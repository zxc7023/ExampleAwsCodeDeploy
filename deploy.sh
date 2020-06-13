#!/bin/bash

REPOSITORY=/home/ubuntu/application/ExampleAwsCodeDeploy
APP_NAME=ExampleAwsCodeDeploy

cd $REPOSITORY
echo "> 현재 구동중인 애플리케이션 pid 확인"
CURRENT_PID=$(pgrep -f $APP_NAME)
echo "$CURRENT_PID"
if [ -z $CURRENT_PID ]; then
    echo "> 현재 구동중인 애플리케이션이 없으므로 종료하지 않습니다."
else
    echo "> kill -15 $CURRENT_PID"
    kill -15 $CURRENT_PID
    sleep 5
fi

echo "> 새 어플리케이션 배포"
echo "> Build 파일 복사"

JAR_NAME=$(ls $REPOSITORY/build/libs/ | grep '.jar' | tail -n 1)
JAR_PATH=$REPOSITORY/build/libs/$JAR_NAME
echo "> JAR Name: $JAR_NAME"

nohup java -jar $JAR_PATH > /dev/null 2> /dev/null < /dev/null &