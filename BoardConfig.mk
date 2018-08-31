LOCAL_PATH := device/xiaomi/hennessy

# Platform
TARGET_BOOTLOADER_BOARD_NAME := mt6795
TARGET_BOARD_PLATFORM := mt6795
TARGET_NO_BOOTLOADER := true
TARGET_IS_64_BIT := true

# CPU
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

#Misc
BLOCK_BASED_OTA := false

# Kernel
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 log_buf_len=8M androidboot.selinux=permissive
BOARD_MKBOOTIMG_ARGS := \
    --base 0x40078000 \
    --board mt6795 \
    --kernel_offset 0x00008000 \
    --pagesize 2048 \
    --ramdisk_offset 0x03f88000 \
    --second_offset 0x00e88000 \
    --tags_offset 0x0df88000

# Partitons
BOARD_USERDATAIMAGE_PARTITION_SIZE := 12737576960
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 629145600
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 131072

# Hardware
BOARD_USES_MTK_HARDWARE := true

# Display
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 1

# Audio
USE_XML_AUDIO_POLICY_CONF := 1

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
YELLOW_LED_PATH := /sys/class/leds/yellow/brightness

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# RIL
BOARD_PROVIDES_RILD := true
BOARD_RIL_CLASS := ../../../$(LOCAL_PATH)/mtk/ril

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# CMHW
BOARD_USES_CYANOGEN_HARDWARE := true
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw

# Camera
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_mtk
TARGET_CAMERASERVICE_CLOSES_NATIVE_HANDLES := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# Low-ram
MALLOC_SVELTE := true

# Include
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Device specific props
TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Wi-Fi
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_P2P := P2P
WIFI_DRIVER_FW_PATH_AP := AP

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_RECOVERY_SWIPE := true

# Seccomp
TARGET_DOES_NOT_SUPPORT_SECCOMP := true

# Sepolicy
BOARD_SEPOLICY_DIRS += device/xiaomi/hennessy/sepolicy
POLICYVERS := 28

# Build kernel without kernel sources
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
