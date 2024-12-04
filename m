Return-Path: <linux-arm-msm+bounces-40301-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D8579E3F29
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2BD2B28CD0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:00:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECF1520DD71;
	Wed,  4 Dec 2024 15:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dy1Vt4TE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED1720DD63;
	Wed,  4 Dec 2024 15:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327877; cv=none; b=XqBMD2JBUEMroRzXPpIJDNb8F6cOzI0wol8g7v5SgAOjQDL1uJ41fgQ52X036NfPHSHYSDI7HBrIf6N8jWYnUBr+gyRjcyfTTkB6vIiYdNRXFzeRO5ZVx6tzNK/ZG4FM+Hia6fEivO6dZTk8HQJ83Ofw0Vy00KlhyhV5Lfa7uFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327877; c=relaxed/simple;
	bh=HdpaVHroT6iC/mIuADXOnpTo/dSXbaiBN9gF6efkgy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nKawDqKxyp1U4rAQVZdFhxOViIxOaBlD1GZtS01MvQh+wnrLoQT+EnVJ/H6x0qEqtHRbqODxACEWy9so/su4hmpQwnn1+zg/+NPM5q4lpKw6S0m3RDYXjgJYbmcVJWE/aTx53H+sduXBROcKLrCiA2y+GYb+CpKKsWgC3j9HEW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dy1Vt4TE; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53e2121112eso53125e87.3;
        Wed, 04 Dec 2024 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327874; x=1733932674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pE54ERLXzMFHOSVaFHGMF5JbmllGHfQ89Y0kI1gToQg=;
        b=dy1Vt4TEkMqILqOVIM7qlKCYzGcYB/oI2gc0xbBVzSXevjGAnV60lVKxdyJRm8m5c7
         oI3VDLbHCX25StmItwJAHoAcV+87N//CGmmgVGYdDRM3idiKLxrs8J9y+dX8n7BEat1y
         3wVRg6UQWO3CN5QLu+vqELhZ1oB8MDvV4/1HBY3Z0wOSYTBpI1KAaYBzSoEDPdAyDeRw
         vaALvBcM15RJtxV5/IA0Q/qrCIm221S70zzcimzGdc5tuA/A2hsH7zAlzPNECjZ3W6/v
         jxs3J7Z1mM1pSxDrmQKRdJChblcEOvUZa2HwL7gD+A2B4Pe96iiniOQD7lXfAMF6ecE5
         /suA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327874; x=1733932674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pE54ERLXzMFHOSVaFHGMF5JbmllGHfQ89Y0kI1gToQg=;
        b=CCSdRi8Wt49S42td8IDw8paabIJO9SxtiqND8ULEAnLTm9FChWVkiYg3kjKicsq49l
         Pf2dO0bbrpoQbtBm5MnEQBhD6m1YaW2NzRluk3QT16hCvHP3ACzXZ1vglZvHZIGOVn3T
         B5KYvM5zCRpr0s0F4cTUpFDviv4VNfNErrmtmwHA3KgxHaXGmFu/FBWLWIibpudMVDWA
         dmnT3TruhvC38lWZ6z7SDt/zc033JOpqCxp9o+tpGsFoWRSEjmno1ooRiGleP0v+NKaq
         pGf/nyxfpE/5udYfdba0LdliVltcHCLs4QVeZQ6gRmWvO7kf1TcN6y86oUty2g6O6sAl
         WHeA==
X-Forwarded-Encrypted: i=1; AJvYcCW1WhRjwhn/vR9xKzbFYpFIKQSfGyE082N/g5wd0fpoZ5HBv5PO8DXhS442hdLwWcIIm3ed0+/Deb0bYWnP@vger.kernel.org, AJvYcCXl/pvoopKeDkvDh1pM/H/7exXGSF5YsIJ0egwr7R+hW/Ckq+5ahlFtXZ6FG5J3ehwD1mlwtSg6XcuHsDhz@vger.kernel.org
X-Gm-Message-State: AOJu0YzaB8oh0ryitpm1kLpBROR2Nfz+rSePL7BhkuySTtjXVoJv96F/
	lTX6GxdfFhWbIg88O0OVWcb4gouvpcPeVX2Zjs5cjSdzZfOD5M0c
X-Gm-Gg: ASbGncvhVB4w8qGLVHNd1okrJZDdeXvKuw1z68Gdb7Yt1aynroL21f8dCJIkt4W3boi
	IWutu5Qiaymmz/gTlwy2ENHgaGAD0nssoRxd3wGmsHWJy8tvMu+uZsq0zTMc9QGRd3cX1nBX0lK
	j149N0yatUKIHL2VjLm6uP1/SOwCrHJLKv8dzkt8IJoqnsG1N8EQ1ATddMKKldzNl3uIEpvpPTL
	C42SD/p+dgQK9lNRTlFhqfW+FXO7KbxEHfIX2h3VFaS5qSROjOuP9i/4wu8JlZMDzcb5xvKsDWO
	WT7zIBgSdrwrCY8=
X-Google-Smtp-Source: AGHT+IE9tM02DUH8MOCjzjoQQbTra+vnau6HGJnv0bJ8SHLzV3mdbCN08x9wN5NL4MZ4tHud9pXj/w==
X-Received: by 2002:a05:6512:3b1e:b0:53e:f38:60eb with SMTP id 2adb3069b0e04-53e129cd2f1mr3878419e87.10.1733327874359;
        Wed, 04 Dec 2024 07:57:54 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:52 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:45 +0100
Subject: [PATCH 3/9] ARM: dove_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-3-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=HdpaVHroT6iC/mIuADXOnpTo/dSXbaiBN9gF6efkgy0=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvTAsyCMOgmu7E7wO60y6tKwceJVxfi79/8L
 xMvNhX1cYyJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B70wAKCRCIgE5vWV1S
 MoSJD/9KbSQFCcwv99pqsWFQON7Uam7nPkP8bGmLJAjlaK+anFeRQOjNCs8z+ohJSol7YY3eFwG
 u3x8NtJ0vhmHurJkTv5jzI2UuAT0povAAGeUcZPtB0XWm2c4vo7wdu96TazEMlr1BItqO3xogVn
 wZfE7jIGaXkPYaMEcJr8fu+kgGAUq2Ie6yIj6pLI4Shj1Q5C8ObGzYJttVJwAZscK+USBJNt7cP
 Y5hBvNZpl3ObqbeyMGgntiDjeQGiXblr6Yknv0oXVDWHRR8V7YlV22DNLcTT+2JTivfjG3137RX
 Gnernb3VmE3Nk/VBJE1MfwInv6y41HakaQ+MNzq//n3Wj3zSAUfo149qMfmvxCMz7f+1W6tGdNU
 NtSCYuyA6+Yfp9PWKW9M9mlHxEIBIuUhtlJ7XXbpvPaGlEW5tv7pZLwSSnc8HIqYYqTy4OjEP0t
 MOgVy+BGu+hppz7NhMGfZ63FsnqTJTVjDq0mtez7zY+yzJ/buQS8L8BhZQ1Mq7GrjgD0HbmPPvB
 6KYr9rkhVwqUUS1xt1HZ118kwupanjZH7e1XLxLR1DryxkHDSAabhYDO3d4iwuSc2wrKsgvLc+9
 zYQdAx383LofbDG6NLIOJTyVBjH7/jCt29rzXvjUs0ay3ED2Y1QIjDSqHiHuTsVJ4EPGFaBdcZX
 gBi+mFXD/llylAA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm dove_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/dove_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/dove_defconfig b/arch/arm/configs/dove_defconfig
index 2849d17f585660aa8ff6aad5d554c4bb2d794c60..c3e19e6aa6c9d8e40ecee7d97d185909db61b6c2 100644
--- a/arch/arm/configs/dove_defconfig
+++ b/arch/arm/configs/dove_defconfig
@@ -3,11 +3,8 @@ CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
 CONFIG_EXPERT=y
-# CONFIG_ARCH_MULTI_V6 is not set
-CONFIG_ARCH_MULTI_V7=y
 CONFIG_ARCH_DOVE=y
 CONFIG_MACH_CM_A510=y
-CONFIG_AEABI=y
 CONFIG_HIGHMEM=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
@@ -40,7 +37,6 @@ CONFIG_MTD_CFI_GEOMETRY=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
@@ -53,7 +49,6 @@ CONFIG_ATA=y
 CONFIG_SATA_MV=y
 CONFIG_NETDEVICES=y
 CONFIG_MV643XX_ETH=y
-# CONFIG_INPUT_MOUSEDEV is not set
 CONFIG_INPUT_EVDEV=y
 # CONFIG_KEYBOARD_ATKBD is not set
 # CONFIG_MOUSE_PS2 is not set
@@ -96,8 +91,6 @@ CONFIG_DMADEVICES=y
 CONFIG_MV_XOR=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
-# CONFIG_EXT3_FS_XATTR is not set
-CONFIG_EXT4_FS=y
 CONFIG_ISO9660_FS=y
 CONFIG_JOLIET=y
 CONFIG_UDF_FS=m
@@ -112,12 +105,9 @@ CONFIG_NLS_CODEPAGE_850=y
 CONFIG_NLS_ISO8859_1=y
 CONFIG_NLS_ISO8859_2=y
 CONFIG_NLS_UTF8=y
-CONFIG_TIMER_STATS=y
 CONFIG_CRYPTO_NULL=y
 CONFIG_CRYPTO_BLOWFISH=y
-CONFIG_CRYPTO_TEA=y
 CONFIG_CRYPTO_TWOFISH=y
-CONFIG_CRYPTO_ECB=m
 CONFIG_CRYPTO_PCBC=m
 CONFIG_CRYPTO_HMAC=y
 CONFIG_CRYPTO_MD4=y
@@ -126,7 +116,6 @@ CONFIG_CRYPTO_SHA256=y
 CONFIG_CRYPTO_SHA512=y
 CONFIG_CRYPTO_DEFLATE=y
 CONFIG_CRYPTO_LZO=y
-# CONFIG_CRYPTO_ANSI_CPRNG is not set
 CONFIG_CRYPTO_DEV_MARVELL_CESA=y
 CONFIG_CRC_CCITT=y
 CONFIG_LIBCRC32C=y

-- 
2.47.0


