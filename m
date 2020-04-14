Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5B581A7151
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 04:58:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404295AbgDNC4U (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 22:56:20 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:51914 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404250AbgDNCze (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 22:55:34 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 13 Apr 2020 19:55:33 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg03-sd.qualcomm.com with ESMTP; 13 Apr 2020 19:55:29 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 698B5216B5; Tue, 14 Apr 2020 08:25:24 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH V3 5/8] clk: qcom: Add ipq apss clock controller
Date:   Tue, 14 Apr 2020 08:25:19 +0530
Message-Id: <1586832922-29191-6-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org>
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The CPU on Qualcomm's IPQ platform devices are clocked primarily by a
PLL and xo which are connected to a mux and enable block, This patch adds
support for the mux and the enable.

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/clk/qcom/Kconfig    |  10 +++++
 drivers/clk/qcom/Makefile   |   1 +
 drivers/clk/qcom/apss-ipq.c | 107 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 118 insertions(+)
 create mode 100644 drivers/clk/qcom/apss-ipq.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 15cdcdc..8573f2e 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -89,6 +89,16 @@ config APQ_MMCC_8084
 	  Say Y if you want to support multimedia devices such as display,
 	  graphics, video encode/decode, camera, etc.
 
+config IPQ_APSS
+	tristate "IPQ APSS Clock Controller"
+	default N
+	help
+	  Support for APSS clock controller on ipq platform devices. The
+	  APSS clock controller manages the Mux and enable block that feeds the
+	  CPUs.
+	  Say Y if you want to support CPU frequency scaling on
+	  ipq based devices.
+
 config IPQ_GCC_4019
 	tristate "IPQ4019 Global Clock Controller"
 	help
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 656a87e..1e4b296 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -19,6 +19,7 @@ clk-qcom-$(CONFIG_QCOM_GDSC) += gdsc.o
 # Keep alphabetically sorted by config
 obj-$(CONFIG_APQ_GCC_8084) += gcc-apq8084.o
 obj-$(CONFIG_APQ_MMCC_8084) += mmcc-apq8084.o
+obj-$(CONFIG_IPQ_APSS) += apss-ipq.o
 obj-$(CONFIG_IPQ_GCC_4019) += gcc-ipq4019.o
 obj-$(CONFIG_IPQ_GCC_6018) += gcc-ipq6018.o
 obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
diff --git a/drivers/clk/qcom/apss-ipq.c b/drivers/clk/qcom/apss-ipq.c
new file mode 100644
index 0000000..a37cd98
--- /dev/null
+++ b/drivers/clk/qcom/apss-ipq.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/kernel.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/clk-provider.h>
+#include <linux/regmap.h>
+#include <linux/module.h>
+
+#include <dt-bindings/clock/qcom,apss-ipq.h>
+
+#include "common.h"
+#include "clk-regmap.h"
+#include "clk-branch.h"
+#include "clk-alpha-pll.h"
+#include "clk-regmap-mux.h"
+
+enum {
+	P_XO,
+	P_APSS_PLL_EARLY,
+};
+
+static const struct clk_parent_data parents_apcs_alias0_clk_src[] = {
+	{ .fw_name = "xo" },
+	{ .fw_name = "pll" },
+};
+
+static const struct parent_map parents_apcs_alias0_clk_src_map[] = {
+	{ P_XO, 0 },
+	{ P_APSS_PLL_EARLY, 5 },
+};
+
+static struct clk_regmap_mux apcs_alias0_clk_src = {
+	.reg = 0x0050,
+	.width = 3,
+	.shift = 7,
+	.parent_map = parents_apcs_alias0_clk_src_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "apcs_alias0_clk_src",
+		.parent_data = parents_apcs_alias0_clk_src,
+		.num_parents = 2,
+		.ops = &clk_regmap_mux_closest_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+/*required for cpufreq*/
+static struct clk_branch apcs_alias0_core_clk = {
+	.halt_reg = 0x0058,
+	.clkr = {
+		.enable_reg = 0x0058,
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
+static const struct regmap_config apss_ipq_regmap_config = {
+	.reg_bits       = 32,
+	.reg_stride     = 4,
+	.val_bits       = 32,
+	.max_register   = 0x1000,
+	.fast_io        = true,
+};
+
+static struct clk_regmap *apss_ipq_clks[] = {
+	[APCS_ALIAS0_CLK_SRC] = &apcs_alias0_clk_src.clkr,
+	[APCS_ALIAS0_CORE_CLK] = &apcs_alias0_core_clk.clkr,
+};
+
+static const struct qcom_cc_desc apss_ipq_desc = {
+	.config = &apss_ipq_regmap_config,
+	.clks = apss_ipq_clks,
+	.num_clks = ARRAY_SIZE(apss_ipq_clks),
+};
+
+static int apss_ipq_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+
+	regmap = dev_get_regmap(pdev->dev.parent, NULL);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	return qcom_cc_really_probe(pdev, &apss_ipq_desc, regmap);
+}
+
+static struct platform_driver apss_ipq_driver = {
+	.probe = apss_ipq_probe,
+	.driver = {
+		.name   = "qcom,apss-ipq-clk",
+	},
+};
+
+module_platform_driver(apss_ipq_driver);
+
+MODULE_DESCRIPTION("QCOM APSS IPQ CLK Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.7.4

