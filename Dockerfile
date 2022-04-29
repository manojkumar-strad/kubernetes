FROM centos:7

# Install Apache
RUN yum -y update
RUN yum -y install httpd httpd-tools
RUN yum -y install unzip
RUN yum -y install zip

# Install EPEL Repo
#RUN rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch                                                                             .rpm \
 #&& rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

ADD https://files.all-free-download.com/downloadfiles/graphic/graphic_7/agriculture_website_template_6891381.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip agriculture_website_template_6891381.zip -d /var/www/html/
#COPY agriculture_website_template_6891381/* .
RUN cp -rvf /var/www/html/template/* .
RUN cp home.html index.html
#RUN rm -rf agriculture_website_template_6891381.zip
EXPOSE 80

# Start Apache
CMD ["/usr/sbin/httpd","-D","FOREGROUND"]
