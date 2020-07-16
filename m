Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E62BA222202
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jul 2020 13:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbgGPL51 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Jul 2020 07:57:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728284AbgGPLz6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Jul 2020 07:55:58 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874DAC061755;
        Thu, 16 Jul 2020 04:55:57 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id w3so11322660wmi.4;
        Thu, 16 Jul 2020 04:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78Y6TdM0PRruNQCvuqrmY2m+2qiFcG1gpfLq2GGN/Aw=;
        b=rKrRFzvDEg32wrVn1K5TMx27ITXZxj+h2LmZiQMikggp7qMycKPCXJE9g2M+pK0lNS
         4jF1VOaYkN2Ni8TKgQ0V40XMrOsCUVZzhDbZiwOb4d85zXFyUGBjuuBqJ5Cl3vJXvIkF
         5dxA3FMBgyfKienebD/be5t6YSLBljFk15gRTaxT2gzPI2uFN8AyKckLl59uVU+BRgRf
         lCY14YLjc0MLquHNXJoK4nf0+YevrCGQYdpwRG7avLQiTtnkbdsio/QyXQEBqveGUQty
         u/aOxsdn+tD21ytw66dTcSP5PW1KoaiYs/9p1IOa3XpAM16NSWizQL/ySUTJyeMwYIQL
         gv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=78Y6TdM0PRruNQCvuqrmY2m+2qiFcG1gpfLq2GGN/Aw=;
        b=jnC8aBP6HG3e65VmO6J8cjsstdZyZKi49xNgKGL0ozA5dPbeHlMS5O/EEe1Y8D4HAN
         cRxX9wn3+EOvg02x6uWgm+k1nwyd8dUno3VQY8ndoNpZdeMYkYBrgMaVhxh1bN99T4E+
         TTZg1+jKhm/EbcYF+5HBOY/bC3KBgIznqjmpvYi1Na2BYYZupfQRU5VpxHuPggpQdK0K
         zRzf7eBbSQUABUUf3HalZzoGVgMPXjPc8AGrEYQ8VG7fOFbJ7KSoJDN1mQQCU7/fPQnS
         ta73rJ8IFFjw6MXQ+2YisfKOrR9i5whmIDgFg0VdoHqL00W9ETBUU0cssPP4i10tlySa
         zRwA==
X-Gm-Message-State: AOAM530RTdJr0bkC1VCC4Obs2f2yd1mQhByX+YrjHhdW82TfNMOrT2vw
        EV82a83abKJUmOTtZo8pEWE=
X-Google-Smtp-Source: ABdhPJx6TpJc5YdfzfnK8PJsm8JZeVlCs3dtuddP2uMEN12zCkHcIugUKpNl/bZd0d+9yRYErpP1uA==
X-Received: by 2002:a1c:5646:: with SMTP id k67mr4180092wmb.61.1594900555913;
        Thu, 16 Jul 2020 04:55:55 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (host-87-7-31-173.retail.telecomitalia.it. [87.7.31.173])
        by smtp.googlemail.com with ESMTPSA id a4sm9553060wrg.80.2020.07.16.04.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 04:55:54 -0700 (PDT)
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
Subject: [PATCH v9 1/2] phy: qualcomm: add qcom ipq806x dwc usb phy driver
Date:   Thu, 16 Jul 2020 13:55:45 +0200
Message-Id: <20200716115547.11903-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
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
v9:
* Use device_property_read_u32 and skip compatible check
v8:
* Drop useless init
* Drop invalid copyright
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

 drivers/phy/qualcomm/Kconfig                |  11 +
 drivers/phy/qualcomm/Makefile               |   1 +
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 575 ++++++++++++++++++++
 3 files changed, 587 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index e46824da29f6..c14dabd7f992 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -91,3 +91,14 @@ config PHY_QCOM_USB_HSIC
 	select GENERIC_PHY
 	help
 	  Support for the USB HSIC ULPI compliant PHY on QCOM chipsets.
+
+config PHY_QCOM_IPQ806X_USB
+	tristate "Qualcomm IPQ806x DWC3 USB PHY driver"
+	depends on HAS_IOMEM
+	depends on OF && (ARCH_QCOM || COMPILE_TEST)
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
index 000000000000..c5906ba06fab
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -0,0 +1,575 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
+		dev_err(phy_dwc3->dev, "write: %x to QSCRATCH: %x FAILED\n", val, offset);
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
+	u32 data;
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
+	struct resource *res;
+	resource_size_t size;
+	struct phy *generic_phy;
+	struct usb_phy *phy_dwc3;
+	const struct phy_drvdata *data;
+	const struct of_device_id *match;
+	struct phy_provider *phy_provider;
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
+	if (device_property_read_u32(&pdev->dev, "qcom,rx-eq",
+				     &phy_dwc3->rx_eq))
+		phy_dwc3->rx_eq = SSPHY_RX_EQ_VALUE;
+
+	if (device_property_read_u32(&pdev->dev, "qcom,tx-deamp_3_5db",
+				     &phy_dwc3->tx_deamp_3_5db))
+		phy_dwc3->rx_eq = SSPHY_TX_DEEMPH_3_5DB;
+
+	if (device_property_read_u32(&pdev->dev, "qcom,mpll", &phy_dwc3->mpll))
+		phy_dwc3->mpll = SSPHY_MPLL_VALUE;
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
2.27.0

