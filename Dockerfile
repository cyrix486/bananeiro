FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]
RUN apt update && apt upgrade -y
ENV TZ=America/Argentina/Buenos_Aires
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt install -y apache2
RUN echo "Hello from VM1" > /var/www/html/index.html
RUN service apache2 restart
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
