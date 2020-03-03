FROM ubuntu as fetcher
RUN apt-get update
ARG SSH_PRIVATE_KEY
WORKDIR /app
RUN mkdir /root/.ssh/
RUN echo "${SSH_PRIVATE_KEY}" > /root/.ssh/id_rsa
RUN ssh-keyscan gitlab.com >> /root/.ssh/known_hosts
RUN git clone git@gitlab.com:ycharki-do/secret-file.git

FROM ubuntu
COPY --from=fetcher /app/secret-file .
COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh" ]


