FROM centos:7
MAINTAINER FengZhiHui

ADD nginx-1.12.2.tar.gz /root/

RUN yum install -y gcc-c++ gd-devel pcre-devel libxml2 libxml2-devel openssl-devel \
        libcurl-devel ncurses-devel libicu libicu-devel perl-DBD-MySQL \
        make \
    && yum clean all \
    && cd /root/nginx-1.12.2/ \
    && ./configure \
        --prefix=/opt/nginx \
        --lock-path=/tmp/nginx.lock \
        --sbin-path=/usr/sbin/nginx \
        --conf-path=/etc/nginx/nginx.conf \
        --pid-path=/tmp/nginx.pid \
        --error-log-path=/var/log/nginx/nginx_error.log \
        --with-http_ssl_module \
        --with-pcre \
        --http-log-path=/var/log/nginx/access.log \
        --with-http_stub_status_module \
    &&  make -j8 && make install \
    && rm -rf /root/nginx-1.12.2/

COPY scripts/nginx /etc/init.d/nginx
COPY conf/nginx/ /etc/nginx/

EXPOSE 80
CMD ["nginx", "-c", "/etc/nginx/nginx.conf"]
