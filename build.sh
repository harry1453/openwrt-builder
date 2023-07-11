#!/usr/bin/env bash

# Ensure that the image has been built
helpers/build_image.sh

docker run --rm -it \
    -v "$(pwd)/config:/openwrt/config_diff:ro" \
    -v "$(pwd)/build/bin:/openwrt/bin" \
    -v "$(pwd)/build/build_dir:/openwrt/build_dir" \
    -v "$(pwd)/build/staging_dir:/openwrt/staging_dir" \
    -v "$(pwd)/build/tmp:/openwrt/tmp" \
    -v "$(pwd)/build/dl:/openwrt/dl" \
    openwrt_builder "./build.sh"
