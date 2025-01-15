#!/bin/bash
docker image build -t fatijon99/jenkins-demo2:$1 -f jenkins-plugin-model/src/demo2-publish/dockerfile .

echo "Building image with tag: $1"
docker image build -t fatijon99/jenkins-demo2:$1 -f jenkins-plugin-model/src/demo2-publish/dockerfile .

if [ -z ${DOCKER_HUB_USER+x} ]
then 
    echo 'Skipping login - credentials not set' 
else 
    echo "Logging in to Docker Hub with user: $DOCKER_HUB_USER"
    docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASSWORD
fi


docker push fatijon99/jenkins-demo2:$1
