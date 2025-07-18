
#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
LOCAL_PATH := device/samsung/gts10fepwifi

# Inherit from common AOSP config
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# A/B OTA
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
    boot \
    dtbo \
    init_boot \
    odm \
    product \
    system \
    system_dlkm \
    system_ext \
    vbmeta \
    vbmeta_system \
    vendor \
    vendor_boot \
    vendor_dlkm

PRODUCT_PACKAGES += \
    bootctrl.erd8855

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=erofs \
    POSTINSTALL_OPTIONAL_system=true

# HAL Bootctrl Pixel
PRODUCT_PACKAGES += \
    android.hardware.boot-service.exynos_recovery

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# vndservicemanager and vndservice no longer included in API 30+, however needed by vendor code.
PRODUCT_PACKAGES += vndservicemanager
PRODUCT_PACKAGES += vndservice

# Init files
PRODUCT_COPY_FILES += \
        device/google/oriole/recovery/root/init.recovery.s5e8855.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.recovery.s5e8835.rc \