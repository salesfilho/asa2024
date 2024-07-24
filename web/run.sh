#!/bin/bash

## Build
docker build -t proxy ./proxy
#docker build -t mail ./mail
docker build -t www ./www

## Run
docker network create -d bridge asa-net

docker run -d --net=asa-net --name www www
docker run -dp 80:80 --net=asa-net --name proxy proxy