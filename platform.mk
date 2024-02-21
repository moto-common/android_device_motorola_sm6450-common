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

# Enable project quotas and casefolding for emulated storage without sdcardfs
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)
# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Platform Path
PLATFORM_COMMON_PATH := device/motorola/sm6450-common

# Platform
PARROT := parrot
TARGET_BOARD_PLATFORM := $(PARROT)
TARGET_KERNEL_VERSION := 5.10
PRODUCT_PLATFORM_MOT := true
PRODUCT_USES_QCOM_HARDWARE := true

# A/B support
AB_OTA_UPDATER := true
PRODUCT_SHIPPING_API_LEVEL := 30

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    product \
    recovery \
    system \
    system_ext \
    vendor \
    vendor_boot \
    vendor_dlkm \
    vbmeta \
    vbmeta_system

# Audio
## Enable Audio V7 HAL
TARGET_USES_AUDIO_V7_0 := true

## Enable Fluence NN Algo
PRODUCT_PROPERTY_OVERRIDES += \
     ro.vendor.audio.sdk.fluence.nn.enabled=true

# AVB
TARGET_HAS_RECOVERY_AVB := true

# Boot
TARGET_USES_DTB_FROM_SOURCE := false

# Device characteristics
DEVICE_CHARACTERISTICS += ufs erofs

# Display
PRODUCT_PACKAGES += \
    android.hardware.common-V2-ndk_platform.vendor \
    android.hardware.graphics.common-V1-ndk_platform.vendor \
    android.hardware.graphics.composer@2.4.vendor \
    vendor.qti.hardware.display.config-V2-ndk.vendor \
    vendor.qti.hardware.display.config-V5-ndk_platform.vendor \
    vendor.qti.hardware.display.allocator@1.0.vendor \
    vendor.qti.hardware.display.allocator@4.0.vendor \
    vendor.qti.hardware.display.composer@3.0.vendor \
    vendor.qti.hardware.display.composer@3.1.vendor \
    vendor.qti.hardware.display.demura@2.0.vendor \
    vendor.qti.hardware.display.mapperextensions@1.2.vendor

# Dynamic Partitions
TARGET_USES_DYNAMIC_PARTITIONS := true

# Components
TARGET_UNWANTED_QTI_COMPONENTS := qseecomd dsprpcd

# Gatekeeper
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.gatekeeper.disable_spu=true

# Power
PRODUCT_USES_PIXEL_POWER_HAL := true

# QCOM Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.qcom.bluetooth.soc=cherokee

# Telephony
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=27,27

$(call inherit-product, device/motorola/common/common.mk)
$(call inherit-product, vendor/motorola/sm6450-common/sm6450-common-vendor.mk)
