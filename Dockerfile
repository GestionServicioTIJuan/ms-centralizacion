FROM maven:3.8.1-jdk-8 AS build
COPY src /home/ms-config-server/src
COPY pom.xml /home/ms-config-server
RUN mvn -f /home/ms-config-server/pom.xml clean package

FROM openjdk:8
# WORKDIR /home
COPY --from=build /home/ms-config-server/target/ms-centralizacion-0.0.1-SNAPSHOT.war /usr/src/app/ms-centralizacion-0.0.1-SNAPSHOT.war
EXPOSE 8888
ENTRYPOINT ["java","-jar","/usr/src/app/ms-centralizacion-0.0.1-SNAPSHOT.war"]