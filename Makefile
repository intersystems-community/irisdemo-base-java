IMAGE_NAME?=intersystemsdc/irisdemo-base-java

build:
	docker build -t ${IMAGE_NAME}:latest .

clean:
	-docker rmi ${IMAGE_NAME}:latest

push:
	-docker push ${IMAGE_NAME}:latest