# use alpine as base image
FROM centos:latest

RUN apt-get update
RUN apt-get -y install openjdk-12-jdk
ENV JAVA_HOME /usr/lib/jvm/java-12-openjdk-amd64

# recommended by spring boot
VOLUME /tmp

# create directory for application
RUN mkdir /app
WORKDIR /app

# jar target
ENV JAR_TARGET "boot-get-started-0.0.1-SNAPSHOT.jar"

# set entrypoint to execute spring boot application
ENTRYPOINT ["sh","-c","java -jar -Dspring.profiles.active=docker build/libs/${JAR_TARGET}"]
