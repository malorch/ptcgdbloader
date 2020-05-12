#!/bin/bash

docker run --rm -d --name=roach1  --hostname=roach1 --net=roachnet  -p 26257:26257 -p 8080:8080  -v "//d/docker/container_files/cockroach-data/roach1:/cockroach/cockroach-data" cockroachdb/cockroach:v20.1.0 start --insecure  --join=roach1,roach2,roach3
docker run --rm -d --name=roach2  --hostname=roach2 --net=roachnet  -p 26258:26257 -p 8081:8080  -v "//d/docker/container_files/cockroach-data/roach2:/cockroach/cockroach-data" cockroachdb/cockroach:v20.1.0 start --insecure  --join=roach1,roach2,roach3
docker run --rm -d --name=roach3  --hostname=roach3 --net=roachnet  -p 26259:26257 -p 8082:8080  -v "//d/docker/container_files/cockroach-data/roach3:/cockroach/cockroach-data" cockroachdb/cockroach:v20.1.0 start --insecure  --join=roach1,roach2,roach3