# docker image for artifactory 5.0.0
# make sure you cat all the tar files before using this image with:
# cat ./artifactory/artifactory-oss-5.0.0.tar.gz.a* > ./artifactory-oss.5.0.0.tar.gz
# tar -zxvf ./artifactory-oss.5.0.0.tar.gz -C .
# build: docker build -t generalmeow/artifactory:5.0.0 .
# run:  docker run -d --network host --restart always --name artifactory -p 8081:8081 -v <FILESTORE>:/opt/artifactory/data/filestore -v <LOGS>:/opt/artifactory/logs -v <BACKUP>:/opt/artifactory/backup generalmeow/artifactory:5.0.0
FROM java:8-jre
MAINTAINER Paul Hoang 2017-01-31
EXPOSE 8081
RUN ["mkdir", "-p", "/opt/artifactory"]
ADD ./artifactory-oss-5.0.0 /opt/artifactory
COPY ["./files/etc/opt/jfrog/artifactory/default", "/etc/opt/jfrog/artifactory/default"]
VOLUME ["/opt/artifactory/data/filestore", "/opt/artifactory/logs", "/opt/artifactory/backup"]
ENTRYPOINT ["/opt/artifactory/bin/artifactory.sh"]
