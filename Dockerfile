FROM eclipse-temurin:17-jdk-ubi9-minimal

COPY build/libs/react-blog-be-0.0.1-SNAPSHOT.jar /app/react-blog-be-0.0.1-SNAPSHOT.jar

WORKDIR /app

EXPOSE 8080

CMD ["java", "-jar", "react-blog-be-0.0.1-SNAPSHOT.jar"]
