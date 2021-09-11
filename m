Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FC39407687
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 14:15:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235790AbhIKMQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 08:16:14 -0400
Received: from relay08.th.seeweb.it ([5.144.164.169]:54935 "EHLO
        relay08.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235780AbhIKMPO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 08:15:14 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 86B413F40D;
        Sat, 11 Sep 2021 14:13:59 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] clk: qcom: mmcc-msm8998: Use ARRAY_SIZE for num_parents
Date:   Sat, 11 Sep 2021 14:13:37 +0200
Message-Id: <20210911121340.261920-6-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911121340.261920-1-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Where possible, use ARRAY_SIZE to determine the number of parents in
clk_parent_data, instead of hardcoding it.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/mmcc-msm8998.c | 78 ++++++++++++++++-----------------
 1 file changed, 39 insertions(+), 39 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index 467dadccde02..a5ab6abe62bf 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -518,7 +518,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
 		.parent_data = mmss_xo_dsibyte,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -531,7 +531,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte1_clk_src",
 		.parent_data = mmss_xo_dsibyte,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -552,7 +552,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -576,7 +576,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -599,7 +599,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -612,7 +612,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -625,7 +625,7 @@ static struct clk_rcg2 csi2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -638,7 +638,7 @@ static struct clk_rcg2 csi3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi3_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -660,7 +660,7 @@ static struct clk_rcg2 csiphy_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csiphy_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -679,7 +679,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -692,7 +692,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -705,7 +705,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2phytimer_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -723,7 +723,7 @@ static struct clk_rcg2 dp_aux_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "dp_aux_clk_src",
 		.parent_data = mmss_xo_gpll0_gpll0_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -743,7 +743,7 @@ static struct clk_rcg2 dp_crypto_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "dp_crypto_clk_src",
 		.parent_data = mmss_xo_dp,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_dp),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -763,7 +763,7 @@ static struct clk_rcg2 dp_link_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "dp_link_clk_src",
 		.parent_data = mmss_xo_dp,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_dp),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -783,7 +783,7 @@ static struct clk_rcg2 dp_pixel_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "dp_pixel_clk_src",
 		.parent_data = mmss_xo_dp,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_dp),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -801,7 +801,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
 		.parent_data = mmss_xo_dsibyte,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -814,7 +814,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc1_clk_src",
 		.parent_data = mmss_xo_dsibyte,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -832,7 +832,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "extpclk_clk_src",
 		.parent_data = mmss_xo_hdmi,
-		.num_parents = 3,
+		.num_parents = ARRAY_SIZE(mmss_xo_hdmi),
 		.ops = &clk_byte_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -855,7 +855,7 @@ static struct clk_rcg2 fd_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "fd_core_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -873,7 +873,7 @@ static struct clk_rcg2 hdmi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_clk_src",
 		.parent_data = mmss_xo_gpll0_gpll0_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -894,7 +894,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -916,7 +916,7 @@ static struct clk_rcg2 maxi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "maxi_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -943,7 +943,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
 		.parent_data = mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -956,7 +956,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
 		.parent_data = mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -969,7 +969,7 @@ static struct clk_rcg2 mclk2_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk2_clk_src",
 		.parent_data = mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -982,7 +982,7 @@ static struct clk_rcg2 mclk3_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk3_clk_src",
 		.parent_data = mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1008,7 +1008,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1026,7 +1026,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
 		.parent_data = mmss_xo_gpll0_gpll0_div,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1046,7 +1046,7 @@ static struct clk_rcg2 ahb_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ahb_clk_src",
 		.parent_data = mmss_xo_mmpll0_gpll0_gpll0_div,
-		.num_parents = 5,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1069,7 +1069,7 @@ static struct clk_rcg2 axi_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "axi_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1082,7 +1082,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
 		.parent_data = mmss_xo_dsi0pll_dsi1pll,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsi0pll_dsi1pll),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1096,7 +1096,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk1_clk_src",
 		.parent_data = mmss_xo_dsi0pll_dsi1pll,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(mmss_xo_dsi0pll_dsi1pll),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -1118,7 +1118,7 @@ static struct clk_rcg2 rot_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rot_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div,
-		.num_parents = 6,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1140,7 +1140,7 @@ static struct clk_rcg2 video_core_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_core_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1153,7 +1153,7 @@ static struct clk_rcg2 video_subcore0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_subcore0_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1166,7 +1166,7 @@ static struct clk_rcg2 video_subcore1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_subcore1_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div,
-		.num_parents = 7,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1191,7 +1191,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1204,7 +1204,7 @@ static struct clk_rcg2 vfe1_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe1_clk_src",
 		.parent_data = mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div,
-		.num_parents = 8,
+		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.33.0

