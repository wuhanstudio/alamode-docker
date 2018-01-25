<<<<<<< HEAD
![Alamode](https://github.com/ttadano/alamode/raw/develop/docs/img/alamode.png)

## Build Image

	docker image build -t alamode .

## Test Image

	docker container run --rm -it wuhanstudio/alamode alm

## RUN 
	
	docker container run --rm -v /path/to/work_dir:/home/ubuntu/work_dir wuhanstudio/alamode "alm < /home/ubuntu/work_dir/si.in"  > si.out
