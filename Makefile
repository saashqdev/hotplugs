#Copyright 2023 KubeWorkz Authors
#
#Licensed under the Apache License, Version 2.0 (the "License");
#you may not use this file except in compliance with the License.
#You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
#Unless required by applicable law or agreed to in writing, software
#distributed under the License is distributed on an "AS IS" BASIS,
#WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#See the License for the specific language governing permissions and
#limitations under the License.

IMG ?= hub.c.163.com/kubeworkz/warden-init:latest

pkg:
	sh compress.sh

images: pkg
	docker build -f ./Dockerfile -t ${IMG} .

multi-arch-images: pkg
	docker buildx build -f ./Dockerfile -t ${IMG} --platform=linux/arm64,linux/amd64 . --push