#=============================================================================
# Copyright 2019 BlazingDB, Inc.
#     Copyright 2018 Alexander Ocsa <alexander@blazingdb.com>
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
#=============================================================================

cmake_minimum_required(VERSION 3.12)

project(ucx-download NONE)

include(ExternalProject)

ExternalProject_Add(ucx
    GIT_REPOSITORY    ${UCX_GIT_REPOSITORY}
    GIT_TAG           ${UCX_GIT_TAG}
    SOURCE_DIR        "${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/thirdparty/ucx-src"
    BUILD_IN_SOURCE   1
    INSTALL_DIR       "${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/thirdparty/ucx-install"
    # CONFIGURE_COMMAND ./autogen.sh COMMAND ./configure --prefix=${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/thirdparty/ucx-install --with-cuda=/usr/local/cuda --with-gdrcopy=${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/thirdparty/ucx-install --without-java
    CONFIGURE_COMMAND ./autogen.sh COMMAND ./configure --prefix=${CMAKE_BINARY_DIR}${CMAKE_FILES_DIRECTORY}/thirdparty/ucx-install --with-cuda=/usr/local/cuda --without-java
    BUILD_COMMAND     ${CMAKE_MAKE_PROGRAM} -j4 install
    UPDATE_COMMAND    ""
)