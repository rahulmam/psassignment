FROM maven:3.6.3-jdk-8 AS build
COPY /var/lib/jenkins/workspace/MyPS/src /usr/src/app/src
COPY /var/lib/jenkins/workspace/MyPS/pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package
FROM openjdk:9
COPY --from=build /usr/src/app/target/*.jar /usr/app/*.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/*.jar"]

