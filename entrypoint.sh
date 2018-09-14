#!/bin/bash

mkdir -p $BLENDER_DIR
mkdir -p $JOBS_DIR
mkdir -p $RENDER_DIR

echo "Manager URL is ${MANAGER_URL}"

# Clear /tmp directory
# rm -rf /tmp/*

# Download blender to /tmp directory
cd /tmp
curl $BLENDER_URL > blender.tar.bz
tar -xf blender.tar.bz
rm blender.tar.bz
BLENDER_TMP=$(ls /tmp)

# Move the blender installation to $BLENDER_DIR
mv $BLENDER_TMP/* $BLENDER_DIR

# Move back to flamenco directory
cd $FLAMENCO_DIR

envsubst < flamenco-worker.cfg.template > flamenco-worker.cfg

./flamenco-worker
