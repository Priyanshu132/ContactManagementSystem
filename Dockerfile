#
# Build stage
#
FROM maven:3.8.2-jdk-11 AS build
COPY . .

#
# Package stage
#
FROM openjdk:11-jdk-slim
COPY --from=build /target/assignment-0.0.1-SNAPSHOT.jar assignment.jar
# ENV PORT=8080
EXPOSE 8080
ENTRYPOINT ["java","-jar","assignment.jar"]