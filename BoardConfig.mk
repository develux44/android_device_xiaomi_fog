# Copyright (C) 2023 Paranoid Android
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

DEVICE_PATH := device/xiaomi/fog

# Board Info
TARGET_BOARD_INFO_FILE := $(DEVICE_PATH)/board-info.txt

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/configs/hidl/xiaomi_manifest.xml

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_fog
TARGET_RECOVERY_DEVICE_MODULES := libinit_fog

# Kernel
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
KERNEL_DEFCONFIG := vendor/fog-perf_defconfig
KERNEL_CUSTOM_LLVM := true
KERNEL_FULL_LLVM := true
TARGET_KERNEL_SOURCE := kernel/xiaomi/fog


# OTA assert
TARGET_OTA_ASSERT_DEVICE := fog,wind,rain

# Screen density
TARGET_SCREEN_DENSITY := 300

# Sensors
# SOONG_CONFIG_NAMESPACES += SENSORS_XIAOMI
# SOONG_CONFIG_SENSORS_XIAOMI += USES_DOUBLE_TAP_SENSOR
# SOONG_CONFIG_SENSORS_XIAOMI_USES_DOUBLE_TAP_SENSOR := true
# SOONG_CONFIG_SENSORS_XIAOMI += USES_SINGLE_TAP_SENSOR
# SOONG_CONFIG_SENSORS_XIAOMI_USES_SINGLE_TAP_SENSOR := true

# Sepolicy
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private

# Inherit from the proprietary version
include vendor/xiaomi/fog/BoardConfigVendor.mk

# Inherit from sm6225-common
include device/xiaomi/sm6225-common/BoardConfigCommon.mk
