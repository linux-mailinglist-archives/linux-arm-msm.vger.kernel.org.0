Return-Path: <linux-arm-msm+bounces-40300-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B9009E3F69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B854B3FDBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 15:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4409620DD51;
	Wed,  4 Dec 2024 15:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q+sgxF4/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B720D51F;
	Wed,  4 Dec 2024 15:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327875; cv=none; b=DVeGfcdigaCNpMgaq0Iz4SfFRJZwhXnin9xhm4ilytfqhYT3CEKFKGRMK9q/HqWuYVXg+vOr6Pyi7gRqec6pyZzkWwD6b3AmTsh9Q6ccjXQ68rOw1ZCHRvvky5S9EfSs2pr//OQPkLOpqZCH9Uk3iiU9/Ewn7MEG7WtitSlvMsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327875; c=relaxed/simple;
	bh=zjQeF+lHLGXt0nBZef6OKhZZCWLAYAtCLWguUvf+RB8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVboSjouuPU4snDt8KU5qy9qEpJNAhvF+2gvqd55Tbp3Qdi3gnFIVC/jnVX0VjcVg60EsMKhv22gOGhRCbRPUPVi3eIkgNhc4ZMe8BTV4C2b3yEQIkE69Avio8zJvjht32/4AAJXqPv3/5Uji+7pE50fXYPmAwFlz/MoYo7e7lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q+sgxF4/; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dd57589c8so1155936e87.1;
        Wed, 04 Dec 2024 07:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327871; x=1733932671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSJIaNwMpBSVKM3jz7waFi0qzaqRh8xMyWjRSkgvN1w=;
        b=Q+sgxF4/L3h7LzegFnfov0E2hioI7bRFqClu6Ak8rhAGdxkn9gBVYQXvt35xHYeI1u
         80sfTkGfkglkekfGX0VPba5hMhs0F3vgtZNAyxc1iT3vTMVgvg5eSN+KuIW6PaMF93VY
         IyBvnOPStifWE/4mrqTU/TnDB7BrKxOfs0cUD+G/uFAkFs67laIHdy1rC3RZqHxxXJDl
         KAbXocPAhUJLfoq00OAx+GEZeDs5HtbhUjwIrNuPPgMItNXFzCdk06LF+gSxt0FLZYAt
         YizppliUtsjmh8EtDJZ/5k7u9RRgEGbtByAtfJ10okkokpM/YIIf4Enwbs3r3r4qcH2O
         jy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327871; x=1733932671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSJIaNwMpBSVKM3jz7waFi0qzaqRh8xMyWjRSkgvN1w=;
        b=tWj6fxLJfaH04OQ/AwMzw4/DmO1Byuttxm+DmpywZXvgbmDlKxoxoQ91zpV8N0t5YJ
         PjSjig71hMCq6WON9J1Uro1AoCp22ju/1staDuBZJQTbzE7r+FSalvTMM4vJbjEJ44MC
         otIt5M4xZiycMy54GvVfX4Fb5KOHq7bzf6Y9TWXszmJ7ocMLuH7SLQyKJxLCtp9tjch/
         NxNnsegyDPFIm04rllTRtlGptL/7yul2h8wyYzOryiOrX03/MTUwNzn6sfTvlOwD6h2c
         ra0ZCNps0jy5C00Z1Rvc+ZCsGxHt3YsKufMnWXCcNG5YBfgoXWsYPbwvBY6hMWF8Go3j
         sDwA==
X-Forwarded-Encrypted: i=1; AJvYcCV7EdYo3F13nH3IvjMiblFJ0NZDMqrctgvMhaAqTnyGEbS49iUHUqSnbNuY4qX2/zXFt1ZOlAxuoG4vgQFm@vger.kernel.org, AJvYcCX0AS/PYMLZWDBwd7LNQ6mJrmk4PC7VPWw1xWoZk0tpP995M+awF+0W+Q8Nksco7+fEMUnRSdQDCKseV+z6@vger.kernel.org
X-Gm-Message-State: AOJu0YxNgi+mVnrY2ixD5phB/jj/glVtokLgMcvT5J3e2tAmnP7MmcOL
	DAqOHLREJjbpEV5RCk95r2GVBXhtdSyUtS+PpjELqdP39Z9ZzoZ2
X-Gm-Gg: ASbGncszozD4DSdHxVe9x1SHFLb2FtmIUjtNinVh1t0PMf/wYKmtcIe7r1ZkMYjkHnf
	7Mj5ee2gjM8Uad83rPujDDNfRbRkqVSDm1G8bkzOZMWe9tkiC4KpFbpZY5aMgz1nCKqtzQgMgwW
	UFINOQdBwup9f9btDcP3VsO5q5uumP/n0CqlQ+zDYiJi7FHfXsVbnV+qWNJVfPQkAOVzoLfCi0g
	cjBdzaDsnXMw7nZBO/+ggzLDaPX5VnxfFFG63K4g86pX8lKbehARzKZ9GRCkpHf/N1Ic+pu6xw1
	O9/NYCrpL9sDRdY=
X-Google-Smtp-Source: AGHT+IFK+sV7O4icijjKv457E5UuddczGGVpjLjFLjjS3CacPYgnaEiA3MVt7SsciegK+X62jTjZDA==
X-Received: by 2002:a05:6512:118a:b0:53e:1d35:802b with SMTP id 2adb3069b0e04-53e1d3580aemr870242e87.22.1733327871107;
        Wed, 04 Dec 2024 07:57:51 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:49 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:44 +0100
Subject: [PATCH 2/9] ARM: davinci_all_defconfig: rebuild default
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-2-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3651;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=zjQeF+lHLGXt0nBZef6OKhZZCWLAYAtCLWguUvf+RB8=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvO2C97zXXxQW6czHz2jFaB/m+N9evB/PHNu
 48CzcfkS8GJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B7zgAKCRCIgE5vWV1S
 Mkd9EACa7dWnhdxZ/VRwCKnmJRA7zIPAmC7tIzR+zRXuXs+a95upoo/ZyESKuqLwNTsfZ1kCK01
 rNz9PIIJIGTjWWZpiZQ+teoVg4Mi15eNNCqGTwjVpaLDS9EAwZ3S8FJhSleO5LihSDE45XAEDhJ
 UIFRg89f3IvmQTLMmpKDeLTukzruYLiPEvD2bXJw9REYeKz7O7XWa9Jfn+ePN9whWU6zoe6Xhqw
 CL+x6oK8/NC0rTcueevwDvEnsM5bD8iInLmTd6bHT9J1XJTt9ek+5qHe4h2+6L94FwnFZqior7/
 WgM8wJX/mAX62sP0xcP4GlnNMnpyARZfnGFOy6gy4P/MwPx6byCnQ11tI5E3ASVO8B52rBsqWoA
 UHO4ulHPZoVApKf2/TN0H2J5bduRAxn0rBCw0NEvyksi0qNj7HM5gVIBq0IU1Ydf51zgoJToKyB
 fw54yqJLZ82kcwuw3wb9tztcrm8tnMuVry32orTB2JhtDt+RxKKqA266UCGaIpn049fYsyYe/rQ
 F6XQXxiAjuVuweKehGCZagm6lxG9BNcDtU/wXv7Vpz3YKGaM77mFRX2Gk23nA/Ojf91yqXv7TzD
 hyE4DqyOdYzkqAMBu22/KOQT8BoXp0WgOCpNGRoS6cVbL10ADb+KTqqbQU+V96K+Hb8K/Q4zXQp
 gLGrJSIi6PlnmkQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm davinci_all_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/davinci_all_defconfig | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/arch/arm/configs/davinci_all_defconfig b/arch/arm/configs/davinci_all_defconfig
index 3474e475373ae89a90bb5af8f11fca2aa9c289dc..6465a56cb51f5cf89b6bb1b00e1ff82707758e6a 100644
--- a/arch/arm/configs/davinci_all_defconfig
+++ b/arch/arm/configs/davinci_all_defconfig
@@ -10,8 +10,6 @@ CONFIG_CGROUPS=y
 CONFIG_CHECKPOINT_RESTORE=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
-CONFIG_ARCH_MULTIPLATFORM=y
-CONFIG_ARCH_MULTI_V5=y
 # CONFIG_ARCH_MULTI_V7 is not set
 CONFIG_ARCH_DAVINCI=y
 CONFIG_ARCH_DAVINCI_DA830=y
@@ -19,10 +17,8 @@ CONFIG_ARCH_DAVINCI_DA850=y
 CONFIG_DAVINCI_MUX_DEBUG=y
 CONFIG_DAVINCI_MUX_WARNINGS=y
 CONFIG_AEABI=y
-CONFIG_SECCOMP=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
-CONFIG_AUTO_ZRELADDR=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE=y
 CONFIG_CPU_FREQ_GOV_PERFORMANCE=m
@@ -53,7 +49,6 @@ CONFIG_BT_HCIUART=m
 CONFIG_BT_HCIUART_LL=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_FW_LOADER=m
 CONFIG_DA8XX_MSTPRI=y
 CONFIG_MTD=m
 CONFIG_MTD_TESTS=m
@@ -63,7 +58,6 @@ CONFIG_MTD_CFI=m
 CONFIG_MTD_CFI_INTELEXT=m
 CONFIG_MTD_CFI_AMDSTD=m
 CONFIG_MTD_PHYSMAP=m
-CONFIG_MTD_M25P80=m
 CONFIG_MTD_RAW_NAND=m
 CONFIG_MTD_NAND_DAVINCI=m
 CONFIG_MTD_SPI_NOR=m
@@ -77,7 +71,6 @@ CONFIG_EEPROM_AT24=y
 CONFIG_BLK_DEV_SD=m
 CONFIG_ATA=m
 CONFIG_AHCI_DA850=m
-CONFIG_PATA_BK3710=m
 CONFIG_NETDEVICES=y
 CONFIG_NETCONSOLE=y
 CONFIG_TUN=m
@@ -116,12 +109,10 @@ CONFIG_I2C_DAVINCI=y
 CONFIG_SPI=y
 CONFIG_SPI_DAVINCI=m
 CONFIG_PINCTRL_DA850_PUPD=m
-CONFIG_PINCTRL_SINGLE=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_PCA953X=y
 CONFIG_GPIO_PCA953X_IRQ=y
-CONFIG_RESET_CONTROLLER=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_SYSCON_REBOOT_MODE=m
@@ -133,32 +124,26 @@ CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_TPS6507X=y
 CONFIG_MEDIA_SUPPORT=m
-CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_MEDIA_USB_SUPPORT=y
 CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_VIDEO_DAVINCI_VPIF_DISPLAY=m
 CONFIG_VIDEO_DAVINCI_VPIF_CAPTURE=m
-# CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
 CONFIG_VIDEO_TVP514X=m
 CONFIG_VIDEO_ADV7343=m
 CONFIG_DRM=m
 CONFIG_DRM_TILCDC=m
 CONFIG_DRM_SIMPLE_BRIDGE=m
-CONFIG_DRM_TINYDRM=m
 CONFIG_TINYDRM_ST7586=m
 CONFIG_FB=y
-CONFIG_FB_DA8XX=y
 CONFIG_FIRMWARE_EDID=y
 CONFIG_BACKLIGHT_PWM=m
 CONFIG_BACKLIGHT_GPIO=m
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 CONFIG_SOUND=m
 CONFIG_SND=m
 CONFIG_SND_USB_AUDIO=m
 CONFIG_SND_SOC=m
-CONFIG_SND_SOC_TLV320AIC3X=m
 CONFIG_SND_SOC_DAVINCI_MCASP=m
 CONFIG_SND_SOC_DAVINCI_EVM=m
 CONFIG_SND_SIMPLE_CARD=m
@@ -204,14 +189,12 @@ CONFIG_MMC_DAVINCI=y
 CONFIG_NEW_LEDS=y
 CONFIG_LEDS_CLASS=m
 CONFIG_LEDS_GPIO=m
-CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_TIMER=m
 CONFIG_LEDS_TRIGGER_HEARTBEAT=m
 CONFIG_LEDS_TRIGGER_DEFAULT_ON=m
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_OMAP=m
 CONFIG_DMADEVICES=y
-CONFIG_TI_EDMA=y
 CONFIG_COMMON_CLK_PWM=m
 CONFIG_REMOTEPROC=y
 CONFIG_DA8XX_REMOTEPROC=m
@@ -254,5 +237,4 @@ CONFIG_DMA_CMA=y
 CONFIG_DEBUG_FS=y
 CONFIG_DEBUG_RT_MUTEXES=y
 CONFIG_DEBUG_MUTEXES=y
-# CONFIG_ARM_UNWIND is not set
 CONFIG_DEBUG_USER=y

-- 
2.47.0


