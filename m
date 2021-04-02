Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9547D35308F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234161AbhDBU61 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235584AbhDBU6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:21 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94BDEC061797
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:19 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id o16so6715160ljp.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vlFFAnWw2oQS6KQuBOzl9VFGrwAtxCUu1GQdT8KGelI=;
        b=TK09IY7eKq3qvOLxDJXD5Hlp/9brUs1poXQAwIlQ66XGuEVSAbh8A3u2RGZmJqIVPh
         n+OWHTzD+igraqKQIrKWSmXjufB1UeHgE9DoyOUffZ+cG75BEvJgxpvRV3IN9uMLA5Kx
         RK+UaV+i/59fulA7hGkpPmRTKALSECV6QxSPf1qRHHg4u6dF9KYCDwpGExB7A/I+XB6z
         PiAwf3dGLGvsh++NrMi2RuFWkpQZem7vd7YbLQXa1FrT2MaIDM5EaxprvGBv5aXj5RwO
         52GOgeGEDf0dOl/tOESFcPC+yrTRLCow8gx7GhdVb/G6dfpdFfkV93D1oMcDI0FAIo12
         xDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vlFFAnWw2oQS6KQuBOzl9VFGrwAtxCUu1GQdT8KGelI=;
        b=lkudmA4RxRuLeivBXUiuwWGXskK0g1ocfGeUh6zPAit0BOWD2cwhZvPjsMkAc6A1Ep
         ZUCJ6MgbWMvLAtdoDlLcXQhJkrRRg9AlIM1qQAVL/uAqAFSRriEZIEiy3SgV4uSNNcIe
         r68/qxCwSGSpr9NQw58IROrEos7luqEjIdmRg8bO2G57uAWsRXqvAU/UbUaBZHazRoln
         l/6aYQexnNyK0sbicksghLNdDHPqofGCMbWGfUB+PkxlKm1cd9PFw0OOM/ZHi/SLrPAx
         60Fchb+ZLw6Pc9gGDXk11rn/9BIc4PBJ0pifqAdQHCVWBL1sY/wtgJ+Mr4Wrl9fJdfO+
         r7tg==
X-Gm-Message-State: AOAM533DxX7a1PHrfkdjAbxUHjLNmHAIQCsdXHKMK1qUmtSn/oTXLRls
        h+SDtI2wpSAiQkMwcV/zYbsEXg==
X-Google-Smtp-Source: ABdhPJw3Tm/4viHMIRFUMcS7XSPdG8l2PltzQzpwnQunk3MA2BUNGPOOyhAO84T11TqvI8GgZhLLGA==
X-Received: by 2002:a2e:89d4:: with SMTP id c20mr9457002ljk.169.1617397098114;
        Fri, 02 Apr 2021 13:58:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v3 15/16] clk: qcom: dispcc-sdm845: get rid of the test clock
Date:   Fri,  2 Apr 2021 23:58:03 +0300
Message-Id: <20210402205804.96507-16-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sdm845.c | 39 ++++++++++++--------------------
 1 file changed, 14 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index bf5e8a4a0230..195cecf9f294 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -21,7 +21,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_DISP_CC_PLL0_OUT_MAIN,
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
@@ -52,38 +51,32 @@ static const struct parent_map disp_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
 	{ P_DSI1_PHY_PLL_OUT_BYTECLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_byteclk", .name = "dsi0_phy_pll_out_byteclk" },
 	{ .fw_name = "dsi1_phy_pll_out_byteclk", .name = "dsi1_phy_pll_out_byteclk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DP_PHY_PLL_LINK_CLK, 1 },
 	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .fw_name = "dp_link_clk_divsel_ten", .name = "dp_link_clk_divsel_ten" },
 	{ .fw_name = "dp_vco_divided_clk_src_mux", .name = "dp_vco_divided_clk_src_mux" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -91,7 +84,6 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
 	{ P_GPLL0_OUT_MAIN, 4 },
 	{ P_GPLL0_OUT_MAIN_DIV, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
@@ -99,21 +91,18 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
 	{ .hw = &disp_cc_pll0.clkr.hw },
 	{ .fw_name = "gcc_disp_gpll0_clk_src", .name = "gcc_disp_gpll0_clk_src" },
 	{ .fw_name = "gcc_disp_gpll0_div_clk_src", .name = "gcc_disp_gpll0_div_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
 	{ P_DSI1_PHY_PLL_OUT_DSICLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_dsiclk", .name = "dsi0_phy_pll_out_dsiclk" },
 	{ .fw_name = "dsi1_phy_pll_out_dsiclk", .name = "dsi1_phy_pll_out_dsiclk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 /* Return the HW recalc rate for idle use case */
@@ -125,7 +114,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte0_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -140,7 +129,7 @@ static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte1_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -160,7 +149,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_aux_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = 1,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
 	},
@@ -174,7 +163,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_crypto_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_byte2_ops,
 	},
 };
@@ -187,7 +176,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -201,7 +190,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel1_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
@@ -215,7 +204,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
@@ -235,7 +224,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc0_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -249,7 +238,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc1_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = 3,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -276,7 +265,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -290,7 +279,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -305,7 +294,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk1_clk_src",
 		.parent_data = disp_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -329,7 +318,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -343,7 +332,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_vsync_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 2,
+		.num_parents = 1,
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.30.2

