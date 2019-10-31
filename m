Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 879EAEB01C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 13:22:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfJaMWW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 08:22:22 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:39102 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaMWW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 08:22:22 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DFF6160D96; Thu, 31 Oct 2019 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524541;
        bh=0U2ZlZO6ATz2y9QCjSup28RXf2H2pQaz7sEgkSb+PFU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lMJ13lc1gwIU5L/mOQSC9GX+164VwpzE73G6LTyIT6k7Bi55d+1zdOVY2naV/8zun
         EZiVFXFwWqbm3vPbzQnz4p0p7nHb9+9g/2KnYp84sdKRjTYsdPSLZLqOCsaFPTJhXJ
         s+1A1CJGFE0cINGVGG2WABCFQx6PUil/OxtrHIS4=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3065060A71;
        Thu, 31 Oct 2019 12:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524537;
        bh=0U2ZlZO6ATz2y9QCjSup28RXf2H2pQaz7sEgkSb+PFU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UmdTO7qkY6jxCrM4rw+iVMC4Cn0Yvg+Va9Ceh5iV/JA2L4IEXrpjJRszQZcnicSIe
         HL0Rudo+qZZOPip4hizjf+3S5TGAxZZIsgLNDTS2k6v5LEmclHRAUtlyOJ7neqSFsr
         mku2c2lgZuNqaSjFUqAkywAgcwq3bAbRhHo/4j40=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3065060A71
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 7/7] clk: qcom: Add video clock controller driver for SC7180
Date:   Thu, 31 Oct 2019 17:51:13 +0530
Message-Id: <1572524473-19344-8-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for the video clock controller found on SC7180
based devices. This would allow video drivers to probe
and control their clocks.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig          |   8 ++
 drivers/clk/qcom/Makefile         |   1 +
 drivers/clk/qcom/videocc-sc7180.c | 263 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 272 insertions(+)
 create mode 100644 drivers/clk/qcom/videocc-sc7180.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index c898e62..c5ad2cc 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -244,6 +244,14 @@ config SC_GPUCC_7180
 	  Say Y if you want to support graphics controller devices and
 	  functionality such as 3D graphics.

+config SC_VIDEOCC_7180
+	tristate "SC7180 Video Clock Controller"
+	select SC_GCC_7180
+	help
+	  Support for the video clock controller on SC7180 devices.
+	  Say Y if you want to support video devices and functionality such as
+	  video encode and decode.
+
 config SDM_CAMCC_845
 	tristate "SDM845 Camera Clock Controller"
 	select SDM_GCC_845
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index b89a292..0906e5d 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -45,6 +45,7 @@ obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
 obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
 obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
+obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
 obj-$(CONFIG_SDM_DISPCC_845) += dispcc-sdm845.o
 obj-$(CONFIG_SDM_GCC_660) += gcc-sdm660.o
diff --git a/drivers/clk/qcom/videocc-sc7180.c b/drivers/clk/qcom/videocc-sc7180.c
new file mode 100644
index 0000000..bef034b
--- /dev/null
+++ b/drivers/clk/qcom/videocc-sc7180.c
@@ -0,0 +1,263 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,videocc-sc7180.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_CHIP_SLEEP_CLK,
+	P_CORE_BI_PLL_TEST_SE,
+	P_VIDEO_PLL0_OUT_EVEN,
+	P_VIDEO_PLL0_OUT_MAIN,
+	P_VIDEO_PLL0_OUT_ODD,
+};
+
+static struct pll_vco fabia_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static struct clk_alpha_pll video_pll0 = {
+	.offset = 0x42c,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "video_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+				.name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
+static const struct parent_map video_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const struct clk_parent_data video_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &video_pll0.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+};
+
+static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(150000000, P_VIDEO_PLL0_OUT_MAIN, 4, 0, 0),
+	F(270000000, P_VIDEO_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(340000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(434000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	F(500000000, P_VIDEO_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 video_cc_venus_clk_src = {
+	.cmd_rcgr = 0x7f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = video_cc_parent_map_1,
+	.freq_tbl = ftbl_video_cc_venus_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "video_cc_venus_clk_src",
+		.parent_data = video_cc_parent_data_1,
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_branch video_cc_vcodec0_axi_clk = {
+	.halt_reg = 0x9ec,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_vcodec0_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_vcodec0_core_clk = {
+	.halt_reg = 0x890,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x890,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_vcodec0_core_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_venus_ahb_clk = {
+	.halt_reg = 0xa4c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0xa4c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_venus_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_venus_ctl_axi_clk = {
+	.halt_reg = 0x9cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_venus_ctl_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch video_cc_venus_ctl_core_clk = {
+	.halt_reg = 0x850,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x850,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "video_cc_venus_ctl_core_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &video_cc_venus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc venus_gdsc = {
+	.gdscr = 0x814,
+	.pd = {
+		.name = "venus_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc vcodec0_gdsc = {
+	.gdscr = 0x874,
+	.pd = {
+		.name = "vcodec0_gdsc",
+	},
+	.flags = HW_CTRL,
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct clk_regmap *video_cc_sc7180_clocks[] = {
+	[VIDEO_CC_VCODEC0_AXI_CLK] = &video_cc_vcodec0_axi_clk.clkr,
+	[VIDEO_CC_VCODEC0_CORE_CLK] = &video_cc_vcodec0_core_clk.clkr,
+	[VIDEO_CC_VENUS_AHB_CLK] = &video_cc_venus_ahb_clk.clkr,
+	[VIDEO_CC_VENUS_CLK_SRC] = &video_cc_venus_clk_src.clkr,
+	[VIDEO_CC_VENUS_CTL_AXI_CLK] = &video_cc_venus_ctl_axi_clk.clkr,
+	[VIDEO_CC_VENUS_CTL_CORE_CLK] = &video_cc_venus_ctl_core_clk.clkr,
+	[VIDEO_PLL0] = &video_pll0.clkr,
+};
+
+static struct gdsc *video_cc_sc7180_gdscs[] = {
+	[VENUS_GDSC] = &venus_gdsc,
+	[VCODEC0_GDSC] = &vcodec0_gdsc,
+};
+
+static const struct regmap_config video_cc_sc7180_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0xb94,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc video_cc_sc7180_desc = {
+	.config = &video_cc_sc7180_regmap_config,
+	.clks = video_cc_sc7180_clocks,
+	.num_clks = ARRAY_SIZE(video_cc_sc7180_clocks),
+	.gdscs = video_cc_sc7180_gdscs,
+	.num_gdscs = ARRAY_SIZE(video_cc_sc7180_gdscs),
+};
+
+static const struct of_device_id video_cc_sc7180_match_table[] = {
+	{ .compatible = "qcom,sc7180-videocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, video_cc_sc7180_match_table);
+
+static int video_cc_sc7180_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	struct alpha_pll_config video_pll0_config = {};
+
+	regmap = qcom_cc_map(pdev, &video_cc_sc7180_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	video_pll0_config.l = 0x1F;
+	video_pll0_config.alpha = 0x4000;
+	video_pll0_config.user_ctl_val = 0x00000001;
+	video_pll0_config.user_ctl_hi_val = 0x00004805;
+
+	clk_fabia_pll_configure(&video_pll0, regmap, &video_pll0_config);
+
+	/* video_cc_xo_clk */
+	regmap_update_bits(regmap, 0x984, 0x1, 0x1);
+
+	return qcom_cc_really_probe(pdev, &video_cc_sc7180_desc, regmap);
+}
+
+static struct platform_driver video_cc_sc7180_driver = {
+	.probe = video_cc_sc7180_probe,
+	.driver = {
+		.name = "sc7180-videocc",
+		.of_match_table = video_cc_sc7180_match_table,
+	},
+};
+
+static int __init video_cc_sc7180_init(void)
+{
+	return platform_driver_register(&video_cc_sc7180_driver);
+}
+core_initcall(video_cc_sc7180_init);
+
+static void __exit video_cc_sc7180_exit(void)
+{
+	platform_driver_unregister(&video_cc_sc7180_driver);
+}
+module_exit(video_cc_sc7180_exit);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("QTI VIDEOCC SC7180 Driver");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

