#!/bin/bash

set -e

# Show bundled node version
export NODEVER=$(cat ./BUNDLED_NODE_VERSION)

printf ">> Downloading bundled Node "
printf "(${NODEVER})\n"
node script/download-node.js

printf "\n"
printf ">> Rebuilding apm dependencies with bundled Node $(./bin/node -p "process.version + ' ' + process.arch")\n"

# parallel node-gyp
JOBS=16

./bin/npm rebuild
