Return-Path: <linux-arm-msm+bounces-40306-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B089E3EFC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:01:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F177169745
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21AED2101B1;
	Wed,  4 Dec 2024 15:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8PKckco"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036E2101A6;
	Wed,  4 Dec 2024 15:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327892; cv=none; b=d7G1dXInPRhGK3Pm52xsottsWXuYb83CT9BJkAOSH/mB3qMDAeAIex6I3gwmfMupzudomq/kULMFfEHWHZOmRPEin3VzXJXAdPG/FIxwE5vMBJ+p9FjULagYlFBJ/KOXTa/wSk97u88UI9KJFPiEZGjGGuyM9eqiIohhfvyjn0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327892; c=relaxed/simple;
	bh=qLf+OscItBw8MHpWEaV1DqM+RlkXLw4hOz0zFmKFx8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WgvqUOGvIx6Kh7M7ertBM2Y6M2bWcWyQy/cStcWr4W5G/rUOs8ER2gO6/ji31uiA9SXJ9ZyRQQQV737PrvXXK0UTKucTDZaNpinJE4yJeOS5XnG3Ei8CbgKbTgOmSnlvJRzaxDk2lm30to97/0GICnciFGHxzQexA0Vu6PAoDms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8PKckco; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53de556ecdaso7130746e87.1;
        Wed, 04 Dec 2024 07:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327888; x=1733932688; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRNozn+CmJ/ud473L/9S72anLINqKxujpLwpR8ystFA=;
        b=j8PKckcoxUdj2lIa9FnJKmx0lTY3WjRey81BnzGNU/Ahav2AbpBuGOXbs38yQqynyh
         lIApBjwFXT/dl25cpGPGENw2HrdmMW50JUA7Y0UIOYdX9cB56R6+c80bYmGIrLCFBDzp
         kMhEa554G9qZRqTV/bUmdJ1mup9LKerc9gCkKUsP+uzRC1IG8aemBaLRwUrYEPaPBF1y
         IY/0EJvK61tw5FZkx4OK683BmQv/qE4F/dMMPhVY5FNuA7Q1KD5zjZEzkhFIMlCwjfqw
         ptCR7989z/YgGnROIZb0MgCoe6chlkr/+2WA3tYpEl9/nLpd+8tHV9/BDFLWeal5qJjm
         6wsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327888; x=1733932688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRNozn+CmJ/ud473L/9S72anLINqKxujpLwpR8ystFA=;
        b=AZxivbBG09GxGHtevh/QHAhnRgqMOlGrRz13eDOLIY1wng2dnk9jeD59/JNpto4HO9
         /Jjgie2s4Ce9zbwRCAK4RTrJmoazd3Xh6/IFw2tPPxxHk62Tho8MC61XIYqQVnlKrdoh
         ho/HLFXj+r3O4PTOmmB0w6Y5+QRfDX4Q7h1fJSqK5fOpDMXu8AkLoxn8+TiulC9ivKvd
         fa5CLCAnACX0pMb6dGeQ1/gz+lAcs99htGoiD0Vri4qwq3upp3Pmnm9q9BRkTqGvVtWP
         vrz4Ia9zKUOOQo0cUIyywjh5ihqviuIb2DR55okgRKcOKhaw8dnjKdKjnmDI9mjnSvtQ
         11rw==
X-Forwarded-Encrypted: i=1; AJvYcCV4fgNkfy93hAxy+DQcslL7PllxV7zuCmUT0uxtWJ43NSMcAEtkRJG5ZRz32kkDpuwbeWmQfaZD+WRj/sjS@vger.kernel.org, AJvYcCWtTVWCsQrEtd5mNQtAx/+jIWvZC4oMjZkKEHPw4Ve5DdCDlL/ObSU18CJXcXkldDK3ZN8nqb5hS6BQT4+w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw07sSoEpWWtgtM1nOM1GlBLh5tY4/A1wu8JxnUKAUX0z9ZDaaD
	l7fLFYrUXAnrNAuEkngI4svgYRbPJ1YkYl8K73X4FMCzrpNncmPB
X-Gm-Gg: ASbGncuFGPCzw70OGxdOi/wHdb8KiH+4oRuVXsiEmQKUXV2HcsuZr7Swla5zzrQ6Yme
	hS0LE7TdAaiw65iC6lKRMCeTRrxk283boBHnV8if/L2s/pZfpIhX3aR/2EA7eZ8rExCL5cBZ+UJ
	Q2P7nxmkHIcQK9RhogU48BI+Oe37mmr9S4XchfRFfel22EKXlAnJn3TDnLE7Ippg5vF2B3N0rTp
	4h4KdPRRSJNCShc1EplI+l/ly2NwT1kR7wvUE0+lQ2RwtWHrV3TKuz5MSbebT1ogrV/g7QR0pJT
	k692+I+W/OoiXDI=
X-Google-Smtp-Source: AGHT+IFaHu0p8meQ8L3Hziy4MXUTfssymJH4vo37O/hYKq4ya/mGS+ElObDyqmeHNSYxvva8OfGHwQ==
X-Received: by 2002:a05:6512:224d:b0:53d:f82a:deb8 with SMTP id 2adb3069b0e04-53e129fdd73mr4650320e87.14.1733327888326;
        Wed, 04 Dec 2024 07:58:08 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:06 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:50 +0100
Subject: [PATCH 8/9] ARM: qcom_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-8-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4815;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=qLf+OscItBw8MHpWEaV1DqM+RlkXLw4hOz0zFmKFx8Q=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvr/6QKFOKNlHDLGT9HydO3AqmoddYqDOLYb
 y3vjUNPVy+JAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B76wAKCRCIgE5vWV1S
 MquMEADEJAgMYnB4LEUqby0BzakaMLt0xuqIwLK/I4IR9GDSOtruMFF/LXX286F0WmJhfTDHVON
 jtC+Iq4/rAI0I5VuegINbTSQVqenwvxL38AkPwGec41R9RUSns+kSXnt4F3on88h7cSBZJ91JSD
 k0GWbGDK5JsomO8p1YSRB5ompRKJjwVVGdw4MmeVe5vusSE9TUgMequt3bW+jN3vJn3UE3T9H3f
 Iz7AnxwUr93ORQiIn+s6TOe+I0jO7kOuAV2Eqte4xt6Wmh7aU5xyEXv1yMZBq7Q0ov8GmKKlxt2
 SaKk/AZUyXc/89i61PSij2pPSfhkTg0WzuAfagBsOoEaRcXQIir7rKN+gejKKT6D63Ju1eDmkVj
 ESaMxOn+jFfN+QaOZAOLLRn022nciPMkoFgxYmK+jOlqVifMrQkbU35j/KnUC0+Icg94+F/WQ/A
 S0X+ef7BCKBy+E/NLI/0vmMi6EazfwVy3rvXAqstvhM3lRVfKtfvWRHIwwHsOcwNcD5cj+QeM6e
 vFMQeZWcLk9WbJh8PzsPuJOR90smWU3Sj89f0RvpoN/n7oxGrt06H5D7Q9d95leoPmofN5QpDut
 jMdLRUXZO0nQN9jGQzKvWyjV9wOrIYKcPs/kD5JcGMFqM4xsv9HvhLKJ2A6Mm01Ak5kdHBp03EM
 YdOO96nFKbFvr9g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm qcom_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/qcom_defconfig | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)

diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index ec52ccece0ca7d6471f04ef4a6953f02530655c5..bc58e76eee18a583da4a591d57dcd632eaae862c 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -10,10 +10,6 @@ CONFIG_EXPERT=y
 CONFIG_KALLSYMS_ALL=y
 CONFIG_PROFILING=y
 CONFIG_ARCH_QCOM=y
-CONFIG_ARCH_MSM8X60=y
-CONFIG_ARCH_MSM8960=y
-CONFIG_ARCH_MSM8974=y
-CONFIG_ARCH_MDM9615=y
 CONFIG_SMP=y
 CONFIG_ARM_PSCI=y
 CONFIG_HIGHMEM=y
@@ -43,9 +39,6 @@ CONFIG_IP_MULTIPLE_TABLES=y
 CONFIG_IP_ROUTE_VERBOSE=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_IPV6 is not set
 CONFIG_QRTR=m
 CONFIG_QRTR_SMD=m
@@ -63,7 +56,6 @@ CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_MTD=y
 CONFIG_MTD_QCOMSMEM_PARTS=y
 CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_QCOM=y
 CONFIG_MTD_SPI_NOR=y
@@ -105,7 +97,6 @@ CONFIG_KEYBOARD_PMIC8XXX=y
 CONFIG_INPUT_JOYSTICK=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_INPUT_MISC=y
-CONFIG_INPUT_MSM_VIBRATOR=m
 CONFIG_INPUT_PM8941_PWRKEY=m
 CONFIG_INPUT_PM8XXX_VIBRATOR=y
 CONFIG_INPUT_PMIC8XXX_PWRKEY=y
@@ -120,7 +111,6 @@ CONFIG_SERIAL_MSM=y
 CONFIG_SERIAL_MSM_CONSOLE=y
 CONFIG_SERIAL_DEV_BUS=y
 CONFIG_HW_RANDOM=y
-CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_QUP=y
 CONFIG_SPI=y
@@ -139,7 +129,6 @@ CONFIG_PINCTRL_MDM9615=y
 CONFIG_PINCTRL_MSM8X74=y
 CONFIG_PINCTRL_MSM8909=y
 CONFIG_PINCTRL_MSM8916=y
-CONFIG_GPIOLIB=y
 CONFIG_PINCTRL_SDX55=y
 CONFIG_PINCTRL_SDX65=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
@@ -156,7 +145,6 @@ CONFIG_QCOM_WDT=y
 CONFIG_MFD_PM8XXX=y
 CONFIG_MFD_QCOM_RPM=y
 CONFIG_MFD_SPMI_PMIC=y
-CONFIG_REGULATOR=y
 CONFIG_REGULATOR_FIXED_VOLTAGE=y
 CONFIG_REGULATOR_QCOM_RPM=y
 CONFIG_REGULATOR_QCOM_RPMH=y
@@ -165,15 +153,13 @@ CONFIG_REGULATOR_QCOM_SPMI=y
 CONFIG_MEDIA_SUPPORT=y
 CONFIG_DRM=y
 CONFIG_DRM_MSM=m
-CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_ANALOGIX_ANX78XX=m
 CONFIG_FB=y
-# CONFIG_LCD_CLASS_DEVICE is not set
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_LM3630A=y
 CONFIG_BACKLIGHT_LP855X=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_DYNAMIC_MINORS=y
@@ -187,16 +173,13 @@ CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_OTG=y
 CONFIG_USB_MON=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_MSM=y
 CONFIG_USB_ACM=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y
 CONFIG_USB_CHIPIDEA_HOST=y
-CONFIG_USB_CHIPIDEA_ULPI=y
 CONFIG_USB_SERIAL=y
 CONFIG_USB_HSIC_USB4604=y
-CONFIG_USB_MSM_OTG=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_GADGET_DEBUG_FILES=y
 CONFIG_USB_GADGET_VBUS_DRAW=500
@@ -204,7 +187,6 @@ CONFIG_USB_CONFIGFS=y
 CONFIG_USB_CONFIGFS_NCM=y
 CONFIG_USB_CONFIGFS_ECM=y
 CONFIG_USB_CONFIGFS_F_FS=y
-CONFIG_USB_ULPI_BUS=y
 CONFIG_USB_ETH=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=32
@@ -234,7 +216,6 @@ CONFIG_IPQ_GCC_4019=y
 CONFIG_IPQ_LCC_806X=y
 CONFIG_MSM_GCC_8660=y
 CONFIG_MSM_LCC_8960=y
-CONFIG_MDM_LCC_9615=y
 CONFIG_MSM_MMCC_8960=y
 CONFIG_MSM_MMCC_8974=y
 CONFIG_SDX_GCC_55=y
@@ -245,9 +226,7 @@ CONFIG_QCOM_APCS_IPC=y
 CONFIG_MSM_IOMMU=y
 CONFIG_ARM_SMMU=y
 CONFIG_REMOTEPROC=y
-CONFIG_QCOM_ADSP_PIL=y
 CONFIG_QCOM_Q6V5_PAS=y
-CONFIG_QCOM_Q6V5_PIL=y
 CONFIG_QCOM_WCNSS_PIL=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_CTRL=y
@@ -256,7 +235,6 @@ CONFIG_RPMSG_QCOM_SMD=y
 CONFIG_QCOM_COMMAND_DB=y
 CONFIG_QCOM_GSBI=y
 CONFIG_QCOM_OCMEM=y
-CONFIG_QCOM_PM=y
 CONFIG_QCOM_RMTFS_MEM=y
 CONFIG_QCOM_RPMH=y
 CONFIG_QCOM_SMEM=y
@@ -289,7 +267,6 @@ CONFIG_PHY_QCOM_USB_HS=y
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
 CONFIG_PHY_QCOM_USB_HSIC=y
 CONFIG_NVMEM_QCOM_QFPROM=y
-CONFIG_INTERCONNECT=y
 CONFIG_INTERCONNECT_QCOM=y
 CONFIG_INTERCONNECT_QCOM_MSM8974=m
 CONFIG_INTERCONNECT_QCOM_SDX55=m
@@ -298,7 +275,6 @@ CONFIG_EXT2_FS_XATTR=y
 CONFIG_EXT3_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_VFAT_FS=y
-CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 CONFIG_UBIFS_FS=y
 CONFIG_NFS_FS=y
@@ -310,7 +286,6 @@ CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_UTF8=y
 CONFIG_CRYPTO_USER=m
-CONFIG_CRYPTO_USER_API=m
 CONFIG_CRYPTO_USER_API_HASH=m
 CONFIG_CRYPTO_USER_API_SKCIPHER=m
 CONFIG_CRYPTO_USER_API_RNG=m

-- 
2.47.0


