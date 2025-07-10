#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Twrp stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from gts10fepwifi device
$(call inherit-product, device/samsung/gts10fepwifi/device.mk)

PRODUCT_DEVICE := gts10fepwifi
PRODUCT_NAME := twrp_gts10fepwifi
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-X620
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="gts10fepwifixx-user 15 AP3A.240905.015.A2 X620XXU3AYE1 test-keys"

BUILD_FINGERPRINT := samsung/gts10fepwifixx/gts10fepwifi:15/AP3A.240905.015.A2/X620XXU3AYE1:user/test-keys
