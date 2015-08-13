FROM ashmckenzie/dooker-base:latest
MAINTAINER ash@the-rebellion.net

RUN apk --update add ruby ruby-dev
RUN echo "gem: --no-document" > /etc/gemrc
RUN gem install bundler

ONBUILD ADD src/ /app/
WORKDIR /app
ONBUILD RUN bundle install

ENTRYPOINT [ "/start" ]
