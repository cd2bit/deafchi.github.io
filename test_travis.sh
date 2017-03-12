#!/bin/bash
bundle exec jekyll build

if [ $TRAVIS_BRANCH == 'master' ];
then
  bundle exec htmlproofer ./_site \
    --check-favicon \
    --chec-html \
    --allow-hash-href \
    --only-4xx # we want to check if there is any 4xx errors on production
else
  bundle exec htmlproofer ./_site \
    --check-favicon \
    --chec-html \
    --allow-hash-href
fi
