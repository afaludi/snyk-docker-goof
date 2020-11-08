#!/usr/bin/env bash
#some comment here
#put some more code in
echo "hello world" 

pushd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" >/dev/null

for f in $(ls *Dockerfile); do
  base=$(basename ${f})
  flavour=${base%.Dockerfile}
  flavour=${flavour%Dockerfile}
  tag=docker-goof${flavour:+-$flavour}
  echo Testing ${tag}...
  snyk test --docker ${tag} --file=${base}
done

popd >/dev/null
