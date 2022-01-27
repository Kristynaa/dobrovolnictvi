#!/bin/bash

HOOK_DIR=$(git rev-parse --show-toplevel)/.git/hooks
ln -s -f ../../.github/hooks/exif-metadata.sh $HOOK_DIR/pre-commit
