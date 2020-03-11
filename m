Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B2BF1821B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2020 20:14:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731113AbgCKTOQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Mar 2020 15:14:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37965 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731123AbgCKTOJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Mar 2020 15:14:09 -0400
Received: by mail-wm1-f68.google.com with SMTP id n2so3395442wmc.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 12:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KJ8pyUFNVfAAPsA5IqEGNlFaiQhnm267Cj5yjO4ggQM=;
        b=Q5IO7jmxJuuKfQcRwsjcZfdS+3HWdI/qftDW8SWNdwA8NXFFlaFJjPJdIT3q1L7XUy
         pxgttXf36s2UrRuvDO9bg9TfHFmG68upALHLabanXgSJ5c+cdceC7Oe6/B4pRz4eSQQK
         awsitvGSAE4L6kOgvt8ltZsnpjJ3uMI7uLdK0Sr3lvLTN/fJxK9OrIsCvfD83WeQ6DHA
         xr0La+IShbnZ/8l8cIfltUuH/cz8G+Yhy/KdFkBh0fUpYnIVUFPSVqv2uSzlWJg6s4fF
         R9WsrUTFvX/ZxMnmBqB+rOeuTdiFpFwVqzPAdPdgX0clnwxEbFzYagYVcJZS1kXXJLq7
         mG9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KJ8pyUFNVfAAPsA5IqEGNlFaiQhnm267Cj5yjO4ggQM=;
        b=kz3xGAblcPl5Lo/905Qm7NXtGE74ElGMDWlJ1rffiKs0otVou2u3LThvrWFLBykC4I
         3Zikg2KyB5MIK7Rn6FIfdvWUwsjHvLnAaJlNwRvgX7NsuETdNP0IghPqyHbRknACWCB9
         ex2W9uckqzWREn3iyFjINBf2/oa5lNLtShvRPwvg4OTlg5LaZs6czxeH9Ev4LbGrGTcE
         te0sRouYSrVUyX4pCNX+Cypq1AHgbFfeDcn0y3bmbw+sN/nW6BML5KBgMr6LsRsSv9qh
         U7aS6iZoDl4aWUEJkaR2tKwfIhUyQWkVvBy4Mlc+kUoIzhfcLRm9y/3WUwWKlkK217+9
         J9cQ==
X-Gm-Message-State: ANhLgQ1JFkV0LYhZayH8OM+5u80o7qgUwcmLg+GAcnJeWobvO0lBSeq2
        YM6dPaHZqxtgJkDtJHCvshsqEg==
X-Google-Smtp-Source: ADFU+vs025imCI+nzJY9mJGdjpRPDkFlc+v6Mg53Kz/G7ojZlRnhfOyOBg/gKSvBrOzjTZ0ELfdW8g==
X-Received: by 2002:a1c:c3c3:: with SMTP id t186mr244481wmf.118.1583954045957;
        Wed, 11 Mar 2020 12:14:05 -0700 (PDT)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id v8sm69443919wrw.2.2020.03.11.12.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 12:14:05 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     kishon@ti.com
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jackp@codeaurora.org,
        robh@kernel.org, bjorn.andersson@linaro.org,
        p.zabel@pengutronix.de,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sriharsha Allenki's <sallenki@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 5/5] phy: qualcomm: usb: Add SuperSpeed PHY driver
Date:   Wed, 11 Mar 2020 19:13:58 +0000
Message-Id: <20200311191358.8102-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311191358.8102-1-bryan.odonoghue@linaro.org>
References: <20200311191358.8102-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Controls Qualcomm's SS PHY 1.0.0 implemented on various SoCs on both the
20nm and 28nm process nodes.

Based on Sriharsha Allenki's <sallenki@codeaurora.org> original code.

[bod: Removed dependency on extcon.
      Switched to gpio-usb-conn to handle VBUS On/Off
      Switched to usb-role-switch to bind gpio-usb-conn to DWC3]
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Cc: Sriharsha Allenki's <sallenki@codeaurora.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/qualcomm/Kconfig           |   9 +
 drivers/phy/qualcomm/Makefile          |   1 +
 drivers/phy/qualcomm/phy-qcom-usb-ss.c | 246 +++++++++++++++++++++++++
 3 files changed, 256 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 9c56a7216f72..98674ed094d9 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -102,3 +102,12 @@ config PHY_QCOM_USB_HS_28NM
 	  High-Speed PHY driver. This driver supports the Hi-Speed PHY which
 	  is usually paired with either the ChipIdea or Synopsys DWC3 USB
 	  IPs on MSM SOCs.
+
+config PHY_QCOM_USB_SS
+	tristate "Qualcomm USB Super-Speed PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
+	select GENERIC_PHY
+	help
+	  Enable this to support the Super-Speed USB transceiver on various
+	  Qualcomm chipsets.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index a4dab5329de0..1f14aeacbd70 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_PHY_QCOM_UFS_20NM)		+= phy-qcom-ufs-qmp-20nm.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
 obj-$(CONFIG_PHY_QCOM_USB_HS_28NM)	+= phy-qcom-usb-hs-28nm.o
+obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-ss.c b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
new file mode 100644
index 000000000000..a3a6d3ce7ea1
--- /dev/null
+++ b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
@@ -0,0 +1,246 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2012-2014,2017 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2020, Linaro Limited
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/reset.h>
+#include <linux/slab.h>
+
+#define PHY_CTRL0			0x6C
+#define PHY_CTRL1			0x70
+#define PHY_CTRL2			0x74
+#define PHY_CTRL4			0x7C
+
+/* PHY_CTRL bits */
+#define REF_PHY_EN			BIT(0)
+#define LANE0_PWR_ON			BIT(2)
+#define SWI_PCS_CLK_SEL			BIT(4)
+#define TST_PWR_DOWN			BIT(4)
+#define PHY_RESET			BIT(7)
+
+#define NUM_BULK_CLKS			3
+#define NUM_BULK_REGS			2
+
+struct ssphy_priv {
+	void __iomem *base;
+	struct device *dev;
+	struct reset_control *reset_com;
+	struct reset_control *reset_phy;
+	struct regulator_bulk_data regs[NUM_BULK_REGS];
+	struct clk_bulk_data clks[NUM_BULK_CLKS];
+	enum phy_mode mode;
+};
+
+static inline void qcom_ssphy_updatel(void __iomem *addr, u32 mask, u32 val)
+{
+	writel((readl(addr) & ~mask) | val, addr);
+}
+
+static int qcom_ssphy_do_reset(struct ssphy_priv *priv)
+{
+	int ret;
+
+	if (!priv->reset_com) {
+		qcom_ssphy_updatel(priv->base + PHY_CTRL1, PHY_RESET,
+				   PHY_RESET);
+		usleep_range(10, 20);
+		qcom_ssphy_updatel(priv->base + PHY_CTRL1, PHY_RESET, 0);
+	} else {
+		ret = reset_control_assert(priv->reset_com);
+		if (ret) {
+			dev_err(priv->dev, "Failed to assert reset com\n");
+			return ret;
+		}
+
+		ret = reset_control_assert(priv->reset_phy);
+		if (ret) {
+			dev_err(priv->dev, "Failed to assert reset phy\n");
+			return ret;
+		}
+
+		usleep_range(10, 20);
+
+		ret = reset_control_deassert(priv->reset_com);
+		if (ret) {
+			dev_err(priv->dev, "Failed to deassert reset com\n");
+			return ret;
+		}
+
+		ret = reset_control_deassert(priv->reset_phy);
+		if (ret) {
+			dev_err(priv->dev, "Failed to deassert reset phy\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int qcom_ssphy_power_on(struct phy *phy)
+{
+	struct ssphy_priv *priv = phy_get_drvdata(phy);
+	int ret;
+
+	ret = regulator_bulk_enable(NUM_BULK_REGS, priv->regs);
+	if (ret)
+		return ret;
+
+	ret = clk_bulk_prepare_enable(NUM_BULK_CLKS, priv->clks);
+	if (ret)
+		goto err_disable_regulator;
+
+	ret = qcom_ssphy_do_reset(priv);
+	if (ret)
+		goto err_disable_clock;
+
+	writeb(SWI_PCS_CLK_SEL, priv->base + PHY_CTRL0);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL4, LANE0_PWR_ON, LANE0_PWR_ON);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL2, REF_PHY_EN, REF_PHY_EN);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL4, TST_PWR_DOWN, 0);
+
+	return 0;
+err_disable_clock:
+	clk_bulk_disable_unprepare(NUM_BULK_CLKS, priv->clks);
+err_disable_regulator:
+	regulator_bulk_disable(NUM_BULK_REGS, priv->regs);
+
+	return ret;
+}
+
+static int qcom_ssphy_power_off(struct phy *phy)
+{
+	struct ssphy_priv *priv = phy_get_drvdata(phy);
+
+	qcom_ssphy_updatel(priv->base + PHY_CTRL4, LANE0_PWR_ON, 0);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL2, REF_PHY_EN, 0);
+	qcom_ssphy_updatel(priv->base + PHY_CTRL4, TST_PWR_DOWN, TST_PWR_DOWN);
+
+	clk_bulk_disable_unprepare(NUM_BULK_CLKS, priv->clks);
+	regulator_bulk_disable(NUM_BULK_REGS, priv->regs);
+
+	return 0;
+}
+
+static int qcom_ssphy_init_clock(struct ssphy_priv *priv)
+{
+	priv->clks[0].id = "ref";
+	priv->clks[1].id = "ahb";
+	priv->clks[2].id = "pipe";
+
+	return devm_clk_bulk_get(priv->dev, NUM_BULK_CLKS, priv->clks);
+}
+
+static int qcom_ssphy_init_regulator(struct ssphy_priv *priv)
+{
+	int ret;
+
+	priv->regs[0].supply = "vdd";
+	priv->regs[1].supply = "vdda1p8";
+	ret = devm_regulator_bulk_get(priv->dev, NUM_BULK_REGS, priv->regs);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(priv->dev, "Failed to get regulators\n");
+		return ret;
+	}
+
+	return ret;
+}
+
+static int qcom_ssphy_init_reset(struct ssphy_priv *priv)
+{
+	priv->reset_com = devm_reset_control_get_optional_exclusive(priv->dev, "com");
+	if (IS_ERR(priv->reset_com)) {
+		dev_err(priv->dev, "Failed to get reset control com\n");
+		return PTR_ERR(priv->reset_com);
+	}
+
+	if (priv->reset_com) {
+		/* if reset_com is present, reset_phy is no longer optional */
+		priv->reset_phy = devm_reset_control_get_exclusive(priv->dev, "phy");
+		if (IS_ERR(priv->reset_phy)) {
+			dev_err(priv->dev, "Failed to get reset control phy\n");
+			return PTR_ERR(priv->reset_phy);
+		}
+	}
+
+	return 0;
+}
+
+static const struct phy_ops qcom_ssphy_ops = {
+	.power_off = qcom_ssphy_power_off,
+	.power_on = qcom_ssphy_power_on,
+	.owner = THIS_MODULE,
+};
+
+static int qcom_ssphy_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct phy_provider *provider;
+	struct ssphy_priv *priv;
+	struct phy *phy;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(struct ssphy_priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+	priv->mode = PHY_MODE_INVALID;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	ret = qcom_ssphy_init_clock(priv);
+	if (ret)
+		return ret;
+
+	ret = qcom_ssphy_init_reset(priv);
+	if (ret)
+		return ret;
+
+	ret = qcom_ssphy_init_regulator(priv);
+	if (ret)
+		return ret;
+
+	phy = devm_phy_create(dev, dev->of_node, &qcom_ssphy_ops);
+	if (IS_ERR(phy)) {
+		dev_err(dev, "Failed to create the SS phy\n");
+		return PTR_ERR(phy);
+	}
+
+	phy_set_drvdata(phy, priv);
+
+	provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
+
+	return PTR_ERR_OR_ZERO(provider);
+}
+
+static const struct of_device_id qcom_ssphy_match[] = {
+	{ .compatible = "qcom,usb-ss-28nm-phy", },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qcom_ssphy_match);
+
+static struct platform_driver qcom_ssphy_driver = {
+	.probe		= qcom_ssphy_probe,
+	.driver = {
+		.name	= "qcom-usb-ssphy",
+		.of_match_table = qcom_ssphy_match,
+	},
+};
+module_platform_driver(qcom_ssphy_driver);
+
+MODULE_DESCRIPTION("Qualcomm SuperSpeed USB PHY driver");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

