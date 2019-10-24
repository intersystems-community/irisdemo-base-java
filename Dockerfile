FROM openjdk:8-jdk-alpine

LABEL maintainer="Amir Samary <amir.samary@intersystems.com>"

# Defaul Java options - You can override this when running the container
ENV JAVA_OPTS=-Xmx1024M

# For a simple health check - Configured by the child image
RUN apk --update --no-cache add curl

# This is where the java application will be running. The child image
# must create a Dockerfile that is FROM this one and at the same folder 
# it must add its app.jar file to this folder.
WORKDIR /app/

ADD ./run.sh /app/
RUN chmod +x /app/run.sh

# The child image should do this
# ADD ./app.jar /usr/app

# This will only be run when the container is started
CMD [ "/app/run.sh"]

# This is a health check example that the child image may or may not chose to configure on its 
# own image.
# HEALTHCHECK --interval=5s --timeout=3s \
#   CMD curl -f http://localhost:8080/test || exit 1