Return-Path: <linux-arm-msm+bounces-40299-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 892979E3F2D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:07:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 591A7B3FA8E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C069520D505;
	Wed,  4 Dec 2024 15:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F040zT5V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13E720D4F6;
	Wed,  4 Dec 2024 15:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327871; cv=none; b=FD8IqpJNT7uiCYlHwcUp94qjcJbhZ1r77D9URFKWkh+71+APUgl7tynA5AYp+eR3v00Th3Frd7WmowR6At9zUNTsU0WcluWlfHzA2hrNReSv1FUeg5AaUpdmmPYRT/a7YA4XElH70lcAPguNf0r9U8AQOospiCgvSuKc0vRp73s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327871; c=relaxed/simple;
	bh=8KQt7pjdBn+B5huSjAB+LdsFv0g/yxS7A8zqbMHAK4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mXimzTqX34XGlUXPBexiwlklda2zt/LvzbdTbIyIfgR5B8d4LTKzI9XR59SG2KSiX2xP1B688KH+Nr50LW3h216VqR/MhO5/ctPjd88nbyzTZTUsDj/EGRfJXwmVXBdb1QFTaDZOcCfbVDgAZeSlMfAdw7+x4YMyOjTyX4T2HF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F040zT5V; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53dd57589c8so1155828e87.1;
        Wed, 04 Dec 2024 07:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327868; x=1733932668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3nkKg1tuuHFEH5PqoMy9MV06rNk95ek43/M1WdoCMPo=;
        b=F040zT5VAU7NVhld1d+usIecoNAPZ0qAhd2B1asky5UgxvDrbRZVPDljSryMtJiwVc
         Y5jiTlAo00yxXvJpjtqX+N/k5DwuFysBOfvvDYnmPERz+uda4LEPM1tqJqJnBONsPg/v
         g8OONrrPyWataxyi2uDvxuenHwNNshuXJWMxusfGi6KvZLFEQ7MjIUA2JxyLJJhcJy/2
         HGQKjMBWrgDAeYbVZKvD635WVRt4EqFLyI9LUTWwuXb1WR59yANswF29NjoNJRHi+5xn
         BbuSngakjvzs1YFxdd3bq4i5PDQFjwVfNZgF5ltqauIl+FukI8GvpT6Tfw+xAcnBOBjb
         9n4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327868; x=1733932668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3nkKg1tuuHFEH5PqoMy9MV06rNk95ek43/M1WdoCMPo=;
        b=jqUUlpjBqPDNL98O1lzjO9sQCuqO5zhUi1Pjm+h/XqnnHNIb4V2Ry7DiuI4+Vq9Taz
         p5CGcbQUXCC6Dae+2y8IGbjA6VYQSgxXxPSMNl3SE+BQsROUG+/CKB7XYsVUH1NCDOK1
         Oo9qj1tnk49U6XnNAVf0pBK0X8FKDjqeTrxBXGWGBK8ZV8if5uD1ePExOrOMhrs3oTBv
         oo5umRzOlg5Vfj3Oukwz7s+PRmiRZMMZZz7LIm6/+ApHqvwq0TkAUHl+Ctqvy/zzm5QU
         cQ9R8SZEr5lO2opK3CwplriYfWsmaL1QfPPCHjUCLYvJGyorbE+sndc3vHaSZ5hOVfNK
         OKJw==
X-Forwarded-Encrypted: i=1; AJvYcCU2/XiwBhTrJw2zx0c8Bhd9STuvoXOH5GhRwVCB3KHQ4H5rMfldoIz9P8PHFwfnCMIzOz+0f5gqqAaK6Ser@vger.kernel.org, AJvYcCWiDNGYxJu7MdLQoAH++fqIBwKS/oeR2YeqTNBorQTLv4H7yu4KGeZW5Vf3Zq11aPETfqG8adxcmBUtbKmJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/vaqiWH/rsIY8CTy2Lfj9aPEaCm+4mJu4GHKZVZuDqHmPz2GR
	i0hrJD3iae8uzHBMOEIMvEePD5gZFuf9BlGsn8yPqGm18Bqfhxcl
X-Gm-Gg: ASbGncvRicevVZ+g2aRwgXKJHUmcn8+R13HEM/qB2jw7cMEM2ebMkAYyYDLbReINDqh
	GQPAgY0EKBFqBzFMIE380ukkrAnySOP5yGGij4bEcxKfrZ295FryCQ1439OKi1fPblVemETM0KD
	d7wdTCbhznfIGJeCOL/P7LHqjiYbeG3rF2ibMj8PMfTSgBn3X9ONhwJo/JFAbJCSF+SdviC7+X9
	MPmnlDmHJ9FQni1nBBsGQ6pHG4HkKPkemFzklQ75bKcD1hfoduVigTsfsdJ6qghAuPEf0hNCAHB
	CY0VqUeuYNc2g/A=
X-Google-Smtp-Source: AGHT+IHAcb5udTy8nhI2YPMmDYf9btt3l6VlGD8R5t5Rr1u9eOFtISjwR/bSWUTbOGgS5xor4NF4lQ==
X-Received: by 2002:a05:6512:159b:b0:53d:ed29:43ac with SMTP id 2adb3069b0e04-53e12df00a2mr2112889e87.28.1733327867939;
        Wed, 04 Dec 2024 07:57:47 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:46 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:43 +0100
Subject: [PATCH 1/9] ARM: axm55xx_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-1-86587652d37a@gmail.com>
References: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
In-Reply-To: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4266;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=8KQt7pjdBn+B5huSjAB+LdsFv0g/yxS7A8zqbMHAK4c=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvJS7ip8U7wYAMpzFqthb2ew9xg5v3/G9C43
 N2EKshFRlCJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B7yQAKCRCIgE5vWV1S
 MsraEADLx49LPm9PHTLMe85Mz5h71JDNAkwmSyHU6u59/ljroYOIe9DrWljN+1DdNXr/V4vKxyZ
 CH9lScPP7/IpKgYy+bGw73H0Tc9JL/LMZFcxu3tQCPdoomELb4kbZ8ReGEN9TeaW8PdFrpLkBBK
 C4SamEjUkw6bEV5CyIpFUqpM5CEudbN1XAStGKSeuChoa1sUUJxmOJDSaFuB+BXWP7nz/bACWK5
 mRX9zbrddiK1aAN5R7yUzocj/cMYTgRxdJMIgsT1SztNzmA5ORac9o9WXEPLaNUxNFqiUzfa3nR
 +tPFHPiZVI14PtR5B0v2MKCrazaHYUQjGMZEk6HJ+cAe/lCuSqm/BSg72L2a4sWAwQM19+Y0Xtm
 4oW70fAMWHttfEK80RcKHYaKkaX82hssAwb7o2QiYkC3FVqHQQkXS14vykXhi3iKdgiq9SjrkBI
 eZn+U6w+1Yjr06eJ3ehoBJP9CiYbbP26qDTqBRAhKnfswHEZX9/kZM63ddVYH60DI8NPzPST/pj
 SfZ7AIMqemTcA1KXCFC6CiMjq8R6A/Q0bthmVJoE6Qb2eLa28s5TZaTRFJtRNJ2c+J7jPwrN+5D
 QrrCDpTMjzYw5bedxN9Au2mlxW43ZdVd+RikFGAtY/BKB3NWebUBvSSOwMJng/rDsdU1qVfwIO+
 T9Mg6jPWc1T6ZAA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm axm55xx_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/axm55xx_defconfig | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 516689dc6cf16407f2b82370ed08df8da1b5770f..d30e8a350ed26e07af6722666cde763ab3196c85 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -1,6 +1,5 @@
 CONFIG_SYSVIPC=y
 CONFIG_POSIX_MQUEUE=y
-CONFIG_FHANDLE=y
 CONFIG_AUDIT=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -27,18 +26,15 @@ CONFIG_ARCH_AXXIA=y
 CONFIG_ARM_LPAE=y
 CONFIG_ARM_THUMBEE=y
 CONFIG_ARM_ERRATA_430973=y
-CONFIG_ARM_ERRATA_643719=y
 CONFIG_ARM_ERRATA_720789=y
 CONFIG_ARM_ERRATA_754322=y
 CONFIG_ARM_ERRATA_754327=y
 CONFIG_ARM_ERRATA_764369=y
 CONFIG_ARM_ERRATA_775420=y
 CONFIG_ARM_ERRATA_798181=y
-CONFIG_PCIE_AXXIA=y
 CONFIG_SMP=y
 CONFIG_NR_CPUS=16
 CONFIG_HOTPLUG_CPU=y
-CONFIG_AEABI=y
 CONFIG_OABI_COMPAT=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
@@ -85,8 +81,6 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_M25P80=y
-CONFIG_PROC_DEVICETREE=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_EEPROM_AT24=y
@@ -94,7 +88,6 @@ CONFIG_EEPROM_AT25=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_ATA=y
-CONFIG_PATA_PLATFORM=y
 CONFIG_PATA_OF_PLATFORM=y
 CONFIG_MD=y
 CONFIG_BLK_DEV_DM=y
@@ -103,7 +96,6 @@ CONFIG_NETDEVICES=y
 CONFIG_TUN=y
 CONFIG_VETH=y
 CONFIG_VIRTIO_NET=y
-# CONFIG_NET_CADENCE is not set
 # CONFIG_NET_VENDOR_BROADCOM is not set
 # CONFIG_NET_VENDOR_CIRRUS is not set
 # CONFIG_NET_VENDOR_FARADAY is not set
@@ -116,7 +108,6 @@ CONFIG_VIRTIO_NET=y
 # CONFIG_NET_VENDOR_STMICRO is not set
 # CONFIG_NET_VENDOR_VIA is not set
 # CONFIG_NET_VENDOR_WIZNET is not set
-CONFIG_BROADCOM_PHY=y
 # CONFIG_WLAN is not set
 # CONFIG_MOUSE_PS2_ALPS is not set
 # CONFIG_MOUSE_PS2_LOGIPS2PP is not set
@@ -132,10 +123,8 @@ CONFIG_VIRTIO_CONSOLE=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
-CONFIG_I2C_AXXIA=y
 CONFIG_SPI=y
 CONFIG_SPI_PL022=y
-CONFIG_DP83640_PHY=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_PL061=y
@@ -150,10 +139,7 @@ CONFIG_PMBUS=y
 CONFIG_SENSORS_LTC2978=y
 CONFIG_WATCHDOG=y
 CONFIG_ARM_SP805_WATCHDOG=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_HID_A4TECH=y
-CONFIG_HID_APPLE=y
 CONFIG_HID_BELKIN=y
 CONFIG_HID_CHERRY=y
 CONFIG_HID_CHICONY=y
@@ -164,7 +150,6 @@ CONFIG_HID_KYE=y
 CONFIG_HID_GYRATION=y
 CONFIG_HID_TWINHAN=y
 CONFIG_HID_KENSINGTON=y
-CONFIG_HID_LOGITECH=y
 CONFIG_HID_MICROSOFT=y
 CONFIG_HID_MONTEREY=y
 CONFIG_HID_NTRIG=y
@@ -182,7 +167,6 @@ CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_EHCI_HCD=y
 # CONFIG_USB_EHCI_TT_NEWSCHED is not set
-CONFIG_USB_EHCI_HCD_AXXIA=y
 CONFIG_USB_STORAGE=y
 CONFIG_MMC=y
 CONFIG_MMC_ARMMMCI=y
@@ -195,18 +179,9 @@ CONFIG_PL320_MBOX=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-CONFIG_EXT4_FS=y
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_CUSE=y
-CONFIG_FSCACHE=y
-CONFIG_FSCACHE_STATS=y
-CONFIG_FSCACHE_HISTOGRAM=y
-CONFIG_FSCACHE_DEBUG=y
-CONFIG_FSCACHE_OBJECT_LIST=y
-CONFIG_CACHEFILES=y
-CONFIG_CACHEFILES_HISTOGRAM=y
 CONFIG_ISO9660_FS=y
 CONFIG_UDF_FS=y
 CONFIG_MSDOS_FS=y
@@ -218,19 +193,14 @@ CONFIG_CRAMFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
-CONFIG_NFS_FSCACHE=y
 CONFIG_SUNRPC_DEBUG=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_CRYPTO_XCBC=y
 CONFIG_PRINTK_TIME=y
 CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 # CONFIG_SCHED_DEBUG is not set
 CONFIG_RCU_CPU_STALL_TIMEOUT=60
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y
-CONFIG_CRYPTO_GCM=y
-CONFIG_CRYPTO_SHA256=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set

-- 
2.47.0


