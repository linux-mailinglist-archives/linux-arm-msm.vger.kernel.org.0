Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6517B442B2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Nov 2021 10:57:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbhKBKAJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Nov 2021 06:00:09 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:37377 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231286AbhKBKAJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Nov 2021 06:00:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635847054; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=cZcKeG71/KweyqjBtgke4mb3lTkX+ukw2AGRDjgJUSQ=; b=rDwkeQPRge3TR+RZ+mPzH9hk2FlQK1LakLnTHT8SlWMOMxBUuUiCOXh+6c3ESA55By9Skc/k
 azBm0cit1Pew6QIkheqCU53F85L7lbT2nPAR+FNRVFAnkEo+AWUyX8gnBDWg6NSbHPAjgCvE
 mlYjuEKzO1EDXgTSBMT3A3ZzdGs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61810b89aeb239055674d65c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Nov 2021 09:57:29
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 885B2C4361A; Tue,  2 Nov 2021 09:57:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3034AC43460;
        Tue,  2 Nov 2021 09:57:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 3034AC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 4/4] clk: qcom: lpass: Add support for LPASS clock controller for SC7280
Date:   Tue,  2 Nov 2021 15:26:53 +0530
Message-Id: <1635847013-3220-5-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635847013-3220-1-git-send-email-tdas@codeaurora.org>
References: <1635847013-3220-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Low Power Audio subsystem core and audio clocks are required for
Audio client to be able to request for the clocks and power domains.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/Kconfig               |   9 +
 drivers/clk/qcom/Makefile              |   1 +
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 831 +++++++++++++++++++++++++++++++++
 drivers/clk/qcom/lpasscorecc-sc7280.c  | 491 +++++++++++++++++++
 4 files changed, 1332 insertions(+)
 create mode 100644 drivers/clk/qcom/lpassaudiocc-sc7280.c
 create mode 100644 drivers/clk/qcom/lpasscorecc-sc7280.c

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 74efc82..4dcabc6 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -435,6 +435,15 @@ config SC_LPASS_CORECC_7180
 	  Say Y if you want to use LPASS clocks and power domains of the LPASS
 	  core clock controller.

+config SC_LPASS_CORECC_7280
+	tristate "SC7280 LPASS Core & Audio Clock Controller"
+	select SC_GCC_7280
+	help
+	  Support for the LPASS(Low Power Audio Subsystem) core and audio clock
+	  controller on SC7280 devices.
+	  Say Y if you want to use LPASS clocks and power domains of the LPASS
+	  core clock controller.
+
 config SC_MSS_7180
 	tristate "SC7180 Modem Clock Controller"
 	select SC_GCC_7180
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 1718c34..9e4b8e1 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_SC_GPUCC_7180) += gpucc-sc7180.o
 obj-$(CONFIG_SC_GPUCC_7280) += gpucc-sc7280.o
 obj-$(CONFIG_SC_LPASSCC_7280) += lpasscc-sc7280.o
 obj-$(CONFIG_SC_LPASS_CORECC_7180) += lpasscorecc-sc7180.o
+obj-$(CONFIG_SC_LPASS_CORECC_7280) += lpasscorecc-sc7280.o lpassaudiocc-sc7280.o
 obj-$(CONFIG_SC_MSS_7180) += mss-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7180) += videocc-sc7180.o
 obj-$(CONFIG_SC_VIDEOCC_7280) += videocc-sc7280.o
diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
new file mode 100644
index 0000000..52e7f8e
--- /dev/null
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -0,0 +1,831 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_LPASS_AON_CC_PLL_OUT_EVEN,
+	P_LPASS_AON_CC_PLL_OUT_MAIN,
+	P_LPASS_AON_CC_PLL_OUT_MAIN_CDIV_DIV_CLK_SRC,
+	P_LPASS_AON_CC_PLL_OUT_ODD,
+	P_LPASS_AUDIO_CC_PLL_OUT_AUX,
+	P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC,
+	P_LPASS_AUDIO_CC_PLL_MAIN_DIV_CLK,
+};
+
+static struct pll_vco zonda_vco[] = {
+	{ 595200000, 3600000000, 0 },
+};
+
+/* 1128.96MHz configuration */
+static const struct alpha_pll_config lpass_audio_cc_pll_config = {
+	.l = 0x3a,
+	.alpha = 0xcccc,
+	.config_ctl_val = 0x08200920,
+	.config_ctl_hi_val = 0x05002001,
+	.config_ctl_hi1_val = 0x00000000,
+	.user_ctl_val = 0x03000101,
+};
+
+static struct clk_alpha_pll lpass_audio_cc_pll = {
+	.offset = 0x0,
+	.vco_table = zonda_vco,
+	.num_vco = ARRAY_SIZE(zonda_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_cc_pll",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_lpass_audio_cc_pll_out_aux2[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv lpass_audio_cc_pll_out_aux2 = {
+	.offset = 0x0,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_lpass_audio_cc_pll_out_aux2,
+	.num_post_div = ARRAY_SIZE(post_div_table_lpass_audio_cc_pll_out_aux2),
+	.width = 2,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_audio_cc_pll_out_aux2",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_audio_cc_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_zonda_ops,
+	},
+};
+
+static struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+/* 614.4 MHz configuration */
+static const struct alpha_pll_config lpass_aon_cc_pll_config = {
+	.l = 0x20,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0x329A299C,
+	.user_ctl_val = 0x00005100,
+	.user_ctl_hi_val = 0x00000805,
+	.user_ctl_hi1_val = 0x00000000,
+};
+
+static struct clk_alpha_pll lpass_aon_cc_pll = {
+	.offset = 0x0,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_aon_cc_pll",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_lpass_aon_cc_pll_out_even[] = {
+	{ 0x1, 2 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv lpass_aon_cc_pll_out_even = {
+	.offset = 0x0,
+	.post_div_shift = 8,
+	.post_div_table = post_div_table_lpass_aon_cc_pll_out_even,
+	.num_post_div = ARRAY_SIZE(post_div_table_lpass_aon_cc_pll_out_even),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_aon_cc_pll_out_even",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_aon_cc_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ops,
+	},
+};
+
+static const struct clk_div_table post_div_table_lpass_aon_cc_pll_out_odd[] = {
+	{ 0x5, 5 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv lpass_aon_cc_pll_out_odd = {
+	.offset = 0x0,
+	.post_div_shift = 12,
+	.post_div_table = post_div_table_lpass_aon_cc_pll_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_lpass_aon_cc_pll_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_aon_cc_pll_out_odd",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_aon_cc_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_alpha_pll_postdiv_lucid_ops,
+	},
+};
+
+static const struct parent_map lpass_audio_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_AUDIO_CC_PLL_OUT_AUX, 3 },
+	{ P_LPASS_AON_CC_PLL_OUT_ODD, 5 },
+	{ P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC, 6 },
+};
+
+static struct clk_regmap_div lpass_audio_cc_pll_out_aux2_div_clk_src;
+static struct clk_regmap_div lpass_audio_cc_pll_out_main_div_clk_src;
+
+static const struct clk_parent_data lpass_audio_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &lpass_audio_cc_pll.clkr.hw },
+	{ .hw = &lpass_aon_cc_pll_out_odd.clkr.hw },
+	{ .hw = &lpass_audio_cc_pll_out_aux2_div_clk_src.clkr.hw },
+};
+
+static const struct parent_map lpass_aon_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_AON_CC_PLL_OUT_EVEN, 4 },
+};
+
+static const struct clk_parent_data lpass_aon_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &lpass_aon_cc_pll_out_even.clkr.hw },
+};
+
+static const struct parent_map lpass_aon_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_AON_CC_PLL_OUT_ODD, 1 },
+	{ P_LPASS_AUDIO_CC_PLL_MAIN_DIV_CLK, 6 },
+};
+
+static const struct clk_parent_data lpass_aon_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &lpass_aon_cc_pll_out_odd.clkr.hw },
+	{ .hw = &lpass_audio_cc_pll_out_main_div_clk_src.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_lpass_aon_cc_main_rcg_clk_src[] = {
+	F(38400000, P_LPASS_AON_CC_PLL_OUT_EVEN, 8, 0, 0),
+	F(76800000, P_LPASS_AON_CC_PLL_OUT_EVEN, 4, 0, 0),
+	F(153600000, P_LPASS_AON_CC_PLL_OUT_EVEN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_aon_cc_main_rcg_clk_src = {
+	.cmd_rcgr = 0x1000,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = lpass_aon_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_aon_cc_main_rcg_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_aon_cc_main_rcg_clk_src",
+		.parent_data = lpass_aon_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_0),
+		.flags = CLK_OPS_PARENT_ENABLE,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_aon_cc_tx_mclk_rcg_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_LPASS_AON_CC_PLL_OUT_ODD, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_aon_cc_tx_mclk_rcg_clk_src = {
+	.cmd_rcgr = 0x13004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = lpass_aon_cc_parent_map_1,
+	.freq_tbl = ftbl_lpass_aon_cc_tx_mclk_rcg_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_aon_cc_tx_mclk_rcg_clk_src",
+		.parent_data = lpass_aon_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(lpass_aon_cc_parent_data_1),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_audio_cc_pll_out_aux2_div_clk_src = {
+	.reg = 0x48,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "lpass_audio_cc_pll_out_aux2_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_audio_cc_pll_out_aux2.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_audio_cc_pll_out_main_div_clk_src = {
+	.reg = 0x3c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "lpass_audio_cc_pll_out_main_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_audio_cc_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_aon_cc_cdiv_tx_mclk_div_clk_src = {
+	.reg = 0x13010,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "lpass_aon_cc_cdiv_tx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_aon_cc_tx_mclk_rcg_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_aon_cc_pll_out_main_cdiv_div_clk_src = {
+	.reg = 0x80,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "lpass_aon_cc_pll_out_main_cdiv_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_aon_cc_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_audio_cc_ext_mclk0_clk_src[] = {
+	F(256000, P_LPASS_AON_CC_PLL_OUT_ODD, 15, 1, 32),
+	F(352800, P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC, 10, 1, 32),
+	F(512000, P_LPASS_AON_CC_PLL_OUT_ODD, 15, 1, 16),
+	F(705600, P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC, 10, 1, 16),
+	F(768000, P_LPASS_AON_CC_PLL_OUT_ODD, 10, 1, 16),
+	F(1024000, P_LPASS_AON_CC_PLL_OUT_ODD, 15, 1, 8),
+	F(1411200, P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC, 10, 1, 8),
+	F(1536000, P_LPASS_AON_CC_PLL_OUT_ODD, 10, 1, 8),
+	F(2048000, P_LPASS_AON_CC_PLL_OUT_ODD, 15, 1, 4),
+	F(2822400, P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC, 10, 1, 4),
+	F(3072000, P_LPASS_AON_CC_PLL_OUT_ODD, 10, 1, 4),
+	F(4096000, P_LPASS_AON_CC_PLL_OUT_ODD, 15, 1, 2),
+	F(5644800, P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC, 10, 1, 2),
+	F(6144000, P_LPASS_AON_CC_PLL_OUT_ODD, 10, 1, 2),
+	F(8192000, P_LPASS_AON_CC_PLL_OUT_ODD, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(11289600, P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC, 10, 0, 0),
+	F(12288000, P_LPASS_AON_CC_PLL_OUT_ODD, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(22579200, P_LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC, 5, 0, 0),
+	F(24576000, P_LPASS_AON_CC_PLL_OUT_ODD, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_mclk0_clk_src = {
+	.cmd_rcgr = 0x20004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_audio_cc_ext_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_audio_cc_ext_mclk0_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_ext_mclk1_clk_src = {
+	.cmd_rcgr = 0x21004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_audio_cc_ext_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_audio_cc_ext_mclk1_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_audio_cc_rx_mclk_clk_src = {
+	.cmd_rcgr = 0x24004,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_audio_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_audio_cc_ext_mclk0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_audio_cc_rx_mclk_clk_src",
+		.parent_data = lpass_audio_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_audio_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_audio_cc_cdiv_rx_mclk_div_clk_src = {
+	.reg = 0x240d0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "lpass_audio_cc_cdiv_rx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_audio_cc_rx_mclk_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch lpass_aon_cc_audio_hm_h_clk;
+
+static struct clk_branch lpass_audio_cc_codec_mem0_clk = {
+	.halt_reg = 0x1e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem1_clk = {
+	.halt_reg = 0x1e008,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e008,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem2_clk = {
+	.halt_reg = 0x1e00c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e00c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem2_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_codec_mem_clk = {
+	.halt_reg = 0x1e000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_cc_codec_mem_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_audio_hm_h_clk.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_mclk0_clk = {
+	.halt_reg = 0x20018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x20018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_cc_ext_mclk0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_mclk0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_ext_mclk1_clk = {
+	.halt_reg = 0x21018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x21018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_cc_ext_mclk1_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_ext_mclk1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_rx_mclk_2x_clk = {
+	.halt_reg = 0x240cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x240cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_cc_rx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_rx_mclk_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_audio_cc_rx_mclk_clk = {
+	.halt_reg = 0x240d4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x240d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_audio_cc_rx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_audio_cc_cdiv_rx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_audio_hm_h_clk = {
+	.halt_reg = 0x9014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_aon_cc_audio_hm_h_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_main_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_va_mem0_clk = {
+	.halt_reg = 0x9028,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x9028,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_aon_cc_va_mem0_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_main_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_tx_mclk_2x_clk = {
+	.halt_reg = 0x1300c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1300c,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_aon_cc_tx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_tx_mclk_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_aon_cc_tx_mclk_clk = {
+	.halt_reg = 0x13014,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x13014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_aon_cc_tx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_aon_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc lpass_aon_cc_lpass_audio_hm_gdsc = {
+	.gdscr = 0x9090,
+	.pd = {
+		.name = "lpass_aon_cc_lpass_audio_hm_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
+};
+
+static struct clk_regmap *lpass_aon_cc_sc7280_clocks[] = {
+	[LPASS_AON_CC_AUDIO_HM_H_CLK] = &lpass_aon_cc_audio_hm_h_clk.clkr,
+	[LPASS_AON_CC_VA_MEM0_CLK] = &lpass_aon_cc_va_mem0_clk.clkr,
+	[LPASS_AON_CC_CDIV_TX_MCLK_DIV_CLK_SRC] = &lpass_aon_cc_cdiv_tx_mclk_div_clk_src.clkr,
+	[LPASS_AON_CC_MAIN_RCG_CLK_SRC] = &lpass_aon_cc_main_rcg_clk_src.clkr,
+	[LPASS_AON_CC_PLL] = &lpass_aon_cc_pll.clkr,
+	[LPASS_AON_CC_PLL_OUT_EVEN] = &lpass_aon_cc_pll_out_even.clkr,
+	[LPASS_AON_CC_PLL_OUT_MAIN_CDIV_DIV_CLK_SRC] =
+		&lpass_aon_cc_pll_out_main_cdiv_div_clk_src.clkr,
+	[LPASS_AON_CC_PLL_OUT_ODD] = &lpass_aon_cc_pll_out_odd.clkr,
+	[LPASS_AON_CC_TX_MCLK_2X_CLK] = &lpass_aon_cc_tx_mclk_2x_clk.clkr,
+	[LPASS_AON_CC_TX_MCLK_CLK] = &lpass_aon_cc_tx_mclk_clk.clkr,
+	[LPASS_AON_CC_TX_MCLK_RCG_CLK_SRC] = &lpass_aon_cc_tx_mclk_rcg_clk_src.clkr,
+};
+
+static struct gdsc *lpass_aon_cc_sc7280_gdscs[] = {
+	[LPASS_AON_CC_LPASS_AUDIO_HM_GDSC] = &lpass_aon_cc_lpass_audio_hm_gdsc,
+};
+
+static struct clk_regmap *lpass_audio_cc_sc7280_clocks[] = {
+	[LPASS_AUDIO_CC_CDIV_RX_MCLK_DIV_CLK_SRC] = &lpass_audio_cc_cdiv_rx_mclk_div_clk_src.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM0_CLK] = &lpass_audio_cc_codec_mem0_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM1_CLK] = &lpass_audio_cc_codec_mem1_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM2_CLK] = &lpass_audio_cc_codec_mem2_clk.clkr,
+	[LPASS_AUDIO_CC_CODEC_MEM_CLK] = &lpass_audio_cc_codec_mem_clk.clkr,
+	[LPASS_AUDIO_CC_EXT_MCLK0_CLK] = &lpass_audio_cc_ext_mclk0_clk.clkr,
+	[LPASS_AUDIO_CC_EXT_MCLK0_CLK_SRC] = &lpass_audio_cc_ext_mclk0_clk_src.clkr,
+	[LPASS_AUDIO_CC_EXT_MCLK1_CLK] = &lpass_audio_cc_ext_mclk1_clk.clkr,
+	[LPASS_AUDIO_CC_EXT_MCLK1_CLK_SRC] = &lpass_audio_cc_ext_mclk1_clk_src.clkr,
+	[LPASS_AUDIO_CC_PLL] = &lpass_audio_cc_pll.clkr,
+	[LPASS_AUDIO_CC_PLL_OUT_AUX2] = &lpass_audio_cc_pll_out_aux2.clkr,
+	[LPASS_AUDIO_CC_PLL_OUT_AUX2_DIV_CLK_SRC] = &lpass_audio_cc_pll_out_aux2_div_clk_src.clkr,
+	[LPASS_AUDIO_CC_PLL_OUT_MAIN_DIV_CLK_SRC] = &lpass_audio_cc_pll_out_main_div_clk_src.clkr,
+	[LPASS_AUDIO_CC_RX_MCLK_2X_CLK] = &lpass_audio_cc_rx_mclk_2x_clk.clkr,
+	[LPASS_AUDIO_CC_RX_MCLK_CLK] = &lpass_audio_cc_rx_mclk_clk.clkr,
+	[LPASS_AUDIO_CC_RX_MCLK_CLK_SRC] = &lpass_audio_cc_rx_mclk_clk_src.clkr,
+};
+
+static struct regmap_config lpass_audio_cc_sc7280_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc lpass_audio_cc_sc7280_desc = {
+	.config = &lpass_audio_cc_sc7280_regmap_config,
+	.clks = lpass_audio_cc_sc7280_clocks,
+	.num_clks = ARRAY_SIZE(lpass_audio_cc_sc7280_clocks),
+};
+
+static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
+	{ .compatible = "qcom,sc7280-lpassaudiocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
+
+static void lpass_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
+static void lpass_pm_clk_destroy(void *data)
+{
+	pm_clk_destroy(data);
+}
+
+static int lpass_create_pm_clks(struct platform_device *pdev)
+{
+	int ret;
+
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0)
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+
+	return ret;
+}
+
+static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	ret = lpass_create_pm_clks(pdev);
+	if (ret)
+		return ret;
+
+	regmap = qcom_cc_map(pdev, &lpass_audio_cc_sc7280_desc);
+	if (IS_ERR(regmap)) {
+		pm_runtime_disable(&pdev->dev);
+		return PTR_ERR(regmap);
+	}
+
+	clk_zonda_pll_configure(&lpass_audio_cc_pll, regmap, &lpass_audio_cc_pll_config);
+
+	ret = qcom_cc_really_probe(pdev, &lpass_audio_cc_sc7280_desc, regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC clocks\n");
+		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
+
+	/* PLL settings */
+	regmap_write(regmap, 0x4, 0x3b);
+	regmap_write(regmap, 0x8, 0xff05);
+
+	pm_clk_suspend(&pdev->dev);
+
+	return ret;
+}
+
+static const struct dev_pm_ops lpass_audio_cc_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpass_audio_cc_sc7280_driver = {
+	.probe = lpass_audio_cc_sc7280_probe,
+	.driver = {
+		.name = "lpass_audio_cc-sc7280",
+		.of_match_table = lpass_audio_cc_sc7280_match_table,
+		.pm = &lpass_audio_cc_pm_ops,
+	},
+};
+
+static const struct qcom_cc_desc lpass_aon_cc_sc7280_desc = {
+	.config = &lpass_audio_cc_sc7280_regmap_config,
+	.clks = lpass_aon_cc_sc7280_clocks,
+	.num_clks = ARRAY_SIZE(lpass_aon_cc_sc7280_clocks),
+	.gdscs = lpass_aon_cc_sc7280_gdscs,
+	.num_gdscs = ARRAY_SIZE(lpass_aon_cc_sc7280_gdscs),
+};
+
+static const struct of_device_id lpass_aon_cc_sc7280_match_table[] = {
+	{ .compatible = "qcom,sc7280-lpassaoncc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_aon_cc_sc7280_match_table);
+
+static int lpass_aon_cc_sc7280_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	ret = lpass_create_pm_clks(pdev);
+	if (ret)
+		return ret;
+
+	lpass_audio_cc_sc7280_regmap_config.name = "lpasscc_aon";
+
+	regmap = qcom_cc_map(pdev, &lpass_aon_cc_sc7280_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_lucid_pll_configure(&lpass_aon_cc_pll, regmap, &lpass_aon_cc_pll_config);
+
+	ret = qcom_cc_really_probe(pdev, &lpass_aon_cc_sc7280_desc, regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register LPASS AON CC clocks\n");
+		return ret;
+	}
+
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+	pm_runtime_put_sync(&pdev->dev);
+	pm_clk_suspend(&pdev->dev);
+
+	return ret;
+}
+
+static struct platform_driver lpass_aon_cc_sc7280_driver = {
+	.probe = lpass_aon_cc_sc7280_probe,
+	.driver = {
+		.name = "lpass_aon_cc-sc7280",
+		.of_match_table = lpass_aon_cc_sc7280_match_table,
+		.pm = &lpass_audio_cc_pm_ops,
+	},
+};
+
+static int __init lpass_audio_cc_sc7280_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&lpass_aon_cc_sc7280_driver);
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&lpass_audio_cc_sc7280_driver);
+}
+subsys_initcall(lpass_audio_cc_sc7280_init);
+
+static void __exit lpass_audio_cc_sc7280_exit(void)
+{
+	platform_driver_unregister(&lpass_audio_cc_sc7280_driver);
+	platform_driver_unregister(&lpass_aon_cc_sc7280_driver);
+}
+module_exit(lpass_audio_cc_sc7280_exit);
+
+MODULE_DESCRIPTION("QTI LPASS_AUDIO_CC SC7280 Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/clk/qcom/lpasscorecc-sc7280.c b/drivers/clk/qcom/lpasscorecc-sc7280.c
new file mode 100644
index 0000000..812d9bd
--- /dev/null
+++ b/drivers/clk/qcom/lpasscorecc-sc7280.c
@@ -0,0 +1,491 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,lpasscorecc-sc7280.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "gdsc.h"
+
+enum {
+	P_BI_TCXO,
+	P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN,
+	P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC,
+	P_LPASS_CORE_CC_DIG_PLL_OUT_ODD,
+};
+
+static struct pll_vco lucid_vco[] = {
+	{ 249600000, 2000000000, 0 },
+};
+
+/* 614.4MHz configuration */
+static const struct alpha_pll_config lpass_core_cc_dig_pll_config = {
+	.l = 0x20,
+	.alpha = 0x0,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00002261,
+	.config_ctl_hi1_val = 0xB2923BBC,
+	.user_ctl_val = 0x00005100,
+	.user_ctl_hi_val = 0x00050805,
+	.user_ctl_hi1_val = 0x00000000,
+};
+
+static struct clk_alpha_pll lpass_core_cc_dig_pll = {
+	.offset = 0x1000,
+	.vco_table = lucid_vco,
+	.num_vco = ARRAY_SIZE(lucid_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_core_cc_dig_pll",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_ops,
+		},
+	},
+};
+
+static const struct clk_div_table post_div_table_lpass_core_cc_dig_pll_out_odd[] = {
+	{ 0x5, 5 },
+	{ }
+};
+
+static struct clk_alpha_pll_postdiv lpass_core_cc_dig_pll_out_odd = {
+	.offset = 0x1000,
+	.post_div_shift = 12,
+	.post_div_table = post_div_table_lpass_core_cc_dig_pll_out_odd,
+	.num_post_div = ARRAY_SIZE(post_div_table_lpass_core_cc_dig_pll_out_odd),
+	.width = 4,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_core_cc_dig_pll_out_odd",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_alpha_pll_postdiv_lucid_ops,
+	},
+};
+
+static struct clk_regmap_div lpass_core_cc_dig_pll_out_main_div_clk_src = {
+	.reg = 0x1054,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(struct clk_init_data) {
+		.name = "lpass_core_cc_dig_pll_out_main_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&lpass_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+
+static const struct parent_map lpass_core_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 5 },
+};
+
+static const struct clk_parent_data lpass_core_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &lpass_core_cc_dig_pll_out_odd.clkr.hw },
+};
+
+static const struct parent_map lpass_core_cc_parent_map_2[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 1 },
+	{ P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 2 },
+};
+
+static const struct clk_parent_data lpass_core_cc_parent_data_2[] = {
+	{ .fw_name = "bi_tcxo" },
+	{ .hw = &lpass_core_cc_dig_pll.clkr.hw },
+	{ .hw = &lpass_core_cc_dig_pll_out_main_div_clk_src.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_lpass_core_cc_core_clk_src[] = {
+	F(51200000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 6, 0, 0),
+	F(102400000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC, 3, 0, 0),
+	F(204800000, P_LPASS_CORE_CC_DIG_PLL_OUT_MAIN, 3, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_core_cc_core_clk_src = {
+	.cmd_rcgr = 0x1d000,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_2,
+	.freq_tbl = ftbl_lpass_core_cc_core_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_core_cc_core_clk_src",
+		.parent_data = lpass_core_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_2),
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_lpass_core_cc_ext_if0_clk_src[] = {
+	F(256000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 15, 1, 32),
+	F(512000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 15, 1, 16),
+	F(768000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 10, 1, 16),
+	F(1024000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 15, 1, 8),
+	F(1536000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 10, 1, 8),
+	F(2048000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 15, 1, 4),
+	F(3072000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 10, 1, 4),
+	F(4096000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 15, 1, 2),
+	F(6144000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 10, 1, 2),
+	F(8192000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_LPASS_CORE_CC_DIG_PLL_OUT_ODD, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_if0_clk_src = {
+	.cmd_rcgr = 0x10000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_core_cc_ext_if0_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 lpass_core_cc_ext_if1_clk_src = {
+	.cmd_rcgr = 0x11000,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = lpass_core_cc_parent_map_0,
+	.freq_tbl = ftbl_lpass_core_cc_ext_if0_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "lpass_core_cc_ext_if1_clk_src",
+		.parent_data = lpass_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(lpass_core_cc_parent_data_0),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+
+static struct clk_branch lpass_core_cc_core_clk = {
+	.halt_reg = 0x1f000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x1f000,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1f000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_core_cc_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_if0_ibit_clk = {
+	.halt_reg = 0x10018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_core_cc_ext_if0_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_if0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_ext_if1_ibit_clk = {
+	.halt_reg = 0x11018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x11018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_core_cc_ext_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_ext_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_lpm_core_clk = {
+	.halt_reg = 0x1e000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_core_cc_lpm_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_lpm_mem0_core_clk = {
+	.halt_reg = 0x1e004,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1e004,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_core_cc_lpm_mem0_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch lpass_core_cc_sysnoc_mport_core_clk = {
+	.halt_reg = 0x23000,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x23000,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x23000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "lpass_core_cc_sysnoc_mport_core_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&lpass_core_cc_core_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct gdsc  lpass_core_cc_lpass_core_hm_gdsc = {
+	.gdscr = 0x0,
+	.pd = {
+		.name = "lpass_core_cc_lpass_core_hm_gdsc",
+	},
+	.pwrsts = PWRSTS_OFF_ON,
+	.flags = RETAIN_FF_ENABLE,
+	.clk_name = "iface",
+};
+
+static struct clk_regmap *lpass_core_cc_sc7280_clocks[] = {
+	[LPASS_CORE_CC_CORE_CLK] = &lpass_core_cc_core_clk.clkr,
+	[LPASS_CORE_CC_CORE_CLK_SRC] = &lpass_core_cc_core_clk_src.clkr,
+	[LPASS_CORE_CC_DIG_PLL] = &lpass_core_cc_dig_pll.clkr,
+	[LPASS_CORE_CC_DIG_PLL_OUT_MAIN_DIV_CLK_SRC] =
+		&lpass_core_cc_dig_pll_out_main_div_clk_src.clkr,
+	[LPASS_CORE_CC_DIG_PLL_OUT_ODD] = &lpass_core_cc_dig_pll_out_odd.clkr,
+	[LPASS_CORE_CC_EXT_IF0_CLK_SRC] = &lpass_core_cc_ext_if0_clk_src.clkr,
+	[LPASS_CORE_CC_EXT_IF0_IBIT_CLK] = &lpass_core_cc_ext_if0_ibit_clk.clkr,
+	[LPASS_CORE_CC_EXT_IF1_CLK_SRC] = &lpass_core_cc_ext_if1_clk_src.clkr,
+	[LPASS_CORE_CC_EXT_IF1_IBIT_CLK] = &lpass_core_cc_ext_if1_ibit_clk.clkr,
+	[LPASS_CORE_CC_LPM_CORE_CLK] = &lpass_core_cc_lpm_core_clk.clkr,
+	[LPASS_CORE_CC_LPM_MEM0_CORE_CLK] = &lpass_core_cc_lpm_mem0_core_clk.clkr,
+	[LPASS_CORE_CC_SYSNOC_MPORT_CORE_CLK] = &lpass_core_cc_sysnoc_mport_core_clk.clkr,
+};
+
+static struct regmap_config lpass_core_cc_sc7280_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+};
+
+static const struct qcom_cc_desc lpass_core_cc_sc7280_desc = {
+	.config = &lpass_core_cc_sc7280_regmap_config,
+	.clks = lpass_core_cc_sc7280_clocks,
+	.num_clks = ARRAY_SIZE(lpass_core_cc_sc7280_clocks),
+};
+
+static const struct of_device_id lpass_core_cc_sc7280_match_table[] = {
+	{ .compatible = "qcom,sc7280-lpasscorecc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_core_cc_sc7280_match_table);
+
+static struct gdsc *lpass_core_hm_sc7280_gdscs[] = {
+	[LPASS_CORE_CC_LPASS_CORE_HM_GDSC] = &lpass_core_cc_lpass_core_hm_gdsc,
+};
+
+static const struct qcom_cc_desc lpass_core_hm_sc7280_desc = {
+	.config = &lpass_core_cc_sc7280_regmap_config,
+	.gdscs = lpass_core_hm_sc7280_gdscs,
+	.num_gdscs = ARRAY_SIZE(lpass_core_hm_sc7280_gdscs),
+};
+
+static void lpass_pm_runtime_disable(void *data)
+{
+	pm_runtime_disable(data);
+}
+
+static void lpass_pm_clk_destroy(void *data)
+{
+	pm_clk_destroy(data);
+}
+
+static int lpass_create_pm_clks(struct platform_device *pdev)
+{
+	int ret;
+
+	pm_runtime_use_autosuspend(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_enable(&pdev->dev);
+
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_runtime_disable, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_create(&pdev->dev);
+	if (ret)
+		return ret;
+	ret = devm_add_action_or_reset(&pdev->dev, lpass_pm_clk_destroy, &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = pm_clk_add(&pdev->dev, "iface");
+	if (ret < 0)
+		dev_err(&pdev->dev, "failed to acquire iface clock\n");
+
+	return ret;
+}
+
+static int lpass_core_cc_sc7280_probe(struct platform_device *pdev)
+{
+	struct regmap *regmap;
+	int ret;
+
+	ret = lpass_create_pm_clks(pdev);
+	if (ret)
+		return ret;
+
+	regmap = qcom_cc_map(pdev, &lpass_core_cc_sc7280_desc);
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
+
+	clk_lucid_pll_configure(&lpass_core_cc_dig_pll, regmap, &lpass_core_cc_dig_pll_config);
+
+	ret = qcom_cc_really_probe(pdev, &lpass_core_cc_sc7280_desc, regmap);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to register LPASS CORE CC clocks\n");
+		return ret;
+	}
+
+	pm_runtime_mark_last_busy(&pdev->dev);
+	pm_runtime_put_autosuspend(&pdev->dev);
+
+	return ret;
+}
+
+static const struct dev_pm_ops lpass_core_cc_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static struct platform_driver lpass_core_cc_sc7280_driver = {
+	.probe = lpass_core_cc_sc7280_probe,
+	.driver = {
+		.name = "lpass_core_cc-sc7280",
+		.of_match_table = lpass_core_cc_sc7280_match_table,
+		.pm = &lpass_core_cc_pm_ops,
+	},
+};
+
+static int lpass_hm_core_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+	int ret;
+
+	lpass_core_cc_sc7280_regmap_config.name = "lpass_hm_core";
+	desc = &lpass_core_hm_sc7280_desc;
+
+	ret = qcom_cc_probe_by_index(pdev, 0, desc);
+	if (ret)
+		goto destroy_clk;
+
+	return 0;
+
+destroy_clk:
+	return ret;
+}
+
+static const struct of_device_id lpass_hm_sc7280_match_table[] = {
+	{
+		.compatible = "qcom,sc7280-lpasshm",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_hm_sc7280_match_table);
+
+static struct platform_driver lpass_hm_sc7280_driver = {
+	.probe = lpass_hm_core_probe,
+	.driver = {
+		.name = "lpass_hm-sc7280",
+		.of_match_table = lpass_hm_sc7280_match_table,
+	},
+};
+
+static int __init lpass_core_cc_sc7280_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&lpass_hm_sc7280_driver);
+	if (ret)
+		return ret;
+
+	return platform_driver_register(&lpass_core_cc_sc7280_driver);
+}
+subsys_initcall(lpass_core_cc_sc7280_init);
+
+static void __exit lpass_core_cc_sc7280_exit(void)
+{
+	platform_driver_unregister(&lpass_core_cc_sc7280_driver);
+	platform_driver_unregister(&lpass_hm_sc7280_driver);
+}
+module_exit(lpass_core_cc_sc7280_exit);
+
+MODULE_DESCRIPTION("QTI LPASS_CORE_CC SC7280 Driver");
+MODULE_LICENSE("GPL v2");
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

