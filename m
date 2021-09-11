Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49B0740766E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 14:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235788AbhIKMPN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 08:15:13 -0400
Received: from m-r2.th.seeweb.it ([5.144.164.171]:41623 "EHLO
        m-r2.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235212AbhIKMPL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 08:15:11 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2075A3F3F2;
        Sat, 11 Sep 2021 14:13:57 +0200 (CEST)
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
Subject: [PATCH 2/8] clk: qcom: gcc-msm8998: Use parent_data/hws for internal clock relations
Date:   Sat, 11 Sep 2021 14:13:34 +0200
Message-Id: <20210911121340.261920-3-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911121340.261920-1-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use parent_data and parent_hws to specify internal relations using
pointers instead of names, and use .fw_name to retrieve external clocks
from clock-names in the DT rather than the global clock tree.

Note that this change relies on the "xo" and "sleep_clk" clocks to be
provided in DT, as per the relevant qcom,gcc-mnsm8998.yaml dt-bindings.
These clocks have been added in a prior patch [1].

[1]: https://lore.kernel.org/linux-arm-msm/20210911120101.248476-1-marijn.suijten@somainline.org/

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 522 ++++++++++++++++++---------------
 1 file changed, 281 insertions(+), 241 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index a67fb9af9e0b..9320e2ba659a 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -63,7 +63,9 @@ static struct clk_alpha_pll_postdiv gpll0_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_even",
-		.parent_names = (const char *[]){ "gpll0" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -74,7 +76,9 @@ static struct clk_alpha_pll_postdiv gpll0_out_main = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_main",
-		.parent_names = (const char *[]){ "gpll0" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -85,7 +89,9 @@ static struct clk_alpha_pll_postdiv gpll0_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_odd",
-		.parent_names = (const char *[]){ "gpll0" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -96,7 +102,9 @@ static struct clk_alpha_pll_postdiv gpll0_out_test = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0_out_test",
-		.parent_names = (const char *[]){ "gpll0" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -124,7 +132,9 @@ static struct clk_alpha_pll_postdiv gpll1_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1_out_even",
-		.parent_names = (const char *[]){ "gpll1" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll1.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -135,7 +145,9 @@ static struct clk_alpha_pll_postdiv gpll1_out_main = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1_out_main",
-		.parent_names = (const char *[]){ "gpll1" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll1.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -146,7 +158,9 @@ static struct clk_alpha_pll_postdiv gpll1_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1_out_odd",
-		.parent_names = (const char *[]){ "gpll1" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll1.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -157,7 +171,9 @@ static struct clk_alpha_pll_postdiv gpll1_out_test = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1_out_test",
-		.parent_names = (const char *[]){ "gpll1" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll1.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -185,7 +201,9 @@ static struct clk_alpha_pll_postdiv gpll2_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll2_out_even",
-		.parent_names = (const char *[]){ "gpll2" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll2.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -196,7 +214,9 @@ static struct clk_alpha_pll_postdiv gpll2_out_main = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll2_out_main",
-		.parent_names = (const char *[]){ "gpll2" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll2.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -207,7 +227,9 @@ static struct clk_alpha_pll_postdiv gpll2_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll2_out_odd",
-		.parent_names = (const char *[]){ "gpll2" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll2.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -218,7 +240,9 @@ static struct clk_alpha_pll_postdiv gpll2_out_test = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll2_out_test",
-		.parent_names = (const char *[]){ "gpll2" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll2.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -246,7 +270,9 @@ static struct clk_alpha_pll_postdiv gpll3_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll3_out_even",
-		.parent_names = (const char *[]){ "gpll3" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll3.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -257,7 +283,9 @@ static struct clk_alpha_pll_postdiv gpll3_out_main = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll3_out_main",
-		.parent_names = (const char *[]){ "gpll3" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll3.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -268,7 +296,9 @@ static struct clk_alpha_pll_postdiv gpll3_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll3_out_odd",
-		.parent_names = (const char *[]){ "gpll3" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll3.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -279,7 +309,9 @@ static struct clk_alpha_pll_postdiv gpll3_out_test = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll3_out_test",
-		.parent_names = (const char *[]){ "gpll3" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll3.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -307,7 +339,9 @@ static struct clk_alpha_pll_postdiv gpll4_out_even = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4_out_even",
-		.parent_names = (const char *[]){ "gpll4" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll4.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -318,7 +352,9 @@ static struct clk_alpha_pll_postdiv gpll4_out_main = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4_out_main",
-		.parent_names = (const char *[]){ "gpll4" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll4.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -329,7 +365,9 @@ static struct clk_alpha_pll_postdiv gpll4_out_odd = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4_out_odd",
-		.parent_names = (const char *[]){ "gpll4" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll4.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -340,7 +378,9 @@ static struct clk_alpha_pll_postdiv gpll4_out_test = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4_out_test",
-		.parent_names = (const char *[]){ "gpll4" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll4.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_fabia_ops,
 	},
@@ -363,11 +403,11 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const gcc_parent_names_0[] = {
-	"xo",
-	"gpll0_out_main",
-	"gpll0_out_main",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data gcc_parent_data_0[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
@@ -376,10 +416,10 @@ static const struct parent_map gcc_parent_map_1[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const gcc_parent_names_1[] = {
-	"xo",
-	"gpll0_out_main",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
@@ -390,12 +430,12 @@ static const struct parent_map gcc_parent_map_2[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const gcc_parent_names_2[] = {
-	"xo",
-	"gpll0_out_main",
-	"core_pi_sleep_clk",
-	"gpll0_out_main",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data gcc_parent_data_2[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .fw_name = "sleep_clk" },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
@@ -404,10 +444,10 @@ static const struct parent_map gcc_parent_map_3[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const gcc_parent_names_3[] = {
-	"xo",
-	"core_pi_sleep_clk",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data gcc_parent_data_3[] = {
+	{ .fw_name = "xo" },
+	{ .fw_name = "sleep_clk" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
@@ -417,11 +457,11 @@ static const struct parent_map gcc_parent_map_4[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const gcc_parent_names_4[] = {
-	"xo",
-	"gpll0_out_main",
-	"gpll4_out_main",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data gcc_parent_data_4[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .hw = &gpll4_out_main.clkr.hw },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
@@ -431,11 +471,11 @@ static const struct parent_map gcc_parent_map_5[] = {
 	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
-static const char * const gcc_parent_names_5[] = {
-	"xo",
-	"gpll0_out_main",
-	"aud_ref_clk",
-	"core_bi_pll_test_se",
+static const struct clk_parent_data gcc_parent_data_5[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .fw_name = "aud_ref_clk" },
+	{ .fw_name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_blsp1_qup1_i2c_apps_clk_src[] = {
@@ -452,8 +492,8 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -477,8 +517,8 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -491,8 +531,8 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -505,8 +545,8 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -519,8 +559,8 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -533,8 +573,8 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -547,8 +587,8 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -561,8 +601,8 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -575,8 +615,8 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -589,8 +629,8 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -603,8 +643,8 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -617,8 +657,8 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -650,8 +690,8 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -664,8 +704,8 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -678,8 +718,8 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart3_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -692,8 +732,8 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -706,8 +746,8 @@ static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -720,8 +760,8 @@ static struct clk_rcg2 blsp2_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -734,8 +774,8 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -748,8 +788,8 @@ static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -762,8 +802,8 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -776,8 +816,8 @@ static struct clk_rcg2 blsp2_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -790,8 +830,8 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -804,8 +844,8 @@ static struct clk_rcg2 blsp2_qup5_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -818,8 +858,8 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -832,8 +872,8 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -846,8 +886,8 @@ static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -860,8 +900,8 @@ static struct clk_rcg2 blsp2_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart1_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -874,8 +914,8 @@ static struct clk_rcg2 blsp2_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart2_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -888,8 +928,8 @@ static struct clk_rcg2 blsp2_uart3_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart3_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -909,8 +949,8 @@ static struct clk_rcg2 gp1_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
-		.parent_names = gcc_parent_names_2,
-		.num_parents = 5,
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -923,8 +963,8 @@ static struct clk_rcg2 gp2_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
-		.parent_names = gcc_parent_names_2,
-		.num_parents = 5,
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -937,8 +977,8 @@ static struct clk_rcg2 gp3_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
-		.parent_names = gcc_parent_names_2,
-		.num_parents = 5,
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -958,8 +998,8 @@ static struct clk_rcg2 hmss_ahb_clk_src = {
 	.freq_tbl = ftbl_hmss_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_ahb_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -977,8 +1017,8 @@ static struct clk_rcg2 hmss_rbcpr_clk_src = {
 	.freq_tbl = ftbl_hmss_rbcpr_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_rbcpr_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -996,8 +1036,8 @@ static struct clk_rcg2 pcie_aux_clk_src = {
 	.freq_tbl = ftbl_pcie_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_aux_clk_src",
-		.parent_names = gcc_parent_names_3,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1015,8 +1055,8 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.freq_tbl = ftbl_pdm2_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1040,8 +1080,8 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.freq_tbl = ftbl_sdcc2_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_parent_names_4,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1064,8 +1104,8 @@ static struct clk_rcg2 sdcc4_apps_clk_src = {
 	.freq_tbl = ftbl_sdcc4_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc4_apps_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1083,8 +1123,8 @@ static struct clk_rcg2 tsif_ref_clk_src = {
 	.freq_tbl = ftbl_tsif_ref_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "tsif_ref_clk_src",
-		.parent_names = gcc_parent_names_5,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1104,8 +1144,8 @@ static struct clk_rcg2 ufs_axi_clk_src = {
 	.freq_tbl = ftbl_ufs_axi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_axi_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1125,8 +1165,8 @@ static struct clk_rcg2 ufs_unipro_core_clk_src = {
 	.freq_tbl = ftbl_ufs_unipro_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ufs_unipro_core_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1147,8 +1187,8 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.freq_tbl = ftbl_usb30_master_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1161,8 +1201,8 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.freq_tbl = ftbl_hmss_rbcpr_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = 4,
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1180,8 +1220,8 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.freq_tbl = ftbl_usb3_phy_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb3_phy_aux_clk_src",
-		.parent_names = gcc_parent_names_3,
-		.num_parents = 3,
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1207,8 +1247,8 @@ static struct clk_branch gcc_aggre1_ufs_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre1_ufs_axi_clk",
-			.parent_names = (const char *[]){
-				"ufs_axi_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1225,8 +1265,8 @@ static struct clk_branch gcc_aggre1_usb3_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_aggre1_usb3_axi_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1348,8 +1388,8 @@ static struct clk_branch gcc_mmss_gpll0_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mmss_gpll0_clk",
-			.parent_names = (const char *[]){
-				"gpll0_out_main",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gpll0_out_main.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1390,8 +1430,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1408,8 +1448,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1426,8 +1466,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1444,8 +1484,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1462,8 +1502,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1480,8 +1520,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1498,8 +1538,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1516,8 +1556,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1534,8 +1574,8 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup5_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup5_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1552,8 +1592,8 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup5_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup5_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1570,8 +1610,8 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup6_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup6_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1588,8 +1628,8 @@ static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup6_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_qup6_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1619,8 +1659,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart1_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1637,8 +1677,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart2_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1655,8 +1695,8 @@ static struct clk_branch gcc_blsp1_uart3_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart3_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart3_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp1_uart3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1686,8 +1726,8 @@ static struct clk_branch gcc_blsp2_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup1_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1704,8 +1744,8 @@ static struct clk_branch gcc_blsp2_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup1_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup1_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1722,8 +1762,8 @@ static struct clk_branch gcc_blsp2_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup2_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1740,8 +1780,8 @@ static struct clk_branch gcc_blsp2_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup2_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup2_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1758,8 +1798,8 @@ static struct clk_branch gcc_blsp2_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup3_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1776,8 +1816,8 @@ static struct clk_branch gcc_blsp2_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup3_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup3_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1794,8 +1834,8 @@ static struct clk_branch gcc_blsp2_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup4_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1812,8 +1852,8 @@ static struct clk_branch gcc_blsp2_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup4_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup4_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1830,8 +1870,8 @@ static struct clk_branch gcc_blsp2_qup5_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup5_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup5_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1848,8 +1888,8 @@ static struct clk_branch gcc_blsp2_qup5_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup5_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup5_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup5_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1866,8 +1906,8 @@ static struct clk_branch gcc_blsp2_qup6_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup6_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup6_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1884,8 +1924,8 @@ static struct clk_branch gcc_blsp2_qup6_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup6_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup6_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_qup6_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1915,8 +1955,8 @@ static struct clk_branch gcc_blsp2_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart1_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart1_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1933,8 +1973,8 @@ static struct clk_branch gcc_blsp2_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart2_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart2_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1951,8 +1991,8 @@ static struct clk_branch gcc_blsp2_uart3_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart3_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart3_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&blsp2_uart3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1969,8 +2009,8 @@ static struct clk_branch gcc_cfg_noc_usb3_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_cfg_noc_usb3_axi_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1987,8 +2027,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_names = (const char *[]){
-				"gp1_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2005,8 +2045,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_names = (const char *[]){
-				"gp2_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2023,8 +2063,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_names = (const char *[]){
-				"gp3_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2112,8 +2152,8 @@ static struct clk_branch gcc_hmss_ahb_clk = {
 		.enable_mask = BIT(21),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_hmss_ahb_clk",
-			.parent_names = (const char *[]){
-				"hmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&hmss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2143,8 +2183,8 @@ static struct clk_branch gcc_hmss_rbcpr_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_hmss_rbcpr_clk",
-			.parent_names = (const char *[]){
-				"hmss_rbcpr_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&hmss_rbcpr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2179,8 +2219,8 @@ static struct clk_rcg2 hmss_gpll0_clk_src = {
 	.freq_tbl = ftbl_hmss_gpll0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "hmss_gpll0_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -2264,8 +2304,8 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_aux_clk",
-			.parent_names = (const char *[]){
-				"pcie_aux_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&pcie_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2334,8 +2374,8 @@ static struct clk_branch gcc_pcie_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_phy_aux_clk",
-			.parent_names = (const char *[]){
-				"pcie_aux_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&pcie_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2352,8 +2392,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_names = (const char *[]){
-				"pdm2_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2422,8 +2462,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc2_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2453,8 +2493,8 @@ static struct clk_branch gcc_sdcc4_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc4_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc4_apps_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&sdcc4_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2497,8 +2537,8 @@ static struct clk_branch gcc_tsif_ref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_tsif_ref_clk",
-			.parent_names = (const char *[]){
-				"tsif_ref_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&tsif_ref_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2528,8 +2568,8 @@ static struct clk_branch gcc_ufs_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_axi_clk",
-			.parent_names = (const char *[]){
-				"ufs_axi_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&ufs_axi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2611,8 +2651,8 @@ static struct clk_branch gcc_ufs_unipro_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_unipro_core_clk",
-			.parent_names = (const char *[]){
-				"ufs_unipro_core_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&ufs_unipro_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2629,8 +2669,8 @@ static struct clk_branch gcc_usb30_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_master_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2647,8 +2687,8 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_mock_utmi_clk",
-			.parent_names = (const char *[]){
-				"usb30_mock_utmi_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&usb30_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2678,8 +2718,8 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_phy_aux_clk",
-			.parent_names = (const char *[]){
-				"usb3_phy_aux_clk_src",
+			.parent_hws = (const struct clk_hw *[]) {
+				&usb3_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.33.0

