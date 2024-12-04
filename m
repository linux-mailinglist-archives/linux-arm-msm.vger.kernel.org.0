Return-Path: <linux-arm-msm+bounces-40304-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246B99E3EEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 17:00:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B1261696BC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 16:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3AA520E31E;
	Wed,  4 Dec 2024 15:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+n3FwOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0878620E302;
	Wed,  4 Dec 2024 15:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733327885; cv=none; b=ezvZIMItSiJ9NWESjB1fHmc+rSBtEDRW2GIvyc3jK6p5Op0gWKn7PT4K+CvwuEZNBpKv5XJD8EvGQG/zzBhLvpl5HXUNQbwn0RWXQWk75FaVDvAbKLmZ5l0BDcL4+A5+8AYz4tNFTPHNXPDmSg3z3daxrfcNZfLQyA0x6/m2A40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733327885; c=relaxed/simple;
	bh=ajy+2nCoY0jRWJ/Q5MIKS0ER7X03c4YJ6hvrLukAy44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OSEE/Pjho+aMq1ziECfCs6XfhAyfxtFMnYuPsPZPlEdMYrmV3JPzApNS6w4oAsptC5srPmf65OlEaHUvjfmA0sByz23mUY5rh82lJ3e4UuZKx6tm5LDqU6VqXTBJs2c1FzTqa7SZ9pnDsWFkiVf6dReGSH/WZTMxOCpPMx2v+6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+n3FwOq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53df80eeeedso7116566e87.2;
        Wed, 04 Dec 2024 07:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327882; x=1733932682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=itezlPYWNMkC0urTxQzlWsd9ErHvjjwDgsS8k4F3P/U=;
        b=g+n3FwOquIYO6X7BcVW27Mg90xvF6IDMGlWGg5qb7TYz8NNOMUDx32mFK/JwYsFYm2
         8TDHD7OZ3HJXkxuy5csT6XQEt2hRAejmAeY69lkwHxc7zWLKPF5ghG2Se49HFiuixlWE
         tqeB7+s95LUYphxfpuvn6iKTpiCRldVxlus1Qh7I39HbSd0P+FyuGSsaOWNruSr67U1i
         jDytdkIjD1WYEE8MCUaWXzNaJ478PNpR6ssCwbO1LrxrCMBZH/tYnX9eOr8Nh9MrWpDC
         HAn/6sxYTEELpyXACZts+6oEt+Wj5ELBN38c4PKCQjbJ4I31vGrwCu/NP4d/Pc2+ARuP
         GSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327882; x=1733932682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itezlPYWNMkC0urTxQzlWsd9ErHvjjwDgsS8k4F3P/U=;
        b=xHVzserNaI8ZgerPlMTL8Vp630Mv0CTUJB2BgPRq7f222lrELkVnellLlpLgV/Ahim
         rOv8IFbv1l9rH4wbf9ttybCZpecya0tm5zudTZyVUUSoOsEGtUgt73NOuN3/8w/m/X4B
         BtffhIHakjhwuCNwT0Fa4upA3u4hWTTTq/eDe8iVdIVXRneDEg5kG6xv8EqLvC1yPQML
         pgcdG/ePEEU73ZLILHnN+9rri5k15ySFaFUSI09Ui+sJzWElWd23c7G6qILnG/6KvIyC
         k/Dtg6tgiL17M8y62AO9qysKQ3y1X/rhRKqjJ8EDuKe0Cylc+quH1b1wa0WUzJSj8X94
         jrUA==
X-Forwarded-Encrypted: i=1; AJvYcCUJIRdxVDSciT+L3C+wrPfgmEKZudO3CwgpXiqXUVdUo/R1x62NJoX9QbrOzSlHfYNihmXvH8nWGR6qtb0T@vger.kernel.org, AJvYcCXCxgp1LfU1DLnEP1FC6OoL+SaGHWqM9D6E9VMGiN/1dY+bvTzJ4coZ4nvF+gFiecqoXznO/JuzP8d9ABcf@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJvx52V/C3bv0U7Umt5iNzaDW05ij5wQDdFKfW6BetxyGaaf+
	1XHmDQu58DPuny8Iu+OKBKcpwsDc0tbwnWNw91l1fz15THzRXzj/
X-Gm-Gg: ASbGncteNmg2nOF1viI2D9UTAbSBN8SBPDV7JdUK81ScXpjmyjmhjGPyN1k/tpKkmUO
	QQFHmOzlVXbV1DkYp3Dwqca7+kwnB57jE1XvBwB8KrlaKxqxo7cdRxPLiYppOt0LkdrDE8z1jBg
	xbBu2NsLr2h3EeS3366wGncrO+LHXQMznzsT8TZXPjSDngt/dyzyjhN2f9k9DjgHMl0HhzqQc1O
	8RsnOfMFoFYe/9tu/eP4Pfc37/6Ubh0t3Vy1MIF8Fcgs+dz9LY1sTyj3MZditTA4G71hPOY/+6N
	9GmG4iDQZkw9GtI=
X-Google-Smtp-Source: AGHT+IGlGfDEsLcZJyCzWffbXy66rLrrA/A5XMM3tlpdjuHEhy8pE4BtS8IqEvBnXzldcs47eI0LSA==
X-Received: by 2002:a05:6512:e8a:b0:53d:e5fd:a445 with SMTP id 2adb3069b0e04-53e12a06e21mr3757767e87.32.1733327881991;
        Wed, 04 Dec 2024 07:58:01 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:58:01 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 04 Dec 2024 16:56:48 +0100
Subject: [PATCH 6/9] ARM: mxs_defconfig: rebuild default configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-defconfigs-v1-6-86587652d37a@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1991;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=ajy+2nCoY0jRWJ/Q5MIKS0ER7X03c4YJ6hvrLukAy44=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvhynCLEQYuXH5PnR++kC2KxmLUbqcle8Eoq
 qUMUAZbFfmJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B74QAKCRCIgE5vWV1S
 MjC4D/9948E/ZGupe0JL9qz/HV+vq88mwiMZfy5bYuiLi0mawPEdE2uesGekyVhJlUUn3u5fkHH
 23CCFWd79I360dPFYEuE8Pr5SaXEFO9Yy5CF2HTmuqGs9LjOoN6ZAt/dbH2pd0/teY6mKsMOdrp
 bBdbxn5o3R2QXMVh9MhuIG35bq5lq75RdxZlfPE6w/DEVxuO9cu8loeetlAAjvBg+ElOViZXnTa
 uo/QdfGDXKeL0FrVHWOrTFwhxlCsHpVxf9g/Sl5KcpF80f4YmDymMQzGZxZL1/cvHo97aBMy2Gy
 Uija49yz1R/kX3N+koyGQQEWZ5zrg6Gtay/hmGh9MMvVFkCaJXBVpjTSayD17D7ueVO3leJzLCv
 /TVEzz3K2PNKo8xMO3Bf1H8Cj7ffX3ZM+oZf5yVXHg4XGYYDU5/nH2QScUkz5bYi29vLrZi93rs
 etEkCa2JbLpnRGQsiiBs4ekKzqyJ3jhDm/F0lmT0PWLgYCfngpabuwsFJ7VVwKT0D4KYrHjHnj6
 W2/dbCTgkvYcji04jo6WP2r1k+nLDsPPuEqtjK731LANzG2uDxRFLFu/Kpn7Xew6eqsXOhg6B6H
 Bx2MYz3m1z4bTIwQViP5Ust1uAgH9scAprUt8I+fGVbYuXjHJgi1SQs7zB4mk0+cU8tSXmt063s
 NGxSS/YDCnB9WzA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

This configuration contains obsolete configuration options e.g.
CONFIG_MTD_M25P80 which is integrated into MTD_SPI_NOR.

Rebuild this configuration by run:
make ARCH=arm mxs_defconfig
make ARCH=arm savedefconfig

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/configs/mxs_defconfig | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 43bc1255a5db9f4ed8f65a98a69284e1439e44d2..946f508ad62c326a0651c8a5da0626ee33c9bfd3 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -32,9 +32,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_CAN=m
@@ -45,7 +42,6 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_DATAFLASH=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_GPMI_NAND=y
@@ -60,7 +56,6 @@ CONFIG_ENC28J60=y
 CONFIG_ICPLUS_PHY=y
 CONFIG_MICREL_PHY=y
 CONFIG_REALTEK_PHY=y
-CONFIG_SMSC_PHY=y
 CONFIG_CAN_FLEXCAN=m
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC95XX=y
@@ -77,13 +72,11 @@ CONFIG_SERIAL_AMBA_PL011=y
 CONFIG_SERIAL_AMBA_PL011_CONSOLE=y
 CONFIG_SERIAL_MXS_AUART=y
 # CONFIG_HW_RANDOM is not set
-# CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MXS=y
 CONFIG_SPI=y
 CONFIG_SPI_GPIO=m
 CONFIG_SPI_MXS=y
-CONFIG_GPIO_SYSFS=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_STMP3XXX_RTC_WATCHDOG=y
@@ -138,10 +131,6 @@ CONFIG_PWM_MXS=y
 CONFIG_NVMEM_MXS_OCOTP=y
 CONFIG_EXT4_FS=y
 # CONFIG_DNOTIFY is not set
-CONFIG_NETFS_SUPPORT=m
-CONFIG_FSCACHE=y
-CONFIG_FSCACHE_STATS=y
-CONFIG_CACHEFILES=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y

-- 
2.47.0


