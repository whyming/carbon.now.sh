FROM alpine:3.5

RUN echo "http://mirrors.aliyun.com/alpine/v3.5/main" >/etc/apk/repositories && \
    echo "http://mirrors.aliyun.com/alpine/v3.5/community" >>/etc/apk/repositories && \
    apk update && \
    apk add --no-cache nginx tzdata git && \ 
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone && \
    mkdir -p /var/www && \
    chown -R nginx:nginx /var/www && \
    mkdir -p /run/nginx && \
    rm -rf /etc/nginx/conf.d/*  && \
    rm -rf /var/cache/apk/* && \
    git clone https://github.com/whyming/carbon.now.sh.git /var/www/carbon && \
    cp /var/www/carbon/carbon.conf  /etc/nginx/conf.d/
ENV TIMEZONE=Asia/Shanghai
WORKDIR /var/www
EXPOSE 80
ENTRYPOINT ["nginx","-g","daemon off;"]
