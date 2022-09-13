From alpine:latest
RUN apk add --no-cache && \
    sh 
RUN apk update
RUN apk add git
RUN adduser -D -g 'git-user' git-user 
USER git-user
CMD ["sleep", "infinity"]
