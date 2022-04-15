#!/bin/bash

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
VERSION=$(./jq_l -r .version package.json)
NAME=$(./jq_l -r .name package.json)  
BUILD=$(./jq_l -r .build package.json)
JAVA_ARGS=$(./jq_l -r .args package.json)
AUTOR=$(./jq_l -r .autor package.json)
elif [[ "$OSTYPE" == "darwin"* ]]; then
VERSION=$(./jq_m -r .version package.json)
NAME=$(./jq_m -r .name package.json)  
BUILD=$(./jq_m -r .build package.json)
JAVA_ARGS=$(./jq_m -r .args package.json)
AUTOR=$(./jq_m -r .autor package.json)
fi

docker build -t $AUTOR/jre:$VERSION-$NAME-19 -f Java19/Dockerfile . --build-arg BUILD=$BUILD --build-arg JVM-ARGS="$JAVA_ARGS" 
docker push $AUTOR/jre:$VERSION-$NAME-19

docker build -t $AUTOR/jre:$VERSION-$NAME-18 -f Java18/Dockerfile . --build-arg BUILD=$BUILD --build-arg JVM-ARGS="$JAVA_ARGS"
docker push $AUTOR/jre:$VERSION-$NAME-18

docker build -t $AUTOR/jre:$VERSION-$NAME-17 -f Java17/Dockerfile . --build-arg BUILD=$BUILD --build-arg JVM-ARGS="$JAVA_ARGS"
docker push $AUTOR/jre:$VERSION-$NAME-17

docker build -t $AUTOR/jre:$VERSION-$NAME-11 -f Java11/Dockerfile . --build-arg BUILD=$BUILD --build-arg JVM-ARGS="$JAVA_ARGS"
docker push $AUTOR/jre:$VERSION-$NAME-11

docker build -t $AUTOR/jre:$VERSION-$NAME-8 -f Java8/Dockerfile . --build-arg BUILD=$BUILD --build-arg JVM_ARGS="$JAVA_ARGS"
docker push $AUTOR/jre:$VERSION-$NAME-8
