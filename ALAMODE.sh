# ---------------------------------------------------------------
# Install Docker
# ---------------------------------------------------------------

# sudo apt-get remove docker docker-engine docker.io
# sudo apt-get update
# sudo apt-get install \
#     apt-transport-https \
#     ca-certificates \
#     curl \
#     software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    $(lsb_release -cs) \
#    stable"
# sudo apt-get update
# sudo apt-get install docker-ce

# ---------------------------------------------------------------
# Prerequisites
# ---------------------------------------------------------------

apt-get update
apt-get install wget tar build-essential git vim libblas-dev liblapack-dev liblapacke-dev libboost-all-dev libfftw3-dev libeigen3-dev
cp /usr/include/eigen3/* /usr/include/ -r
rm -rf /var/lib/apt/lists/*

# ---------------------------------------------------------------
# MPICH2
# ---------------------------------------------------------------

mkdir -p /opt/mpich2
cd /opt/mpich2
wget http://www.mpich.org/static/downloads/3.2.1/mpich-3.2.1.tar.gz
tar -xvf mpich-3.2.1.tar.gz
cd mpich-3.2.1
./configure  #--disable-fortran
make && make install

# ---------------------------------------------------------------
# LAPACK
# ---------------------------------------------------------------

#sudo apt-get install libblas-dev liblapack-dev
mkdir -p /opt/lapack
cd /opt/lapack
wget http://www.netlib.org/lapack/lapack-3.8.0.tar.gz
tar -xvf lapack-3.8.0.tar.gz
cd lapack-3.8.0
cp make.inc.example make.inc
make blaslib lapacklib lapackelib
cp librefblas.a /usr/lib/

# ---------------------------------------------------------------
# Boost
# ---------------------------------------------------------------

#apt-get install libboost-all-dev

# ---------------------------------------------------------------
# FFTW3
# ---------------------------------------------------------------

#apt-get install libfftw3-dev

# ---------------------------------------------------------------
# Eigen3
# ---------------------------------------------------------------

# apt-get install libeigen3-dev 

# ---------------------------------------------------------------
# ALAMODE
# ---------------------------------------------------------------

git clone http://github.com/ttadano/alamode.git /opt/alamode

# ALM
cd /opt/alamode/alm
cp Makefile.linux Makefile
# CXX = g++
# CXXFLAGS = -O2 -std=c++11
# LDFLAGS = -llapacke -llapack -lrefblas -lgfortran -lblas
# LAPACK= -L /opt/lapack/lapack-3.8.0
#alm: ${OBJS}
#        ${CXXL} ${CXXFLAGS} -o $@ ${OBJS} ${LIBS} ${LDFLAGS}
make

# ANPHON
cd /opt/alamode/anphon
cp Makefile.linux Makefile
vim Makefile
#CXXFLAGS = -O3 -fopenmp -std=c++11
#LDfLAGS = -lfftw3 -llapacke -llapack -lrefblas
make

# TOOLS
cd /opt/alamode/tools
vim Makefile
# CXX = g++
# CXXFLAGS = -O2 -std=c++11
make

export PATH=$PATH:/opt/alamode/alm:/opt/alamode/anphon:/opt/alamode/tools
