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

#!/bin/bash

dir="charts"
dest="third-charts"
pkg="third-charts.tar.gz"

rm -rf $dest > /dev/null
rm $pkg > /dev/null
mkdir -p $dest

for folder in $dir/*; do
  if [ -d "$folder" ]; then
    helm package "$folder" -d $dest/
  fi
done

tar czf third-charts.tar.gz third-charts