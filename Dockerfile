FROM nginx:stable-alpine

ENV release mqtt-wall-0.4.0
ENV tag v0.4
ENV unzipname wall-0.4.0

ENV HOST     //host
ENV USERNAME //username:
ENV PASSWORD //password:


RUN apk update && apk upgrade && \
    apk add wget && \
    apk add unzip && \
    wget https://github.com/bastlirna/mqtt-wall/releases/download/${tag}/${release}.zip && \
    unzip  ${release}.zip -d . && \
    cp -r ${unzipname}/. /usr/share/nginx/html  && \
    rm -rf ${release}.zip && \
    rm -rf ${unzipname} && \
    apk del wget && \
    apk del unzip 


COPY start.sh /
RUN chmod +x /start.sh
ENTRYPOINT /start.sh
