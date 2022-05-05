#!/bin/bash

GCP_PROJECT=$1
TAG=$2

if [ -z $GCP_PROJECT ]; then
  echo "NO GCP_PROJECT"
  exit 1
fi

if [ -z $TAG ]; then
  echo "NO TAG"
  exit 1
fi

IMAGE_NAME=asia-docker.pkg.dev/${GCP_PROJECT}/spinnaker/halyard:${TAG}

yes | gcloud auth configure-docker asia-docker.pkg.dev
docker build -t $IMAGE_NAME ./halyard
docker push $IMAGE_NAME
echo "Image: ${IMAGE_NAME}"
