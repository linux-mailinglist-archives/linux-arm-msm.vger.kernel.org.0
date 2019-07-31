Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65C657CBFB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2019 20:27:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727961AbfGaS1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Jul 2019 14:27:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45412 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730037AbfGaS1e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Jul 2019 14:27:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 5D23660734; Wed, 31 Jul 2019 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564597652;
        bh=l6yPCxZR+IXtBsSBlCsz6q1pTNhqIKKVrlFGqWyp/hk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ohndJW7NQJ1LGwYF13wa1U5jWvUUHLsfVJwNXdsR2ySDAt6abzoU0OB5oPxOXoSN2
         VwQ2nIy67si4/+H+J4SONIbyCYYItJ8Q9BYoEtp3Ld9xG6RIpU7MHfthlTMUgn853/
         udBZiZKf3BXiZuHbr72HqJgiKfyqzlMrPllxnMQs=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07D8060721;
        Wed, 31 Jul 2019 18:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1564597651;
        bh=l6yPCxZR+IXtBsSBlCsz6q1pTNhqIKKVrlFGqWyp/hk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=oQjt3LvKmAxh+t2fitZAlBF52ORPmgRE4LhyN2KQahhShQf0OVEa0N3eQjMGhLzK8
         X7pD89QylTShkqao2FFQjNS2+OKgopJZ3wdKAYro6xVsu+WAtkVd81MtR8dY9p/o/c
         Gz2ok8FpspRJOUxScy/Q0xJ2WlxfxFqdXz+tT4AI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07D8060721
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
Subject: [PATCH v3 2/2] clk: qcom : dispcc: Add support for display port clocks
Date:   Wed, 31 Jul 2019 23:57:13 +0530
Message-Id: <20190731182713.8123-3-tdas@codeaurora.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190731182713.8123-1-tdas@codeaurora.org>
References: <20190731182713.8123-1-tdas@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

SDM845 dispcc supports RCG and CBCRs for display port, so add support for
the same.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 drivers/clk/qcom/dispcc-sdm845.c              | 214 +++++++++++++++++-
 .../dt-bindings/clock/qcom,dispcc-sdm845.h    |  13 +-
 2 files changed, 225 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 0cc4909b5dbe..5c932cd17b14 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  */

 #include <linux/clk-provider.h>
@@ -29,6 +29,8 @@ enum {
 	P_DSI1_PHY_PLL_OUT_DSICLK,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
+	P_DP_PHY_PLL_LINK_CLK,
+	P_DP_PHY_PLL_VCO_DIV_CLK,
 };

 static const struct parent_map disp_cc_parent_map_0[] = {
@@ -45,6 +47,20 @@ static const char * const disp_cc_parent_names_0[] = {
 	"core_bi_pll_test_se",
 };

+static const struct parent_map disp_cc_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DP_PHY_PLL_LINK_CLK, 1 },
+	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
+	{ P_CORE_BI_PLL_TEST_SE, 7 },
+};
+
+static const char * const disp_cc_parent_names_1[] = {
+	"bi_tcxo",
+	"dp_link_clk_divsel_ten",
+	"dp_vco_divided_clk_src_mux",
+	"core_bi_pll_test_se",
+};
+
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
@@ -128,6 +144,81 @@ static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
 	},
 };

+static const struct freq_tbl ftbl_disp_cc_mdss_dp_aux_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
+	.cmd_rcgr = 0x219c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_2,
+	.freq_tbl = ftbl_disp_cc_mdss_dp_aux_clk_src,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_aux_clk_src",
+		.parent_names = disp_cc_parent_names_2,
+		.num_parents = 2,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
+	.cmd_rcgr = 0x2154,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_crypto_clk_src",
+		.parent_names = disp_cc_parent_names_1,
+		.num_parents = 4,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
+	.cmd_rcgr = 0x2138,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_link_clk_src",
+		.parent_names = disp_cc_parent_names_1,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_byte2_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src = {
+	.cmd_rcgr = 0x2184,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_pixel1_clk_src",
+		.parent_names = disp_cc_parent_names_1,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
+static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
+	.cmd_rcgr = 0x216c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = disp_cc_parent_map_1,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "disp_cc_mdss_dp_pixel_clk_src",
+		.parent_names = disp_cc_parent_names_1,
+		.num_parents = 4,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_dp_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_disp_cc_mdss_esc0_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	{ }
@@ -391,6 +482,114 @@ static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
 	},
 };

+static struct clk_branch disp_cc_mdss_dp_aux_clk = {
+	.halt_reg = 0x2054,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2054,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_aux_clk",
+			.parent_names = (const char *[]){
+				"disp_cc_mdss_dp_aux_clk_src",
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
+			.parent_names = (const char *[]){
+				"disp_cc_mdss_dp_crypto_clk_src",
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
+			.parent_names = (const char *[]){
+				"disp_cc_mdss_dp_link_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+/* reset state of disp_cc_mdss_dp_link_div_clk_src divider is 0x3 (div 4) */
+static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
+	.halt_reg = 0x2044,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2044,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_link_intf_clk",
+			.parent_names = (const char *[]){
+				"disp_cc_mdss_dp_link_clk_src",
+			},
+			.num_parents = 1,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch disp_cc_mdss_dp_pixel1_clk = {
+	.halt_reg = 0x2050,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x2050,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_mdss_dp_pixel1_clk",
+			.parent_names = (const char *[]){
+				"disp_cc_mdss_dp_pixel1_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
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
+			.parent_names = (const char *[]){
+				"disp_cc_mdss_dp_pixel_clk_src",
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch disp_cc_mdss_esc0_clk = {
 	.halt_reg = 0x2038,
 	.halt_check = BRANCH_HALT,
@@ -589,6 +788,19 @@ static struct clk_regmap *disp_cc_sdm845_clocks[] = {
 	[DISP_CC_MDSS_BYTE1_INTF_CLK] = &disp_cc_mdss_byte1_intf_clk.clkr,
 	[DISP_CC_MDSS_BYTE1_DIV_CLK_SRC] =
 					&disp_cc_mdss_byte1_div_clk_src.clkr,
+	[DISP_CC_MDSS_DP_AUX_CLK] = &disp_cc_mdss_dp_aux_clk.clkr,
+	[DISP_CC_MDSS_DP_AUX_CLK_SRC] = &disp_cc_mdss_dp_aux_clk_src.clkr,
+	[DISP_CC_MDSS_DP_CRYPTO_CLK] = &disp_cc_mdss_dp_crypto_clk.clkr,
+	[DISP_CC_MDSS_DP_CRYPTO_CLK_SRC] =
+					&disp_cc_mdss_dp_crypto_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK_CLK] = &disp_cc_mdss_dp_link_clk.clkr,
+	[DISP_CC_MDSS_DP_LINK_CLK_SRC] = &disp_cc_mdss_dp_link_clk_src.clkr,
+	[DISP_CC_MDSS_DP_LINK_INTF_CLK] = &disp_cc_mdss_dp_link_intf_clk.clkr,
+	[DISP_CC_MDSS_DP_PIXEL1_CLK] = &disp_cc_mdss_dp_pixel1_clk.clkr,
+	[DISP_CC_MDSS_DP_PIXEL1_CLK_SRC] =
+					&disp_cc_mdss_dp_pixel1_clk_src.clkr,
+	[DISP_CC_MDSS_DP_PIXEL_CLK] = &disp_cc_mdss_dp_pixel_clk.clkr,
+	[DISP_CC_MDSS_DP_PIXEL_CLK_SRC] = &disp_cc_mdss_dp_pixel_clk_src.clkr,
 	[DISP_CC_MDSS_ESC0_CLK] = &disp_cc_mdss_esc0_clk.clkr,
 	[DISP_CC_MDSS_ESC0_CLK_SRC] = &disp_cc_mdss_esc0_clk_src.clkr,
 	[DISP_CC_MDSS_ESC1_CLK] = &disp_cc_mdss_esc1_clk.clkr,
diff --git a/include/dt-bindings/clock/qcom,dispcc-sdm845.h b/include/dt-bindings/clock/qcom,dispcc-sdm845.h
index 11eed4bc9646..4016fd1d5b46 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sdm845.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sdm845.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
  */

 #ifndef _DT_BINDINGS_CLK_SDM_DISP_CC_SDM845_H
@@ -35,6 +35,17 @@
 #define DISP_CC_PLL0						25
 #define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				26
 #define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				27
+#define DISP_CC_MDSS_DP_AUX_CLK					28
+#define DISP_CC_MDSS_DP_AUX_CLK_SRC				29
+#define DISP_CC_MDSS_DP_CRYPTO_CLK				30
+#define DISP_CC_MDSS_DP_CRYPTO_CLK_SRC				31
+#define DISP_CC_MDSS_DP_LINK_CLK				32
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC				33
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK				34
+#define DISP_CC_MDSS_DP_PIXEL1_CLK				35
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC				36
+#define DISP_CC_MDSS_DP_PIXEL_CLK				37
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC				38

 /* DISP_CC Reset */
 #define DISP_CC_MDSS_RSCC_BCR					0
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

