# write your Docker file code here
FROM maven:3.99-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./srcRUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
WORKDIR /appCOPY --from=build /app/target/*.jar app.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "app.jar"]