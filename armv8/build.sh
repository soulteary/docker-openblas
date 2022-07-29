#!/bin/sh

docker build \
    --build-arg=LTS=22.04 \
    --build-arg=OPENBLAS_VERSION=0.3.20 \
    -t soulteary/milvus-openblas:0.3.20-armv8-ubuntu-22.04 .

docker build \
    --build-arg=LTS=20.04 \
    --build-arg=OPENBLAS_VERSION=0.3.20 \
    -t soulteary/milvus-openblas:0.3.20-armv8-ubuntu-20.04 .

docker build \
    --build-arg=LTS=18.04 \
    --build-arg=OPENBLAS_VERSION=0.3.20 \
    -t soulteary/milvus-openblas:0.3.20-armv8-ubuntu-18.04 .