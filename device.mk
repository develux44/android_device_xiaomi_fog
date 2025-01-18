# Copyright (C) 2023 Paranoid Android
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/xiaomi/fog

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# API Level
BOARD_SHIPPING_API_LEVEL := 30

SHIPPING_API_LEVEL := 30
PRODUCT_SHIPPING_API_LEVEL := $(SHIPPING_API_LEVEL)

# AB
TARGET_IS_VAB := true
PRODUCT_VIRTUAL_AB_OTA := true

# Audio
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/audio/,$(TARGET_COPY_OUT_VENDOR)/etc)

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths_idp_india.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 1650
TARGET_SCREEN_WIDTH := 720

# Camera
PRODUCT_PACKAGES += \
    libcamera_provider_shim \
    libpiex_shim

# Display
TARGET_USE_QCOM_OFFSET := true
TARGET_DISPLAY_USE_SMOOTH_MOTION := true

# Fingerprint
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint@2.3-service.xiaomi \
    com.fingerprints.extension@1.0.vendor \
    libvendor.goodix.hardware.biometrics.fingerprint@2.1.vendor \
    vendor.xiaomi.hardware.fingerprintextension@1.0.vendor

# Health
TARGET_USE_HIDL_QTI_HEALTH := true

# HIDL
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/hidl/compatibility_matrix.xml

# HWUI
PPRODUCT_SYSTEM_PROPERTIES += \
    ro.hwui.texture_cache_size=72 \
    ro.hwui.layer_cache_size=48 \
    ro.hwui.r_buffer_cache_size=8 \
    ro.hwui.path_cache_size=32 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=6 \
    ro.hwui.texture_cache_flushrate=0.4 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024 \
    ro.vendor.perf.scroll_opt=1 \
    ro.launcher.blur.appLaunch=0

# Media
PRODUCT_ODM_PROPERTIES += \
    media.settings.xml=/vendor/etc/media_profiles_khaje.xml

# NFC
TARGET_COMMON_QTI_COMPONENTS += \
    nfc

TARGET_NFC_SKU := c3qn
ODM_MANIFEST_SKUS += $(TARGET_NFC_SKU)
ODM_MANIFEST_C3QN_FILES := $(DEVICE_PATH)/configs/hidl/manifest_c3qn.xml

PPRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    android.hardware.secure_element@1.2-service \
    com.android.nfc_extras \
    libchrome.vendor \
    NfcNci \
    SecureElement \
    Tag

PPRODUCT_SYSTEM_PROPERTIES += \
    ro.nfc.port=I2C \
    ro.hardware.nfc_nci=pn8x

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/sku_c3qn/android.hardware.nfc.uicc.xml

PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/configs/nfc/,$(TARGET_COPY_OUT_VENDOR)/etc)
# Overlays
PRODUCT_PACKAGES += \
    AOSPAFogFrameworksOverlay \
    FogPowerFrameworksOverlay \
    FogFrameworksOverlay \
    FogSettingsOverlay \
    FogSystemUIOverlay \
    FogWifiOverlay \
    FogWifiMainline \
    SettingsProvider220333QAGOverlay \
    SettingsProvider220333QLOverlay \
    SettingsProvider220333QBIOverlay \
    SettingsProvider220333QNYOverlay

# Remove packages
PRODUCT_PACKAGES += \
    RemovePackages

# Rootdir / Init files
PRODUCT_PACKAGES += \
    init.device.rc

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# VNDK
PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libhidlbase.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libhidlbase-v32.so

PRODUCT_COPY_FILES += \
    prebuilts/vndk/v32/arm/arch-arm-armv7-a-neon/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib/libutils-v32.so \
    prebuilts/vndk/v32/arm64/arch-arm64-armv8-a/shared/vndk-sp/libutils.so:$(TARGET_COPY_OUT_VENDOR)/lib64/libutils-v32.so

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/xiaomi/fog/fog-vendor.mk)

# Inherit from sm6225-common
$(call inherit-product, device/xiaomi/sm6225-common/common.mk)
