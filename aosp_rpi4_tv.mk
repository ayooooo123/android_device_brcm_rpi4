#
# Copyright (C) 2021-2023 KonstaKANG
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/brcm/rpi4

# Inherit device configuration
$(call inherit-product, device/brcm/rpi4/device.mk)

PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_CHARACTERISTICS := tv

$(call inherit-product, device/google/atv/products/atv_base.mk)
$(call enforce-product-packages-exist,)

# Android TV
PRODUCT_PACKAGES += \
    DocumentsUI \
    LeanbackIME \
    TvProvision \
    TvSampleLeanbackLauncher \
    TvSettingsTwoPanel

# Bluetooth
PRODUCT_VENDOR_PROPERTIES += \
    bluetooth.device.class_of_device=34,4,36

# Display: compose the 1080p TV UI into a 1080p client target and let the
# display hardware scale it, so 4K video buffers fit in CMA.
PRODUCT_VENDOR_PROPERTIES += \
    ro.surface_flinger.max_graphics_width=1920 \
    ro.surface_flinger.max_graphics_height=1080

# Boot animation
PRODUCT_COPY_FILES += \
    device/google/atv/products/bootanimations/bootanimation.zip:$(TARGET_COPY_OUT_SYSTEM)/media/bootanimation.zip

# Keylayout
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/keylayout/Generic-tv.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/Generic.kl

# Overlays
PRODUCT_PACKAGES += \
    AndroidTvRpiOverlay \
    BluetoothRpiOverlay \
    SettingsProviderTvRpiOverlay \
    WifiRpiOverlay

# Device identifier. This must come after all inclusions.
PRODUCT_DEVICE := rpi4
PRODUCT_NAME := aosp_rpi4_tv
PRODUCT_BRAND := Raspberry
PRODUCT_MODEL := Pi 4
PRODUCT_MANUFACTURER := Raspberry
