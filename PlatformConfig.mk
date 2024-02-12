# Copyright 2014 The Android Open Source Project
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

# Arch
TARGET_ARCH_VARIANT := armv8-2a-dotprod
TARGET_CPU_VARIANT := cortex-a76
TARGET_CPU_VARIANT_RUNTIME := cortex-a76
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a55

# Audio
AUDIO_FEATURE_ENABLED_GKI := true

## 64-Bit Audio
$(call soong_config_set,android_hardware_audio,run_64bit,true)

# AVB
BOARD_AVB_ENABLE := true
TARGET_HAS_VBMETA_SYSTEM := true

# Boot Image Header
BOARD_BOOT_HEADER_VERSION := 4

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_CMDLINE += bootconfig

# Partitions
BOARD_EXCLUDE_KERNEL_FROM_RECOVERY_IMAGE := true
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 30720000
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

# Ramdisk
BOARD_RAMDISK_USE_LZ4 := true

# SELinux
BOARD_USE_ENFORCING_SELINUX := false
BOARD_VENDOR_SEPOLICY_DIRS += $(PLATFORM_COMMON_PATH)/sepolicy

# VINTF
DEVICE_MANIFEST_FILE += $(PLATFORM_COMMON_PATH)/vintf/manifest.xml
DEVICE_MATRIX_FILE += $(PLATFORM_COMMON_PATH)/vintf/compatibility_manifest.xml

include device/motorola/common/CommonConfig.mk
