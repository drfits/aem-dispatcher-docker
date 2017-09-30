# aem-dispatcher-docker

This docker image is an example on how we can create AEM Dispatcher with Docker for AEM Author instance.

Container variables:

- **AEM_HOST** - is a host (IP address for example) where AEM instance locates
- **AEM_PORT** - is a port on which AEM instance available

A few words for using this docker image:

- place required httpd configurations to **conf** folder
- build your image: **docker build --rm -t local/aem-dispatcher-author .**
- start container as **docker run --rm -it -v C:/dev/soft/dispatcher/logs:/etc/httpd/logs -v C:/dev/soft/dispatcher/dispatcher_cache:/etc/httpd/dispatcher_cache -e AEM_HOST=192.168.1.6 -e AEM_PORT=4502 -p 80:80 -p 443:443 local/aem-dispatcher-author** 

That's it.
