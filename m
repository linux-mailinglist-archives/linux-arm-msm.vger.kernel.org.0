Return-Path: <linux-arm-msm+bounces-49059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA74A40EDD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 13:24:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 277DB1778A4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 23 Feb 2025 12:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2246A20AF82;
	Sun, 23 Feb 2025 12:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fLHdey8B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22944207A20;
	Sun, 23 Feb 2025 12:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740313361; cv=none; b=X0OzkP55TH0pMwOmra4w8BzRCrE2j4QdF7JQXmoIK3AmXpIwdUN85zFjmmAt7CjmMpKShMWLU1/MP9sL1punR+pL5a+dWf3EJ4xvrlLBuXDXxrnaQctVTmpVHocdtsi/w9gg++5jnSxlUZuaMeqBzC3t4d7ksf198R1U9l/FHh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740313361; c=relaxed/simple;
	bh=n9eA+aTBOKbIOiv4MRI4KMJsBryhl6JUd30Cu6T5CRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oCOEmzWL99jbRAsZoVmqRsmhrk8L/Dxzhs8d3LxpFmRFYoTWJpPsa9x13S2L/mUK0Jm2zAAdyXwmlXV3gxXS58cmr05VON4WP1eb0mbfZnINb90W3dg1MjG7Y/rSEHECSKDgb2PalXbHXYb83SoJclfMjN6r8yCma0WB6gb6Fyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fLHdey8B; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4399a1eada3so30939715e9.2;
        Sun, 23 Feb 2025 04:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740313356; x=1740918156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5AqloAAA42MXmA8w7bAhHKGWmPLv+VF0Ofk4tbyqKU=;
        b=fLHdey8BwXwirtI+GGvQbNJix2eFYhimaIL41J7Z+OnUANBvUhNQjwSjwotECEO/qQ
         nWIkiK3GGM8zfyE6I9joCEiiRthU1LCn8myS3mf/e7iSOsmCTXbdlVT1aqBm8dNYqsGs
         O1XtaFJFzqQ5CtwGnw3VmAnFlLX+5qER9YXj4+jAihzouNQ6Sc9wge28XIvTXUtBqZh0
         2R8Ch+YUzwz1L4wCjmrgVJql8Ta1YTeSC1WvXNxXWn4CEri9seo7LTu6o0wZbTfCFtJS
         ul4DSSYvREIV6CBeoKYvukSdJk4HA47M4L8VHifE1Gt7iF4o4vKmCOqL0/4Adnz0VztI
         yQww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740313356; x=1740918156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5AqloAAA42MXmA8w7bAhHKGWmPLv+VF0Ofk4tbyqKU=;
        b=oLnrI3SypvTJEcDG/TStNDBZFpDzFh/7bl1fRoC4NS9cIU13KiDcW2qPLUxDZtuOlO
         b1WlbFgOI4jKs1F5n7sntsWdgFCQh2j8GANbVx7QjoFQgnF1PlGD5QE2FoMkAPuuaew9
         cx43H02RH/IAaaUGm9rYG/Iz5GU0u5IPFEaanBGBg08NfkNwOAI8kksuBdg2KAs/adwH
         AtEn9lnP3HfqPM0PSi69ZUDEDLcqZMOuTpBYlUbpE8iSxAAcoVd7k+3ZpFNfpDKH4F+4
         3udMMnrjoKwrUgazFpxAxOP5MlZpEyV2GTGXBUnNcUsvNRqfbPhuMrEgfNJv1g2FHL3C
         YntQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwX5CkNxWZ4Iohx7NDa1L3TN5Pomjz2n1eeE1Vi+g3LUIrpohIxstGtIYd2BsGNThx67OBzfiGSX7qETR5BzN0q8U=@vger.kernel.org, AJvYcCVJWvpLCGmO/w7i0sJKXsjvJFH0AtY0Kh1JtYtlluuBnrC95n+wDaIjbpOtQ/H3lHjW4mEziLLaYm0I@vger.kernel.org, AJvYcCWd8y09nFJIKWvQnN20ZI7SWAM19+CWdQ6u0yp94bBGtVCvjOzlSFbQIMyIv3yYmsotH2rRaIOnY/+EKV2r@vger.kernel.org
X-Gm-Message-State: AOJu0YzX7E9qW1EvjjisFoGUyOf02DwnChb3BylYpsoI0pyhpsvb6tme
	6oOP9kOQLeikCcO5Pj4E4e+2IDEXwIX3uh3T4u2dz10LXVYKbfAm
X-Gm-Gg: ASbGncu1MmNtmLsSap05n0fsCVSaTaPId0J07d5ALAXPO6orqEiLH2/d49AYua6+jAa
	abG6NpMFH1ojfHsH2xv5vA+c/e97iKmRk56VpjNbFHyt4Yxlsgjc9u+LZhuze+hAiZPz6UAv3hf
	KEkBKfRr2oTMD0AWb4muVB9eq7fm7MjQyWpEuGzQxqPvSuLqDkp5iwK4qDvBX0bYjasdeIoNFU+
	PBbkvvTwgwJdunsze9kx4TVuk3Koqg0OLifgF/DWIlr1ED982/KzopeH8BK+yEicJvLzz5pnrxH
	39GALB13CFlswsK8idKc6hqq74xRSvbaMkGDU2vfEOuBrmWi9MGZywHv1UsBX++xNkAi1sNfFHX
	xUQ==
X-Google-Smtp-Source: AGHT+IHqP76iHfiYngmm0o31mQ9yL26b7/JkdUj5J77MLt+JVK4hCOloOw0no10cd3jakQMTipP2eA==
X-Received: by 2002:a05:6000:184f:b0:38d:dffc:c144 with SMTP id ffacd0b85a97d-38f6f0c8e74mr7319751f8f.55.1740313356080;
        Sun, 23 Feb 2025 04:22:36 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f8602sm29611608f8f.94.2025.02.23.04.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Feb 2025 04:22:35 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] phy: move phy-qcom-snps-eusb2 out of its vendor sub-directory
Date: Sun, 23 Feb 2025 14:22:23 +0200
Message-ID: <20250223122227.725233-5-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250223122227.725233-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As Samsung is using the same Synopsys eUSB2 IP in Exynos2200, albeit
with a different register layout, it only makes sense to implement
support for that in the existing eUSB2 driver.

To make room for new non-qcom SoCs, do the following:
1. Move phy-qcom-snps-eusb2.c to phy-snps-eusb2.c
2. Rename all qcom_snps_eusb2 functions and structs to snps_eusb2_phy
3. Add a prefix to the qcom-specific register offset definitions
4. Make a generic phy_ops init that sets up power before the SoC-specific
eUSB2 IP init
5. Introduce a driver data structure with init function and clocks

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/phy/Kconfig                        |   8 +
 drivers/phy/Makefile                       |   1 +
 drivers/phy/phy-snps-eusb2.c               | 505 +++++++++++++++++++++
 drivers/phy/qualcomm/Kconfig               |   9 -
 drivers/phy/qualcomm/Makefile              |   1 -
 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c | 442 ------------------
 6 files changed, 514 insertions(+), 452 deletions(-)
 create mode 100644 drivers/phy/phy-snps-eusb2.c
 delete mode 100644 drivers/phy/qualcomm/phy-qcom-snps-eusb2.c

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
diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
new file mode 100644
index 000000000..4e5914a76
--- /dev/null
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -0,0 +1,505 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/mod_devicetable.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+
+#define QCOM_USB_PHY_UTMI_CTRL0		(0x3c)
+#define SLEEPM				BIT(0)
+#define OPMODE_MASK			GENMASK(4, 3)
+#define OPMODE_NONDRIVING		BIT(3)
+
+#define QCOM_USB_PHY_UTMI_CTRL5		(0x50)
+#define POR				BIT(1)
+
+#define QCOM_USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
+#define PHY_ENABLE			BIT(0)
+#define SIDDQ_SEL			BIT(1)
+#define SIDDQ				BIT(2)
+#define RETENABLEN			BIT(3)
+#define FSEL_MASK			GENMASK(6, 4)
+#define FSEL_19_2_MHZ_VAL		(0x0)
+#define FSEL_38_4_MHZ_VAL		(0x4)
+
+#define QCOM_USB_PHY_CFG_CTRL_1		(0x58)
+#define PHY_CFG_PLL_CPBIAS_CNTRL_MASK	GENMASK(7, 1)
+
+#define QCOM_USB_PHY_CFG_CTRL_2		(0x5c)
+#define PHY_CFG_PLL_FB_DIV_7_0_MASK	GENMASK(7, 0)
+#define DIV_7_0_19_2_MHZ_VAL		(0x90)
+#define DIV_7_0_38_4_MHZ_VAL		(0xc8)
+
+#define QCOM_USB_PHY_CFG_CTRL_3		(0x60)
+#define PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(3, 0)
+#define DIV_11_8_19_2_MHZ_VAL		(0x1)
+#define DIV_11_8_38_4_MHZ_VAL		(0x0)
+
+#define PHY_CFG_PLL_REF_DIV		GENMASK(7, 4)
+#define PLL_REF_DIV_VAL			(0x0)
+
+#define QCOM_USB_PHY_HS_PHY_CTRL2	(0x64)
+#define VBUSVLDEXT0			BIT(0)
+#define USB2_SUSPEND_N			BIT(2)
+#define USB2_SUSPEND_N_SEL		BIT(3)
+#define VBUS_DET_EXT_SEL		BIT(4)
+
+#define QCOM_USB_PHY_CFG_CTRL_4		(0x68)
+#define PHY_CFG_PLL_GMP_CNTRL_MASK	GENMASK(1, 0)
+#define PHY_CFG_PLL_INT_CNTRL_MASK	GENMASK(7, 2)
+
+#define QCOM_USB_PHY_CFG_CTRL_5		(0x6c)
+#define PHY_CFG_PLL_PROP_CNTRL_MASK	GENMASK(4, 0)
+#define PHY_CFG_PLL_VREF_TUNE_MASK	GENMASK(7, 6)
+
+#define QCOM_USB_PHY_CFG_CTRL_6		(0x70)
+#define PHY_CFG_PLL_VCO_CNTRL_MASK	GENMASK(2, 0)
+
+#define QCOM_USB_PHY_CFG_CTRL_7		(0x74)
+
+#define QCOM_USB_PHY_CFG_CTRL_8		(0x78)
+#define PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(1, 0)
+#define PHY_CFG_TX_FSLS_VREG_BYPASS	BIT(2)
+#define PHY_CFG_TX_HS_VREF_TUNE_MASK	GENMASK(5, 3)
+#define PHY_CFG_TX_HS_XV_TUNE_MASK	GENMASK(7, 6)
+
+#define QCOM_USB_PHY_CFG_CTRL_9		(0x7c)
+#define PHY_CFG_TX_PREEMP_TUNE_MASK	GENMASK(2, 0)
+#define PHY_CFG_TX_RES_TUNE_MASK	GENMASK(4, 3)
+#define PHY_CFG_TX_RISE_TUNE_MASK	GENMASK(6, 5)
+#define PHY_CFG_RCAL_BYPASS		BIT(7)
+
+#define QCOM_USB_PHY_CFG_CTRL_10	(0x80)
+
+#define QCOM_USB_PHY_CFG0		(0x94)
+#define DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
+#define CMN_CTRL_OVERRIDE_EN		BIT(1)
+
+#define QCOM_UTMI_PHY_CMN_CTRL0		(0x98)
+#define TESTBURNIN			BIT(6)
+
+#define QCOM_USB_PHY_FSEL_SEL		(0xb8)
+#define FSEL_SEL			BIT(0)
+
+#define QCOM_USB_PHY_APB_ACCESS_CMD	(0x130)
+#define RW_ACCESS			BIT(0)
+#define APB_START_CMD			BIT(1)
+#define APB_LOGIC_RESET			BIT(2)
+
+#define QCOM_USB_PHY_APB_ACCESS_STATUS	(0x134)
+#define ACCESS_DONE			BIT(0)
+#define TIMED_OUT			BIT(1)
+#define ACCESS_ERROR			BIT(2)
+#define ACCESS_IN_PROGRESS		BIT(3)
+
+#define QCOM_USB_PHY_APB_ADDRESS	(0x138)
+#define APB_REG_ADDR_MASK		GENMASK(7, 0)
+
+#define QCOM_USB_PHY_APB_WRDATA_LSB	(0x13c)
+#define APB_REG_WRDATA_7_0_MASK		GENMASK(3, 0)
+
+#define QCOM_USB_PHY_APB_WRDATA_MSB	(0x140)
+#define APB_REG_WRDATA_15_8_MASK	GENMASK(7, 4)
+
+#define QCOM_USB_PHY_APB_RDDATA_LSB	(0x144)
+#define APB_REG_RDDATA_7_0_MASK		GENMASK(3, 0)
+
+#define QCOM_USB_PHY_APB_RDDATA_MSB	(0x148)
+#define APB_REG_RDDATA_15_8_MASK	GENMASK(7, 4)
+
+static const char * const eusb2_hsphy_vreg_names[] = {
+	"vdd", "vdda12",
+};
+
+#define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
+
+struct snps_eusb2_phy_drvdata {
+	int (*phy_init)(struct phy *p);
+	const char * const *clk_names;
+	int num_clks;
+};
+
+struct snps_eusb2_hsphy {
+	struct phy *phy;
+	void __iomem *base;
+
+	struct clk *ref_clk;
+	struct clk_bulk_data *clks;
+
+	struct reset_control *phy_reset;
+
+	struct regulator_bulk_data vregs[EUSB2_NUM_VREGS];
+
+	enum phy_mode mode;
+
+	struct phy *repeater;
+
+	const struct snps_eusb2_phy_drvdata *data;
+};
+
+static int snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+
+	phy->mode = mode;
+
+	return phy_set_mode_ext(phy->repeater, mode, submode);
+}
+
+static void snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
+					u32 mask, u32 val)
+{
+	u32 reg;
+
+	reg = readl_relaxed(base + offset);
+	reg &= ~mask;
+	reg |= val & mask;
+	writel_relaxed(reg, base + offset);
+
+	/* Ensure above write is completed */
+	readl_relaxed(base + offset);
+}
+
+static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
+{
+	/* default parameters: tx pre-emphasis */
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
+				    PHY_CFG_TX_PREEMP_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
+
+	/* tx rise/fall time */
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
+				    PHY_CFG_TX_RISE_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
+
+	/* source impedance adjustment */
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_9,
+				    PHY_CFG_TX_RES_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
+
+	/* dc voltage level adjustement */
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_8,
+				    PHY_CFG_TX_HS_VREF_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
+
+	/* transmitter HS crossover adjustement */
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_8,
+				    PHY_CFG_TX_HS_XV_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
+}
+
+static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
+{
+	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
+
+	switch (ref_clk_freq) {
+	case 19200000:
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
+					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
+					    DIV_7_0_19_2_MHZ_VAL);
+
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    DIV_11_8_19_2_MHZ_VAL);
+		break;
+
+	case 38400000:
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+					    FSEL_MASK,
+					    FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
+
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
+					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
+					    DIV_7_0_38_4_MHZ_VAL);
+
+		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
+					    DIV_11_8_38_4_MHZ_VAL);
+		break;
+
+	default:
+		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
+		return -EINVAL;
+	}
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+				    PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
+
+	return 0;
+}
+
+static int qcom_snps_eusb2_hsphy_init(struct phy *p)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	int ret;
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG0,
+				    CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL5, POR, POR);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    PHY_ENABLE | RETENABLEN, PHY_ENABLE | RETENABLEN);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_APB_ACCESS_CMD,
+				    APB_LOGIC_RESET, APB_LOGIC_RESET);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_UTMI_PHY_CMN_CTRL0, TESTBURNIN, 0);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_FSEL_SEL,
+				    FSEL_SEL, FSEL_SEL);
+
+	/* update ref_clk related registers */
+	ret = qcom_eusb2_ref_clk_init(phy);
+	if (ret)
+		return ret;
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_1,
+				    PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
+				    PHY_CFG_PLL_INT_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_INT_CNTRL_MASK, 0x8));
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
+				    PHY_CFG_PLL_GMP_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_GMP_CNTRL_MASK, 0x1));
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_5,
+				    PHY_CFG_PLL_PROP_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_PROP_CNTRL_MASK, 0x10));
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_6,
+				    PHY_CFG_PLL_VCO_CNTRL_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_VCO_CNTRL_MASK, 0x0));
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_5,
+				    PHY_CFG_PLL_VREF_TUNE_MASK,
+				    FIELD_PREP(PHY_CFG_PLL_VREF_TUNE_MASK, 0x1));
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
+				    VBUS_DET_EXT_SEL, VBUS_DET_EXT_SEL);
+
+	/* set default parameters */
+	qcom_eusb2_default_parameters(phy);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
+				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+				    USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    SIDDQ_SEL, SIDDQ_SEL);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    SIDDQ, 0);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_UTMI_CTRL5, POR, 0);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL2,
+				    USB2_SUSPEND_N_SEL, 0);
+
+	return 0;
+}
+
+static const char * const qcom_eusb2_hsphy_clock_names[] = {
+	"ref",
+};
+
+static const struct snps_eusb2_phy_drvdata sm8550_snps_eusb2_phy = {
+	.phy_init	= qcom_snps_eusb2_hsphy_init,
+	.clk_names	= qcom_eusb2_hsphy_clock_names,
+	.num_clks	= ARRAY_SIZE(qcom_eusb2_hsphy_clock_names),
+};
+
+static int snps_eusb2_hsphy_init(struct phy *p)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
+	if (ret)
+		return ret;
+
+	ret = phy_init(phy->repeater);
+	if (ret) {
+		dev_err(&p->dev, "repeater init failed. %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = clk_prepare_enable(phy->ref_clk);
+	if (ret) {
+		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
+		goto disable_vreg;
+	}
+
+	ret = reset_control_assert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	usleep_range(100, 150);
+
+	ret = reset_control_deassert(phy->phy_reset);
+	if (ret) {
+		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
+		goto disable_ref_clk;
+	}
+
+	ret = phy->data->phy_init(p);
+	if (ret)
+		goto disable_ref_clk;
+
+	return 0;
+
+disable_ref_clk:
+	clk_disable_unprepare(phy->ref_clk);
+
+disable_vreg:
+	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
+
+	return ret;
+}
+
+static int snps_eusb2_hsphy_exit(struct phy *p)
+{
+	struct snps_eusb2_hsphy *phy = phy_get_drvdata(p);
+
+	clk_disable_unprepare(phy->ref_clk);
+
+	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
+
+	phy_exit(phy->repeater);
+
+	return 0;
+}
+
+static const struct phy_ops snps_eusb2_hsphy_ops = {
+	.init		= snps_eusb2_hsphy_init,
+	.exit		= snps_eusb2_hsphy_exit,
+	.set_mode	= snps_eusb2_hsphy_set_mode,
+	.owner		= THIS_MODULE,
+};
+
+static int snps_eusb2_hsphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct snps_eusb2_hsphy *phy;
+	struct phy_provider *phy_provider;
+	struct phy *generic_phy;
+	const struct snps_eusb2_phy_drvdata *drv_data;
+	int ret, i;
+	int num;
+
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
+	if (!phy)
+		return -ENOMEM;
+
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -EINVAL;
+	phy->data = drv_data;
+
+	phy->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(phy->base))
+		return PTR_ERR(phy->base);
+
+	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
+	if (IS_ERR(phy->phy_reset))
+		return PTR_ERR(phy->phy_reset);
+
+	phy->clks = devm_kcalloc(dev,
+				 phy->data->num_clks,
+				 sizeof(*phy->clks),
+				 GFP_KERNEL);
+	if (!phy->clks)
+		return -ENOMEM;
+
+	for (int i = 0; i < phy->data->num_clks; ++i)
+		phy->clks[i].id = phy->data->clk_names[i];
+
+	ret = devm_clk_bulk_get(dev, phy->data->num_clks,
+				phy->clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get phy clock(s)\n");
+
+	phy->ref_clk = NULL;
+	for (int i = 0; i < phy->data->num_clks; ++i) {
+		if (!strcmp(phy->clks[i].id, "ref")) {
+			phy->ref_clk = phy->clks[i].clk;
+			break;
+		}
+	}
+
+	if (IS_ERR_OR_NULL(phy->ref_clk))
+		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
+				     "failed to get ref clk\n");
+
+	num = ARRAY_SIZE(phy->vregs);
+	for (i = 0; i < num; i++)
+		phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
+
+	ret = devm_regulator_bulk_get(dev, num, phy->vregs);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to get regulator supplies\n");
+
+	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
+	if (IS_ERR(phy->repeater))
+		return dev_err_probe(dev, PTR_ERR(phy->repeater),
+				     "failed to get repeater\n");
+
+	generic_phy = devm_phy_create(dev, NULL, &snps_eusb2_hsphy_ops);
+	if (IS_ERR(generic_phy)) {
+		dev_err(dev, "failed to create phy %d\n", ret);
+		return PTR_ERR(generic_phy);
+	}
+
+	dev_set_drvdata(dev, phy);
+	phy_set_drvdata(generic_phy, phy);
+
+	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(phy_provider))
+		return PTR_ERR(phy_provider);
+
+	dev_info(dev, "Registered Snps-eUSB2 phy\n");
+
+	return 0;
+}
+
+static const struct of_device_id snps_eusb2_hsphy_of_match_table[] = {
+	{
+		.compatible = "qcom,sm8550-snps-eusb2-phy",
+		.data = &sm8550_snps_eusb2_phy,
+	}, { },
+};
+MODULE_DEVICE_TABLE(of, snps_eusb2_hsphy_of_match_table);
+
+static struct platform_driver snps_eusb2_hsphy_driver = {
+	.probe		= snps_eusb2_hsphy_probe,
+	.driver = {
+		.name	= "snps-eusb2-hsphy",
+		.of_match_table = snps_eusb2_hsphy_of_match_table,
+	},
+};
+
+module_platform_driver(snps_eusb2_hsphy_driver);
+MODULE_DESCRIPTION("SNPS eUSB2 HS PHY driver");
+MODULE_LICENSE("GPL");
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
diff --git a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c b/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
deleted file mode 100644
index 1484691a4..000000000
--- a/drivers/phy/qualcomm/phy-qcom-snps-eusb2.c
+++ /dev/null
@@ -1,442 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (c) 2023, Linaro Limited
- */
-
-#include <linux/bitfield.h>
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/iopoll.h>
-#include <linux/mod_devicetable.h>
-#include <linux/phy/phy.h>
-#include <linux/platform_device.h>
-#include <linux/regulator/consumer.h>
-#include <linux/reset.h>
-
-#define USB_PHY_UTMI_CTRL0		(0x3c)
-#define SLEEPM				BIT(0)
-#define OPMODE_MASK			GENMASK(4, 3)
-#define OPMODE_NONDRIVING		BIT(3)
-
-#define USB_PHY_UTMI_CTRL5		(0x50)
-#define POR				BIT(1)
-
-#define USB_PHY_HS_PHY_CTRL_COMMON0	(0x54)
-#define PHY_ENABLE			BIT(0)
-#define SIDDQ_SEL			BIT(1)
-#define SIDDQ				BIT(2)
-#define RETENABLEN			BIT(3)
-#define FSEL_MASK			GENMASK(6, 4)
-#define FSEL_19_2_MHZ_VAL		(0x0)
-#define FSEL_38_4_MHZ_VAL		(0x4)
-
-#define USB_PHY_CFG_CTRL_1		(0x58)
-#define PHY_CFG_PLL_CPBIAS_CNTRL_MASK	GENMASK(7, 1)
-
-#define USB_PHY_CFG_CTRL_2		(0x5c)
-#define PHY_CFG_PLL_FB_DIV_7_0_MASK	GENMASK(7, 0)
-#define DIV_7_0_19_2_MHZ_VAL		(0x90)
-#define DIV_7_0_38_4_MHZ_VAL		(0xc8)
-
-#define USB_PHY_CFG_CTRL_3		(0x60)
-#define PHY_CFG_PLL_FB_DIV_11_8_MASK	GENMASK(3, 0)
-#define DIV_11_8_19_2_MHZ_VAL		(0x1)
-#define DIV_11_8_38_4_MHZ_VAL		(0x0)
-
-#define PHY_CFG_PLL_REF_DIV		GENMASK(7, 4)
-#define PLL_REF_DIV_VAL			(0x0)
-
-#define USB_PHY_HS_PHY_CTRL2		(0x64)
-#define VBUSVLDEXT0			BIT(0)
-#define USB2_SUSPEND_N			BIT(2)
-#define USB2_SUSPEND_N_SEL		BIT(3)
-#define VBUS_DET_EXT_SEL		BIT(4)
-
-#define USB_PHY_CFG_CTRL_4		(0x68)
-#define PHY_CFG_PLL_GMP_CNTRL_MASK	GENMASK(1, 0)
-#define PHY_CFG_PLL_INT_CNTRL_MASK	GENMASK(7, 2)
-
-#define USB_PHY_CFG_CTRL_5		(0x6c)
-#define PHY_CFG_PLL_PROP_CNTRL_MASK	GENMASK(4, 0)
-#define PHY_CFG_PLL_VREF_TUNE_MASK	GENMASK(7, 6)
-
-#define USB_PHY_CFG_CTRL_6		(0x70)
-#define PHY_CFG_PLL_VCO_CNTRL_MASK	GENMASK(2, 0)
-
-#define USB_PHY_CFG_CTRL_7		(0x74)
-
-#define USB_PHY_CFG_CTRL_8		(0x78)
-#define PHY_CFG_TX_FSLS_VREF_TUNE_MASK	GENMASK(1, 0)
-#define PHY_CFG_TX_FSLS_VREG_BYPASS	BIT(2)
-#define PHY_CFG_TX_HS_VREF_TUNE_MASK	GENMASK(5, 3)
-#define PHY_CFG_TX_HS_XV_TUNE_MASK	GENMASK(7, 6)
-
-#define USB_PHY_CFG_CTRL_9		(0x7c)
-#define PHY_CFG_TX_PREEMP_TUNE_MASK	GENMASK(2, 0)
-#define PHY_CFG_TX_RES_TUNE_MASK	GENMASK(4, 3)
-#define PHY_CFG_TX_RISE_TUNE_MASK	GENMASK(6, 5)
-#define PHY_CFG_RCAL_BYPASS		BIT(7)
-
-#define USB_PHY_CFG_CTRL_10		(0x80)
-
-#define USB_PHY_CFG0			(0x94)
-#define DATAPATH_CTRL_OVERRIDE_EN	BIT(0)
-#define CMN_CTRL_OVERRIDE_EN		BIT(1)
-
-#define UTMI_PHY_CMN_CTRL0		(0x98)
-#define TESTBURNIN			BIT(6)
-
-#define USB_PHY_FSEL_SEL		(0xb8)
-#define FSEL_SEL			BIT(0)
-
-#define USB_PHY_APB_ACCESS_CMD		(0x130)
-#define RW_ACCESS			BIT(0)
-#define APB_START_CMD			BIT(1)
-#define APB_LOGIC_RESET			BIT(2)
-
-#define USB_PHY_APB_ACCESS_STATUS	(0x134)
-#define ACCESS_DONE			BIT(0)
-#define TIMED_OUT			BIT(1)
-#define ACCESS_ERROR			BIT(2)
-#define ACCESS_IN_PROGRESS		BIT(3)
-
-#define USB_PHY_APB_ADDRESS		(0x138)
-#define APB_REG_ADDR_MASK		GENMASK(7, 0)
-
-#define USB_PHY_APB_WRDATA_LSB		(0x13c)
-#define APB_REG_WRDATA_7_0_MASK		GENMASK(3, 0)
-
-#define USB_PHY_APB_WRDATA_MSB		(0x140)
-#define APB_REG_WRDATA_15_8_MASK	GENMASK(7, 4)
-
-#define USB_PHY_APB_RDDATA_LSB		(0x144)
-#define APB_REG_RDDATA_7_0_MASK		GENMASK(3, 0)
-
-#define USB_PHY_APB_RDDATA_MSB		(0x148)
-#define APB_REG_RDDATA_15_8_MASK	GENMASK(7, 4)
-
-static const char * const eusb2_hsphy_vreg_names[] = {
-	"vdd", "vdda12",
-};
-
-#define EUSB2_NUM_VREGS		ARRAY_SIZE(eusb2_hsphy_vreg_names)
-
-struct qcom_snps_eusb2_hsphy {
-	struct phy *phy;
-	void __iomem *base;
-
-	struct clk *ref_clk;
-	struct reset_control *phy_reset;
-
-	struct regulator_bulk_data vregs[EUSB2_NUM_VREGS];
-
-	enum phy_mode mode;
-
-	struct phy *repeater;
-};
-
-static int qcom_snps_eusb2_hsphy_set_mode(struct phy *p, enum phy_mode mode, int submode)
-{
-	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
-
-	phy->mode = mode;
-
-	return phy_set_mode_ext(phy->repeater, mode, submode);
-}
-
-static void qcom_snps_eusb2_hsphy_write_mask(void __iomem *base, u32 offset,
-					     u32 mask, u32 val)
-{
-	u32 reg;
-
-	reg = readl_relaxed(base + offset);
-	reg &= ~mask;
-	reg |= val & mask;
-	writel_relaxed(reg, base + offset);
-
-	/* Ensure above write is completed */
-	readl_relaxed(base + offset);
-}
-
-static void qcom_eusb2_default_parameters(struct qcom_snps_eusb2_hsphy *phy)
-{
-	/* default parameters: tx pre-emphasis */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
-					 PHY_CFG_TX_PREEMP_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_PREEMP_TUNE_MASK, 0));
-
-	/* tx rise/fall time */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
-					 PHY_CFG_TX_RISE_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_RISE_TUNE_MASK, 0x2));
-
-	/* source impedance adjustment */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_9,
-					 PHY_CFG_TX_RES_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_RES_TUNE_MASK, 0x1));
-
-	/* dc voltage level adjustement */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
-					 PHY_CFG_TX_HS_VREF_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_HS_VREF_TUNE_MASK, 0x3));
-
-	/* transmitter HS crossover adjustement */
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_8,
-					 PHY_CFG_TX_HS_XV_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
-}
-
-static int qcom_eusb2_ref_clk_init(struct qcom_snps_eusb2_hsphy *phy)
-{
-	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
-
-	switch (ref_clk_freq) {
-	case 19200000:
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-						 FSEL_MASK,
-						 FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
-
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_2,
-						 PHY_CFG_PLL_FB_DIV_7_0_MASK,
-						 DIV_7_0_19_2_MHZ_VAL);
-
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
-						 PHY_CFG_PLL_FB_DIV_11_8_MASK,
-						 DIV_11_8_19_2_MHZ_VAL);
-		break;
-
-	case 38400000:
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-						 FSEL_MASK,
-						 FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
-
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_2,
-						 PHY_CFG_PLL_FB_DIV_7_0_MASK,
-						 DIV_7_0_38_4_MHZ_VAL);
-
-		qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
-						 PHY_CFG_PLL_FB_DIV_11_8_MASK,
-						 DIV_11_8_38_4_MHZ_VAL);
-		break;
-
-	default:
-		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
-		return -EINVAL;
-	}
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_3,
-					 PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
-
-	return 0;
-}
-
-static int qcom_snps_eusb2_hsphy_init(struct phy *p)
-{
-	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
-	int ret;
-
-	ret = regulator_bulk_enable(ARRAY_SIZE(phy->vregs), phy->vregs);
-	if (ret)
-		return ret;
-
-	ret = phy_init(phy->repeater);
-	if (ret) {
-		dev_err(&p->dev, "repeater init failed. %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = clk_prepare_enable(phy->ref_clk);
-	if (ret) {
-		dev_err(&p->dev, "failed to enable ref clock, %d\n", ret);
-		goto disable_vreg;
-	}
-
-	ret = reset_control_assert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
-	usleep_range(100, 150);
-
-	ret = reset_control_deassert(phy->phy_reset);
-	if (ret) {
-		dev_err(&p->dev, "failed to de-assert phy_reset, %d\n", ret);
-		goto disable_ref_clk;
-	}
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG0,
-					 CMN_CTRL_OVERRIDE_EN, CMN_CTRL_OVERRIDE_EN);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL5, POR, POR);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-					 PHY_ENABLE | RETENABLEN, PHY_ENABLE | RETENABLEN);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_APB_ACCESS_CMD,
-					 APB_LOGIC_RESET, APB_LOGIC_RESET);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, UTMI_PHY_CMN_CTRL0, TESTBURNIN, 0);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_FSEL_SEL,
-					 FSEL_SEL, FSEL_SEL);
-
-	/* update ref_clk related registers */
-	ret = qcom_eusb2_ref_clk_init(phy);
-	if (ret)
-		goto disable_ref_clk;
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_1,
-					 PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_4,
-					 PHY_CFG_PLL_INT_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_INT_CNTRL_MASK, 0x8));
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_4,
-					 PHY_CFG_PLL_GMP_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_GMP_CNTRL_MASK, 0x1));
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_5,
-					 PHY_CFG_PLL_PROP_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_PROP_CNTRL_MASK, 0x10));
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_6,
-					 PHY_CFG_PLL_VCO_CNTRL_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_VCO_CNTRL_MASK, 0x0));
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_CFG_CTRL_5,
-					 PHY_CFG_PLL_VREF_TUNE_MASK,
-					 FIELD_PREP(PHY_CFG_PLL_VREF_TUNE_MASK, 0x1));
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
-					 VBUS_DET_EXT_SEL, VBUS_DET_EXT_SEL);
-
-	/* set default parameters */
-	qcom_eusb2_default_parameters(phy);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
-					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
-					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-					 SIDDQ_SEL, SIDDQ_SEL);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL_COMMON0,
-					 SIDDQ, 0);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_UTMI_CTRL5, POR, 0);
-
-	qcom_snps_eusb2_hsphy_write_mask(phy->base, USB_PHY_HS_PHY_CTRL2,
-					 USB2_SUSPEND_N_SEL, 0);
-
-	return 0;
-
-disable_ref_clk:
-	clk_disable_unprepare(phy->ref_clk);
-
-disable_vreg:
-	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
-
-	return ret;
-}
-
-static int qcom_snps_eusb2_hsphy_exit(struct phy *p)
-{
-	struct qcom_snps_eusb2_hsphy *phy = phy_get_drvdata(p);
-
-	clk_disable_unprepare(phy->ref_clk);
-
-	regulator_bulk_disable(ARRAY_SIZE(phy->vregs), phy->vregs);
-
-	phy_exit(phy->repeater);
-
-	return 0;
-}
-
-static const struct phy_ops qcom_snps_eusb2_hsphy_ops = {
-	.init		= qcom_snps_eusb2_hsphy_init,
-	.exit		= qcom_snps_eusb2_hsphy_exit,
-	.set_mode	= qcom_snps_eusb2_hsphy_set_mode,
-	.owner		= THIS_MODULE,
-};
-
-static int qcom_snps_eusb2_hsphy_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct qcom_snps_eusb2_hsphy *phy;
-	struct phy_provider *phy_provider;
-	struct phy *generic_phy;
-	int ret, i;
-	int num;
-
-	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
-	if (!phy)
-		return -ENOMEM;
-
-	phy->base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(phy->base))
-		return PTR_ERR(phy->base);
-
-	phy->phy_reset = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(phy->phy_reset))
-		return PTR_ERR(phy->phy_reset);
-
-	phy->ref_clk = devm_clk_get(dev, "ref");
-	if (IS_ERR(phy->ref_clk))
-		return dev_err_probe(dev, PTR_ERR(phy->ref_clk),
-				     "failed to get ref clk\n");
-
-	num = ARRAY_SIZE(phy->vregs);
-	for (i = 0; i < num; i++)
-		phy->vregs[i].supply = eusb2_hsphy_vreg_names[i];
-
-	ret = devm_regulator_bulk_get(dev, num, phy->vregs);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "failed to get regulator supplies\n");
-
-	phy->repeater = devm_of_phy_get_by_index(dev, np, 0);
-	if (IS_ERR(phy->repeater))
-		return dev_err_probe(dev, PTR_ERR(phy->repeater),
-				     "failed to get repeater\n");
-
-	generic_phy = devm_phy_create(dev, NULL, &qcom_snps_eusb2_hsphy_ops);
-	if (IS_ERR(generic_phy)) {
-		dev_err(dev, "failed to create phy %d\n", ret);
-		return PTR_ERR(generic_phy);
-	}
-
-	dev_set_drvdata(dev, phy);
-	phy_set_drvdata(generic_phy, phy);
-
-	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
-	if (IS_ERR(phy_provider))
-		return PTR_ERR(phy_provider);
-
-	dev_info(dev, "Registered Qcom-eUSB2 phy\n");
-
-	return 0;
-}
-
-static const struct of_device_id qcom_snps_eusb2_hsphy_of_match_table[] = {
-	{ .compatible = "qcom,sm8550-snps-eusb2-phy", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, qcom_snps_eusb2_hsphy_of_match_table);
-
-static struct platform_driver qcom_snps_eusb2_hsphy_driver = {
-	.probe		= qcom_snps_eusb2_hsphy_probe,
-	.driver = {
-		.name	= "qcom-snps-eusb2-hsphy",
-		.of_match_table = qcom_snps_eusb2_hsphy_of_match_table,
-	},
-};
-
-module_platform_driver(qcom_snps_eusb2_hsphy_driver);
-MODULE_DESCRIPTION("Qualcomm SNPS eUSB2 HS PHY driver");
-MODULE_LICENSE("GPL");
-- 
2.43.0


