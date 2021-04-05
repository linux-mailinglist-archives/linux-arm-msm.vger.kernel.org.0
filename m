Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 890623548C7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Apr 2021 00:48:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242857AbhDEWsB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Apr 2021 18:48:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242853AbhDEWsB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Apr 2021 18:48:01 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42761C061788
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Apr 2021 15:47:54 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 12so19531244lfq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Apr 2021 15:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nyY12tnfi1JJhk/HnXKo+fM1P8aTeJ2dHsxTCFKcLFY=;
        b=HXpreK0BNX8HepJI8sJN+EFSRiWvye22bdauElnszh/vP2HxGZwoNUlN7ZOJljOl+N
         y3FQx2MDIGDgCObLTTEol+1yPPSHlVC7aI0F+GwAzFWhjISE6Hlp5xii9l73OlKgqJ8u
         jqO5Uzw6Twqv16tlWdde7K++gSPRNnbdMNoIVHllX7CcqiHAFr8t7F2d0lFWF0O2ntNq
         jXn0NU3HCc+BpI58fx2kYA+BkC5O0vNPgdQa90SNn+52KxDuUdYQ1rp+k8QfmMrSK76h
         l7AAjbFd3yUWEO4Mvd07Ay+27CtXV/liyFSqCJLpYTABbkBdiFofHG8Y+m9u33dpfYNL
         5JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nyY12tnfi1JJhk/HnXKo+fM1P8aTeJ2dHsxTCFKcLFY=;
        b=klfGCjTp7UkoMCpkJR6/jg21EU9diPX1jAp7t8W4rNJPByb/f8lVitKBlBjOoutqIw
         VEENzJWHDxSBnCn2sWDcdTP6EVnf8aCYoIpSTI3WNYXAn2gFpw2/FnE6n2pIWhqs7iSC
         5/zgQNJI4onu8Q4E6c0uh7lsd95RgIEOhpCi+jPFKFll2fDkFcWXJ920ktlrLJm8viaB
         82a+7cSWpEoj5LskcErDSnQ9GRnirL5Q4KbIrj37WYdUFlndEUqQ7oKAURKN4taBQsQO
         wG7lQnpEvElui1j6VK2WhcCCqstiGBcq/3NPKFMtAkGhyDn8AmMhDpM5YOw2lww0cWLT
         wM0w==
X-Gm-Message-State: AOAM533W0Vq/jRJ6pla1d6dzjA+7pqz/pShYbuZI8YHdHQVo5hoLdo3P
        NrEZno98G87V9xEp6c+kRemjZQ==
X-Google-Smtp-Source: ABdhPJygY3rHOyUp+pwuw1o3083VH+XUtSJcClHmicGEYhzkaHnSGnoNt1g/WyU3uyudVljoy6DthQ==
X-Received: by 2002:a05:6512:3d16:: with SMTP id d22mr19295134lfv.111.1617662872743;
        Mon, 05 Apr 2021 15:47:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 130sm213748lfg.263.2021.04.05.15.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 15:47:52 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 11/33] clk: qcom: dispcc-sdm845: convert to parent data
Date:   Tue,  6 Apr 2021 01:47:21 +0300
Message-Id: <20210405224743.590029-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
References: <20210405224743.590029-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sdm845.c | 216 ++++++++++++++++---------------
 1 file changed, 109 insertions(+), 107 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 5c932cd17b14..aef1024c5318 100644
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
@@ -122,8 +124,8 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.parent_map = disp_cc_parent_map_0,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte0_clk_src",
-		.parent_names = disp_cc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -137,8 +139,8 @@ static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
 	.parent_map = disp_cc_parent_map_0,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte1_clk_src",
-		.parent_names = disp_cc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -157,8 +159,8 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_dp_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_aux_clk_src",
-		.parent_names = disp_cc_parent_names_2,
-		.num_parents = 2,
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -171,8 +173,8 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_crypto_clk_src",
-		.parent_names = disp_cc_parent_names_1,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.ops = &clk_byte2_ops,
 	},
 };
@@ -184,8 +186,8 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
-		.parent_names = disp_cc_parent_names_1,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -198,8 +200,8 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel1_clk_src",
-		.parent_names = disp_cc_parent_names_1,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
@@ -212,8 +214,8 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel_clk_src",
-		.parent_names = disp_cc_parent_names_1,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_1,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
@@ -232,8 +234,8 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc0_clk_src",
-		.parent_names = disp_cc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -246,8 +248,8 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc1_clk_src",
-		.parent_names = disp_cc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -273,8 +275,8 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_mdp_clk_src",
-		.parent_names = disp_cc_parent_names_3,
-		.num_parents = 5,
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -287,8 +289,8 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 	.parent_map = disp_cc_parent_map_4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk0_clk_src",
-		.parent_names = disp_cc_parent_names_4,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -302,8 +304,8 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 	.parent_map = disp_cc_parent_map_4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk1_clk_src",
-		.parent_names = disp_cc_parent_names_4,
-		.num_parents = 4,
+		.parent_data = disp_cc_parent_data_4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -326,8 +328,8 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_rot_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_rot_clk_src",
-		.parent_names = disp_cc_parent_names_3,
-		.num_parents = 5,
+		.parent_data = disp_cc_parent_data_3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -340,8 +342,8 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_vsync_clk_src",
-		.parent_names = disp_cc_parent_names_2,
-		.num_parents = 2,
+		.parent_data = disp_cc_parent_data_2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -381,8 +383,8 @@ static struct clk_branch disp_cc_mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -399,8 +401,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_div_clk_src",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_regmap_div_ops,
@@ -417,8 +419,8 @@ static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_intf_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte0_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte0_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -436,8 +438,8 @@ static struct clk_branch disp_cc_mdss_byte1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -454,8 +456,8 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_div_clk_src",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_regmap_div_ops,
@@ -472,8 +474,8 @@ static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_intf_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte1_div_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_byte1_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -490,8 +492,8 @@ static struct clk_branch disp_cc_mdss_dp_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_aux_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_aux_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -508,8 +510,8 @@ static struct clk_branch disp_cc_mdss_dp_crypto_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_crypto_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_crypto_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_crypto_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -526,8 +528,8 @@ static struct clk_branch disp_cc_mdss_dp_link_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_link_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -545,8 +547,8 @@ static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link_intf_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_link_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -562,8 +564,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_pixel1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_pixel1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_pixel1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -580,8 +582,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_pixel_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_pixel_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_dp_pixel_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -598,8 +600,8 @@ static struct clk_branch disp_cc_mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_esc0_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_esc0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_esc0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -616,8 +618,8 @@ static struct clk_branch disp_cc_mdss_esc1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_esc1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_esc1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_esc1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -634,8 +636,8 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_mdp_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_mdp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -652,8 +654,8 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_mdp_lut_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_mdp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -670,8 +672,8 @@ static struct clk_branch disp_cc_mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_pclk0_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_pclk0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_pclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -689,8 +691,8 @@ static struct clk_branch disp_cc_mdss_pclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_pclk1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_pclk1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_pclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -707,8 +709,8 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rot_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_rot_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_rot_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -738,8 +740,8 @@ static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rscc_vsync_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_vsync_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -756,8 +758,8 @@ static struct clk_branch disp_cc_mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_vsync_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_vsync_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

