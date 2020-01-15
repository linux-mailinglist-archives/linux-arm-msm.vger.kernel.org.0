Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA79213C57A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jan 2020 15:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726553AbgAOOOx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jan 2020 09:14:53 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34798 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729765AbgAOONP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jan 2020 09:13:15 -0500
Received: by mail-wr1-f67.google.com with SMTP id t2so15912025wrr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2020 06:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hkLW9376kNaAP2cCZzPr5DVWx2pUMEC0uQ4FLFt5LZQ=;
        b=BJ0Nmqok8hUc8auHcKInFCKanEh5yXgv+oFFu6tG/s9JmAoQ9+EDkziAcBHfixfKRl
         xoLEswjtvif04RRbIdnukoaItdfGjJHB5Ss8DPFor8lj/oeOmN2i465ouZh9jV1l5Thr
         wPBPht6X5QamhHCScSys+/0YVYLKdPbmTtrBHiw7I/YWckKQN4lG1+NqmiI6U4q4gGdc
         CJIWRH8jWWH71Vuv8LKVyTfN0qTjcfL9prJnPscyUt+pJ18HCL8rpq+IdTDdewwYchqa
         EBQ560+6ctFDUFytN6ChtNHVcT52zYSJjFU0lW1FU+9ccKuNNzZyTrRK2ayjuNiy8BAs
         tAHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hkLW9376kNaAP2cCZzPr5DVWx2pUMEC0uQ4FLFt5LZQ=;
        b=Zz7Pfhujm3NsFocjo92u+kmBf/Omi8YtgLRTRC+a1PXJdT+uGldTIf2Q3UqZE3akyx
         kyjn9t4inbSzAltQo1oaOahGEPSAiAMn+OqLtYTqKLnEjAjp+KMpA+gJiz5bh9E7wvQH
         NsuX5O4RHsyx7QET5HRzrfBzldI7V/xSkGxUFdeqYkzrBVFypF4BRLYHN/UcPkKlBT8W
         hViywdFgs8w+YOCS/a6fsx+75B9RVYvNdI042NqC8I6SgK6RAK0B+G019TsuSCXgaWbK
         1y1SPynbSCJ28m1lQ9zFnymi3z+Ti1mylxEDnO/bwJ4gCQLzpVCZuiSNMaAZT0md8WCr
         +QtQ==
X-Gm-Message-State: APjAAAUk8nzOLbnKn8s/WVMRoMD2QzJmwMbaFGTIfFFHTOTEf8OVWsyv
        b4FYTfNHHb0nrMatYRyx/VoAKpW9dsg=
X-Google-Smtp-Source: APXvYqwbP21Tcnjjnh60DPljSutLNPdzleh4vLa6R5vpDk4janWSNyPS/+yWOuLYFSDEGvN8rbS/UQ==
X-Received: by 2002:a5d:6a8e:: with SMTP id s14mr32359236wru.150.1579097591920;
        Wed, 15 Jan 2020 06:13:11 -0800 (PST)
Received: from localhost.localdomain ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id m21sm23730720wmi.27.2020.01.15.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2020 06:13:11 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        gregkh@linuxfoundation.org, jackp@codeaurora.org, balbi@kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>,
        Sriharsha Allenki's <sallenki@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH 05/19] phy: qualcomm: usb: Add SuperSpeed PHY driver
Date:   Wed, 15 Jan 2020 14:13:19 +0000
Message-Id: <20200115141333.1222676-6-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
References: <20200115141333.1222676-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Controls Qualcomm's SS phy 1.0.0 implemented in the QCS404 and some
other Qualcomm platforms.

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
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/phy/qualcomm/Kconfig           |  11 ++
 drivers/phy/qualcomm/Makefile          |   1 +
 drivers/phy/qualcomm/phy-qcom-usb-ss.c | 246 +++++++++++++++++++++++++
 3 files changed, 258 insertions(+)
 create mode 100644 drivers/phy/qualcomm/phy-qcom-usb-ss.c

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index cc3f2bb01ad1..d95602ec6515 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -101,3 +101,14 @@ config PHY_QCOM_QCS404_USB_HS
 	  Enable this to support the Qualcomm QCS404 USB Hi-Speed PHY driver.
 	  This driver supports the Hi-Speed PHY which is usually paired with
 	  either the ChipIdea or Synopsys DWC3 USB IPs on MSM SOCs.
+
+config PHY_QCOM_USB_SS
+	tristate "Qualcomm USB SS PHY driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on EXTCON || !EXTCON # if EXTCON=m, this cannot be built-in
+	select GENERIC_PHY
+	help
+	  Enable this to support the Super-Speed USB transceiver on Qualcomm
+	  chips. This driver supports the PHY which uses the QSCRATCH-based
+	  register set for its control sequences, normally paired with newer
+	  DWC3-based Super-Speed controllers on Qualcomm SoCs.
diff --git a/drivers/phy/qualcomm/Makefile b/drivers/phy/qualcomm/Makefile
index a4a3b21240fa..e8c7137cdbed 100644
--- a/drivers/phy/qualcomm/Makefile
+++ b/drivers/phy/qualcomm/Makefile
@@ -11,3 +11,4 @@ obj-$(CONFIG_PHY_QCOM_UFS_20NM)		+= phy-qcom-ufs-qmp-20nm.o
 obj-$(CONFIG_PHY_QCOM_USB_HS) 		+= phy-qcom-usb-hs.o
 obj-$(CONFIG_PHY_QCOM_USB_HSIC) 	+= phy-qcom-usb-hsic.o
 obj-$(CONFIG_PHY_QCOM_QCS404_USB_HS)	+= phy-qcom-qcs404-usb-hs.o
+obj-$(CONFIG_PHY_QCOM_USB_SS)		+= phy-qcom-usb-ss.o
diff --git a/drivers/phy/qualcomm/phy-qcom-usb-ss.c b/drivers/phy/qualcomm/phy-qcom-usb-ss.c
new file mode 100644
index 000000000000..109e455cb509
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
+#define NUM_BULK_CLKS	3
+#define NUM_BULK_REGS	2
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
+	priv->clks[1].id = "phy";
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
+	priv->reset_com = devm_reset_control_get_optional(priv->dev, "com");
+	if (IS_ERR(priv->reset_com)) {
+		dev_err(priv->dev, "Failed to get reset control com\n");
+		return PTR_ERR(priv->reset_com);
+	}
+
+	if (priv->reset_com) {
+		/* if reset_com is present, reset_phy is no longer optional */
+		priv->reset_phy = devm_reset_control_get(priv->dev, "phy");
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
+	{ .compatible = "qcom,usb-ssphy", },
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
2.24.0

