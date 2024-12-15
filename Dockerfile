FROM eclipse-temurin:21
ARG JAR_FILE=app/build/libs/app-0.0.1-SNAPSHOT.jar
ARG USERNAME=webuser
ARG WORKDIR=/app

RUN adduser ${USERNAME}
WORKDIR ${WORKDIR}
COPY --chown=${USERNAME}:${USERNAME} --chmod=700 ${JAR_FILE} ${WORKDIR}/app.jar
USER ${USERNAME}
ENTRYPOINT ["java","-jar","app.jar"]