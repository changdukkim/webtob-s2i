FROM registry.bastion.ocpnh.co.kr/webtob:4.1.9.1

LABEL io.k8s.description="Platform for serving static files" \
      io.k8s.display-name="Apache httpd 2.4" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,http,http24,apache,httpd,rhscl-httpd24"

LABEL io.openshift.s2i.scripts-url=image:///usr/local/s2i

COPY files/s2i/ /usr/local/s2i

RUN useradd -u 1000 -G root webtob \
  && chmod 775 /usr/local/s2i/* \
  && chmod -R 775 /root/webtob/ \
  && chown -R webtob:root /root/webtob 

# 8080 포트를 오픈한다.
EXPOSE 8080

USER 1000
 
# 실행명령
CMD ["/root/webtob/bin/wsboot"]
