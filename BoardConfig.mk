# Path
DEVICE_PATH := device/xiaomi/hermes

# Board
TARGET_BOOTLOADER_BOARD_NAME := mt6795
TARGET_BOARD_PLATFORM := mt6795
TARGET_NO_BOOTLOADER := true
TARGET_IS_64_BIT := true
TARGET_USES_64_BIT_BINDER := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# Kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2
ifneq ($(TARGET_BUILD_VARIANT),user)
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
endif

BOARD_MKBOOTIMG_ARGS := \
    --base 0x40078000 \
    --board $(TARGET_BOARD_PLATFORM) \
    --kernel_offset 0x8000 \
    --pagesize 2048 \
    --ramdisk_offset 0x3F88000 \
    --second_offset 0xE88000 \
    --tags_offset 0xDF88000

TARGET_KERNEL_SOURCE := kernel/xiaomi/hermes
TARGET_KERNEL_CONFIG := hermes_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# Partitons
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12737560576
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# EXT4
TARGET_USERIMAGES_USE_EXT4 := true

# Hardware
BOARD_USES_MTK_HARDWARE := true

# DRM
TARGET_ENABLE_MEDIADRM_64 := true

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := vendor/xiaomi/hermes/proprietary/vendor/lib/egl/egl.cfg
BOARD_EGL_NEEDS_HANDLE_VALUE := true
VSYNC_EVENT_PHASE_OFFSET_NS := -8000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := -8000000
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# RIL
SIM_COUNT := 2
ENABLE_VENDOR_RIL_SERVICE := true
BOARD_PROVIDES_LIBRIL := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Low-ram
MALLOC_SVELTE := true

# Device specific props
TARGET_SYSTEM_PROP := $(DEVICE_PATH)/system.prop

# Shim libs
TARGET_LD_SHIM_LIBS := \
        /vendor/xbin/mnld|mtklog.so

# Wi-Fi
BOARD_WLAN_DEVICE := MediaTek
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_STATE_ON := 1
WIFI_DRIVER_STATE_OFF := 0

# Recovery
TARGET_RECOVERY_FSTAB := vendor/xiaomi/hermes/proprietary/vendor/etc/fstab.$(TARGET_BOARD_PLATFORM)

# Sepolicy
#BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy
#SELINUX_IGNORE_NEVERALLOWS := true

# Disable dex pre-opt
ifeq ($(HOST_OS),linux)
ifneq ($(TARGET_BUILD_VARIANT),eng)
ifeq ($(WITH_DEXPREOPT),)
WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY := false
WITH_DEXPREOPT := true
endif
endif
endif

# HIDL Manifest
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/compatibility_matrix.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/manifest.xml

# Treble
#BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
#PRODUCT_FULL_TREBLE_OVERRIDE := true
#BOARD_VNDK_RUNTIME_DISABLE := true
TARGET_COPY_OUT_VENDOR := system/vendor
#BOARD_VNDK_VERSION := current

# Vendor
VENDOR_SECURITY_PATCH := 2016-12-01
COMPILE_MTK_PROPRIETARY := true

# Legacy blob support
TARGET_PROCESS_SDK_VERSION_OVERRIDE := /vendor/xbin/mnld=27
