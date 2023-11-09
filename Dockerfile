# Use the base image with Java and Gradle installed
FROM gradle:latest as builder

# Create a directory for the application
WORKDIR /app

# Copy the build.gradle and settings.gradle files
COPY build.gradle settings.gradle /app/

# Copy the entire source code
COPY src /app/src

# Build the project using Gradle
RUN gradle build --no-daemon

# Use a lighter base image for the final image
FROM openjdk:17-jdk-slim

# Create a directory for the application
WORKDIR /app

# Copy the built .jar file from the Gradle build
COPY --from=builder /app/build/libs/react-blog-be-0.0.1-SNAPSHOT.jar /app/

# Expose port 8080 (assuming your application uses this port)
EXPOSE 80

# Define the command to run your application
CMD ["java", "-jar", "react-blog-be-0.0.1-SNAPSHOT.jar"]
