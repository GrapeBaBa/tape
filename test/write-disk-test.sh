#!/usr/bin/env bash
set -ex

DIR=$PWD
docker image rm -f tape
docker build -t tape:latest .

cd "$DIR"
docker run  -e TAPE_LOGLEVEL=info --network host -v $PWD:/config tape tape -c $CONFIG_FILE -n 400000 -p diskWrite