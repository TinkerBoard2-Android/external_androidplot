# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH:= $(call my-dir)

## Core androidplot library

include $(CLEAR_VARS)

LOCAL_MODULE := androidplot
LOCAL_MODULE_TAGS := optional
LOCAL_SDK_VERSION := current

LOCAL_SRC_FILES := $(call all-java-files-under, AndroidPlot-Core/src/main)

# b/73499927
LOCAL_ERROR_PRONE_FLAGS := -Xep:MissingOverride:OFF

include ${BUILD_STATIC_JAVA_LIBRARY}

## Demo app

include $(CLEAR_VARS)

LOCAL_PACKAGE_NAME := AndroidPlotDemos
LOCAL_MODULE_TAGS := tests
LOCAL_SDK_VERSION := current

LOCAL_STATIC_JAVA_LIBRARIES := androidplot

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/Examples/DemoApp/res
LOCAL_MANIFEST_FILE := Examples/DemoApp/AndroidManifest.xml
LOCAL_SRC_FILES := $(call all-java-files-under, Examples/DemoApp/src)

# b/73499927
LOCAL_ERROR_PRONE_FLAGS := -Xep:MissingOverride:OFF

include $(BUILD_PACKAGE)
