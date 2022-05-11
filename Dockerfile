FROM centos:7

MAINTAINER Evgeniy Fitsner <evgeniy.fitsner@gmail.com>

# Install HTTPD and enable it
RUN yum -y install httpd mod_ssl mod_so mod_security openssl; yum clean all; systemctl enable httpd.service

# download dispatcher module
RUN curl -s https://download.macromedia.com/dispatcher/download/dispatcher-apache2.4-linux-x86_64-ssl1.1-4.3.5.tar.gz -O
RUN mkdir dispatcher
RUN tar -C dispatcher -zxvf dispatcher-apache2.*.tar.gz

# copy and rename dispatcher module
RUN mkdir /etc/httpd/dispatcher_cache
RUN cp ./dispatcher/dispatcher-apache2.*.so /etc/httpd/modules/
RUN cp ./dispatcher/conf/httpd-dispatcher.conf /etc/httpd/conf/httpd-dispatcher.conf
RUN ln -s /etc/httpd/modules/dispatcher-apache2.*.so /etc/httpd/modules/mod_dispatcher.so

# Copy all config files to the image
COPY conf/httpd /etc/httpd

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

