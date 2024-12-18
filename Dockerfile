# JBoss EAP OpenJDK 8 Base Image
FROM registry.redhat.io/jboss-eap-6/eap64-openshift:1.9-32.1626872997

# 환경 변수 설정
ENV JBOSS_HOME=/opt/eap
ENV DEPLOYMENTS_DIR=${JBOSS_HOME}/standalone/deployments

# WAR 파일 복사
COPY helloworld-ws.war ${DEPLOYMENTS_DIR}/

# 권한 설정
USER root
RUN chmod -R 775 ${DEPLOYMENTS_DIR} && \
    chown -R jboss:root ${DEPLOYMENTS_DIR}
USER 185

# JBoss EAP 실행
CMD ["/opt/eap/bin/openshift-launch.sh"]

