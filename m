Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF938195F21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2020 20:48:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbgC0Ts7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Mar 2020 15:48:59 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:32046 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727780AbgC0Ts4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Mar 2020 15:48:56 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585338535; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=k0A0JRiuIG+Y6lzQU64ysYi40Sb/U89gmKHVr0wM7pY=; b=htyrqqgx+L6qINoVmFOJvf6p0RsUBKIjWwEHlK5rHvhGy+HNJdEpwxZqQTmnjrkgWVOGq46b
 h0F+Q48mcLf+QcNHnGAvxIPIbmDBGZmBE4z8bqQAoxICcr3fIhi/P6Ouw7dBRshLxjvFRXsZ
 0RKopEc/5WbOEI08d1XlJ0f+S/o=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7e5899.7f0ca4e9fdf8-smtp-out-n02;
 Fri, 27 Mar 2020 19:48:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 33D34C4478C; Fri, 27 Mar 2020 19:48:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BE316C433F2;
        Fri, 27 Mar 2020 19:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org BE316C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
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
Subject: [PATCH v1 4/4] clk: qcom: lpass: Add support for LPASS clock controller for SC7180
Date:   Sat, 28 Mar 2020 01:18:05 +0530
Message-Id: <1585338485-31820-5-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585338485-31820-1-git-send-email-tdas@codeaurora.org>
References: <1585338485-31820-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Low Power Audio subsystem clocks are required for Audio client
to be able to request for the clocks and power domains.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig              |   9 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/lpasscorecc-sc7180.c | 479 ++++++++++++++++++++++++++++++++++
 3 files changed, 489 insertions(+)
 create mode 100644 drivers/clk/qcom/lpasscorecc-sc7180.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 11ec6f4..732e91d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -272,6 +272,15 @@ config SC_GCC_7180
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.

+config SC_LPASS_CORECC_7180
+	tristate "SC7180 LPASS Core Clock Controller"
+	select SC_GCC_7180
+	help
+	  Support for the LPASS(Low Power Audio Subsystem) core clock controller
+	  on SC7180 devices.
+	  Say Y if you want to use LPASS clocks and power domains of the LPASS
+	  core clock controller.
+
 config SC_GPUCC_7180
 	tristate "SC7180 Graphics Clock Controller"
 	select SC_GCC_7180
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 691efbf..cb29262 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
 obj-$(CONFIG_SC_DISPCC_7180) += dispcc-sc7180.o
 obj-$(CONFIG_SC_GCC_7180) += gcc-sc7180.o
 obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
+obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
 obj-$(CONFIG_SC_MSS_7180) += mss-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SDM_CAMCC_845) += camcc-sdm845.o
diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
new file mode 100644
index 0000000..86e3599
--- /dev/null
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -0,0 +1,479 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lpasscorecc-sc7180.h>
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
+	P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD,
+	P_SLEEP_CLK,
+};
+
+static struct pll_vco fabia_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+static const struct alpha_pll_config lpass_lpaaudio_dig_pll_config = {
+	.l = 0x20,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002067,
+	.test_ctl_val = 0x40000000,
+	.test_ctl_hi_val = 0x00000000,
+	.user_ctl_val = 0x00005105,
+	.user_ctl_hi_val = 0x00004805,
+};
+
+static const u8 clk_alpha_pll_regs_offset[][PLL_OFF_MAX_REGS] = {
+	[CLK_ALPHA_PLL_TYPE_FABIA] =  {
+		[PLL_OFF_L_VAL] = 0x04,
+		[PLL_OFF_CAL_L_VAL] = 0x8,
+		[PLL_OFF_USER_CTL] = 0x0c,
+		[PLL_OFF_USER_CTL_U] = 0x10,
+		[PLL_OFF_USER_CTL_U1] = 0x14,
+		[PLL_OFF_CONFIG_CTL] = 0x18,
+		[PLL_OFF_CONFIG_CTL_U] = 0x1C,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x20,
+		[PLL_OFF_TEST_CTL] = 0x24,
+		[PLL_OFF_TEST_CTL_U] = 0x28,
+		[PLL_OFF_STATUS] = 0x30,
+		[PLL_OFF_OPMODE] = 0x38,
+		[PLL_OFF_FRAC] = 0x40,
+	},
+};
+
+static struct clk_alpha_pll lpass_lpaaudio_dig_pll = {
+	.offset = 0x1000,
+	.vco_table = fabia_vco,
+	.num_vco = ARRAY_SIZE(fabia_vco),
+	.regs = clk_alpha_pll_regs_offset[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_lpaaudio_dig_pll",
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
+static const struct clk_div_table
+			post_div_table_lpass_lpaaudio_dig_pll_out_odd[] = {
+	{ 0x5, 5 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv lpass_lpaaudio_dig_pll_out_odd = {
+	.offset = 0x1000,
+	.post_div_shift = 12,
+	.post_div_table = post_div_table_lpass_lpaaudio_dig_pll_out_odd,
+	.num_post_div =
+		ARRAY_SIZE(post_div_table_lpass_lpaaudio_dig_pll_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_lpaaudio_dig_pll_out_odd",
+		.parent_data = &(const struct clk_parent_data){
+			.hw = &lpass_lpaaudio_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_fabia_ops,
+	},
+};
+
+static const struct parent_map lpass_core_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 5 },
+};
+
+static const struct clk_parent_data lpass_core_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &lpass_lpaaudio_dig_pll_out_odd.clkr.hw },
+};
+
+static const struct parent_map lpass_core_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+};
+
+static struct clk_rcg2 core_clk_src = {
+	.cmd_rcgr = 0x1d000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_2,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "core_clk_src",
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "bi_tcxo",
+		},
+		.num_parents = 1,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_ext_mclk0_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static const struct freq_tbl ftbl_ext_lpaif_clk_src[] = {
+	F(256000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 15, 1, 32),
+	F(512000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 15, 1, 16),
+	F(768000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 10, 1, 16),
+	F(1024000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 15, 1, 8),
+	F(1536000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 10, 1, 8),
+	F(2048000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 15, 1, 4),
+	F(3072000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 10, 1, 4),
+	F(4096000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 15, 1, 2),
+	F(6144000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 10, 1, 2),
+	F(8192000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_LPASS_LPAAUDIO_DIG_PLL_OUT_ODD, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 ext_mclk0_clk_src = {
+	.cmd_rcgr = 0x20000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_ext_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "ext_mclk0_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpaif_pri_clk_src = {
+	.cmd_rcgr = 0x10000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_ext_lpaif_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpaif_pri_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpaif_sec_clk_src = {
+	.cmd_rcgr = 0x11000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_ext_lpaif_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpaif_sec_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch lpass_audio_core_ext_mclk0_clk = {
+	.halt_reg = 0x20014,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x20014,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x20014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_core_ext_mclk0_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &ext_mclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_core_lpaif_pri_ibit_clk = {
+	.halt_reg = 0x10018,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x10018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x10018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_core_lpaif_pri_ibit_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &lpaif_pri_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_core_lpaif_sec_ibit_clk = {
+	.halt_reg = 0x11018,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x11018,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x11018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_core_lpaif_sec_ibit_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &lpaif_sec_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_core_sysnoc_mport_core_clk = {
+	.halt_reg = 0x23000,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x23000,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x23000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_core_sysnoc_mport_core_clk",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *lpass_core_cc_sc7180_clocks[] = {
+	[EXT_MCLK0_CLK_SRC] = &ext_mclk0_clk_src.clkr,
+	[LPAIF_PRI_CLK_SRC] = &lpaif_pri_clk_src.clkr,
+	[LPAIF_SEC_CLK_SRC] = &lpaif_sec_clk_src.clkr,
+	[CORE_CLK_SRC] = &core_clk_src.clkr,
+	[LPASS_AUDIO_CORE_EXT_MCLK0_CLK] = &lpass_audio_core_ext_mclk0_clk.clkr,
+	[LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK] =
+		&lpass_audio_core_lpaif_pri_ibit_clk.clkr,
+	[LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK] =
+		&lpass_audio_core_lpaif_sec_ibit_clk.clkr,
+	[LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK] =
+		&lpass_audio_core_sysnoc_mport_core_clk.clkr,
+	[LPASS_LPAAUDIO_DIG_PLL] = &lpass_lpaaudio_dig_pll.clkr,
+	[LPASS_LPAAUDIO_DIG_PLL_OUT_ODD] = &lpass_lpaaudio_dig_pll_out_odd.clkr,
+};
+
+static struct gdsc lpass_pdc_hm_gdsc = {
+	.gdscr = 0x3090,
+	.pd = {
+		.name = "lpass_pdc_hm_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = VOTABLE,
+};
+
+static struct gdsc lpass_audio_hm_gdsc = {
+	.gdscr = 0x9090,
+	.pd = {
+		.name = "lpass_audio_hm_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+};
+
+static struct gdsc lpass_core_hm_gdsc = {
+	.gdscr = 0x0,
+	.pd = {
+		.name = "lpass_core_hm_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
+};
+
+static struct gdsc *lpass_core_hm_sc7180_gdscs[] = {
+	[LPASS_CORE_HM_GDSCR] = &lpass_core_hm_gdsc,
+};
+
+static struct gdsc *lpass_audio_hm_sc7180_gdscs[] = {
+	[LPASS_PDC_HM_GDSCR] = &lpass_pdc_hm_gdsc,
+	[LPASS_AUDIO_HM_GDSCR] = &lpass_audio_hm_gdsc,
+};
+
+static struct regmap_config lpass_core_cc_sc7180_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc lpass_core_hm_sc7180_desc = {
+	.config = &lpass_core_cc_sc7180_regmap_config,
+	.gdscs = lpass_core_hm_sc7180_gdscs,
+	.num_gdscs = ARRAY_SIZE(lpass_core_hm_sc7180_gdscs),
+};
+
+static const struct qcom_cc_desc lpass_core_cc_sc7180_desc = {
+	.config = &lpass_core_cc_sc7180_regmap_config,
+	.clks = lpass_core_cc_sc7180_clocks,
+	.num_clks = ARRAY_SIZE(lpass_core_cc_sc7180_clocks),
+};
+
+static const struct qcom_cc_desc lpass_audio_hm_sc7180_desc = {
+	.config = &lpass_core_cc_sc7180_regmap_config,
+	.gdscs = lpass_audio_hm_sc7180_gdscs,
+	.num_gdscs = ARRAY_SIZE(lpass_audio_hm_sc7180_gdscs),
+};
+
+
+static int lpass_core_cc_sc7180_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+	struct regmap *regmap;
+	int ret;
+
+	lpass_core_cc_sc7180_regmap_config.name = "lpass_audio_cc";
+	desc = &lpass_audio_hm_sc7180_desc;
+	ret = qcom_cc_probe_by_index(pdev, 1, desc);
+	if (ret)
+		return ret;
+
+	lpass_core_cc_sc7180_regmap_config.name = "lpass_core_cc";
+	regmap = qcom_cc_map(pdev, &lpass_core_cc_sc7180_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	/*
+	 * Keep the CLK always-ON
+	 * LPASS_AUDIO_CORE_SYSNOC_SWAY_CORE_CLK
+	 */
+	regmap_update_bits(regmap, 0x24000, BIT(0), BIT(0));
+
+	/* PLL settings */
+	regmap_write(regmap, 0x1008, 0x20);
+	regmap_update_bits(regmap, 0x1014, BIT(0), BIT(0));
+
+	clk_fabia_pll_configure(&lpass_lpaaudio_dig_pll, regmap,
+				&lpass_lpaaudio_dig_pll_config);
+
+	return qcom_cc_really_probe(pdev, &lpass_core_cc_sc7180_desc, regmap);
+}
+
+static int lpass_hm_core_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+	int ret;
+
+	lpass_core_cc_sc7180_regmap_config.name = "lpass_hm_core";
+	desc = &lpass_core_hm_sc7180_desc;
+
+	return qcom_cc_probe_by_index(pdev, 0, desc);
+}
+
+static const struct of_device_id lpass_core_cc_sc7180_match_table[] = {
+	{
+		.compatible = "qcom,sc7180-lpasshm",
+		.data = lpass_hm_core_probe,
+	},
+	{
+		.compatible = "qcom,sc7180-lpasscorecc",
+		.data = lpass_core_cc_sc7180_probe,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7180_match_table);
+
+static int lpass_core_sc7180_probe(struct platform_device *pdev)
+{
+	int (*clk_probe)(struct platform_device *p);
+	int ret;
+
+	pm_runtime_enable(&pdev->dev);
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "gcc_lpass_sway");
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+		goto disable_pm_runtime;
+	}
+
+	clk_probe = of_device_get_match_data(&pdev->dev);
+	if (!clk_probe)
+		return -EINVAL;
+
+	ret = clk_probe(pdev);
+	if (ret)
+		goto destroy_pm_clk;
+
+	return 0;
+
+destroy_pm_clk:
+	pm_clk_destroy(&pdev->dev);
+
+disable_pm_runtime:
+	pm_runtime_disable(&pdev->dev);
+
+	return ret;
+}
+
+static const struct dev_pm_ops lpass_core_cc_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpass_core_cc_sc7180_driver = {
+	.probe = lpass_core_sc7180_probe,
+	.driver = {
+		.name = "lpass_core_cc-sc7180",
+		.of_match_table = lpass_core_cc_sc7180_match_table,
+		.pm = &lpass_core_cc_pm_ops,
+	},
+};
+
+static int __init lpass_core_cc_sc7180_init(void)
+{
+	return platform_driver_register(&lpass_core_cc_sc7180_driver);
+}
+subsys_initcall(lpass_core_cc_sc7180_init);
+
+static void __exit lpass_core_cc_sc7180_exit(void)
+{
+	platform_driver_unregister(&lpass_core_cc_sc7180_driver);
+}
+module_exit(lpass_core_cc_sc7180_exit);
+
+MODULE_DESCRIPTION("QTI LPASS_CORE_CC SC7180 Driver");
+MODULE_LICENSE("GPL v2");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
