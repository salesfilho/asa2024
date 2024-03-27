#!/bin/bash

## Build
docker build -t web01 ./web01
docker build -t web02 ./web02
docker build -t proxy ./proxy

## Run
docker network create -d bridge asa-net
docker run -d --net=asa-net --name web01 web01
docker run -d --net=asa-net --name web02 web02
docker run -dp 8081:80 --net=asa-net --name proxy proxy
