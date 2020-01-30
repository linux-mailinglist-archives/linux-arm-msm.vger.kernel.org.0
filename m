Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFC9A14E47B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jan 2020 22:13:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgA3VM5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jan 2020 16:12:57 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44987 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727824AbgA3VMz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jan 2020 16:12:55 -0500
Received: by mail-pl1-f196.google.com with SMTP id d9so1813918plo.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jan 2020 13:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kusoJ9Oev7Pj23ZWUrs+11xOFwvMD53pguR4hXEdEGM=;
        b=aNiL5acFWisbjjTjfzgrXPr9wjxck7dAlmTjQgrZCCM/2Ww2pKszK96bQNvTdaoXDI
         rKdLZiEFhEZzTrTKNTNdx8pQB8H+18Xjd1eJdZMHso7yRyUwtBMOR68F8rEnWfjW9fQt
         RfxldIPLgtVNSZVw1EEsSFvXkOroxIXPKQFZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kusoJ9Oev7Pj23ZWUrs+11xOFwvMD53pguR4hXEdEGM=;
        b=XswGMVc3JWZWfG+q5M+CYJaEEz9xtzIncZxRKF71Q7qpqahFpprP6U/1E60Fehwgy8
         jsVbBykprf7w7yNegw2o2zttwq7a1cqxy7dGMRWNTVD115cWV/R/zVieWlj66j+DcWbm
         0bBQlLQlMB3usAoKugj2hA02TEZLbGzuOHobR0d5YbOtl0dkOi4lHF3kTq7V0UolqWdj
         /r+LdX4mIAk6VP8be5uxsMMsLm4ELM8xl9L3prvcGtqcw8bh5LiMKxmCu3G9pI6V1EvD
         jhT/01FMx6HXeOGTKZTERAg37m0c8gdS+YpfI/BTfGgPG9gRlKbp3I22lvrqQosu/d12
         4tPA==
X-Gm-Message-State: APjAAAX9hm+lkArovMcGA5BsS0lFCKInPwjXZgBYj7ELv+AkxBc5AFKI
        X77+it5cTyWrp91INm+V5R2HOQ==
X-Google-Smtp-Source: APXvYqwe0qRkaWDidOrdKnE8oUdTw6jxlBtUuBHq5uav5aVOIgtlL/9m1Dd9HvFykYt2bddO1/EEYA==
X-Received: by 2002:a17:902:b587:: with SMTP id a7mr6703883pls.82.1580418774669;
        Thu, 30 Jan 2020 13:12:54 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id ci5sm4343871pjb.5.2020.01.30.13.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2020 13:12:54 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, jeffrey.l.hugo@gmail.com,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        devicetree@vger.kernel.org, mka@chromium.org,
        kalyan_t@codeaurora.org, Mark Rutland <mark.rutland@arm.com>,
        linux-clk@vger.kernel.org, hoegsberg@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/15] clk: qcom: Get rid of the test clock for dispcc-sc7180
Date:   Thu, 30 Jan 2020 13:12:21 -0800
Message-Id: <20200130131220.v3.5.I28ac8f801456f1b950f7da10ed0f74a1344d4a35@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200130211231.224656-1-dianders@chromium.org>
References: <20200130211231.224656-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("clk: qcom: Get rid of the test...dispcc-sc7180") split out for v3.

Changes in v2: None

 drivers/clk/qcom/dispcc-sc7180.c | 32 ++++++++++----------------------
 1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index a820e1558677..397f5d9dafc8 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -76,38 +76,32 @@ static struct clk_alpha_pll_postdiv disp_cc_pll0_out_even = {
 
 static const struct parent_map disp_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
 	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DP_PHY_PLL_LINK_CLK, 1 },
 	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dp_phy_pll_link_clk" },
 	{ .fw_name = "dp_phy_pll_vco_div_clk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_byteclk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -115,7 +109,6 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
 	{ P_GPLL0_OUT_MAIN, 4 },
 	{ P_DISP_CC_PLL0_OUT_EVEN, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
@@ -123,31 +116,26 @@ static const struct clk_parent_data disp_cc_parent_data_3[] = {
 	{ .hw = &disp_cc_pll0.clkr.hw },
 	{ .fw_name = "gcc_disp_gpll0_clk_src" },
 	{ .hw = &disp_cc_pll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 4 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "gcc_disp_gpll0_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
 	{ .fw_name = "bi_tcxo" },
 	{ .fw_name = "dsi0_phy_pll_out_dsiclk" },
-	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
@@ -166,7 +154,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_ahb_clk_src",
 		.parent_data = disp_cc_parent_data_4,
-		.num_parents = 3,
+		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -180,7 +168,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte0_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -213,7 +201,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_crypto_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -227,7 +215,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -241,7 +229,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
@@ -256,7 +244,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc0_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -279,7 +267,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -292,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_5,
-		.num_parents = 3,
+		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -307,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -321,7 +309,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_vsync_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 2,
+		.num_parents = 1,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
-- 
2.25.0.341.g760bfbb309-goog

