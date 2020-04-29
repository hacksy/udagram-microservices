#!/bin/bash
echo $TRAVIS_BRANCH
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
echo "master build"
docker-compose -f course-03/exercises/udacity-c3-deployment/docker/docker-compose-build.yaml build --parallel
docker images
docker push $DOCKER_USER/udacity-restapi-user
docker push $DOCKER_USER/udacity-restapi-feed
docker push $DOCKER_USER/udacity-frontend
docker logout