Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B1467FDA6F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727515AbfKOKEp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:04:45 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34246 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfKOKEp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:04:45 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 232FA617A0; Fri, 15 Nov 2019 10:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812282;
        bh=HAq6Fk9zE0SblHC9ZTnDoV3qcOO9tzNLLcEPrGJbcE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f9M37Gh4NGVji5v0u3R9GQthS/Ej4fPZYZcA05FjO/6S4ETU6efGvPxY8aiptAZ19
         NSD6URQr6lZJd4O14ms9OOq4oLSiwaB/qR2J9MuuIlr4NbBXe7RK4NehUd+F140zWp
         TBhw1A+UGeOEb/+0tvo4VSeTGZrV3zln+5MX8Vzo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3234961798;
        Fri, 15 Nov 2019 10:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812276;
        bh=HAq6Fk9zE0SblHC9ZTnDoV3qcOO9tzNLLcEPrGJbcE0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZC1m2yq7SkT3l/PEWUt3MiKmM2dA8FbJZmKQMjhVQcLzBJqZjSg4EkJb4F1RKvF3i
         +YoxAsrBDUqBaWjE7aFkyiaDAf8vdloR6fSdSYAeForkT2SoHabQC5wfM5xLf8THFW
         gcbKue7mXtHm8rC8jmSCrGb10+j/CesJlNMjl5xQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3234961798
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 3/3] clk: qcom: Add display clock controller driver for SC7180
Date:   Fri, 15 Nov 2019 15:34:05 +0530
Message-Id: <1573812245-23827-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573812245-23827-1-git-send-email-tdas@codeaurora.org>
References: <1573812245-23827-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the display clock controller found on SC7180
based devices. This would allow display drivers to probe and
control their clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig         |   9 +
 drivers/clk/qcom/Makefile        |   1 +
 drivers/clk/qcom/dispcc-sc7180.c | 776 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 786 insertions(+)
 create mode 100644 drivers/clk/qcom/dispcc-sc7180.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 8f0ebbc..7d06390 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -237,6 +237,15 @@ config QCS_GCC_404
 	  Say Y if you want to use multimedia devices or peripheral
 	  devices such as UART, SPI, I2C, USB, SD/eMMC, PCIe etc.

+config SC_DISPCC_7180
+	tristate "SC7180 Display Clock Controller"
+	select SC_GCC_7180
+	help
+	  Support for the display clock controller on Qualcomm Technologies, Inc
+	  SC7180 devices.
+	  Say Y if you want to support display devices and functionality such as
+	  splash screen.
+
 config SC_GCC_7180
 	tristate "SC7180 Global Clock Controller"
 	select QCOM_GDSC
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 4cdd08f..ff353d3 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
 obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
+obj-$(CONFIG_SC_DISPCC_7180) += dispcc-sc7180.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
 obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
new file mode 100644
index 0000000..30c1e25
--- /dev/null
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -0,0 +1,776 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,dispcc-sc7180.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_CHIP_SLEEP_CLK,
+	P_CORE_BI_PLL_TEST_SE,
+	P_DISP_CC_PLL0_OUT_EVEN,
+	P_DISP_CC_PLL0_OUT_MAIN,
+	P_DP_PHY_PLL_LINK_CLK,
+	P_DP_PHY_PLL_VCO_DIV_CLK,
+	P_DSI0_PHY_PLL_OUT_BYTECLK,
+	P_DSI0_PHY_PLL_OUT_DSICLK,
+	P_GPLL0_OUT_MAIN,
+};
+
+static const struct pll_vco fabia_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static struct clk_alpha_pll disp_cc_pll0 = {
+	.offset = 0x0,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_disp_cc_pll0_out_even[] = {
+	{ 0x0, 1 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv disp_cc_pll0_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_disp_cc_pll0_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_disp_cc_pll0_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_pll0_out_even",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &disp_cc_pll0.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
+	},
+};
+
+static const struct parent_map disp_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "dp_phy_pll_link_clk", .name = "dp_phy_pll_link_clk" },
+	{ .fw_name = "dp_phy_pll_vco_div_clk",
+				.name = "dp_phy_pll_vco_div_clk"},
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_2[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "dsi0_phy_pll_out_byteclk",
+				.name = "dsi0_phy_pll_out_byteclk" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_3[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
+	{ P_GPLL0_OUT_MAIN, 4 },
+	{ P_DISP_CC_PLL0_OUT_EVEN, 5 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_3[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &disp_cc_pll0.clkr.hw },
+	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .hw = &disp_cc_pll0_out_even.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_4[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPLL0_OUT_MAIN, 4 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_4[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct parent_map disp_cc_parent_map_5[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data disp_cc_parent_data_5[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "dsi0_phy_pll_out_dsiclk",
+				.name = "dsi0_phy_pll_out_dsiclk" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(37500000, P_GPLL0_OUT_MAIN, 16, 0, 0),
+	F(75000000, P_GPLL0_OUT_MAIN, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
+	.cmd_rcgr = 0x22bc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_4,
+	.freq_tbl = ftbl_disp_cc_mdss_ahb_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_ahb_clk_src",
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
+	.cmd_rcgr = 0x2110,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_byte0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_dp_aux_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
+	.cmd_rcgr = 0x21dc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_mdss_dp_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_aux_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
+	.cmd_rcgr = 0x2194,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_crypto_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
+	.cmd_rcgr = 0x2178,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_link_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
+	.cmd_rcgr = 0x21ac,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_pixel_clk_src",
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
+	.cmd_rcgr = 0x2148,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_mdss_dp_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_esc0_clk_src",
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_disp_cc_mdss_mdp_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN, 3, 0, 0),
+	F(300000000, P_GPLL0_OUT_MAIN, 2, 0, 0),
+	F(345000000, P_DISP_CC_PLL0_OUT_MAIN, 4, 0, 0),
+	F(460000000, P_DISP_CC_PLL0_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
+	.cmd_rcgr = 0x20c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_mdp_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = 5,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
+	.cmd_rcgr = 0x2098,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_5,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_pclk0_clk_src",
+		.parent_data = disp_cc_parent_data_5,
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_pixel_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
+	.cmd_rcgr = 0x20e0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_3,
+	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_rot_clk_src",
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = 5,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
+	.cmd_rcgr = 0x20f8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_0,
+	.freq_tbl = ftbl_disp_cc_mdss_dp_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_vsync_clk_src",
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = 2,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch disp_cc_mdss_ahb_clk = {
+	.halt_reg = 0x2080,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2080,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_clk = {
+	.halt_reg = 0x2028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_byte0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
+	.reg = 0x2128,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "disp_cc_mdss_byte0_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div disp_cc_mdss_dp_link_div_clk_src = {
+	.reg = 0x2190,
+	.shift = 0,
+	.width = 2,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "disp_cc_mdss_dp_link_div_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
+	.halt_reg = 0x202c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x202c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_byte0_intf_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_aux_clk = {
+	.halt_reg = 0x2054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_aux_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_aux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_crypto_clk = {
+	.halt_reg = 0x2048,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2048,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_crypto_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_crypto_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_link_clk = {
+	.halt_reg = 0x2040,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2040,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_link_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
+	.halt_reg = 0x2044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_link_intf_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_pixel_clk = {
+	.halt_reg = 0x204c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x204c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_pixel_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_pixel_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_esc0_clk = {
+	.halt_reg = 0x2038,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2038,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_esc0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_esc0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_clk = {
+	.halt_reg = 0x200c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x200c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_mdp_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
+	.halt_reg = 0x201c,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x201c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_mdp_lut_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_non_gdsc_ahb_clk = {
+	.halt_reg = 0x4004,
+	.halt_check = BRANCH_VOTED,
+	.clkr = {
+		.enable_reg = 0x4004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_non_gdsc_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_pclk0_clk = {
+	.halt_reg = 0x2004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_pclk0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_pclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_rot_clk = {
+	.halt_reg = 0x2014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_rot_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_rot_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_rscc_ahb_clk = {
+	.halt_reg = 0x400c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x400c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_rscc_ahb_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_ahb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL | CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
+	.halt_reg = 0x4008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_rscc_vsync_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_vsync_clk = {
+	.halt_reg = 0x2024,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2024,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_vsync_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc mdss_gdsc = {
+	.gdscr = 0x3000,
+	.pd = {
+		.name = "mdss_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = HW_CTRL,
+};
+
+static struct gdsc *disp_cc_sc7180_gdscs[] = {
+	[MDSS_GDSC] = &mdss_gdsc,
+};
+
+static struct clk_regmap *disp_cc_sc7180_clocks[] = {
+	[DISP_CC_MDSS_AHB_CLK] = &disp_cc_mdss_ahb_clk.clkr,
+	[DISP_CC_MDSS_AHB_CLK_SRC] = &disp_cc_mdss_ahb_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK] = &disp_cc_mdss_byte0_clk.clkr,
+	[DISP_CC_MDSS_BYTE0_CLK_SRC] = &disp_cc_mdss_byte0_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_DIV_CLK_SRC] = &disp_cc_mdss_byte0_div_clk_src.clkr,
+	[DISP_CC_MDSS_BYTE0_INTF_CLK] = &disp_cc_mdss_byte0_intf_clk.clkr,
+	[DISP_CC_MDSS_DP_AUX_CLK] = &disp_cc_mdss_dp_aux_clk.clkr,
+	[DISP_CC_MDSS_DP_AUX_CLK_SRC] = &disp_cc_mdss_dp_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DP_CRYPTO_CLK] = &disp_cc_mdss_dp_crypto_clk.clkr,
+	[DISP_CC_MDSS_DP_CRYPTO_CLK_SRC] = &disp_cc_mdss_dp_crypto_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK_CLK] = &disp_cc_mdss_dp_link_clk.clkr,
+	[DISP_CC_MDSS_DP_LINK_CLK_SRC] = &disp_cc_mdss_dp_link_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC] =
+				&disp_cc_mdss_dp_link_div_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK_INTF_CLK] = &disp_cc_mdss_dp_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DP_PIXEL_CLK] = &disp_cc_mdss_dp_pixel_clk.clkr,
+	[DISP_CC_MDSS_DP_PIXEL_CLK_SRC] = &disp_cc_mdss_dp_pixel_clk_src.clkr,
+	[DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
+	[DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_CLK] = &disp_cc_mdss_mdp_clk.clkr,
+	[DISP_CC_MDSS_MDP_CLK_SRC] = &disp_cc_mdss_mdp_clk_src.clkr,
+	[DISP_CC_MDSS_MDP_LUT_CLK] = &disp_cc_mdss_mdp_lut_clk.clkr,
+	[DISP_CC_MDSS_NON_GDSC_AHB_CLK] = &disp_cc_mdss_non_gdsc_ahb_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK] = &disp_cc_mdss_pclk0_clk.clkr,
+	[DISP_CC_MDSS_PCLK0_CLK_SRC] = &disp_cc_mdss_pclk0_clk_src.clkr,
+	[DISP_CC_MDSS_ROT_CLK] = &disp_cc_mdss_rot_clk.clkr,
+	[DISP_CC_MDSS_ROT_CLK_SRC] = &disp_cc_mdss_rot_clk_src.clkr,
+	[DISP_CC_MDSS_RSCC_AHB_CLK] = &disp_cc_mdss_rscc_ahb_clk.clkr,
+	[DISP_CC_MDSS_RSCC_VSYNC_CLK] = &disp_cc_mdss_rscc_vsync_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK] = &disp_cc_mdss_vsync_clk.clkr,
+	[DISP_CC_MDSS_VSYNC_CLK_SRC] = &disp_cc_mdss_vsync_clk_src.clkr,
+	[DISP_CC_PLL0] = &disp_cc_pll0.clkr,
+	[DISP_CC_PLL0_OUT_EVEN] = &disp_cc_pll0_out_even.clkr,
+};
+
+static const struct regmap_config disp_cc_sc7180_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x10000,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc disp_cc_sc7180_desc = {
+	.config = &disp_cc_sc7180_regmap_config,
+	.clks = disp_cc_sc7180_clocks,
+	.num_clks = ARRAY_SIZE(disp_cc_sc7180_clocks),
+	.gdscs = disp_cc_sc7180_gdscs,
+	.num_gdscs = ARRAY_SIZE(disp_cc_sc7180_gdscs),
+};
+
+static const struct of_device_id disp_cc_sc7180_match_table[] = {
+	{ .compatible = "qcom,sc7180-dispcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, disp_cc_sc7180_match_table);
+
+static int disp_cc_sc7180_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	struct alpha_pll_config disp_cc_pll_config = {};
+
+	regmap = qcom_cc_map(pdev, &disp_cc_sc7180_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* 1380MHz configuration */
+	disp_cc_pll_config.l = 0x47;
+	disp_cc_pll_config.alpha = 0xe000;
+	disp_cc_pll_config.user_ctl_val = 0x00000001;
+	disp_cc_pll_config.user_ctl_hi_val = 0x00004805;
+
+	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll_config);
+
+	return qcom_cc_really_probe(pdev, &disp_cc_sc7180_desc, regmap);
+}
+
+static struct platform_driver disp_cc_sc7180_driver = {
+	.probe = disp_cc_sc7180_probe,
+	.driver = {
+		.name = "sc7180-dispcc",
+		.of_match_table = disp_cc_sc7180_match_table,
+	},
+};
+
+static int __init disp_cc_sc7180_init(void)
+{
+	return platform_driver_register(&disp_cc_sc7180_driver);
+}
+subsys_initcall(disp_cc_sc7180_init);
+
+static void __exit disp_cc_sc7180_exit(void)
+{
+	platform_driver_unregister(&disp_cc_sc7180_driver);
+}
+module_exit(disp_cc_sc7180_exit);
+
+MODULE_DESCRIPTION("QTI DISP_CC SC7180 Driver");
+MODULE_LICENSE("GPL v2");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

