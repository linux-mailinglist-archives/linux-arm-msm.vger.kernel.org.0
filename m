Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA018149142
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2020 23:44:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387559AbgAXWnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jan 2020 17:43:53 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34496 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387435AbgAXWnW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jan 2020 17:43:22 -0500
Received: by mail-pf1-f196.google.com with SMTP id i6so1810593pfc.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jan 2020 14:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WwMmfsPkXdXCpaGsa/Vhjbeiu4wcqbZZLVDwLapzju4=;
        b=V2NA5DrGCfEhQgH9jV86zkbxJnkeRBelGIWAFB97cPgMuGMopB1kx/VIBF3t8ZswoL
         XVlURC/Q7V2+fK/5NFs18VgfPm0YfDfIZql6rDGJCazPqE9rjkLyMi2Os7KONIl49Wop
         VsfQ5cOrJMXbbi0CifDItHNoEiHEiZAoKp2MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WwMmfsPkXdXCpaGsa/Vhjbeiu4wcqbZZLVDwLapzju4=;
        b=IlvjmBTg1eHExeAdh7C6Sdli1UjIYue2DFdqeY2+vnjtc2qyMlyfaPp3Vk5RtqDR5s
         9DJhUpzGho6Me2ciP3mpEHWghDdxlIGfSU5YkQw2wao+DoYQPpylLZwdbuokWFoCrFOx
         V0Y0k1cL/lAyT1uhtbisnZw3IwzX2OMWhAukZ/9hOSAR59bXIoMtL74+lmtxEGbE+IEo
         H8FRWFh0yZYxsgYqQxpmTqPynNfxjuebD269nTYNMSFdapu2txcMtkdvMPZVRlk4W4o8
         sShELyGODE4RcFwp6yOIbe5pLGN9YiTOy8PhU2SeQkLCG09RkuSQ450pjdI8EZd9ksAp
         jm0g==
X-Gm-Message-State: APjAAAXYz+QeOFABpo31n4+D+JBzIT33fuoqI9mgXrJ0lZCGgTt34+HW
        WpsXtrHdL5Wa6DW0UgVzsfgW8g==
X-Google-Smtp-Source: APXvYqz09IB9wjq2TIbSib3i7IBWc2d69f4jcnNd7AKOKXWKfAq7g+mY64Cbl3ttZtEXDtRT6EGNZg==
X-Received: by 2002:aa7:864a:: with SMTP id a10mr5567180pfo.233.1579905801319;
        Fri, 24 Jan 2020 14:43:21 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id o2sm7690948pjo.26.2020.01.24.14.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 14:43:20 -0800 (PST)
From:   Douglas Anderson <dianders@chromium.org>
To:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@codeaurora.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, harigovi@codeaurora.org,
        mka@chromium.org, kalyan_t@codeaurora.org,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        hoegsberg@chromium.org, Douglas Anderson <dianders@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/10] clk: qcom: Fix sc7180 dispcc parent data
Date:   Fri, 24 Jan 2020 14:42:20 -0800
Message-Id: <20200124144154.v2.5.If590c468722d2985cea63adf60c0d2b3098f37d9@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200124224225.22547-1-dianders@chromium.org>
References: <20200124224225.22547-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The bindings file (qcom,dispcc.yaml) says that the two clocks that
dispcc is a client of are named "xo" and "gpll0".  That means we have
to refer to them by those names.  We weren't referring to "xo"
properly in the driver.

Then, in the patch ("dt-bindings: clock: Fix qcom,dispcc bindings for
sdm845/sc7180") we clarify the names for all of the clocks that we are
a client of.  Fix all those too, also getting rid of the "fallback"
names for them.  Since sc7180 is still in infancy there is no reason
to specify a fallback name.  People should just get the device tree
right.

Since we didn't add the "test" clock to the bindings (apparently it's
never used), kill it from the driver.  If someone has a use for it we
should add it to the bindings and bring it back.

Instead of updating all of the sizes of the arrays now that the test
clock is gone, switch to using the less error-prone ARRAY_SIZE.  Not
sure why it didn't always use that.

Fixes: dd3d06622138 ("clk: qcom: Add display clock controller driver for SC7180")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Patch ("clk: qcom: Fix sc7180 dispcc parent data") new for v2.

 drivers/clk/qcom/dispcc-sc7180.c | 63 ++++++++++++--------------------
 1 file changed, 24 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc7180.c b/drivers/clk/qcom/dispcc-sc7180.c
index 30c1e25d3edb..380eca3f847d 100644
--- a/drivers/clk/qcom/dispcc-sc7180.c
+++ b/drivers/clk/qcom/dispcc-sc7180.c
@@ -43,7 +43,7 @@ static struct clk_alpha_pll disp_cc_pll0 = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_pll0",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo",
+				.fw_name = "xo",
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fabia_ops,
@@ -76,40 +76,32 @@ static struct clk_alpha_pll_postdiv disp_cc_pll0_out_even = {
 
 static const struct parent_map disp_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_0[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "xo" },
 };
 
 static const struct parent_map disp_cc_parent_map_1[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DP_PHY_PLL_LINK_CLK, 1 },
 	{ P_DP_PHY_PLL_VCO_DIV_CLK, 2 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_1[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dp_phy_pll_link_clk", .name = "dp_phy_pll_link_clk" },
-	{ .fw_name = "dp_phy_pll_vco_div_clk",
-				.name = "dp_phy_pll_vco_div_clk"},
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "xo" },
+	{ .fw_name = "dp_phy_pll_link" },
+	{ .fw_name = "dp_phy_pll_vco_div" },
 };
 
 static const struct parent_map disp_cc_parent_map_2[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_2[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_byteclk",
-				.name = "dsi0_phy_pll_out_byteclk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "xo" },
+	{ .fw_name = "dsi_phy_pll_byte" },
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
@@ -117,40 +109,33 @@ static const struct parent_map disp_cc_parent_map_3[] = {
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
 	{ P_GPLL0_OUT_MAIN, 4 },
 	{ P_DISP_CC_PLL0_OUT_EVEN, 5 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .fw_name = "bi_tcxo" },
+	{ .fw_name = "xo" },
 	{ .hw = &disp_cc_pll0.clkr.hw },
-	{ .fw_name = "gcc_disp_gpll0_clk_src" },
+	{ .fw_name = "gpll0" },
 	{ .hw = &disp_cc_pll0_out_even.clkr.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map disp_cc_parent_map_4[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_GPLL0_OUT_MAIN, 4 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_4[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "gcc_disp_gpll0_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "xo" },
+	{ .fw_name = "gpll0" },
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .fw_name = "bi_tcxo" },
-	{ .fw_name = "dsi0_phy_pll_out_dsiclk",
-				.name = "dsi0_phy_pll_out_dsiclk" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "xo" },
+	{ .fw_name = "dsi_phy_pll_pixel" },
 };
 
 static const struct freq_tbl ftbl_disp_cc_mdss_ahb_clk_src[] = {
@@ -169,7 +154,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_ahb_clk_src",
 		.parent_data = disp_cc_parent_data_4,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -183,7 +168,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte0_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -203,7 +188,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_aux_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -216,7 +201,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_crypto_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -230,7 +215,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -244,7 +229,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel_clk_src",
 		.parent_data = disp_cc_parent_data_1,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
 	},
@@ -259,7 +244,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc0_clk_src",
 		.parent_data = disp_cc_parent_data_2,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -282,7 +267,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_mdp_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -295,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_5,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -310,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_rot_clk_src",
 		.parent_data = disp_cc_parent_data_3,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
@@ -324,7 +309,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_vsync_clk_src",
 		.parent_data = disp_cc_parent_data_0,
-		.num_parents = 2,
+		.num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
-- 
2.25.0.341.g760bfbb309-goog

