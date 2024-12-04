Return-Path: <linux-arm-msm+bounces-40303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A809E40BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 18:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 74B26B42B3C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D92D20E034;
	Wed,  4 Dec 2024 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYa9JSFl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C863020DD63;
	Wed,  4 Dec 2024 15:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327883; cv=none; b=Hv4jQJewQ/A8cGOEy3po1k3vZ77JeMFjEsAo/SE4wTYvibYK9XIYGLi5Xx6PQd1ZiBpDWYFOsMsBy7IDlP0+SNdM8alOI0XQf1dRTlGwa+FApqM3xCj45d+05arQBRCSC6rzmenEyyDulB5SRWO0sDG8zrnj0tzkGIs6wdgl12c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327883; c=relaxed/simple;
	bh=XPKa8479dz0V5E5HAGWYwOAk2JntXJAee03QMzKRTSQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ccrBAajbGEN6inRfpo2YDRhlZ9potV48dbFYaLrR9J+Z75gq68YjaSc2xbENg3uv5I+cdkt4/lghSoiAUYdZe2Cj3f5yt0JKSg9+rzgk6G4xMN0/esmAcSXFlmzsi3l3myXwvDk8mHYdfZOe9nEZo2LHgKg5uVwnuXt+keMJMdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PYa9JSFl; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffd6b7d77aso85220581fa.0;
        Wed, 04 Dec 2024 07:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327880; x=1733932680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JfHYxP2GgtlUvSHoyxk9brlVRWIg2t+9FS/MzmulW6A=;
        b=PYa9JSFl9h/AfRag9OtlnxJWAqmixeBsMRkAUtTIs014jQGGOCmqIzz+MbupICU9SL
         8diAz45ywHg/wztajdvZSKyBuWS0rtN/Fn3hU8b6uiBS6PrFVGsvWJVBXQ/T3nUjW4Be
         vqllZ/zFiYQykNhSBDZvDQnGhnOJIMeXKXGbKb1hhTqv8Ab5PAiyt2YlEULDwNiidJsH
         1wec6qxTqk4RJ4qXMFLhpsWFSsU84L0TR1suJOHlDDI/Ec2HRUCws3KS5TnpSFQfWzC4
         khDgJh8AGY77egBoIQ3HVemgiRVOmP0eM0gBdYLTzQLJdznlHEyTK7A4dfNFaW/0cqAB
         rldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327880; x=1733932680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfHYxP2GgtlUvSHoyxk9brlVRWIg2t+9FS/MzmulW6A=;
        b=VLQ6LE2m108Ed5lGjEJTzdwTxtShpfTe7CJaa7dehr/e4S36ipag/MlteGMsHLDzJF
         AOJto51nS6wPHlsdttZYBJtv8eh05x5VpTpmHMOoc4BA3BZsRsolbeT7FHykSeb5mjMz
         umUlxL9BDdY/oqMsHMlMZzVDs/ShsEW/QvIwgnXnbZbNFUNDsRvZzpsbkvmDxMCU0+JZ
         vqM1X+wa8EUADJlva80IfCNuBx38At8t4I40jXgK1DkcWG0xJGfFT2pcjjKn71mrHZTa
         bksoFYnXXOOgP9ZdsJw4tRBGKcm2+KgO1Yrp3WA+3er66fxMdCi6vezGN4Wus4zBVOry
         pwrw==
X-Forwarded-Encrypted: i=1; AJvYcCWH1BeEWdhoXvKpL4PqV8XCCtMJSk1rOUlsoixQ2L8/luVkRJHUFk7jCglaQzgnkO+SC5du0kgNanpL19VZ@vger.kernel.org, AJvYcCWvkGn4MOfT/MLLqCsGBfJAf9O2v38qQRs7wB0Bly83tDIzLUCYEyKDVIYp7Vx4a47cnENdNDslcy5fpG9l@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt862rqiiClxihyYCNlkru1wkg4nJ8DUVnxWdFmZ9kp6ZIKzMi
	QuGfd6upcU+GDlp9w9ALPuh/A+xD33DwYyvaoeeOlyAMdd1Ke8nX
X-Gm-Gg: ASbGncvrbSfuGgs3vQnuZt7vYInw21DAP+rPDS0woN2h9rRvH10H1/JYAzhbLaU0sC+
	2aoos0aLZmp3i+KOCAklaOUVkKXIqKZOhJgxqeoo1OGOx7TdSLAvDXgX/Hc4HU/xagf/v0ay5jy
	6HfbZ4yfdutKOFknNVCMUlikbIsllHD8xwcxaA1xmLH6Vyj9so/BrxFklVubG93sQlatVu8u5HB
	PtF6GMbrow3mRFDY2gCyL0HJR1HWGVvRkrgh98wCeZT9bj0l5XwMaZbRJA5ND9G+0Lai20777sI
	4yqtlLcBZPeSCxo=
X-Google-Smtp-Source: AGHT+IEnG7rAIHbmYk1mvEg0ri78z0sWiaMH6QfOyp2+jXWu85eTrMU3PvGvXTghn3BBrs0fux21+w==
X-Received: by 2002:a05:6512:12cd:b0:53d:e5b0:1709 with SMTP id 2adb3069b0e04-53e12a22fc1mr5089410e87.38.1733327879786;
        Wed, 04 Dec 2024 07:57:59 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:58 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:47 +0100
Subject: [PATCH 5/9] ARM: mvebu_v5_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-5-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=XPKa8479dz0V5E5HAGWYwOAk2JntXJAee03QMzKRTSQ=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvch911bcazEE3clz1x9w8iZQmmDlX4uDR9z
 07T6Hpka4SJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B73AAKCRCIgE5vWV1S
 MgBKEACj7IXfw3FWzIMmgTNg4C/ssmHFA+VrYa1r+Ni1oPjhCk3fKvz5VL2/mwxOcpWriNPVkeW
 VPIdNAzyTkw/TXyFjLYdH5mtGO1cHP6U8l+lLm1qWWImSzXyTraAuIC8iFc69gAUYUh359rj7k5
 L9rNoGsHhAT4/wjcbSCOCEWbf6z3eUuCNXQ+I8Bd6whCTSyLTfq7keKpghzzPK1o30lf8GpDnIV
 bzVYkd71OtDyKkqNXZ0r/zQhOJ0xkuy17fxfKmUwDRXW6zPjEBwkMvGoAcKRDGG2lvrZNqg3L97
 FdLG/LlX1EMP000XJbUVui5oluOvAhF41THQKnHxKdqGON+IuHzD4H36lGMOg8+VpM1Ol7UwYa0
 TpUCbEvI83waD/2riwpFDHgVrgwV9WhJsLhXAyDME7+TJU/+eCg4rQsbqJUlZ5ihwRo4XguS5L2
 petdLHofkYcZKGFR9QtJNrbywhGbRNlz9GiawyoBsBesF6bLoDs0b41fVfltuGiPKihBUhqJNSH
 +vkBmT17upIxRjy+cX9mBTi5qflxTQZcUfq2sNOjc/K7zTfdgzxcjh9sEA8UQHJFxMI36AlWG/c
 vbuqPoDDm0n8i+EVwcG0tkYOkT69xi1V904+mHesdROU8xWDJ/t1zyXLY4oR3mARqwEWhdVYog3
 VH3Y0+T0lxBzxQw==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm mvebu_v5_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/mvebu_v5_defconfig | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/configs/mvebu_v5_defconfig b/arch/arm/configs/mvebu_v5_defconfig
index 2467afd32146ba7ba2bf4b71053a6747bc58d1cc..0e3da23baab417378afcbc40fca88ace5cd51e57 100644
--- a/arch/arm/configs/mvebu_v5_defconfig
+++ b/arch/arm/configs/mvebu_v5_defconfig
@@ -1,5 +1,4 @@
 CONFIG_SYSVIPC=y
-CONFIG_FHANDLE=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_PREEMPT=y
@@ -15,7 +14,6 @@ CONFIG_MACH_DNS323=y
 CONFIG_MACH_TS209=y
 CONFIG_MACH_TERASTATION_PRO2=y
 CONFIG_MACH_LINKSTATION_PRO=y
-CONFIG_MACH_LINKSTATION_LSCHL=y
 CONFIG_MACH_LINKSTATION_MINI=y
 CONFIG_MACH_TS409=y
 CONFIG_MACH_TS78XX=y
@@ -45,7 +43,6 @@ CONFIG_IP_PNP_DHCP=y
 CONFIG_IP_PNP_BOOTP=y
 # CONFIG_IPV6 is not set
 CONFIG_NET_DSA=y
-CONFIG_NET_SWITCHDEV=y
 CONFIG_NET_PKTGEN=m
 CONFIG_CFG80211=y
 CONFIG_MAC80211=y
@@ -63,7 +60,6 @@ CONFIG_MTD_CFI_GEOMETRY=y
 CONFIG_MTD_CFI_INTELEXT=y
 CONFIG_MTD_CFI_STAA=y
 CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_ORION=y
 CONFIG_MTD_SPI_NOR=y
@@ -96,12 +92,10 @@ CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_OF_PLATFORM=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C=y
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_SPI=y
 CONFIG_SPI_ORION=y
-CONFIG_GPIO_SYSFS=y
 CONFIG_POWER_RESET=y
 CONFIG_POWER_RESET_GPIO=y
 CONFIG_POWER_RESET_QNAP=y
@@ -166,7 +160,6 @@ CONFIG_RTC_DRV_MV=y
 CONFIG_DMADEVICES=y
 CONFIG_MV_XOR=y
 CONFIG_STAGING=y
-CONFIG_FB_XGI=y
 CONFIG_EXT2_FS=y
 CONFIG_EXT3_FS=y
 CONFIG_ISO9660_FS=m
@@ -194,6 +187,5 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
-# CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y

-- 
2.47.0


