Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F9D348EA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 12:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhCYLMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 07:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbhCYLL4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 07:11:56 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82928C061761
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:55 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id o126so1975279lfa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 04:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nFKRMT+uuLb0v0tcxrynoQiqJNSnoW1UORVuiU4smjw=;
        b=kk33QTWNPOIfwGWwYv6Pt20Es2APOrjRMd7Yi9Bca7rkMfjLTjtWtVBho3gYs51IVF
         /LNUqBvKtn6Tdo21VYyJNYSHDfJBu3aFGxIVhiiwsJX1KISooorNOaISadccfWFofD7n
         HXxarCmvP0/yBu4iHn1Fp8BQkwTBV4OMaaumpKhv+VIsgXR6gQR7Egsy5kLhYT5XhimE
         4xh59A2PZxBmhKsGbqKZxiZpZWMVrdY/2V2GhNpif2ODGESjbAsSEBqEAVuVx1a9LAEv
         b/FOjTZPItobtNIx7EXdy3fLBMC2Owxp6YyvLq1sRrWgRsC7kYOrKS9cfux6lbDQTVUe
         f8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nFKRMT+uuLb0v0tcxrynoQiqJNSnoW1UORVuiU4smjw=;
        b=o9usBxpg3OhnmmhKFINQFUBh9y4zQDMuhGNSBsMy5Xx82A2+wwkXUP/PJwKxweT+0Y
         3cT4FkeEjXWqYnropXEaf9D2hk0XZE6ygSGT0IFQzB3GAjWCbJ6GaRwX/E9IpyNC35LB
         MezbjYvg3viE7fe1A4bss0zfwNtHkVUB/90161KxM3lU+PDF8eKzqdt6JEdZvz0n+VDo
         dBVsU3o4TcG3y9HWEP0R5+ZZkbRY1c8kJcp3j8tPOBRLf+Hah/TPsC71+Z2McqOhmcw3
         4+A/P+ncMJ8WyfM5tsXiF7u1E5Og9NVpP9LdyEH1zo9z4AGWUdSjjwm/mlN9UFzE3kGL
         b4sQ==
X-Gm-Message-State: AOAM532rH9isUREmADxK8hrFP1bFmLlr4siRQQx6+nXhKCi5E1VuEzTi
        QpX812DiQ/wL/aTtiTiSgao+rA==
X-Google-Smtp-Source: ABdhPJxSHI6/bYkP3SwAx6dCXxALniLEGtWcjwt2rkYuyzWcFvfZZeAGZbBcINSJJBPKAhHhocX3Vw==
X-Received: by 2002:a05:6512:b03:: with SMTP id w3mr1696945lfu.72.1616670713876;
        Thu, 25 Mar 2021 04:11:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:53 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 09/15] clk: qcom: dispcc-sdm845: convert to parent data
Date:   Thu, 25 Mar 2021 14:11:38 +0300
Message-Id: <20210325111144.2852594-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sdm845.c | 188 ++++++++++++++++---------------
 1 file changed, 95 insertions(+), 93 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 5c932cd17b14..bf5e8a4a0230 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -33,6 +33,21 @@ enum {
 	P_DP_PHY_PLL_VCO_DIV_CLK,
 };
 
+static struct clk_alpha_pll disp_cc_pll0 = {
+	.offset = 0x0,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "disp_cc_pll0",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "bi_tcxo", .name = "bi_tcxo",
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fabia_ops,
+		},
+	},
+};
+
 static const struct parent_map disp_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
@@ -40,11 +55,11 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const disp_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"dsi0_phy_pll_out_byteclk",
-	"dsi1_phy_pll_out_byteclk",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data disp_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .fw_name = "dsi0_phy_pll_out_byteclk", .name = "dsi0_phy_pll_out_byteclk" },
+	{ .fw_name = "dsi1_phy_pll_out_byteclk", .name = "dsi1_phy_pll_out_byteclk" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
@@ -54,11 +69,11 @@ static const struct parent_map disp_cc_parent_map_1[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const disp_cc_parent_names_1[] = {
-	"bi_tcxo",
-	"dp_link_clk_divsel_ten",
-	"dp_vco_divided_clk_src_mux",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data disp_cc_parent_data_1[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .fw_name = "dp_link_clk_divsel_ten", .name = "dp_link_clk_divsel_ten" },
+	{ .fw_name = "dp_vco_divided_clk_src_mux", .name = "dp_vco_divided_clk_src_mux" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
@@ -66,9 +81,9 @@ static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const disp_cc_parent_names_2[] = {
-	"bi_tcxo",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data disp_cc_parent_data_2[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -79,12 +94,12 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const disp_cc_parent_names_3[] = {
-	"bi_tcxo",
-	"disp_cc_pll0",
-	"gcc_disp_gpll0_clk_src",
-	"gcc_disp_gpll0_div_clk_src",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data disp_cc_parent_data_3[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &disp_cc_pll0.clkr.hw },
+	{ .fw_name = "gcc_disp_gpll0_clk_src", .name = "gcc_disp_gpll0_clk_src" },
+	{ .fw_name = "gcc_disp_gpll0_div_clk_src", .name = "gcc_disp_gpll0_div_clk_src" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
@@ -94,24 +109,11 @@ static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const disp_cc_parent_names_4[] = {
-	"bi_tcxo",
-	"dsi0_phy_pll_out_dsiclk",
-	"dsi1_phy_pll_out_dsiclk",
-	"core_bi_pll_test_se",
-};
-
-static struct clk_alpha_pll disp_cc_pll0 = {
-	.offset = 0x0,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
-	.clkr = {
-		.hw.init = &(struct clk_init_data){
-			.name = "disp_cc_pll0",
-			.parent_names = (const char *[]){ "bi_tcxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_fabia_ops,
-		},
-	},
+static const struct clk_parent_data disp_cc_parent_data_4[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .fw_name = "dsi0_phy_pll_out_dsiclk", .name = "dsi0_phy_pll_out_dsiclk" },
+	{ .fw_name = "dsi1_phy_pll_out_dsiclk", .name = "dsi1_phy_pll_out_dsiclk" },
+	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 /* Return the HW recalc rate for idle use case */
@@ -122,7 +124,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.parent_map = disp_cc_parent_map_0,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte0_clk_src",
-		.parent_names = disp_cc_parent_names_0,
+		.parent_data = disp_cc_parent_data_0,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
@@ -137,7 +139,7 @@ static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
 	.parent_map = disp_cc_parent_map_0,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte1_clk_src",
-		.parent_names = disp_cc_parent_names_0,
+		.parent_data = disp_cc_parent_data_0,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
@@ -157,7 +159,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_dp_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_aux_clk_src",
-		.parent_names = disp_cc_parent_names_2,
+		.parent_data = disp_cc_parent_data_2,
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -171,7 +173,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_crypto_clk_src",
-		.parent_names = disp_cc_parent_names_1,
+		.parent_data = disp_cc_parent_data_1,
 		.num_parents = 4,
 		.ops = &clk_byte2_ops,
 	},
@@ -184,7 +186,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
-		.parent_names = disp_cc_parent_names_1,
+		.parent_data = disp_cc_parent_data_1,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
@@ -198,7 +200,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel1_clk_src",
-		.parent_names = disp_cc_parent_names_1,
+		.parent_data = disp_cc_parent_data_1,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
@@ -212,7 +214,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel_clk_src",
-		.parent_names = disp_cc_parent_names_1,
+		.parent_data = disp_cc_parent_data_1,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
@@ -232,7 +234,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc0_clk_src",
-		.parent_names = disp_cc_parent_names_0,
+		.parent_data = disp_cc_parent_data_0,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -246,7 +248,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc1_clk_src",
-		.parent_names = disp_cc_parent_names_0,
+		.parent_data = disp_cc_parent_data_0,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -273,7 +275,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_mdp_clk_src",
-		.parent_names = disp_cc_parent_names_3,
+		.parent_data = disp_cc_parent_data_3,
 		.num_parents = 5,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -287,7 +289,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 	.parent_map = disp_cc_parent_map_4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk0_clk_src",
-		.parent_names = disp_cc_parent_names_4,
+		.parent_data = disp_cc_parent_data_4,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
@@ -302,7 +304,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 	.parent_map = disp_cc_parent_map_4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk1_clk_src",
-		.parent_names = disp_cc_parent_names_4,
+		.parent_data = disp_cc_parent_data_4,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
@@ -326,7 +328,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_rot_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_rot_clk_src",
-		.parent_names = disp_cc_parent_names_3,
+		.parent_data = disp_cc_parent_data_3,
 		.num_parents = 5,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -340,7 +342,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_vsync_clk_src",
-		.parent_names = disp_cc_parent_names_2,
+		.parent_data = disp_cc_parent_data_2,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -381,8 +383,8 @@ static struct clk_branch disp_cc_mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -399,8 +401,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_div_clk_src",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_regmap_div_ops,
@@ -417,8 +419,8 @@ static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_intf_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte0_div_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -436,8 +438,8 @@ static struct clk_branch disp_cc_mdss_byte1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -454,8 +456,8 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_div_clk_src",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_regmap_div_ops,
@@ -472,8 +474,8 @@ static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_intf_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte1_div_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte1_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -490,8 +492,8 @@ static struct clk_branch disp_cc_mdss_dp_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_aux_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_aux_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -508,8 +510,8 @@ static struct clk_branch disp_cc_mdss_dp_crypto_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_crypto_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_crypto_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_crypto_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -526,8 +528,8 @@ static struct clk_branch disp_cc_mdss_dp_link_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_link_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -545,8 +547,8 @@ static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link_intf_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_link_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -562,8 +564,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_pixel1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_pixel1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_pixel1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -580,8 +582,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_pixel_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_pixel_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_pixel_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -598,8 +600,8 @@ static struct clk_branch disp_cc_mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_esc0_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_esc0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_esc0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -616,8 +618,8 @@ static struct clk_branch disp_cc_mdss_esc1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_esc1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_esc1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_esc1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -634,8 +636,8 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_mdp_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_mdp_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -652,8 +654,8 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_mdp_lut_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_mdp_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -670,8 +672,8 @@ static struct clk_branch disp_cc_mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_pclk0_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_pclk0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_pclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -689,8 +691,8 @@ static struct clk_branch disp_cc_mdss_pclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_pclk1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_pclk1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_pclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -707,8 +709,8 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rot_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_rot_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_rot_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -738,8 +740,8 @@ static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rscc_vsync_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_vsync_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -756,8 +758,8 @@ static struct clk_branch disp_cc_mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_vsync_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_vsync_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

