Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14F7EFDA17
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 10:57:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727171AbfKOJ44 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 04:56:56 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56510 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOJ4z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 04:56:55 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4AF1761685; Fri, 15 Nov 2019 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811814;
        bh=ueiLqqr0y2IfqCjEwg/nvsy9qxiY4V4RPaX0shJbJus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=epFuLIiP+Qai9Zjg9QyzPTqA6Pnn/D8Bm+HmuEwKCfr+xKcP3xVPT6PUVXqiDAPC6
         2QtOyDqYHuVslvY8Vc+z9ccK9ggRWpqstfbyzhzg3Pnz8U8ZvoKct43oENr5LDulB3
         INUqavQb5N5nygpnCDeK9sKdx8eOSVcPo5EV5GMU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4F36461666;
        Fri, 15 Nov 2019 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811813;
        bh=ueiLqqr0y2IfqCjEwg/nvsy9qxiY4V4RPaX0shJbJus=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bWFZv8jarZ+d753OnE1HOUUut8PBrygeJyBuNVGeLyQmG1qh1eGBnln0K+OgNgQIW
         e5ylEw9oRXmhdhMeFrGVMQnFMufcwUDwiPGxuEY2k5SCuI/U7VGDC0avC8aRFC/N8B
         z58djCjogqRdFGK7tJd8NeOAZdb9E04rfh7f8Usk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4F36461666
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 5/8] clk: qcom: Add graphics clock controller driver for SC7180
Date:   Fri, 15 Nov 2019 15:26:05 +0530
Message-Id: <1573811768-21462-6-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573811768-21462-1-git-send-email-tdas@codeaurora.org>
References: <1573811768-21462-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the graphics clock controller found on SC7180
based devices. This would allow graphics drivers to probe and
control their clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig        |   8 ++
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/gpucc-sc7180.c | 266 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 275 insertions(+)
 create mode 100644 drivers/clk/qcom/gpucc-sc7180.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3b33ef1..e648a60 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -245,6 +245,14 @@ config SC_GCC_7180
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.

+config SC_GPUCC_7180
+	tristate "SC7180 Graphics Clock Controller"
+	select SC_GCC_7180
+	help
+	  Support for the graphics clock controller on SC7180 devices.
+	  Say Y if you want to support graphics controller devices and
+	  functionality such as 3D graphics.
+
 config SDM_CAMCC_845
 	tristate "SDM845 Camera Clock Controller"
 	select SDM_GCC_845
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index d899661..5477482 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
+obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
 obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
diff --git a/drivers/clk/qcom/gpucc-sc7180.c b/drivers/clk/qcom/gpucc-sc7180.c
new file mode 100644
index 0000000..0b1815c
--- /dev/null
+++ b/drivers/clk/qcom/gpucc-sc7180.c
@@ -0,0 +1,266 @@
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
+#include <dt-bindings/clock/qcom,gpucc-sc7180.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "common.h"
+#include "gdsc.h"
+
+#define CX_GMU_CBCR_SLEEP_MASK		0xF
+#define CX_GMU_CBCR_SLEEP_SHIFT		4
+#define CX_GMU_CBCR_WAKE_MASK		0xF
+#define CX_GMU_CBCR_WAKE_SHIFT		8
+#define CLK_DIS_WAIT_SHIFT		12
+#define CLK_DIS_WAIT_MASK		(0xf << CLK_DIS_WAIT_SHIFT)
+
+enum {
+	P_BI_TCXO,
+	P_CORE_BI_PLL_TEST_SE,
+	P_GPLL0_OUT_MAIN,
+	P_GPLL0_OUT_MAIN_DIV,
+	P_GPU_CC_PLL1_OUT_EVEN,
+	P_GPU_CC_PLL1_OUT_MAIN,
+	P_GPU_CC_PLL1_OUT_ODD,
+};
+
+static const struct pll_vco fabia_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static struct clk_alpha_pll gpu_cc_pll1 = {
+	.offset = 0x100,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_pll1",
+			.parent_data =  &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
+static const struct parent_map gpu_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
+	{ P_GPLL0_OUT_MAIN, 5 },
+	{ P_GPLL0_OUT_MAIN_DIV, 6 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data gpu_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &gpu_cc_pll1.clkr.hw },
+	{ .fw_name = "gcc_gpu_gpll0_clk_src", .name = "gcc_gpu_gpll0_clk_src" },
+	{ .fw_name = "gcc_gpu_gpll0_div_clk_src" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(200000000, P_GPLL0_OUT_MAIN_DIV, 1.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 gpu_cc_gmu_clk_src = {
+	.cmd_rcgr = 0x1120,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = gpu_cc_parent_map_0,
+	.freq_tbl = ftbl_gpu_cc_gmu_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpu_cc_gmu_clk_src",
+		.parent_data = gpu_cc_parent_data_0,
+		.num_parents = 5,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch gpu_cc_crc_ahb_clk = {
+	.halt_reg = 0x107c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x107c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_crc_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_gmu_clk = {
+	.halt_reg = 0x1098,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1098,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cx_gmu_clk",
+			.parent_data =  &(const struct clk_parent_data){
+				.hw = &gpu_cc_gmu_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cx_snoc_dvm_clk = {
+	.halt_reg = 0x108c,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x108c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cx_snoc_dvm_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_aon_clk = {
+	.halt_reg = 0x1004,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cxo_aon_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gpu_cc_cxo_clk = {
+	.halt_reg = 0x109c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x109c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpu_cc_cxo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc cx_gdsc = {
+	.gdscr = 0x106c,
+	.gds_hw_ctrl = 0x1540,
+	.pd = {
+		.name = "cx_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc *gpu_cc_sc7180_gdscs[] = {
+	[CX_GDSC] = &cx_gdsc,
+};
+
+static struct clk_regmap *gpu_cc_sc7180_clocks[] = {
+	[GPU_CC_CXO_CLK] = &gpu_cc_cxo_clk.clkr,
+	[GPU_CC_CRC_AHB_CLK] = &gpu_cc_crc_ahb_clk.clkr,
+	[GPU_CC_CX_GMU_CLK] = &gpu_cc_cx_gmu_clk.clkr,
+	[GPU_CC_CX_SNOC_DVM_CLK] = &gpu_cc_cx_snoc_dvm_clk.clkr,
+	[GPU_CC_CXO_AON_CLK] = &gpu_cc_cxo_aon_clk.clkr,
+	[GPU_CC_GMU_CLK_SRC] = &gpu_cc_gmu_clk_src.clkr,
+	[GPU_CC_PLL1] = &gpu_cc_pll1.clkr,
+};
+
+static const struct regmap_config gpu_cc_sc7180_regmap_config = {
+	.reg_bits =	32,
+	.reg_stride =	4,
+	.val_bits =	32,
+	.max_register =	0x8008,
+	.fast_io =	true,
+};
+
+static const struct qcom_cc_desc gpu_cc_sc7180_desc = {
+	.config = &gpu_cc_sc7180_regmap_config,
+	.clks = gpu_cc_sc7180_clocks,
+	.num_clks = ARRAY_SIZE(gpu_cc_sc7180_clocks),
+	.gdscs = gpu_cc_sc7180_gdscs,
+	.num_gdscs = ARRAY_SIZE(gpu_cc_sc7180_gdscs),
+};
+
+static const struct of_device_id gpu_cc_sc7180_match_table[] = {
+	{ .compatible = "qcom,sc7180-gpucc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpu_cc_sc7180_match_table);
+
+static int gpu_cc_sc7180_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	struct alpha_pll_config gpu_cc_pll_config = {};
+	unsigned int value, mask;
+
+	regmap = qcom_cc_map(pdev, &gpu_cc_sc7180_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/* 360MHz Configuration */
+	gpu_cc_pll_config.l = 0x12;
+	gpu_cc_pll_config.alpha = 0xc000;
+	gpu_cc_pll_config.config_ctl_val = 0x20485699;
+	gpu_cc_pll_config.config_ctl_hi_val = 0x00002067;
+	gpu_cc_pll_config.user_ctl_val = 0x00000001;
+	gpu_cc_pll_config.user_ctl_hi_val = 0x00004805;
+	gpu_cc_pll_config.test_ctl_hi_val = 0x40000000;
+
+	clk_fabia_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll_config);
+
+	/* Recommended WAKEUP/SLEEP settings for the gpu_cc_cx_gmu_clk */
+	mask = CX_GMU_CBCR_WAKE_MASK << CX_GMU_CBCR_WAKE_SHIFT;
+	mask |= CX_GMU_CBCR_SLEEP_MASK << CX_GMU_CBCR_SLEEP_SHIFT;
+	value = 0xF << CX_GMU_CBCR_WAKE_SHIFT | 0xF << CX_GMU_CBCR_SLEEP_SHIFT;
+	regmap_update_bits(regmap, 0x1098, mask, value);
+
+	/* Configure clk_dis_wait for gpu_cx_gdsc */
+	regmap_update_bits(regmap, 0x106c, CLK_DIS_WAIT_MASK,
+						8 << CLK_DIS_WAIT_SHIFT);
+
+	return qcom_cc_really_probe(pdev, &gpu_cc_sc7180_desc, regmap);
+}
+
+static struct platform_driver gpu_cc_sc7180_driver = {
+	.probe = gpu_cc_sc7180_probe,
+	.driver = {
+		.name = "sc7180-gpucc",
+		.of_match_table = gpu_cc_sc7180_match_table,
+	},
+};
+
+static int __init gpu_cc_sc7180_init(void)
+{
+	return platform_driver_register(&gpu_cc_sc7180_driver);
+}
+subsys_initcall(gpu_cc_sc7180_init);
+
+static void __exit gpu_cc_sc7180_exit(void)
+{
+	platform_driver_unregister(&gpu_cc_sc7180_driver);
+}
+module_exit(gpu_cc_sc7180_exit);
+
+MODULE_DESCRIPTION("QTI GPU_CC SC7180 Driver");
+MODULE_LICENSE("GPL v2");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

