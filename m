Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 246C9171479
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 10:55:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgB0Jz3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 04:55:29 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:52167 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728454AbgB0Jz2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 04:55:28 -0500
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 27 Feb 2020 01:55:27 -0800
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 27 Feb 2020 01:55:24 -0800
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id B9CBA2150A; Thu, 27 Feb 2020 15:25:22 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sivaprak@codeaurora.org
Subject: [PATCH 2/2] clk: qcom: Add ipq6018 apss clock controller
Date:   Thu, 27 Feb 2020 15:25:18 +0530
Message-Id: <1582797318-26288-3-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the support for apss clock controller found on ipq6018
devices.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/clk/qcom/Kconfig        |   8 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/apss-ipq6018.c | 210 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 219 insertions(+)
 create mode 100644 drivers/clk/qcom/apss-ipq6018.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 15cdcdc..37e4ce2 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -89,6 +89,14 @@ config APQ_MMCC_8084
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
 
+config IPQ_APSS_6018
+	tristate "IPQ6018 APSS Clock Controller"
+	select IPQ_GCC_6018
+	help
+	  Support for APSS clock controller on ipq6018 devices. The
+	  APSS clock controller supports frequencies higher than 800Mhz.
+	  Say Y if you want to support higher frequencies on ipq6018 devices.
+
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 656a87e..2b61715 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -19,6 +19,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 # Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
+obj-$(CONFIG_IPQ_APSS_6018) += apss-ipq6018.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
 obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
 obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
new file mode 100644
index 0000000..04b8962
--- /dev/null
+++ b/drivers/clk/qcom/apss-ipq6018.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+
+#include <linux/reset-controller.h>
+#include <dt-bindings/clock/qcom,apss-ipq6018.h>
+
+#include "common.h"
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-branch.h"
+#include "clk-alpha-pll.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "reset.h"
+
+#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
+
+enum {
+	P_XO,
+	P_GPLL0,
+	P_GPLL2,
+	P_GPLL4,
+	P_APSS_PLL_EARLY,
+	P_APSS_PLL
+};
+
+const u8 apss_pll_offsets[] = {
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
+static struct clk_alpha_pll apss_pll_early = {
+	.offset = 0x4ff4,
+	.regs = apss_pll_offsets,
+	.flags = SUPPORTS_DYNAMIC_UPDATE,
+	.clkr = {
+		.enable_reg = 0x4ff4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "apss_pll_early",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "xo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_huayra_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll_postdiv apss_pll = {
+	.offset = 0x4ff4,
+	.regs = apss_pll_offsets,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "apss_pll",
+		.parent_hws = (const struct clk_hw *[]){
+					&apss_pll_early.clkr.hw },
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_ro_ops,
+	},
+};
+
+static const struct clk_parent_data parents_apcs_alias0_clk_src[] = {
+	{ .fw_name = "xo" },
+	{ .fw_name = "gpll0"},
+	{ .fw_name = "gpll2"},
+	{ .fw_name = "gpll4"},
+	{ .hw = &apss_pll.clkr.hw },
+	{ .hw = &apss_pll_early.clkr.hw },
+};
+
+static const struct parent_map parents_apcs_alias0_clk_src_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 4 },
+	{ P_GPLL2, 2 },
+	{ P_GPLL4, 1 },
+	{ P_APSS_PLL, 3 },
+	{ P_APSS_PLL_EARLY, 5 },
+};
+
+static const struct freq_tbl ftbl_apcs_alias0_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(864000000, P_APSS_PLL_EARLY, 1, 0, 0),
+	F(1056000000, P_APSS_PLL_EARLY, 1, 0, 0),
+	F(1200000000, P_APSS_PLL_EARLY, 1, 0, 0),
+	F(1320000000, P_APSS_PLL_EARLY, 1, 0, 0),
+	F(1440000000, P_APSS_PLL_EARLY, 1, 0, 0),
+	F(1608000000, P_APSS_PLL_EARLY, 1, 0, 0),
+	F(1800000000, P_APSS_PLL_EARLY, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 apcs_alias0_clk_src = {
+	.cmd_rcgr = 0x0044,
+	.freq_tbl = ftbl_apcs_alias0_clk_src,
+	.hid_width = 5,
+	.parent_map = parents_apcs_alias0_clk_src_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "apcs_alias0_clk_src",
+		.parent_data = parents_apcs_alias0_clk_src,
+		.num_parents = 6,
+		.ops = &clk_rcg2_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_branch apcs_alias0_core_clk = {
+	.halt_reg = 0x004c,
+	.clkr = {
+		.enable_reg = 0x004c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "apcs_alias0_core_clk",
+			.parent_hws = (const struct clk_hw *[]){
+				&apcs_alias0_clk_src.clkr.hw },
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *apss_ipq6018_clks[] = {
+	[APSS_PLL_EARLY] = &apss_pll_early.clkr,
+	[APSS_PLL] = &apss_pll.clkr,
+	[APCS_ALIAS0_CLK_SRC] = &apcs_alias0_clk_src.clkr,
+	[APCS_ALIAS0_CORE_CLK] = &apcs_alias0_core_clk.clkr,
+};
+
+static const struct alpha_pll_config apss_pll_config = {
+	.l = 0x37,
+	.config_ctl_val = 0x04141200,
+	.config_ctl_hi_val = 0x0,
+	.early_output_mask = BIT(3),
+	.main_output_mask = BIT(0),
+};
+
+static const struct of_device_id apss_ipq6018_match_table[] = {
+	{ .compatible = "qcom,apss-ipq6018" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, apss_ipq6018_match_table);
+
+static const struct regmap_config apss_ipq6018_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register   = 0x5ffc,
+	.fast_io        = true,
+};
+
+static const struct qcom_cc_desc apss_ipq6018_desc = {
+	.config = &apss_ipq6018_regmap_config,
+	.clks = apss_ipq6018_clks,
+	.num_clks = ARRAY_SIZE(apss_ipq6018_clks),
+};
+
+static int apss_ipq6018_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = qcom_cc_map(pdev, &apss_ipq6018_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_alpha_pll_configure(&apss_pll_early, regmap, &apss_pll_config);
+
+	return qcom_cc_really_probe(pdev, &apss_ipq6018_desc, regmap);
+}
+
+static struct platform_driver apss_ipq6018_driver = {
+	.probe = apss_ipq6018_probe,
+	.driver = {
+		.name   = "qcom,apss-ipq6018",
+		.of_match_table = apss_ipq6018_match_table,
+	},
+};
+
+static int __init apss_ipq6018_init(void)
+{
+	return platform_driver_register(&apss_ipq6018_driver);
+}
+core_initcall(apss_ipq6018_init);
+
+static void __exit apss_ipq6018_exit(void)
+{
+	platform_driver_unregister(&apss_ipq6018_driver);
+}
+module_exit(apss_ipq6018_exit);
+
+MODULE_DESCRIPTION("QCA APSS IPQ6018 Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

