Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85E42407674
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Sep 2021 14:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235870AbhIKMPR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 11 Sep 2021 08:15:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235770AbhIKMPN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 11 Sep 2021 08:15:13 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43120C061574
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Sep 2021 05:13:59 -0700 (PDT)
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id ECB3E3F3F5;
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
Subject: [PATCH 3/8] clk: qcom: gcc-msm8998: Remove transient global "xo" clock
Date:   Sat, 11 Sep 2021 14:13:35 +0200
Message-Id: <20210911121340.261920-4-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210911121340.261920-1-marijn.suijten@somainline.org>
References: <20210911121340.261920-1-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that all clock controllers and the DSI PLL clocks rely on "xo" being
passed in DT as phandle instead of looking it up by the global "xo" name
this transient clock can be removed, leaving only the fixed-factor
"xo_board" clock in DT.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/clk/qcom/gcc-msm8998.c | 57 ++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 9320e2ba659a..407e2c5caea4 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -25,17 +25,6 @@
 #include "reset.h"
 #include "gdsc.h"
 
-static struct clk_fixed_factor xo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "xo",
-		.parent_names = (const char *[]){ "xo_board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
 static struct pll_vco fabia_vco[] = {
 	{ 250000000, 2000000000, 0 },
 	{ 125000000, 1000000000, 1 },
@@ -51,7 +40,9 @@ static struct clk_alpha_pll gpll0 = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
@@ -120,7 +111,9 @@ static struct clk_alpha_pll gpll1 = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll1",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
@@ -189,7 +182,9 @@ static struct clk_alpha_pll gpll2 = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll2",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
@@ -258,7 +253,9 @@ static struct clk_alpha_pll gpll3 = {
 		.enable_mask = BIT(3),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll3",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
@@ -327,7 +324,9 @@ static struct clk_alpha_pll gpll4 = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll4",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_fixed_fabia_ops,
 		}
@@ -2761,7 +2760,9 @@ static struct clk_branch gcc_hdmi_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_hdmi_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -2775,7 +2776,9 @@ static struct clk_branch gcc_ufs_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ufs_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -2789,7 +2792,9 @@ static struct clk_branch gcc_usb3_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -2803,7 +2808,9 @@ static struct clk_branch gcc_pcie_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -2817,7 +2824,9 @@ static struct clk_branch gcc_rx1_usb2_clkref_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_rx1_usb2_clkref_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data []) {
+				{ .fw_name = "xo" },
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -3155,10 +3164,6 @@ static const struct regmap_config gcc_msm8998_regmap_config = {
 	.fast_io	= true,
 };
 
-static struct clk_hw *gcc_msm8998_hws[] = {
-	&xo.hw,
-};
-
 static const struct qcom_cc_desc gcc_msm8998_desc = {
 	.config = &gcc_msm8998_regmap_config,
 	.clks = gcc_msm8998_clocks,
@@ -3167,8 +3172,6 @@ static const struct qcom_cc_desc gcc_msm8998_desc = {
 	.num_resets = ARRAY_SIZE(gcc_msm8998_resets),
 	.gdscs = gcc_msm8998_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_msm8998_gdscs),
-	.clk_hws = gcc_msm8998_hws,
-	.num_clk_hws = ARRAY_SIZE(gcc_msm8998_hws),
 };
 
 static int gcc_msm8998_probe(struct platform_device *pdev)
-- 
2.33.0

