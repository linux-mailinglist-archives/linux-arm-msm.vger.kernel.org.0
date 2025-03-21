Return-Path: <linux-arm-msm+bounces-52188-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CDFA6BC64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:02:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 12C967A8EEA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 13:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8591A256B;
	Fri, 21 Mar 2025 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muz2KIDv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47653169397;
	Fri, 21 Mar 2025 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742565546; cv=none; b=dasKJWD4N97tywTqVyQKlaF0DDkgNS7nUt+9NycrBIMfQJJw5zsA9NR0PBQrG/9Zzz9VbOmihgA/HLhgDGSRTCREPxTJQ560vVMDcP7FUXIZVstJAKB/UTxj0SM47VXFLty18u2rP7FjAfNMySrcXoWn4pRP8IZIG0CM4AolMC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742565546; c=relaxed/simple;
	bh=ZJC40o810p8ayiR7NIMSKxZSOPhG8klnx2E364F9OX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dme4bBKP08PrMflvSPUMeOyV/VSCKZCu0pdfmgzTRVT6ZDGcoFMOuim2DNH2Q3AOZypIKfi0wb0e2jFIMFS80acZwfXsEJzwov/jtCt8WPNiszPS8pBWDtQqxGhcFzMLdXJdmCkuTRdku6C1NB/Tro66bZV/e1GBR1H0aKmE0TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muz2KIDv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1802881f8f.0;
        Fri, 21 Mar 2025 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565542; x=1743170342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5bLkk6uqPyWirFskOF6TYLbFYm64XVe1/MBmiWZndA=;
        b=muz2KIDvIoSFFZBOrmOSzDD7TV3720ukHzsqbggCFxSSrJ2hlULemXZiDmL5RmE8+z
         dGbyqEAqGW6n466hq8cRZAFGSigSIyX7xQtlOlyrLvbfBWnpenH4vBTNh293HnyS8lWa
         Lb3R43EzQk7utdhN1cKB5ep7RfJeZ9GxKbtLvzCeef/T2Lq1uT9B9QTXCjxzrPoZOyAZ
         F8eZG3e2zto9cH4N3xVzeYdWUNIM2bFCS1Y30XglfdRmr4iAuoX/FTfSoWIHYEdfTTzd
         VtQm3hBbq/e8fnpS2isD79zJUH3jxTzgPY4NJe3eQHdl98HV5K6NWI6jGYedKDfgrHYr
         stOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565542; x=1743170342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5bLkk6uqPyWirFskOF6TYLbFYm64XVe1/MBmiWZndA=;
        b=IBGDhZ3xwe02lOIhPKrLexTu9XVkQkn3mbMBJGLKlDTE4NrobpNwwmBx1y7T7L7705
         mrNYJYup26miOIVN0Rp6fV3IH7yCEB+Zr4qTvVIXzfR31cA1YOU2iKYLv1tf3+CV7QsT
         VFBm77WLpykFh6K51VTuu+EfFkYYROUI2XvV5XZIZ1X4GivoeFDPHWjiiGJJGOPGGq8L
         Wduak/uHypKzFK7bDswG5ZsPZ2ZfXVHnQmQbktgpT8z/U4C6n+qB8Eok4JHgmy7R7WML
         SHMjf4DSA0/Zi8bWrRu3u8Mbzn42Cyx1LBPu8gVmtIhcWS5WJhPXxdDoW/SyNS07uk+d
         X5Xw==
X-Forwarded-Encrypted: i=1; AJvYcCVIRukFx8Fy5X7BzPlgldkUgyU94u7xCqG0hGcsL7BNMfGGNbOd1sf0ux+1bvsM1DOozqZg18CwtDjgwu1Q@vger.kernel.org, AJvYcCXZ242u08Qz9Lo0nmf1RfwWKiDOpW3mPMbkuD8sCRb2u4RQkJfBi+C7Dl1UhIOierl5vY+NaQ2XVnUD@vger.kernel.org, AJvYcCXxE0D+g+1ergW/gAZ2tCjAc337eMfdinqnQpDEs+vFHP7vwBDkkuCdmSvyG1thMBbQoUV0m4XaPIs2gRPwpwEksKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXQmCEj0Fs2H/qhvXmW0Rk/+Rb7KfMvQT64xkAZdEykdXZW+0
	Z/StXpcSnudj0J0jzgui1AhZcWsS8g25aqezrDC/tlM0BC4ygzwJ
X-Gm-Gg: ASbGncvdIJctE+MvghgTkPrzgMGMCi+ibcWyge2nWJEI6OzbwlfPW8hfc3vLVQ7fMMK
	jo726scJdrtGttVE2fTIiGQnVmiC9VyZaufHvbiUJPbdqI2ZCqyi0NdcZSu7kpQsJ1I44Xe0l8J
	TzeSb0UNZurBCQXDmgQt7SkXznjfS9nZmp+Bbx9z6x6zsnA73zCuTo7sX3V/VDnLyiXdMKWqj4L
	mkHWO/xoiHhoQBjW1jQWp2GGBVlb7mSJJMbHK+UbI9p3KQm/O9BvSoFk9JjQ/erT1ZYFPhEjFjB
	YOnbI1xazIAHfi1RndxviLNOc8n2bPTLtA0b4eZWjZsB4pt1lvMbQeUTb0dlUSItSY8f98pwrKM
	9Smt5TeQ/gqvqJsQUdImT
X-Google-Smtp-Source: AGHT+IHNOmMa9KW3MUdMo1gO9oj/91uP7LkUin/DdC6+LBE4xrKRJwfNY8vmAFeiFQoQQMTRjkFDAQ==
X-Received: by 2002:a5d:584b:0:b0:390:f9a5:bd79 with SMTP id ffacd0b85a97d-3997f90ab9emr3286675f8f.26.1742565542199;
        Fri, 21 Mar 2025 06:59:02 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:01 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 03/10] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
Date: Fri, 21 Mar 2025 15:58:47 +0200
Message-ID: <20250321135854.1431375-4-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As not only Qualcomm, but also Samsung is using the Synopsys eUSB2 IP
(albeit with a different register layout) in their newer SoCs, move the
driver out of its vendor sub-directory and rename it to phy-snps-eusb2.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/Kconfig                                      | 8 ++++++++
 drivers/phy/Makefile                                     | 1 +
 .../{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} | 0
 drivers/phy/qualcomm/Kconfig                             | 9 ---------
 drivers/phy/qualcomm/Makefile                            | 1 -
 5 files changed, 9 insertions(+), 10 deletions(-)
 rename drivers/phy/{qualcomm/phy-qcom-snps-eusb2.c => phy-snps-eusb2.c} (100%)

diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 8d58efe99..11c166204 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -43,6 +43,14 @@ config PHY_PISTACHIO_USB
 	help
 	  Enable this to support the USB2.0 PHY on the IMG Pistachio SoC.
 
+config PHY_SNPS_EUSB2
+	tristate "SNPS eUSB2 PHY Driver"
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	select GENERIC_PHY
+	help
+	  Enable support for the USB high-speed SNPS eUSB2 phy on select
+	  SoCs. The PHY is usually paired with a Synopsys DWC3 USB controller.
+
 config PHY_XGENE
 	tristate "APM X-Gene 15Gbps PHY support"
 	depends on HAS_IOMEM && OF && (ARCH_XGENE || COMPILE_TEST)
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index e281442ac..c670a8dac 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_LPC18XX_USB_OTG)	+= phy-lpc18xx-usb-otg.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
+obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
 obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_NXP_PTN3222)		+= phy-nxp-ptn3222.o
diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
similarity index 100%
rename from drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
rename to drivers/phy/phy-snps-eusb2.c
diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 846f8c995..914547068 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -125,15 +125,6 @@ config PHY_QCOM_QUSB2
 	  PHY which is usually paired with either the ChipIdea or Synopsys DWC3
 	  USB IPs on MSM SOCs.
 
-config PHY_QCOM_SNPS_EUSB2
-	tristate "Qualcomm SNPS eUSB2 PHY Driver"
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
-	select GENERIC_PHY
-	help
-	  Enable support for the USB high-speed SNPS eUSB2 phy on Qualcomm
-	  chipsets. The PHY is paired with a Synopsys DWC3 USB controller
-	  on Qualcomm SOCs.
-
 config PHY_QCOM_EUSB2_REPEATER
 	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index eb60e950a..2121e92df 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -15,7 +15,6 @@ obj-$(CONFIG_PHY_QCOM_QMP_USB)		+= phy-qcom-qmp-usb.o
 obj-$(CONFIG_PHY_QCOM_QMP_USB_LEGACY)	+= phy-qcom-qmp-usb-legacy.o
 
 obj-$(CONFIG_PHY_QCOM_QUSB2)		+= phy-qcom-qusb2.o
-obj-$(CONFIG_PHY_QCOM_SNPS_EUSB2)	+= phy-qcom-snps-eusb2.o
 obj-$(CONFIG_PHY_QCOM_EUSB2_REPEATER)	+= phy-qcom-eusb2-repeater.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
-- 
2.43.0


