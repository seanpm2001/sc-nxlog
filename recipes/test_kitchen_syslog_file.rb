#
# Cookbook Name:: nxlog_ce
# Recipe:: default
#
# Copyright (C) 2014 Simon Detheridge
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'nxlog_ce::default'

nxlog_ce_destination 'test' do
  if platform? 'windows'
    file 'c:/windows/temp/test.log'
  else
    file '/var/log/nxlog/test.log'
  end
end

nxlog_ce_source 'mark' do
  input_module 'im_mark'
  mark '-> -> MARK <- <-'
  mark_interval 1
  destination 'test'
end
