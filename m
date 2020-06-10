Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99C851F5D82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2020 23:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgFJVIk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Jun 2020 17:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgFJVIk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Jun 2020 17:08:40 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0AFCC03E96B;
        Wed, 10 Jun 2020 14:08:39 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id w16so3627593ejj.5;
        Wed, 10 Jun 2020 14:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VSgaCWcJCjV35lapo7mD2rShPIM6X/GUy6e/swmmkag=;
        b=hjRDswghSyxgf77KZeoPgxhGKV+nEs/lK6SCEj2p5VM3s6YKldU7qyYvtsNjby2/Wv
         xkUS4nzUY7J/czSMuOVXVUwBfGISz2FISJBL1Q2B7gIOQgJ/gACD9bI6/S+UdMdJCxn0
         9R6RXLYydxN40WfDO4nVZJp8QKBfmi9DdIvlTu/5v9AJTUcEEMA8vgZ3Oz2AjzDgEmFh
         /l1Uv/rDx8zQQIx/ddqfjJxscXcb5iHO2HlHVWq1x4uvJ3YWya8pNJgldhYe2CYrNWvo
         /W33zkwpbwqtGdYda9HotOIPhpTVYklZfXvt6s6h5yuhejTLM72WyKMd0s63OZXrgmM9
         vj7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VSgaCWcJCjV35lapo7mD2rShPIM6X/GUy6e/swmmkag=;
        b=HZT6qWsnOuIMdu+QKuL3eyVShT7yHRRUQBjerMSWBvafqZ8lNq/octIDj3gjRnqxKh
         Smdbs2gfakPZlc6ZHVTOVvAIuSFbN4HUAPGumyYUaWSwvU5/eALsaqbL5KYUte/2SZqt
         zwMDRZ+PLL6UOw+zP0xuen3PmFur4OV4ggVHP5/OjsqNn8hLJw0Y7IlLiw2zEsJuCf2W
         fCjEscW/9PJw3U0sezM1bsPmSczL/f0fpeyQpSv4XG7kapg0Xr4M16Toub8HmgrlW34f
         GD0Hj949JkcUZJLY02D+RtobQOU8F6JKruIIca9906jlmUT6oueTynTpadVDkgq6IZOO
         Ovng==
X-Gm-Message-State: AOAM533KslHJ+xBtg6/XjDDraSp6u50Mu6zMp59FmwditQ63SbPkj/XG
        zfRl1KmXYHEJN7cS/EJ8KTU=
X-Google-Smtp-Source: ABdhPJz751pZyRuFLsrhaFWpMPCgDtwTAei22dSQlrshHt4l/pNqEEw2I/GL2aZ/whNm8rpZhlZQSA==
X-Received: by 2002:a17:906:6c82:: with SMTP id s2mr5101080ejr.215.1591823318254;
        Wed, 10 Jun 2020 14:08:38 -0700 (PDT)
Received: from Ansuel-XPS.localdomain ([80.180.205.145])
        by smtp.googlemail.com with ESMTPSA id g25sm447448edq.34.2020.06.10.14.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2020 14:08:37 -0700 (PDT)
From:   Ansuel Smith <ansuelsmth@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@codeaurora.org>,
        Jonathan McDowell <noodles@earth.li>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v7 1/2] phy: qualcomm: add qcom ipq806x dwc usb phy driver
Date:   Wed, 10 Jun 2020 23:08:24 +0200
Message-Id: <20200610210828.13297-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This has lost in the original push for the dwc3 qcom driver.
This is needed for ipq806x SoC as without this the usb ports
doesn't work at all.

Signed-off-by: Andy Gross <agross@codeaurora.org>
Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
Tested-by: Jonathan McDowell <noodles@earth.li>
---
v7:
* Add TestedBy tag
v6:
* Use GENMASK instead of hex value
v4:
* Add qcom to specific bindings
v3:
* Use reg instead of regmap phandle
v2:
* Renamed config from PHY_QCOM_DWC3 to PHY_QCOM_IPQ806X_USB
* Rename inline function to generic name to reduce length
* Fix check reported by checkpatch --strict
* Rename compatible to qcom,ipq806x-usb-phy-(hs/ss)

 drivers/phy/qualcomm/Kconfig                |  12 +
 drivers/phy/qualcomm/Makefile               |   1 +
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 593 ++++++++++++++++++++
 3 files changed, 606 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index e46824da29f6..9d41c3d12800 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -91,3 +91,15 @@ config PHY_QCOM_USB_HSIC
 	select GENERIC_PHY
 	help
 	  Support for the USB HSIC ULPI compliant PHY on QCOM chipsets.
+
+config PHY_QCOM_IPQ806X_USB
+	tristate "Qualcomm IPQ806x DWC3 USB PHY driver"
+	depends on ARCH_QCOM
+	depends on HAS_IOMEM
+	depends on OF
+	select GENERIC_PHY
+	help
+	  This option enables support for the Synopsis PHYs present inside the
+	  Qualcomm USB3.0 DWC3 controller on ipq806x SoC. This driver supports
+	  both HS and SS PHY controllers.
+
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 283251d6a5d9..8629299c1495 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_PHY_QCOM_UFS_14NM)		+= phy-qcom-ufs-qmp-14nm.o
 obj-$(CONFIG_PHY_QCOM_UFS_20NM)		+= phy-qcom-ufs-qmp-20nm.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
+obj-$(CONFIG_PHY_QCOM_IPQ806X_USB)		+= phy-qcom-ipq806x-usb.o
diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
new file mode 100644
index 000000000000..f37cd8760118
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -0,0 +1,593 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2014-2015, Code Aurora Forum. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/delay.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+/* USB QSCRATCH Hardware registers */
+#define QSCRATCH_GENERAL_CFG		(0x08)
+#define HSUSB_PHY_CTRL_REG		(0x10)
+
+/* PHY_CTRL_REG */
+#define HSUSB_CTRL_DMSEHV_CLAMP		BIT(24)
+#define HSUSB_CTRL_USB2_SUSPEND		BIT(23)
+#define HSUSB_CTRL_UTMI_CLK_EN		BIT(21)
+#define HSUSB_CTRL_UTMI_OTG_VBUS_VALID	BIT(20)
+#define HSUSB_CTRL_USE_CLKCORE		BIT(18)
+#define HSUSB_CTRL_DPSEHV_CLAMP		BIT(17)
+#define HSUSB_CTRL_COMMONONN		BIT(11)
+#define HSUSB_CTRL_ID_HV_CLAMP		BIT(9)
+#define HSUSB_CTRL_OTGSESSVLD_CLAMP	BIT(8)
+#define HSUSB_CTRL_CLAMP_EN		BIT(7)
+#define HSUSB_CTRL_RETENABLEN		BIT(1)
+#define HSUSB_CTRL_POR			BIT(0)
+
+/* QSCRATCH_GENERAL_CFG */
+#define HSUSB_GCFG_XHCI_REV		BIT(2)
+
+/* USB QSCRATCH Hardware registers */
+#define SSUSB_PHY_CTRL_REG		(0x00)
+#define SSUSB_PHY_PARAM_CTRL_1		(0x04)
+#define SSUSB_PHY_PARAM_CTRL_2		(0x08)
+#define CR_PROTOCOL_DATA_IN_REG		(0x0c)
+#define CR_PROTOCOL_DATA_OUT_REG	(0x10)
+#define CR_PROTOCOL_CAP_ADDR_REG	(0x14)
+#define CR_PROTOCOL_CAP_DATA_REG	(0x18)
+#define CR_PROTOCOL_READ_REG		(0x1c)
+#define CR_PROTOCOL_WRITE_REG		(0x20)
+
+/* PHY_CTRL_REG */
+#define SSUSB_CTRL_REF_USE_PAD		BIT(28)
+#define SSUSB_CTRL_TEST_POWERDOWN	BIT(27)
+#define SSUSB_CTRL_LANE0_PWR_PRESENT	BIT(24)
+#define SSUSB_CTRL_SS_PHY_EN		BIT(8)
+#define SSUSB_CTRL_SS_PHY_RESET		BIT(7)
+
+/* SSPHY control registers - Does this need 0x30? */
+#define SSPHY_CTRL_RX_OVRD_IN_HI(lane)	(0x1006 + 0x100 * (lane))
+#define SSPHY_CTRL_TX_OVRD_DRV_LO(lane)	(0x1002 + 0x100 * (lane))
+
+/* SSPHY SoC version specific values */
+#define SSPHY_RX_EQ_VALUE		4 /* Override value for rx_eq */
+/* Override value for transmit preemphasis */
+#define SSPHY_TX_DEEMPH_3_5DB		23
+/* Override value for mpll */
+#define SSPHY_MPLL_VALUE		0
+
+/* QSCRATCH PHY_PARAM_CTRL1 fields */
+#define PHY_PARAM_CTRL1_TX_FULL_SWING_MASK	GENMASK(26, 19)
+#define PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK	GENMASK(19, 13)
+#define PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK	GENMASK(13, 7)
+#define PHY_PARAM_CTRL1_LOS_BIAS_MASK		GENMASK(7, 2)
+
+#define PHY_PARAM_CTRL1_MASK				\
+		(PHY_PARAM_CTRL1_TX_FULL_SWING_MASK |	\
+		 PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK |	\
+		 PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK |	\
+		 PHY_PARAM_CTRL1_LOS_BIAS_MASK)
+
+#define PHY_PARAM_CTRL1_TX_FULL_SWING(x)	\
+		(((x) << 20) & PHY_PARAM_CTRL1_TX_FULL_SWING_MASK)
+#define PHY_PARAM_CTRL1_TX_DEEMPH_6DB(x)	\
+		(((x) << 14) & PHY_PARAM_CTRL1_TX_DEEMPH_6DB_MASK)
+#define PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB(x)	\
+		(((x) <<  8) & PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB_MASK)
+#define PHY_PARAM_CTRL1_LOS_BIAS(x)	\
+		(((x) <<  3) & PHY_PARAM_CTRL1_LOS_BIAS_MASK)
+
+/* RX OVRD IN HI bits */
+#define RX_OVRD_IN_HI_RX_RESET_OVRD		BIT(13)
+#define RX_OVRD_IN_HI_RX_RX_RESET		BIT(12)
+#define RX_OVRD_IN_HI_RX_EQ_OVRD		BIT(11)
+#define RX_OVRD_IN_HI_RX_EQ_MASK		GENMASK(10, 7)
+#define RX_OVRD_IN_HI_RX_EQ(x)			((x) << 8)
+#define RX_OVRD_IN_HI_RX_EQ_EN_OVRD		BIT(7)
+#define RX_OVRD_IN_HI_RX_EQ_EN			BIT(6)
+#define RX_OVRD_IN_HI_RX_LOS_FILTER_OVRD	BIT(5)
+#define RX_OVRD_IN_HI_RX_LOS_FILTER_MASK	GENMASK(4, 2)
+#define RX_OVRD_IN_HI_RX_RATE_OVRD		BIT(2)
+#define RX_OVRD_IN_HI_RX_RATE_MASK		GENMASK(2, 0)
+
+/* TX OVRD DRV LO register bits */
+#define TX_OVRD_DRV_LO_AMPLITUDE_MASK		GENMASK(6, 0)
+#define TX_OVRD_DRV_LO_PREEMPH_MASK		GENMASK(13, 6)
+#define TX_OVRD_DRV_LO_PREEMPH(x)		((x) << 7)
+#define TX_OVRD_DRV_LO_EN			BIT(14)
+
+/* MPLL bits */
+#define SSPHY_MPLL_MASK				GENMASK(8, 5)
+#define SSPHY_MPLL(x)				((x) << 5)
+
+/* SS CAP register bits */
+#define SS_CR_CAP_ADDR_REG			BIT(0)
+#define SS_CR_CAP_DATA_REG			BIT(0)
+#define SS_CR_READ_REG				BIT(0)
+#define SS_CR_WRITE_REG				BIT(0)
+
+struct usb_phy {
+	void __iomem		*base;
+	struct device		*dev;
+	struct clk		*xo_clk;
+	struct clk		*ref_clk;
+	u32			rx_eq;
+	u32			tx_deamp_3_5db;
+	u32			mpll;
+};
+
+struct phy_drvdata {
+	struct phy_ops	ops;
+	u32		clk_rate;
+};
+
+/**
+ * Write register and read back masked value to confirm it is written
+ *
+ * @base - QCOM DWC3 PHY base virtual address.
+ * @offset - register offset.
+ * @mask - register bitmask specifying what should be updated
+ * @val - value to write.
+ */
+static inline void usb_phy_write_readback(struct usb_phy *phy_dwc3,
+					  u32 offset,
+					  const u32 mask, u32 val)
+{
+	u32 write_val, tmp = readl(phy_dwc3->base + offset);
+
+	tmp &= ~mask;		/* retain other bits */
+	write_val = tmp | val;
+
+	writel(write_val, phy_dwc3->base + offset);
+
+	/* Read back to see if val was written */
+	tmp = readl(phy_dwc3->base + offset);
+	tmp &= mask;		/* clear other bits */
+
+	if (tmp != val)
+		dev_err(phy_dwc3->dev, "write: %x to QSCRATCH: %x FAILED\n",
+			val, offset);
+}
+
+static int wait_for_latch(void __iomem *addr)
+{
+	u32 retry = 10;
+
+	while (true) {
+		if (!readl(addr))
+			break;
+
+		if (--retry == 0)
+			return -ETIMEDOUT;
+
+		usleep_range(10, 20);
+	}
+
+	return 0;
+}
+
+/**
+ * Write SSPHY register
+ *
+ * @base - QCOM DWC3 PHY base virtual address.
+ * @addr - SSPHY address to write.
+ * @val - value to write.
+ */
+static int usb_ss_write_phycreg(struct usb_phy *phy_dwc3,
+				u32 addr, u32 val)
+{
+	int ret;
+
+	writel(addr, phy_dwc3->base + CR_PROTOCOL_DATA_IN_REG);
+	writel(SS_CR_CAP_ADDR_REG,
+	       phy_dwc3->base + CR_PROTOCOL_CAP_ADDR_REG);
+
+	ret = wait_for_latch(phy_dwc3->base + CR_PROTOCOL_CAP_ADDR_REG);
+	if (ret)
+		goto err_wait;
+
+	writel(val, phy_dwc3->base + CR_PROTOCOL_DATA_IN_REG);
+	writel(SS_CR_CAP_DATA_REG,
+	       phy_dwc3->base + CR_PROTOCOL_CAP_DATA_REG);
+
+	ret = wait_for_latch(phy_dwc3->base + CR_PROTOCOL_CAP_DATA_REG);
+	if (ret)
+		goto err_wait;
+
+	writel(SS_CR_WRITE_REG, phy_dwc3->base + CR_PROTOCOL_WRITE_REG);
+
+	ret = wait_for_latch(phy_dwc3->base + CR_PROTOCOL_WRITE_REG);
+
+err_wait:
+	if (ret)
+		dev_err(phy_dwc3->dev, "timeout waiting for latch\n");
+	return ret;
+}
+
+/**
+ * Read SSPHY register.
+ *
+ * @base - QCOM DWC3 PHY base virtual address.
+ * @addr - SSPHY address to read.
+ */
+static int usb_ss_read_phycreg(struct usb_phy *phy_dwc3,
+			       u32 addr, u32 *val)
+{
+	int ret;
+
+	writel(addr, phy_dwc3->base + CR_PROTOCOL_DATA_IN_REG);
+	writel(SS_CR_CAP_ADDR_REG,
+	       phy_dwc3->base + CR_PROTOCOL_CAP_ADDR_REG);
+
+	ret = wait_for_latch(phy_dwc3->base + CR_PROTOCOL_CAP_ADDR_REG);
+	if (ret)
+		goto err_wait;
+
+	/*
+	 * Due to hardware bug, first read of SSPHY register might be
+	 * incorrect. Hence as workaround, SW should perform SSPHY register
+	 * read twice, but use only second read and ignore first read.
+	 */
+	writel(SS_CR_READ_REG, phy_dwc3->base + CR_PROTOCOL_READ_REG);
+
+	ret = wait_for_latch(phy_dwc3->base + CR_PROTOCOL_READ_REG);
+	if (ret)
+		goto err_wait;
+
+	/* throwaway read */
+	readl(phy_dwc3->base + CR_PROTOCOL_DATA_OUT_REG);
+
+	writel(SS_CR_READ_REG, phy_dwc3->base + CR_PROTOCOL_READ_REG);
+
+	ret = wait_for_latch(phy_dwc3->base + CR_PROTOCOL_READ_REG);
+	if (ret)
+		goto err_wait;
+
+	*val = readl(phy_dwc3->base + CR_PROTOCOL_DATA_OUT_REG);
+
+err_wait:
+	return ret;
+}
+
+static int qcom_ipq806x_usb_hs_phy_init(struct phy *phy)
+{
+	struct usb_phy *phy_dwc3 = phy_get_drvdata(phy);
+	int ret;
+	u32 val;
+
+	ret = clk_prepare_enable(phy_dwc3->xo_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(phy_dwc3->ref_clk);
+	if (ret) {
+		clk_disable_unprepare(phy_dwc3->xo_clk);
+		return ret;
+	}
+
+	/*
+	 * HSPHY Initialization: Enable UTMI clock, select 19.2MHz fsel
+	 * enable clamping, and disable RETENTION (power-on default is ENABLED)
+	 */
+	val = HSUSB_CTRL_DPSEHV_CLAMP | HSUSB_CTRL_DMSEHV_CLAMP |
+		HSUSB_CTRL_RETENABLEN  | HSUSB_CTRL_COMMONONN |
+		HSUSB_CTRL_OTGSESSVLD_CLAMP | HSUSB_CTRL_ID_HV_CLAMP |
+		HSUSB_CTRL_DPSEHV_CLAMP | HSUSB_CTRL_UTMI_OTG_VBUS_VALID |
+		HSUSB_CTRL_UTMI_CLK_EN | HSUSB_CTRL_CLAMP_EN | 0x70;
+
+	/* use core clock if external reference is not present */
+	if (!phy_dwc3->xo_clk)
+		val |= HSUSB_CTRL_USE_CLKCORE;
+
+	writel(val, phy_dwc3->base + HSUSB_PHY_CTRL_REG);
+	usleep_range(2000, 2200);
+
+	/* Disable (bypass) VBUS and ID filters */
+	writel(HSUSB_GCFG_XHCI_REV, phy_dwc3->base + QSCRATCH_GENERAL_CFG);
+
+	return 0;
+}
+
+static int qcom_ipq806x_usb_hs_phy_exit(struct phy *phy)
+{
+	struct usb_phy *phy_dwc3 = phy_get_drvdata(phy);
+
+	clk_disable_unprepare(phy_dwc3->ref_clk);
+	clk_disable_unprepare(phy_dwc3->xo_clk);
+
+	return 0;
+}
+
+static int qcom_ipq806x_usb_ss_phy_init(struct phy *phy)
+{
+	struct usb_phy *phy_dwc3 = phy_get_drvdata(phy);
+	int ret;
+	u32 data = 0;
+
+	ret = clk_prepare_enable(phy_dwc3->xo_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(phy_dwc3->ref_clk);
+	if (ret) {
+		clk_disable_unprepare(phy_dwc3->xo_clk);
+		return ret;
+	}
+
+	/* reset phy */
+	data = readl(phy_dwc3->base + SSUSB_PHY_CTRL_REG);
+	writel(data | SSUSB_CTRL_SS_PHY_RESET,
+	       phy_dwc3->base + SSUSB_PHY_CTRL_REG);
+	usleep_range(2000, 2200);
+	writel(data, phy_dwc3->base + SSUSB_PHY_CTRL_REG);
+
+	/* clear REF_PAD if we don't have XO clk */
+	if (!phy_dwc3->xo_clk)
+		data &= ~SSUSB_CTRL_REF_USE_PAD;
+	else
+		data |= SSUSB_CTRL_REF_USE_PAD;
+
+	writel(data, phy_dwc3->base + SSUSB_PHY_CTRL_REG);
+
+	/* wait for ref clk to become stable, this can take up to 30ms */
+	msleep(30);
+
+	data |= SSUSB_CTRL_SS_PHY_EN | SSUSB_CTRL_LANE0_PWR_PRESENT;
+	writel(data, phy_dwc3->base + SSUSB_PHY_CTRL_REG);
+
+	/*
+	 * WORKAROUND: There is SSPHY suspend bug due to which USB enumerates
+	 * in HS mode instead of SS mode. Workaround it by asserting
+	 * LANE0.TX_ALT_BLOCK.EN_ALT_BUS to enable TX to use alt bus mode
+	 */
+	ret = usb_ss_read_phycreg(phy_dwc3, 0x102D, &data);
+	if (ret)
+		goto err_phy_trans;
+
+	data |= (1 << 7);
+	ret = usb_ss_write_phycreg(phy_dwc3, 0x102D, data);
+	if (ret)
+		goto err_phy_trans;
+
+	ret = usb_ss_read_phycreg(phy_dwc3, 0x1010, &data);
+	if (ret)
+		goto err_phy_trans;
+
+	data &= ~0xff0;
+	data |= 0x20;
+	ret = usb_ss_write_phycreg(phy_dwc3, 0x1010, data);
+	if (ret)
+		goto err_phy_trans;
+
+	/*
+	 * Fix RX Equalization setting as follows
+	 * LANE0.RX_OVRD_IN_HI. RX_EQ_EN set to 0
+	 * LANE0.RX_OVRD_IN_HI.RX_EQ_EN_OVRD set to 1
+	 * LANE0.RX_OVRD_IN_HI.RX_EQ set based on SoC version
+	 * LANE0.RX_OVRD_IN_HI.RX_EQ_OVRD set to 1
+	 */
+	ret = usb_ss_read_phycreg(phy_dwc3,
+				  SSPHY_CTRL_RX_OVRD_IN_HI(0), &data);
+	if (ret)
+		goto err_phy_trans;
+
+	data &= ~RX_OVRD_IN_HI_RX_EQ_EN;
+	data |= RX_OVRD_IN_HI_RX_EQ_EN_OVRD;
+	data &= ~RX_OVRD_IN_HI_RX_EQ_MASK;
+	data |= RX_OVRD_IN_HI_RX_EQ(phy_dwc3->rx_eq);
+	data |= RX_OVRD_IN_HI_RX_EQ_OVRD;
+	ret = usb_ss_write_phycreg(phy_dwc3,
+				   SSPHY_CTRL_RX_OVRD_IN_HI(0), data);
+	if (ret)
+		goto err_phy_trans;
+
+	/*
+	 * Set EQ and TX launch amplitudes as follows
+	 * LANE0.TX_OVRD_DRV_LO.PREEMPH set based on SoC version
+	 * LANE0.TX_OVRD_DRV_LO.AMPLITUDE set to 110
+	 * LANE0.TX_OVRD_DRV_LO.EN set to 1.
+	 */
+	ret = usb_ss_read_phycreg(phy_dwc3,
+				  SSPHY_CTRL_TX_OVRD_DRV_LO(0), &data);
+	if (ret)
+		goto err_phy_trans;
+
+	data &= ~TX_OVRD_DRV_LO_PREEMPH_MASK;
+	data |= TX_OVRD_DRV_LO_PREEMPH(phy_dwc3->tx_deamp_3_5db);
+	data &= ~TX_OVRD_DRV_LO_AMPLITUDE_MASK;
+	data |= 0x6E;
+	data |= TX_OVRD_DRV_LO_EN;
+	ret = usb_ss_write_phycreg(phy_dwc3,
+				   SSPHY_CTRL_TX_OVRD_DRV_LO(0), data);
+	if (ret)
+		goto err_phy_trans;
+
+	data = 0;
+	data &= ~SSPHY_MPLL_MASK;
+	data |= SSPHY_MPLL(phy_dwc3->mpll);
+	usb_ss_write_phycreg(phy_dwc3, 0x30, data);
+
+	/*
+	 * Set the QSCRATCH PHY_PARAM_CTRL1 parameters as follows
+	 * TX_FULL_SWING [26:20] amplitude to 110
+	 * TX_DEEMPH_6DB [19:14] to 32
+	 * TX_DEEMPH_3_5DB [13:8] set based on SoC version
+	 * LOS_BIAS [7:3] to 9
+	 */
+	data = readl(phy_dwc3->base + SSUSB_PHY_PARAM_CTRL_1);
+
+	data &= ~PHY_PARAM_CTRL1_MASK;
+
+	data |= PHY_PARAM_CTRL1_TX_FULL_SWING(0x6e) |
+		PHY_PARAM_CTRL1_TX_DEEMPH_6DB(0x20) |
+		PHY_PARAM_CTRL1_TX_DEEMPH_3_5DB(phy_dwc3->tx_deamp_3_5db) |
+		PHY_PARAM_CTRL1_LOS_BIAS(0x9);
+
+	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_PARAM_CTRL_1,
+			       PHY_PARAM_CTRL1_MASK, data);
+
+err_phy_trans:
+	return ret;
+}
+
+static int qcom_ipq806x_usb_ss_phy_exit(struct phy *phy)
+{
+	struct usb_phy *phy_dwc3 = phy_get_drvdata(phy);
+
+	/* Sequence to put SSPHY in low power state:
+	 * 1. Clear REF_PHY_EN in PHY_CTRL_REG
+	 * 2. Clear REF_USE_PAD in PHY_CTRL_REG
+	 * 3. Set TEST_POWERED_DOWN in PHY_CTRL_REG to enable PHY retention
+	 */
+	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_CTRL_REG,
+			       SSUSB_CTRL_SS_PHY_EN, 0x0);
+	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_CTRL_REG,
+			       SSUSB_CTRL_REF_USE_PAD, 0x0);
+	usb_phy_write_readback(phy_dwc3, SSUSB_PHY_CTRL_REG,
+			       SSUSB_CTRL_TEST_POWERDOWN, 0x0);
+
+	clk_disable_unprepare(phy_dwc3->ref_clk);
+	clk_disable_unprepare(phy_dwc3->xo_clk);
+
+	return 0;
+}
+
+static const struct phy_drvdata qcom_ipq806x_usb_hs_drvdata = {
+	.ops = {
+		.init		= qcom_ipq806x_usb_hs_phy_init,
+		.exit		= qcom_ipq806x_usb_hs_phy_exit,
+		.owner		= THIS_MODULE,
+	},
+	.clk_rate = 60000000,
+};
+
+static const struct phy_drvdata qcom_ipq806x_usb_ss_drvdata = {
+	.ops = {
+		.init		= qcom_ipq806x_usb_ss_phy_init,
+		.exit		= qcom_ipq806x_usb_ss_phy_exit,
+		.owner		= THIS_MODULE,
+	},
+	.clk_rate = 125000000,
+};
+
+static const struct of_device_id qcom_ipq806x_usb_phy_table[] = {
+	{ .compatible = "qcom,ipq806x-usb-phy-hs",
+	  .data = &qcom_ipq806x_usb_hs_drvdata },
+	{ .compatible = "qcom,ipq806x-usb-phy-ss",
+	  .data = &qcom_ipq806x_usb_ss_drvdata },
+	{ /* Sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, qcom_ipq806x_usb_phy_table);
+
+static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
+{
+	struct usb_phy	*phy_dwc3;
+	struct phy_provider		*phy_provider;
+	struct phy			*generic_phy;
+	const struct of_device_id *match;
+	const struct phy_drvdata *data;
+	struct resource			*res;
+	resource_size_t			size;
+	struct device_node *np;
+
+	phy_dwc3 = devm_kzalloc(&pdev->dev, sizeof(*phy_dwc3), GFP_KERNEL);
+	if (!phy_dwc3)
+		return -ENOMEM;
+
+	match = of_match_node(qcom_ipq806x_usb_phy_table, pdev->dev.of_node);
+	data = match->data;
+
+	phy_dwc3->dev = &pdev->dev;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+	size = resource_size(res);
+	phy_dwc3->base = devm_ioremap(phy_dwc3->dev, res->start, size);
+
+	if (IS_ERR(phy_dwc3->base)) {
+		dev_err(phy_dwc3->dev, "failed to map reg\n");
+		return PTR_ERR(phy_dwc3->base);
+	}
+
+	phy_dwc3->ref_clk = devm_clk_get(phy_dwc3->dev, "ref");
+	if (IS_ERR(phy_dwc3->ref_clk)) {
+		dev_dbg(phy_dwc3->dev, "cannot get reference clock\n");
+		return PTR_ERR(phy_dwc3->ref_clk);
+	}
+
+	clk_set_rate(phy_dwc3->ref_clk, data->clk_rate);
+
+	phy_dwc3->xo_clk = devm_clk_get(phy_dwc3->dev, "xo");
+	if (IS_ERR(phy_dwc3->xo_clk)) {
+		dev_dbg(phy_dwc3->dev, "cannot get TCXO clock\n");
+		phy_dwc3->xo_clk = NULL;
+	}
+
+	/* Parse device node to probe HSIO settings */
+	np = of_node_get(pdev->dev.of_node);
+	if (!of_compat_cmp(match->compatible, "qcom,ipq806x-usb-phy-ss",
+			   strlen(match->compatible))) {
+		if (of_property_read_u32(np, "qcom,rx-eq", &phy_dwc3->rx_eq) ||
+		    of_property_read_u32(np, "qcom,tx-deamp_3_5db",
+					 &phy_dwc3->tx_deamp_3_5db) ||
+		    of_property_read_u32(np, "qcom,mpll", &phy_dwc3->mpll)) {
+			dev_err(phy_dwc3->dev, "cannot get HSIO settings from device node, using default values\n");
+
+			/* Default HSIO settings */
+			phy_dwc3->rx_eq = SSPHY_RX_EQ_VALUE;
+			phy_dwc3->tx_deamp_3_5db = SSPHY_TX_DEEMPH_3_5DB;
+			phy_dwc3->mpll = SSPHY_MPLL_VALUE;
+		}
+	}
+
+	generic_phy = devm_phy_create(phy_dwc3->dev, pdev->dev.of_node,
+				      &data->ops);
+
+	if (IS_ERR(generic_phy))
+		return PTR_ERR(generic_phy);
+
+	phy_set_drvdata(generic_phy, phy_dwc3);
+	platform_set_drvdata(pdev, phy_dwc3);
+
+	phy_provider = devm_of_phy_provider_register(phy_dwc3->dev,
+						     of_phy_simple_xlate);
+
+	if (IS_ERR(phy_provider))
+		return PTR_ERR(phy_provider);
+
+	return 0;
+}
+
+static struct platform_driver qcom_ipq806x_usb_phy_driver = {
+	.probe		= qcom_ipq806x_usb_phy_probe,
+	.driver		= {
+		.name	= "qcom-ipq806x-usb-phy",
+		.owner	= THIS_MODULE,
+		.of_match_table = qcom_ipq806x_usb_phy_table,
+	},
+};
+
+module_platform_driver(qcom_ipq806x_usb_phy_driver);
+
+MODULE_ALIAS("platform:phy-qcom-ipq806x-usb");
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Andy Gross <agross@codeaurora.org>");
+MODULE_AUTHOR("Ivan T. Ivanov <iivanov@mm-sol.com>");
+MODULE_DESCRIPTION("DesignWare USB3 QCOM PHY driver");
-- 
2.25.1

