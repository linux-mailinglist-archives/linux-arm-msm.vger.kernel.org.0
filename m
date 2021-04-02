Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B19353086
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Apr 2021 22:58:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbhDBU6Z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Apr 2021 16:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235473AbhDBU6U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Apr 2021 16:58:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD96C0613AA
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Apr 2021 13:58:16 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id z8so6667970ljm.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Apr 2021 13:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nFKRMT+uuLb0v0tcxrynoQiqJNSnoW1UORVuiU4smjw=;
        b=vndj7mQXq9j7rJK+vqhPAk8J7GUsKGl7kHLJK19QVTOm/Q7yOKlGs5i0D4JVLXl1DF
         LyqKZq+Xn1yjFD8uYZ1IG3ygsgdu9D71rsFJqHJESHGzXxI7VeeHt5GDYX6U4YP5FBFH
         CJHKc0pYSVkKAHq+CZnvQlTS9NXqO6x5EpBrCkbiT3OVdZX67xYxHJpTBqavbrTfiAh1
         XBajLU/Q3MvPIvFfevGkvkmZFOo+IP+6afBK1fMemoijn4rBsRLuzz2TMBa5H3Y2pavV
         NRclxblWl/rwYHHGyO0LE7jw5BaO/8/HzU8uFJhrvUIWo+Y0VOwNR6a0KrvOEcax+cNs
         loIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nFKRMT+uuLb0v0tcxrynoQiqJNSnoW1UORVuiU4smjw=;
        b=SBHMJDBT6f3xeOQ3OeAdUN6LKeayYYvRPxB7q4XTt+APAPE6oNlhPveuqDsYLXcNUX
         2HxnPZG5/Xro5lXtH6ff8AA9XRqsluTLcLvhPduNKyFReBw7zuj4nGD7yag7qSJUHd+t
         3bSgIjrxizCdjSPNMAogg/iHkfYlI5gjKzi1WdHlgIjtWHZHvVruq7zcVJxMvM7GtS54
         Ea7WYnwSPmg5FojaGxMW1JnBOyE5TDJR6E3I86XVb/f4tdJCO7HFjb7BbtgL2pQaVe5Q
         kAzYVIpppXlvC/0MS0qlWEQwfv+g+4mqPWYrTqyuPcoYuDZumnOAYyIX8jCx+Xrz9c9Z
         t7pA==
X-Gm-Message-State: AOAM5328jh/9JHbhmn+B+bBHO9gOFY8q04E5UwTP7inzLnGcn3tqQEAB
        vyUF7zSJy/okTRCEMPKtgXbfcw==
X-Google-Smtp-Source: ABdhPJyzN3an4Pi45Ipf+QnbEZJK3QGVEbf/pghJTJw3Vh7gXPBrm+u1eITPXHxnoy+EL7hAUfxhgA==
X-Received: by 2002:a2e:7807:: with SMTP id t7mr9433946ljc.313.1617397095037;
        Fri, 02 Apr 2021 13:58:15 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 11/16] clk: qcom: dispcc-sdm845: convert to parent data
Date:   Fri,  2 Apr 2021 23:57:59 +0300
Message-Id: <20210402205804.96507-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/dispcc-sdm845.c | 188 ++++++++++++++++---------------
 1 file changed, 95 insertions(+), 93 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 5c932cd17b14..bf5e8a4a0230 100644
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
@@ -122,7 +124,7 @@ static struct clk_rcg2 disp_cc_mdss_byte0_clk_src = {
 	.parent_map = disp_cc_parent_map_0,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte0_clk_src",
-		.parent_names = disp_cc_parent_names_0,
+		.parent_data = disp_cc_parent_data_0,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
@@ -137,7 +139,7 @@ static struct clk_rcg2 disp_cc_mdss_byte1_clk_src = {
 	.parent_map = disp_cc_parent_map_0,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_byte1_clk_src",
-		.parent_names = disp_cc_parent_names_0,
+		.parent_data = disp_cc_parent_data_0,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
@@ -157,7 +159,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_aux_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_dp_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_aux_clk_src",
-		.parent_names = disp_cc_parent_names_2,
+		.parent_data = disp_cc_parent_data_2,
 		.num_parents = 2,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_ops,
@@ -171,7 +173,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_crypto_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_crypto_clk_src",
-		.parent_names = disp_cc_parent_names_1,
+		.parent_data = disp_cc_parent_data_1,
 		.num_parents = 4,
 		.ops = &clk_byte2_ops,
 	},
@@ -184,7 +186,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_link_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_link_clk_src",
-		.parent_names = disp_cc_parent_names_1,
+		.parent_data = disp_cc_parent_data_1,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
@@ -198,7 +200,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel1_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel1_clk_src",
-		.parent_names = disp_cc_parent_names_1,
+		.parent_data = disp_cc_parent_data_1,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
@@ -212,7 +214,7 @@ static struct clk_rcg2 disp_cc_mdss_dp_pixel_clk_src = {
 	.parent_map = disp_cc_parent_map_1,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_dp_pixel_clk_src",
-		.parent_names = disp_cc_parent_names_1,
+		.parent_data = disp_cc_parent_data_1,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_dp_ops,
@@ -232,7 +234,7 @@ static struct clk_rcg2 disp_cc_mdss_esc0_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc0_clk_src",
-		.parent_names = disp_cc_parent_names_0,
+		.parent_data = disp_cc_parent_data_0,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -246,7 +248,7 @@ static struct clk_rcg2 disp_cc_mdss_esc1_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_esc1_clk_src",
-		.parent_names = disp_cc_parent_names_0,
+		.parent_data = disp_cc_parent_data_0,
 		.num_parents = 4,
 		.ops = &clk_rcg2_ops,
 	},
@@ -273,7 +275,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_mdp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_mdp_clk_src",
-		.parent_names = disp_cc_parent_names_3,
+		.parent_data = disp_cc_parent_data_3,
 		.num_parents = 5,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -287,7 +289,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 	.parent_map = disp_cc_parent_map_4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk0_clk_src",
-		.parent_names = disp_cc_parent_names_4,
+		.parent_data = disp_cc_parent_data_4,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
@@ -302,7 +304,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 	.parent_map = disp_cc_parent_map_4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_pclk1_clk_src",
-		.parent_names = disp_cc_parent_names_4,
+		.parent_data = disp_cc_parent_data_4,
 		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
@@ -326,7 +328,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_rot_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_rot_clk_src",
-		.parent_names = disp_cc_parent_names_3,
+		.parent_data = disp_cc_parent_data_3,
 		.num_parents = 5,
 		.ops = &clk_rcg2_shared_ops,
 	},
@@ -340,7 +342,7 @@ static struct clk_rcg2 disp_cc_mdss_vsync_clk_src = {
 	.freq_tbl = ftbl_disp_cc_mdss_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "disp_cc_mdss_vsync_clk_src",
-		.parent_names = disp_cc_parent_names_2,
+		.parent_data = disp_cc_parent_data_2,
 		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
@@ -381,8 +383,8 @@ static struct clk_branch disp_cc_mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -399,8 +401,8 @@ static struct clk_regmap_div disp_cc_mdss_byte0_div_clk_src = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_div_clk_src",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_regmap_div_ops,
@@ -417,8 +419,8 @@ static struct clk_branch disp_cc_mdss_byte0_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte0_intf_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte0_div_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte0_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -436,8 +438,8 @@ static struct clk_branch disp_cc_mdss_byte1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -454,8 +456,8 @@ static struct clk_regmap_div disp_cc_mdss_byte1_div_clk_src = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_div_clk_src",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_regmap_div_ops,
@@ -472,8 +474,8 @@ static struct clk_branch disp_cc_mdss_byte1_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_byte1_intf_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_byte1_div_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_byte1_div_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -490,8 +492,8 @@ static struct clk_branch disp_cc_mdss_dp_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_aux_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_aux_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -508,8 +510,8 @@ static struct clk_branch disp_cc_mdss_dp_crypto_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_crypto_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_crypto_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_crypto_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -526,8 +528,8 @@ static struct clk_branch disp_cc_mdss_dp_link_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_link_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -545,8 +547,8 @@ static struct clk_branch disp_cc_mdss_dp_link_intf_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_link_intf_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_link_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_link_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -562,8 +564,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_pixel1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_pixel1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_pixel1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -580,8 +582,8 @@ static struct clk_branch disp_cc_mdss_dp_pixel_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_dp_pixel_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_dp_pixel_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_dp_pixel_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -598,8 +600,8 @@ static struct clk_branch disp_cc_mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_esc0_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_esc0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_esc0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -616,8 +618,8 @@ static struct clk_branch disp_cc_mdss_esc1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_esc1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_esc1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_esc1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -634,8 +636,8 @@ static struct clk_branch disp_cc_mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_mdp_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_mdp_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -652,8 +654,8 @@ static struct clk_branch disp_cc_mdss_mdp_lut_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_mdp_lut_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_mdp_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -670,8 +672,8 @@ static struct clk_branch disp_cc_mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_pclk0_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_pclk0_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_pclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -689,8 +691,8 @@ static struct clk_branch disp_cc_mdss_pclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_pclk1_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_pclk1_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_pclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -707,8 +709,8 @@ static struct clk_branch disp_cc_mdss_rot_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rot_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_rot_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_rot_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -738,8 +740,8 @@ static struct clk_branch disp_cc_mdss_rscc_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_rscc_vsync_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_vsync_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -756,8 +758,8 @@ static struct clk_branch disp_cc_mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "disp_cc_mdss_vsync_clk",
-			.parent_names = (const char *[]){
-				"disp_cc_mdss_vsync_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.hw = &disp_cc_mdss_vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.30.2

