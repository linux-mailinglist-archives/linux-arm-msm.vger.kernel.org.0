Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01BE1145BD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2020 19:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728925AbgAVS4V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jan 2020 13:56:21 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:39363 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728900AbgAVS4T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jan 2020 13:56:19 -0500
Received: by mail-wr1-f68.google.com with SMTP id y11so235863wrt.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 10:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FIB8X4KTMSMav9IDv7FsBm+HOZtjyAZ9FH0A+hL6eL0=;
        b=tSD8y1pDo+XjWodwC2nsYEdlSEHcxz9EdMzEFBCZeIj1JRl4LPREqvzmddet9cfIqv
         nsjJFgA0sGztClJY24c5TjSEbUqIuzorBLoLya6YlLt368D8jdeRhBku203RxNJjZ15n
         MDyiiF51yKMsjTsD2r7aUPJi8WyRFllx825/hxElH2ngXyy79yj0upMYnV44awcY9SY7
         41BD0Bj/MmIC2ghlJqoPdObCRUJ68ubKEt5Zwca7O04RJXTRs2J58zem/b1XnP/UyU9Q
         zKs1l+IMwBvM2bEoOZipm7wTRd0acYA2j1J0QP3BNn/OAXsZMBpBGMgNzYwS4TJkCrhP
         MNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FIB8X4KTMSMav9IDv7FsBm+HOZtjyAZ9FH0A+hL6eL0=;
        b=AXj6g+WubO5RXWwAxHoWGi97gkrNdfApfNC4XT7mtWdUXj2xTINJSczH/F5GV2AghP
         uE6ZoTQ7O3TZ1g/lScd2/P9pWBv9GpZ443u7DqjNTut2nLwzQWy/csR5wPnCUwgM7Yh2
         CBqJSHUSWiaYChXd+htB9+LRY2p72AP9RDH/ZDg6l0SrNC6wKsdUFD9ZDBNoF/s/ei2d
         kzP0Bzm31EfKt3jLuIpb7jbkXznjGu1CsmK3HQVQ2ik0VEqn6P+TbmjyH9RCDjTnwCLA
         pQ/9hN3TG8FHFecrSFNhtx++gk0EyWkbrl17TvXfMlOM8ozwaHFTA32tVBkm+5TC4DXL
         XF/Q==
X-Gm-Message-State: APjAAAXDv2NClvjGCgys/EhrY7xSw7sk1ZRBBVzUT5Rev7pvB2XPpPJ7
        BvcazzbzQgNMtGOWCAlAYATqC1G7LqI9/g==
X-Google-Smtp-Source: APXvYqyqEl5qQ6WTdMEaehy5OUnRnRoYXyYl2EhXfopPtwGzUKrgvhDqCocXpvH91tdD+5LWYVVQIw==
X-Received: by 2002:a5d:4692:: with SMTP id u18mr12793396wrq.206.1579719376757;
        Wed, 22 Jan 2020 10:56:16 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id q15sm58590390wrr.11.2020.01.22.10.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 10:56:16 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v3 03/19] phy: qualcomm: Add Synopsys Hi-Speed USB PHY driver
Date:   Wed, 22 Jan 2020 18:55:54 +0000
Message-Id: <20200122185610.131930-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
References: <20200122185610.131930-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Shawn Guo <shawn.guo@linaro.org>

Adds Qualcomm QCS404 Hi-Speed USB PHY driver support. This PHY is usually
is usually paired with Synopsys DWC3 USB controllers on Qualcomm SoCs.

[bod: Updated qcom_snps_hsphy_set_mode to match new method signature
      Added disjunct on mode > 0
      Removed regulator_set_voltage() in favour of setting floor in dts
      Removed 'snps' and '28nm' from driver name]

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/qualcomm/Kconfig                  |  10 +
 drivers/phy/qualcomm/Makefile                 |   1 +
 drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c | 415 ++++++++++++++++++
 3 files changed, 426 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index e46824da29f6..cc3f2bb01ad1 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -91,3 +91,13 @@ config PHY_QCOM_USB_HSIC
 	select GENERIC_PHY
 	help
 	  Support for the USB HSIC ULPI compliant PHY on QCOM chipsets.
+
+config PHY_QCOM_QCS404_USB_HS
+	tristate "Qualcomm QCS404 Hi-Speed USB PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
+	select GENERIC_PHY
+	help
+	  Enable this to support the Qualcomm QCS404 USB Hi-Speed PHY driver.
+	  This driver supports the Hi-Speed PHY which is usually paired with
+	  either the ChipIdea or Synopsys DWC3 USB IPs on MSM SOCs.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index 283251d6a5d9..a4a3b21240fa 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_PHY_QCOM_UFS_14NM)		+= phy-qcom-ufs-qmp-14nm.o
 obj-$(CONFIG_PHY_QCOM_UFS_20NM)		+= phy-qcom-ufs-qmp-20nm.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
+obj-$(CONFIG_PHY_QCOM_QCS404_USB_HS)	+= phy-qcom-qcs404-usb-hs.o
diff --git a/drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c b/drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c
new file mode 100644
index 000000000000..0ea7c32941dd
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-qcs404-usb-hs.c
@@ -0,0 +1,415 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2009-2018, Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2020, Linaro Limited
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+/* PHY register and bit definitions */
+#define PHY_CTRL_COMMON0		0x078
+#define SIDDQ				BIT(2)
+#define PHY_IRQ_CMD			0x0d0
+#define PHY_INTR_MASK0			0x0d4
+#define PHY_INTR_CLEAR0			0x0dc
+#define DPDM_MASK			0x1e
+#define DP_1_0				BIT(4)
+#define DP_0_1				BIT(3)
+#define DM_1_0				BIT(2)
+#define DM_0_1				BIT(1)
+
+enum hsphy_voltage {
+	VOL_NONE,
+	VOL_MIN,
+	VOL_MAX,
+	VOL_NUM,
+};
+
+enum hsphy_vreg {
+	VDD,
+	VDDA_1P8,
+	VDDA_3P3,
+	VREG_NUM,
+};
+
+struct hsphy_init_seq {
+	int offset;
+	int val;
+	int delay;
+};
+
+struct hsphy_data {
+	const struct hsphy_init_seq *init_seq;
+	unsigned int init_seq_num;
+};
+
+struct hsphy_priv {
+	void __iomem *base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	struct reset_control *phy_reset;
+	struct reset_control *por_reset;
+	struct regulator_bulk_data vregs[VREG_NUM];
+	const struct hsphy_data *data;
+	enum phy_mode mode;
+};
+
+static int qcom_snps_hsphy_set_mode(struct phy *phy, enum phy_mode mode,
+				    int submode)
+{
+	struct hsphy_priv *priv = phy_get_drvdata(phy);
+
+	priv->mode = PHY_MODE_INVALID;
+
+	if (mode > 0)
+		priv->mode = mode;
+
+	return 0;
+}
+
+static void qcom_snps_hsphy_enable_hv_interrupts(struct hsphy_priv *priv)
+{
+	u32 val;
+
+	/* Clear any existing interrupts before enabling the interrupts */
+	val = readb(priv->base + PHY_INTR_CLEAR0);
+	val |= DPDM_MASK;
+	writeb(val, priv->base + PHY_INTR_CLEAR0);
+
+	writeb(0x0, priv->base + PHY_IRQ_CMD);
+	usleep_range(200, 220);
+	writeb(0x1, priv->base + PHY_IRQ_CMD);
+
+	/* Make sure the interrupts are cleared */
+	usleep_range(200, 220);
+
+	val = readb(priv->base + PHY_INTR_MASK0);
+	switch (priv->mode) {
+	case PHY_MODE_USB_HOST_HS:
+	case PHY_MODE_USB_HOST_FS:
+	case PHY_MODE_USB_DEVICE_HS:
+	case PHY_MODE_USB_DEVICE_FS:
+		val |= DP_1_0 | DM_0_1;
+		break;
+	case PHY_MODE_USB_HOST_LS:
+	case PHY_MODE_USB_DEVICE_LS:
+		val |= DP_0_1 | DM_1_0;
+		break;
+	default:
+		/* No device connected */
+		val |= DP_0_1 | DM_0_1;
+		break;
+	}
+	writeb(val, priv->base + PHY_INTR_MASK0);
+}
+
+static void qcom_snps_hsphy_disable_hv_interrupts(struct hsphy_priv *priv)
+{
+	u32 val;
+
+	val = readb(priv->base + PHY_INTR_MASK0);
+	val &= ~DPDM_MASK;
+	writeb(val, priv->base + PHY_INTR_MASK0);
+
+	/* Clear any pending interrupts */
+	val = readb(priv->base + PHY_INTR_CLEAR0);
+	val |= DPDM_MASK;
+	writeb(val, priv->base + PHY_INTR_CLEAR0);
+
+	writeb(0x0, priv->base + PHY_IRQ_CMD);
+	usleep_range(200, 220);
+
+	writeb(0x1, priv->base + PHY_IRQ_CMD);
+	usleep_range(200, 220);
+}
+
+static void qcom_snps_hsphy_enter_retention(struct hsphy_priv *priv)
+{
+	u32 val;
+
+	val = readb(priv->base + PHY_CTRL_COMMON0);
+	val |= SIDDQ;
+	writeb(val, priv->base + PHY_CTRL_COMMON0);
+}
+
+static void qcom_snps_hsphy_exit_retention(struct hsphy_priv *priv)
+{
+	u32 val;
+
+	val = readb(priv->base + PHY_CTRL_COMMON0);
+	val &= ~SIDDQ;
+	writeb(val, priv->base + PHY_CTRL_COMMON0);
+}
+
+static int qcom_snps_hsphy_power_on(struct phy *phy)
+{
+	struct hsphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = regulator_bulk_enable(VREG_NUM, priv->vregs);
+	if (ret)
+		return ret;
+	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
+	if (ret)
+		goto err_disable_regulator;
+	qcom_snps_hsphy_disable_hv_interrupts(priv);
+	qcom_snps_hsphy_exit_retention(priv);
+
+	return 0;
+
+err_disable_regulator:
+	regulator_bulk_disable(VREG_NUM, priv->vregs);
+
+	return ret;
+}
+
+static int qcom_snps_hsphy_power_off(struct phy *phy)
+{
+	struct hsphy_priv *priv = phy_get_drvdata(phy);
+
+	qcom_snps_hsphy_enter_retention(priv);
+	qcom_snps_hsphy_enable_hv_interrupts(priv);
+	clk_bulk_disable_unprepare(priv->num_clks, priv->clks);
+	regulator_bulk_disable(VREG_NUM, priv->vregs);
+
+	return 0;
+}
+
+static int qcom_snps_hsphy_reset(struct hsphy_priv *priv)
+{
+	int ret;
+
+	ret = reset_control_assert(priv->phy_reset);
+	if (ret)
+		return ret;
+
+	usleep_range(10, 15);
+
+	ret = reset_control_deassert(priv->phy_reset);
+	if (ret)
+		return ret;
+
+	usleep_range(80, 100);
+
+	return 0;
+}
+
+static void qcom_snps_hsphy_init_sequence(struct hsphy_priv *priv)
+{
+	const struct hsphy_data *data = priv->data;
+	const struct hsphy_init_seq *seq;
+	int i;
+
+	/* Device match data is optional. */
+	if (!data)
+		return;
+
+	seq = data->init_seq;
+
+	for (i = 0; i < data->init_seq_num; i++, seq++) {
+		writeb(seq->val, priv->base + seq->offset);
+		if (seq->delay)
+			usleep_range(seq->delay, seq->delay + 10);
+	}
+}
+
+static int qcom_snps_hsphy_por_reset(struct hsphy_priv *priv)
+{
+	int ret;
+
+	ret = reset_control_assert(priv->por_reset);
+	if (ret)
+		return ret;
+
+	/*
+	 * The Femto PHY is POR reset in the following scenarios.
+	 *
+	 * 1. After overriding the parameter registers.
+	 * 2. Low power mode exit from PHY retention.
+	 *
+	 * Ensure that SIDDQ is cleared before bringing the PHY
+	 * out of reset.
+	 */
+	qcom_snps_hsphy_exit_retention(priv);
+
+	/*
+	 * As per databook, 10 usec delay is required between
+	 * PHY POR assert and de-assert.
+	 */
+	usleep_range(10, 20);
+	ret = reset_control_deassert(priv->por_reset);
+	if (ret)
+		return ret;
+
+	/*
+	 * As per databook, it takes 75 usec for PHY to stabilize
+	 * after the reset.
+	 */
+	usleep_range(80, 100);
+
+	return 0;
+}
+
+static int qcom_snps_hsphy_init(struct phy *phy)
+{
+	struct hsphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = qcom_snps_hsphy_reset(priv);
+	if (ret)
+		return ret;
+
+	qcom_snps_hsphy_init_sequence(priv);
+
+	ret = qcom_snps_hsphy_por_reset(priv);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static const struct phy_ops qcom_snps_hsphy_ops = {
+	.init = qcom_snps_hsphy_init,
+	.power_on = qcom_snps_hsphy_power_on,
+	.power_off = qcom_snps_hsphy_power_off,
+	.set_mode = qcom_snps_hsphy_set_mode,
+	.owner = THIS_MODULE,
+};
+
+static const char * const qcom_snps_hsphy_clks[] = {
+	"ref",
+	"phy",
+	"sleep",
+};
+
+static int qcom_snps_hsphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct hsphy_priv *priv;
+	struct phy *phy;
+	int ret;
+	int i;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	priv->num_clks = ARRAY_SIZE(qcom_snps_hsphy_clks);
+	priv->clks = devm_kcalloc(dev, priv->num_clks, sizeof(*priv->clks),
+				  GFP_KERNEL);
+	if (!priv->clks)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->num_clks; i++)
+		priv->clks[i].id = qcom_snps_hsphy_clks[i];
+
+	ret = devm_clk_bulk_get(dev, priv->num_clks, priv->clks);
+	if (ret)
+		return ret;
+
+	priv->phy_reset = devm_reset_control_get_exclusive(dev, "phy");
+	if (IS_ERR(priv->phy_reset))
+		return PTR_ERR(priv->phy_reset);
+
+	priv->por_reset = devm_reset_control_get_exclusive(dev, "por");
+	if (IS_ERR(priv->por_reset))
+		return PTR_ERR(priv->por_reset);
+
+	priv->vregs[VDD].supply = "vdd";
+	priv->vregs[VDDA_1P8].supply = "vdda1p8";
+	priv->vregs[VDDA_3P3].supply = "vdda3p3";
+
+	ret = devm_regulator_bulk_get(dev, VREG_NUM, priv->vregs);
+	if (ret)
+		return ret;
+
+	/* Get device match data */
+	priv->data = device_get_match_data(dev);
+
+	phy = devm_phy_create(dev, dev->of_node, &qcom_snps_hsphy_ops);
+	if (IS_ERR(phy))
+		return PTR_ERR(phy);
+
+	phy_set_drvdata(phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+	if (IS_ERR(provider))
+		return PTR_ERR(provider);
+
+	ret = regulator_set_load(priv->vregs[VDDA_1P8].consumer, 19000);
+	if (ret < 0)
+		return ret;
+
+	ret = regulator_set_load(priv->vregs[VDDA_3P3].consumer, 16000);
+	if (ret < 0)
+		goto unset_1p8_load;
+
+	return 0;
+
+unset_1p8_load:
+	regulator_set_load(priv->vregs[VDDA_1P8].consumer, 0);
+
+	return ret;
+}
+
+/*
+ * The macro is used to define an initialization sequence.  Each tuple
+ * is meant to program 'value' into phy register at 'offset' with 'delay'
+ * in us followed.
+ */
+#define HSPHY_INIT_CFG(o, v, d)	{ .offset = o, .val = v, .delay = d, }
+
+static const struct hsphy_init_seq init_seq_qcs404[] = {
+	HSPHY_INIT_CFG(0xc0, 0x01, 0),
+	HSPHY_INIT_CFG(0xe8, 0x0d, 0),
+	HSPHY_INIT_CFG(0x74, 0x12, 0),
+	HSPHY_INIT_CFG(0x98, 0x63, 0),
+	HSPHY_INIT_CFG(0x9c, 0x03, 0),
+	HSPHY_INIT_CFG(0xa0, 0x1d, 0),
+	HSPHY_INIT_CFG(0xa4, 0x03, 0),
+	HSPHY_INIT_CFG(0x8c, 0x23, 0),
+	HSPHY_INIT_CFG(0x78, 0x08, 0),
+	HSPHY_INIT_CFG(0x7c, 0xdc, 0),
+	HSPHY_INIT_CFG(0x90, 0xe0, 20),
+	HSPHY_INIT_CFG(0x74, 0x10, 0),
+	HSPHY_INIT_CFG(0x90, 0x60, 0),
+};
+
+static const struct hsphy_data hsphy_data_qcs404 = {
+	.init_seq = init_seq_qcs404,
+	.init_seq_num = ARRAY_SIZE(init_seq_qcs404),
+};
+
+static const struct of_device_id qcom_snps_hsphy_match[] = {
+	{ .compatible = "qcom,qcs404-usb-hsphy", .data = &hsphy_data_qcs404, },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_match);
+
+static struct platform_driver qcom_snps_hsphy_driver = {
+	.probe = qcom_snps_hsphy_probe,
+	.driver	= {
+		.name = "qcom-qcs404-usb-hsphy",
+		.of_match_table = qcom_snps_hsphy_match,
+	},
+};
+module_platform_driver(qcom_snps_hsphy_driver);
+
+MODULE_DESCRIPTION("Qualcomm QCS404 Hi-Speed USB PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.0

