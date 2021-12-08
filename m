Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F7E46DA75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 18:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238313AbhLHR6J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 12:58:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233964AbhLHR6J (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 12:58:09 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A4BFC061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 09:54:37 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id p8so5101480ljo.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Dec 2021 09:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=M5FyoFqRVs4gEQOdo+GDads/mfbVI+VwCCol7pwwbOo=;
        b=l76+PvOA47FvSVOBw2fo0M5GFJh1NLpJ0m4KrxSSxGlUvytVpv1X7jXt5upqmSHt+I
         JoHv1CtJYFDRkBYnHTbkmAZSzuomn9wvcvyBa9E1i5b72VywWRoYVednWC0e4XQ6dD1Y
         yFIzLIYtA+Jgjji8crlWaMCziYDnQ6fmR+X3joB4bMKiwBpQvN9bwarUtR5ZlWY7LOAY
         k4uwr6Wi6wt9oAgprPLvpQEmvLjefuphRdNi4SpBlokFMkXVNFM/2v8Iue5t9ZRaHPcB
         TS0zZv4EyfZSfchlbBQkZ3fmMSepfv62Y9usIj3tYhGT4kLjDE4K3ldbhKm5HO1yyVBK
         OYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=M5FyoFqRVs4gEQOdo+GDads/mfbVI+VwCCol7pwwbOo=;
        b=jr/OHIueLMgLXLkuZ0VrX7LhDrZmFxn5OxjS30pZRga11Pt4zo2krM7iETVOWvdCdR
         Ph7NaMCKU2oPMmGYzpxr7O4EmzzfN+aWzopF4mPgeEOdGkTd8eqW3gNU8aQw7qV+1P8k
         oh1rhcqwNLR83+OPY5zstF7X2Eu9BUbV9bxuoC6MTbSsf803bA/nWePJtUCdpUslvfdR
         w0vH7DW3meMMEuiGyQbMjJrFDeDdzztj0bXNkjlzOQJDe+F8JHXSROrgjqbYqIQ77a3U
         /I0QeT5onkCGYFKoLnYdRU/JcIEi0gXJCCtkreXqEUOhReOexBNoLJD3WDXNxUjDBSxG
         WtKg==
X-Gm-Message-State: AOAM531BqJqAKb1RVanqwliUKaqg7LNx07czU8S7gjFoPwcPiVtTfKoE
        oPyT9hj9zb616020avBfJoMMVA==
X-Google-Smtp-Source: ABdhPJyrf/R/CxS2KM9505ybuIKzKlKEyceQKryrCDPcWLzr8busBOSFL5sJ6wfS7Zg8NKe06ZYspA==
X-Received: by 2002:a2e:b8cc:: with SMTP id s12mr878805ljp.489.1638986075263;
        Wed, 08 Dec 2021 09:54:35 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:34 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 03/11] clk: qcom: camcc-sc7180: get rid of the test clock
Date:   Wed,  8 Dec 2021 20:54:22 +0300
Message-Id: <20211208175430.1333594-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/camcc-sc7180.c | 65 +++++++++++++--------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sc7180.c b/drivers/clk/qcom/camcc-sc7180.c
index ce73ee9037cb..3c15e551419f 100644
--- a/drivers/clk/qcom/camcc-sc7180.c
+++ b/drivers/clk/qcom/camcc-sc7180.c
@@ -29,7 +29,6 @@ enum {
 	P_CAM_CC_PLL2_OUT_AUX,
 	P_CAM_CC_PLL2_OUT_EARLY,
 	P_CAM_CC_PLL3_OUT_MAIN,
-	P_CORE_BI_PLL_TEST_SE,
 };
 
 static const struct pll_vco agera_vco[] = {
@@ -187,26 +186,22 @@ static const struct parent_map cam_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &cam_cc_pll1.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_1[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_CAM_CC_PLL2_OUT_AUX, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_1[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &cam_cc_pll2_out_aux.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_2[] = {
@@ -214,7 +209,6 @@ static const struct parent_map cam_cc_parent_map_2[] = {
 	{ P_CAM_CC_PLL2_OUT_EARLY, 4 },
 	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_2[] = {
@@ -222,7 +216,6 @@ static const struct clk_parent_data cam_cc_parent_data_2[] = {
 	{ .hw = &cam_cc_pll2_out_early.hw },
 	{ .hw = &cam_cc_pll3.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_3[] = {
@@ -231,7 +224,6 @@ static const struct parent_map cam_cc_parent_map_3[] = {
 	{ P_CAM_CC_PLL2_OUT_EARLY, 4 },
 	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_3[] = {
@@ -240,33 +232,28 @@ static const struct clk_parent_data cam_cc_parent_data_3[] = {
 	{ .hw = &cam_cc_pll2_out_early.hw },
 	{ .hw = &cam_cc_pll3.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &cam_cc_pll3.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_5[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_5[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map cam_cc_parent_map_6[] = {
@@ -274,7 +261,6 @@ static const struct parent_map cam_cc_parent_map_6[] = {
 	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
 	{ P_CAM_CC_PLL3_OUT_MAIN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data cam_cc_parent_data_6[] = {
@@ -282,7 +268,6 @@ static const struct clk_parent_data cam_cc_parent_data_6[] = {
 	{ .hw = &cam_cc_pll1.clkr.hw },
 	{ .hw = &cam_cc_pll3.clkr.hw },
 	{ .hw = &cam_cc_pll0.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
@@ -303,7 +288,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_bps_clk_src",
 		.parent_data = cam_cc_parent_data_2,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -324,7 +309,7 @@ static struct clk_rcg2 cam_cc_cci_0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cci_0_clk_src",
 		.parent_data = cam_cc_parent_data_5,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -338,7 +323,7 @@ static struct clk_rcg2 cam_cc_cci_1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cci_1_clk_src",
 		.parent_data = cam_cc_parent_data_5,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_5),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -359,7 +344,7 @@ static struct clk_rcg2 cam_cc_cphy_rx_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_cphy_rx_clk_src",
 		.parent_data = cam_cc_parent_data_3,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -378,7 +363,7 @@ static struct clk_rcg2 cam_cc_csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi0phytimer_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -392,7 +377,7 @@ static struct clk_rcg2 cam_cc_csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi1phytimer_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -406,7 +391,7 @@ static struct clk_rcg2 cam_cc_csi2phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi2phytimer_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -420,7 +405,7 @@ static struct clk_rcg2 cam_cc_csi3phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_csi3phytimer_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -442,7 +427,7 @@ static struct clk_rcg2 cam_cc_fast_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_fast_ahb_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -465,7 +450,7 @@ static struct clk_rcg2 cam_cc_icp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_icp_clk_src",
 		.parent_data = cam_cc_parent_data_2,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -487,7 +472,7 @@ static struct clk_rcg2 cam_cc_ife_0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_clk_src",
 		.parent_data = cam_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -509,7 +494,7 @@ static struct clk_rcg2 cam_cc_ife_0_csid_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_0_csid_clk_src",
 		.parent_data = cam_cc_parent_data_3,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -523,7 +508,7 @@ static struct clk_rcg2 cam_cc_ife_1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_clk_src",
 		.parent_data = cam_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -537,7 +522,7 @@ static struct clk_rcg2 cam_cc_ife_1_csid_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_1_csid_clk_src",
 		.parent_data = cam_cc_parent_data_3,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -551,7 +536,7 @@ static struct clk_rcg2 cam_cc_ife_lite_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_clk_src",
 		.parent_data = cam_cc_parent_data_4,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -566,7 +551,7 @@ static struct clk_rcg2 cam_cc_ife_lite_csid_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ife_lite_csid_clk_src",
 		.parent_data = cam_cc_parent_data_3,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -589,7 +574,7 @@ static struct clk_rcg2 cam_cc_ipe_0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_ipe_0_clk_src",
 		.parent_data = cam_cc_parent_data_2,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -612,7 +597,7 @@ static struct clk_rcg2 cam_cc_jpeg_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_jpeg_clk_src",
 		.parent_data = cam_cc_parent_data_2,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_2),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -634,7 +619,7 @@ static struct clk_rcg2 cam_cc_lrme_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_lrme_clk_src",
 		.parent_data = cam_cc_parent_data_6,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_6),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -655,7 +640,7 @@ static struct clk_rcg2 cam_cc_mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk0_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -669,7 +654,7 @@ static struct clk_rcg2 cam_cc_mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk1_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -683,7 +668,7 @@ static struct clk_rcg2 cam_cc_mclk2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk2_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -697,7 +682,7 @@ static struct clk_rcg2 cam_cc_mclk3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk3_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -711,7 +696,7 @@ static struct clk_rcg2 cam_cc_mclk4_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_mclk4_clk_src",
 		.parent_data = cam_cc_parent_data_1,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_1),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -730,7 +715,7 @@ static struct clk_rcg2 cam_cc_slow_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cam_cc_slow_ahb_clk_src",
 		.parent_data = cam_cc_parent_data_0,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
 		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.33.0

