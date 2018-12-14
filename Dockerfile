FROM alpine/git
WORKDIR /usr/src
RUN git clone https://github.com/kiranbdvt1/SimpleMavenProject.git
FROM maven:3.5-jdk-8-alpine
WORKDIR /usr/src
COPY --from=0 /usr/src/simple-Maven_Proj/app

RUN mvn install
FROM openjdk:8-jre-alpine
WORKDIR /usr/src
COPY --from=1 /app/target/simple-Maven_Proj-1.0.0.jar /app
CMD ["java -jar simple-Maven_Proj-1.0.0.jar"]
