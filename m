Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B7A40767C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 14:14:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbhIKMPT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 08:15:19 -0400
Received: from relay06.th.seeweb.it ([5.144.164.167]:60085 "EHLO
        relay06.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235824AbhIKMPP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 08:15:15 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id D5BE13F46F;
        Sat, 11 Sep 2021 14:14:01 +0200 (CEST)
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
Subject: [PATCH 8/8] clk: qcom: mmcc-msm8998: Remove unnecessary fallbacks to global clocks
Date:   Sat, 11 Sep 2021 14:13:40 +0200
Message-Id: <20210911121340.261920-9-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911121340.261920-1-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A previous patch removes the "xo" clock from the global namespace making
it impossible to acquire by that ".name".  The device-tree for msm8998
currently does not include an mmcc node but the dt-bindings for this
compatible already require all these clocks, and the patch introducing
this node [1] also includes them.

[1]: https://patchwork.kernel.org/project/linux-arm-msm/patch/20210901183123.1087392-1-angelogioacchino.delregno@somainline.org/

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/mmcc-msm8998.c | 105 +++++++++++++++-----------------
 1 file changed, 48 insertions(+), 57 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8998.c b/drivers/clk/qcom/mmcc-msm8998.c
index a5ab6abe62bf..c421b1291651 100644
--- a/drivers/clk/qcom/mmcc-msm8998.c
+++ b/drivers/clk/qcom/mmcc-msm8998.c
@@ -53,8 +53,7 @@ static struct clk_fixed_factor gpll0_div = {
 	.hw.init = &(struct clk_init_data){
 		.name = "mmss_gpll0_div",
 		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "gpll0",
-			.name = "gpll0"
+			.fw_name = "gpll0"
 		},
 		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
@@ -78,8 +77,7 @@ static struct clk_alpha_pll mmpll0 = {
 		.hw.init = &(struct clk_init_data){
 			.name = "mmpll0",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "xo",
-				.name = "xo"
+				.fw_name = "xo"
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fixed_fabia_ops,
@@ -111,8 +109,7 @@ static struct clk_alpha_pll mmpll1 = {
 		.hw.init = &(struct clk_init_data){
 			.name = "mmpll1",
 			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "xo",
-				.name = "xo"
+				.fw_name = "xo"
 			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fixed_fabia_ops,
@@ -141,8 +138,7 @@ static struct clk_alpha_pll mmpll3 = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll3",
 		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "xo",
-			.name = "xo"
+			.fw_name = "xo"
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_fixed_fabia_ops,
@@ -170,8 +166,7 @@ static struct clk_alpha_pll mmpll4 = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll4",
 		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "xo",
-			.name = "xo"
+			.fw_name = "xo"
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_fixed_fabia_ops,
@@ -199,8 +194,7 @@ static struct clk_alpha_pll mmpll5 = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll5",
 		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "xo",
-			.name = "xo"
+			.fw_name = "xo"
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_fixed_fabia_ops,
@@ -228,8 +222,7 @@ static struct clk_alpha_pll mmpll6 = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll6",
 		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "xo",
-			.name = "xo"
+			.fw_name = "xo"
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_fixed_fabia_ops,
@@ -257,8 +250,7 @@ static struct clk_alpha_pll mmpll7 = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll7",
 		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "xo",
-			.name = "xo"
+			.fw_name = "xo"
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_fixed_fabia_ops,
@@ -286,8 +278,7 @@ static struct clk_alpha_pll mmpll10 = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll10",
 		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "xo",
-			.name = "xo"
+			.fw_name = "xo"
 		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_fixed_fabia_ops,
@@ -316,9 +307,9 @@ static const struct parent_map mmss_xo_hdmi_map[] = {
 };
 
 static const struct clk_parent_data mmss_xo_hdmi[] = {
-	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "hdmipll", .name = "hdmipll" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "xo" },
+	{ .fw_name = "hdmipll" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
@@ -329,10 +320,10 @@ static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
 };
 
 static const struct clk_parent_data mmss_xo_dsi0pll_dsi1pll[] = {
-	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "dsi0dsi", .name = "dsi0dsi" },
-	{ .fw_name = "dsi1dsi", .name = "dsi1dsi" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "xo" },
+	{ .fw_name = "dsi0dsi" },
+	{ .fw_name = "dsi1dsi" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_dsibyte_map[] = {
@@ -343,10 +334,10 @@ static const struct parent_map mmss_xo_dsibyte_map[] = {
 };
 
 static const struct clk_parent_data mmss_xo_dsibyte[] = {
-	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "dsi0byte", .name = "dsi0byte" },
-	{ .fw_name = "dsi1byte", .name = "dsi1byte" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "xo" },
+	{ .fw_name = "dsi0byte" },
+	{ .fw_name = "dsi1byte" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_dp_map[] = {
@@ -357,10 +348,10 @@ static const struct parent_map mmss_xo_dp_map[] = {
 };
 
 static const struct clk_parent_data mmss_xo_dp[] = {
-	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "dplink", .name = "dplink" },
-	{ .fw_name = "dpvco", .name = "dpvco" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "xo" },
+	{ .fw_name = "dplink" },
+	{ .fw_name = "dpvco" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
@@ -371,10 +362,10 @@ static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
 };
 
 static const struct clk_parent_data mmss_xo_gpll0_gpll0_div[] = {
-	{ .fw_name = "xo", .name = "xo" },
-	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "xo" },
+	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
@@ -386,11 +377,11 @@ static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_gpll0_gpll0_div[] = {
-	{ .fw_name = "xo", .name = "xo" },
+	{ .fw_name = "xo" },
 	{ .hw = &mmpll0_out_even.clkr.hw },
-	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
@@ -403,12 +394,12 @@ static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
-	{ .fw_name = "xo", .name = "xo" },
+	{ .fw_name = "xo" },
 	{ .hw = &mmpll0_out_even.clkr.hw },
 	{ .hw = &mmpll1_out_even.clkr.hw },
-	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
@@ -421,12 +412,12 @@ static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
-	{ .fw_name = "xo", .name = "xo" },
+	{ .fw_name = "xo" },
 	{ .hw = &mmpll0_out_even.clkr.hw },
 	{ .hw = &mmpll5_out_even.clkr.hw },
-	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div_map[] = {
@@ -440,13 +431,13 @@ static const struct parent_map mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div_map[
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll3_mmpll6_gpll0_gpll0_div[] = {
-	{ .fw_name = "xo", .name = "xo" },
+	{ .fw_name = "xo" },
 	{ .hw = &mmpll0_out_even.clkr.hw },
 	{ .hw = &mmpll3_out_even.clkr.hw },
 	{ .hw = &mmpll6_out_even.clkr.hw },
-	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div_map[] = {
@@ -460,13 +451,13 @@ static const struct parent_map mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div_map
 };
 
 static const struct clk_parent_data mmss_xo_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div[] = {
-	{ .fw_name = "xo", .name = "xo" },
+	{ .fw_name = "xo" },
 	{ .hw = &mmpll4_out_even.clkr.hw },
 	{ .hw = &mmpll7_out_even.clkr.hw },
 	{ .hw = &mmpll10_out_even.clkr.hw },
-	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div_map[] = {
@@ -480,13 +471,13 @@ static const struct parent_map mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div_map
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll7_mmpll10_gpll0_gpll0_div[] = {
-	{ .fw_name = "xo", .name = "xo" },
+	{ .fw_name = "xo" },
 	{ .hw = &mmpll0_out_even.clkr.hw },
 	{ .hw = &mmpll7_out_even.clkr.hw },
 	{ .hw = &mmpll10_out_even.clkr.hw },
-	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div_map[] = {
@@ -501,14 +492,14 @@ static const struct parent_map mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_
 };
 
 static const struct clk_parent_data mmss_xo_mmpll0_mmpll4_mmpll7_mmpll10_gpll0_gpll0_div[] = {
-	{ .fw_name = "xo", .name = "xo" },
+	{ .fw_name = "xo" },
 	{ .hw = &mmpll0_out_even.clkr.hw },
 	{ .hw = &mmpll4_out_even.clkr.hw },
 	{ .hw = &mmpll7_out_even.clkr.hw },
 	{ .hw = &mmpll10_out_even.clkr.hw },
-	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "gpll0" },
 	{ .hw = &gpll0_div.hw },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static struct clk_rcg2 byte0_clk_src = {
-- 
2.33.0

