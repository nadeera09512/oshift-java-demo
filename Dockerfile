# Stage 1: Build with Maven + JDK 21
FROM maven:3.9.8-eclipse-temurin-21 AS builder

WORKDIR /workspace

# Cache dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source and build the app
COPY src ./src
RUN mvn package -DskipTests -B

# Stage 2: Run with JRE 21
FROM eclipse-temurin:21-jre-alpine AS runtime

WORKDIR /app

# Copy the built JAR from the builder stage
COPY --from=builder /workspace/target/*.jar ./app.jar

# Expose application port (adjust if needed)
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
