FROM maven:3.8.1-jdk-11

LABEL AUTHOR="Darko Gorgievski"

RUN apt update && \
apt install -y

RUN mkdir ui-tests
WORKDIR /usr/src/ui-tests
COPY pom.xml ./
COPY src src
COPY send_notification.sh ./
COPY testNG.xml ./

RUN mvn dependency:resolve
RUN mvn clean install -DskipTests

