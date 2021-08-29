Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C95473FAE8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Aug 2021 22:48:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236029AbhH2Ut0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 29 Aug 2021 16:49:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234668AbhH2UtW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 29 Aug 2021 16:49:22 -0400
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [IPv6:2001:4b7a:2000:18::162])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 745AAC0617AE;
        Sun, 29 Aug 2021 13:48:28 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id AD72F1FA03;
        Sun, 29 Aug 2021 22:48:26 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] clk: qcom: mmcc-sdm660: Use ARRAY_SIZE for num_parents
Date:   Sun, 29 Aug 2021 22:48:21 +0200
Message-Id: <20210829204822.289829-4-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829204822.289829-1-marijn.suijten@somainline.org>
References: <20210829204822.289829-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Where possible, use ARRAY_SIZE to determine the number of parents in
clk_parent_data, instead of hardcoding it.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/mmcc-sdm660.c | 72 +++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-sdm660.c b/drivers/clk/qcom/mmcc-sdm660.c
index 941993bc610d..9bfce9c31ca7 100644
--- a/drivers/clk/qcom/mmcc-sdm660.c
+++ b/drivers/clk/qcom/mmcc-sdm660.c
@@ -483,7 +483,7 @@ static struct clk_rcg2 ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ahb_clk_src",
 		.parent_data = mmcc_xo_mmpll0_gpll0_gpll0_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -496,7 +496,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
 		.parent_data = mmcc_xo_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
 	},
@@ -510,7 +510,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte1_clk_src",
 		.parent_data = mmcc_xo_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
 	},
@@ -538,7 +538,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll7_mmpll10_sleep_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll7_mmpll10_sleep_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -552,7 +552,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll7_mmpll10_sleep_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll7_mmpll10_sleep_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -573,7 +573,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll7_mmpll10_sleep_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll7_mmpll10_sleep_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -597,7 +597,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_mmpll6,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_mmpll6),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -620,7 +620,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -641,7 +641,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -655,7 +655,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -669,7 +669,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -683,7 +683,7 @@ static struct clk_rcg2 csi2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -697,7 +697,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2phytimer_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -711,7 +711,7 @@ static struct clk_rcg2 csi3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi3_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -733,7 +733,7 @@ static struct clk_rcg2 csiphy_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csiphy_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll8_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -752,7 +752,7 @@ static struct clk_rcg2 dp_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "dp_aux_clk_src",
 		.parent_data = mmcc_xo_gpll0_gpll0_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -773,7 +773,7 @@ static struct clk_rcg2 dp_crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "dp_crypto_clk_src",
 		.parent_data = mmcc_xo_dplink_dpvco,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dplink_dpvco),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -793,7 +793,7 @@ static struct clk_rcg2 dp_gtc_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "dp_gtc_clk_src",
 		.parent_data = mmcc_xo_gpll0_gpll0_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -814,7 +814,7 @@ static struct clk_rcg2 dp_link_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "dp_link_clk_src",
 		.parent_data = mmcc_xo_dplink_dpvco,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dplink_dpvco),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
 	},
@@ -828,7 +828,7 @@ static struct clk_rcg2 dp_pixel_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "dp_pixel_clk_src",
 		.parent_data = mmcc_xo_dplink_dpvco,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dplink_dpvco),
 		.ops = &clk_dp_ops,
 		.flags = CLK_GET_RATE_NOCACHE | CLK_SET_RATE_PARENT,
 	},
@@ -842,7 +842,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_data = mmcc_xo_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -855,7 +855,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc1_clk_src",
 		.parent_data = mmcc_xo_dsibyte,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -878,7 +878,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -906,7 +906,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
 		.parent_data = mmcc_xo_mmpll4_mmpll7_mmpll10_sleep_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll4_mmpll7_mmpll10_sleep_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -920,7 +920,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
 		.parent_data = mmcc_xo_mmpll4_mmpll7_mmpll10_sleep_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll4_mmpll7_mmpll10_sleep_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -934,7 +934,7 @@ static struct clk_rcg2 mclk2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk2_clk_src",
 		.parent_data = mmcc_xo_mmpll4_mmpll7_mmpll10_sleep_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll4_mmpll7_mmpll10_sleep_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -948,7 +948,7 @@ static struct clk_rcg2 mclk3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk3_clk_src",
 		.parent_data = mmcc_xo_mmpll4_mmpll7_mmpll10_sleep_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll4_mmpll7_mmpll10_sleep_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -974,7 +974,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll5_mmpll7_gpll0_gpll0_div,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll5_mmpll7_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -987,7 +987,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
 		.parent_data = mmcc_xo_dsi0pll_dsi1pll,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi0pll_dsi1pll),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
 	},
@@ -1001,7 +1001,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk1_clk_src",
 		.parent_data = mmcc_xo_dsi0pll_dsi1pll,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_dsi0pll_dsi1pll),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
 	},
@@ -1025,7 +1025,7 @@ static struct clk_rcg2 rot_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rot_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll5_mmpll7_gpll0_gpll0_div,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll5_mmpll7_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1051,7 +1051,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
 		.parent_data = mmcc_mmpll0_mmpll4_mmpll7_mmpll10_mmpll6_gpll0,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_mmpll0_mmpll4_mmpll7_mmpll10_mmpll6_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1065,7 +1065,7 @@ static struct clk_rcg2 vfe1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe1_clk_src",
 		.parent_data = mmcc_mmpll0_mmpll4_mmpll7_mmpll10_mmpll6_gpll0,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_mmpll0_mmpll4_mmpll7_mmpll10_mmpll6_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1089,7 +1089,7 @@ static struct clk_rcg2 video_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_core_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll8_mmpll3_mmpll6_gpll0_mmpll7,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll8_mmpll3_mmpll6_gpll0_mmpll7),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_IS_CRITICAL,
 	},
@@ -1104,7 +1104,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
 		.parent_data = mmcc_xo_gpll0_gpll0_div,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmcc_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -2055,7 +2055,7 @@ static struct clk_rcg2 axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "axi_clk_src",
 		.parent_data = mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.33.0

