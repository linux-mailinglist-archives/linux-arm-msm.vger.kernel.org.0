Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 322411DFE32
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2020 12:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387636AbgEXKE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 24 May 2020 06:04:57 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:53590 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728774AbgEXKE4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 24 May 2020 06:04:56 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 24 May 2020 03:04:55 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg02-sd.qualcomm.com with ESMTP; 24 May 2020 03:04:51 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 6EB47217E7; Sun, 24 May 2020 15:34:49 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH V5 3/8] clk: qcom: Add ipq apss pll driver
Date:   Sun, 24 May 2020 15:34:41 +0530
Message-Id: <1590314686-11749-4-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org>
References: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The CPUs on Qualcomm ipq based devices are clocked by an alpha PLL.
Add support for the apss pll found on ipq based devices which can
support CPU frequencies above 1Ghz.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/clk/qcom/Kconfig        |  8 ++++
 drivers/clk/qcom/Makefile       |  1 +
 drivers/clk/qcom/apss-ipq-pll.c | 97 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 106 insertions(+)
 create mode 100644 drivers/clk/qcom/apss-ipq-pll.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 11ec6f4..e70aa01 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -89,6 +89,14 @@ config APQ_MMCC_8084
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
 
+config IPQ_APSS_PLL
+	tristate "IPQ APSS PLL"
+	help
+	  Support for APSS PLL on ipq devices. The APSS PLL is the main
+	  clock that feeds the CPUs on ipq based devices.
+	  Say Y if you want to support CPU frequency scaling on ipq based
+	  devices.
+
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 691efbf..b4a6ba1 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -19,6 +19,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 # Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
+obj-$(CONFIG_IPQ_APSS_PLL) += apss-ipq-pll.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
 obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
 obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
new file mode 100644
index 0000000..aafdaa7
--- /dev/null
+++ b/drivers/clk/qcom/apss-ipq-pll.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018, The Linux Foundation. All rights reserved.
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+
+#include "clk-alpha-pll.h"
+
+static const u8 ipq_pll_offsets[] = {
+	[PLL_OFF_L_VAL] = 0x08,
+	[PLL_OFF_ALPHA_VAL] = 0x10,
+	[PLL_OFF_USER_CTL] = 0x18,
+	[PLL_OFF_CONFIG_CTL] = 0x20,
+	[PLL_OFF_CONFIG_CTL_U] = 0x24,
+	[PLL_OFF_STATUS] = 0x28,
+	[PLL_OFF_TEST_CTL] = 0x30,
+	[PLL_OFF_TEST_CTL_U] = 0x34,
+};
+
+static struct clk_alpha_pll ipq_pll = {
+	.offset = 0x0,
+	.regs = ipq_pll_offsets,
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.clkr = {
+		.enable_reg = 0x0,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "a53pll",
+			.parent_data = &(const struct clk_parent_data) {
+				.fw_name = "xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_huayra_ops,
+		},
+	},
+};
+
+static const struct alpha_pll_config ipq_pll_config = {
+	.l = 0x37,
+	.config_ctl_val = 0x04141200,
+	.config_ctl_hi_val = 0x0,
+	.early_output_mask = BIT(3),
+	.main_output_mask = BIT(0),
+};
+
+static const struct regmap_config ipq_pll_regmap_config = {
+	.reg_bits		= 32,
+	.reg_stride		= 4,
+	.val_bits		= 32,
+	.max_register		= 0x40,
+	.fast_io		= true,
+};
+
+static int apss_ipq_pll_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+	struct resource *res;
+	void __iomem *base;
+	int ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	base = devm_ioremap_resource(dev, res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	regmap = devm_regmap_init_mmio(&pdev->dev, base,
+						&ipq_pll_regmap_config);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_alpha_pll_configure(&ipq_pll, regmap, &ipq_pll_config);
+
+	ret = devm_clk_register_regmap(dev, &ipq_pll.clkr);
+	if (ret)
+		return ret;
+
+	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get,
+							&ipq_pll.clkr.hw);
+}
+
+static const struct of_device_id apss_ipq_pll_match_table[] = {
+	{ .compatible = "qcom,ipq6018-a53pll" },
+	{ }
+};
+
+static struct platform_driver apss_ipq_pll_driver = {
+	.probe = apss_ipq_pll_probe,
+	.driver = {
+		.name = "qcom-ipq-apss-pll",
+		.of_match_table = apss_ipq_pll_match_table,
+	},
+};
+module_platform_driver(apss_ipq_pll_driver);
+
+MODULE_DESCRIPTION("Qualcomm technology Inc APSS ALPHA PLL Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

