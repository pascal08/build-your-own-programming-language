#!/usr/bin/env sh
set -e

IMAGE=dyflexis-oss/build-your-own-programming-language:0.1.0

if [ "$(docker images -q ${IMAGE} 2> /dev/null)" = "" ]
then
  ./build.sh
fi

docker run --rm ${IMAGE} -v $(pwd):/app vendor/bin/phpunit