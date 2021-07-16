#!/bin/bash

# Allow to build multiple images for each config.
# TODO: avoid rebuilding every image by just moving the config in the right place.

set -e

for filename in config/*.*;
do
    filebase=$(basename -- "$filename")
	docker run --rm -e TARGET=$(echo $filebase | cut -d. -f2) -e NODE_NAME=$(echo $filebase | cut -d. -f1) -v ${PWD}:/app -v /dev:/dev --privileged picl-builder:latest
done