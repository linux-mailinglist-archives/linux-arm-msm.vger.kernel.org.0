Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F4F655FDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231710AbiLZEW2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231638AbiLZEWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:22:09 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 732352DC3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:03 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p36so14650867lfa.12
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHXIT4N9KmOzNTarDmuOaDKpO+uItT0wTFscppu/rBo=;
        b=WKR2Il2x4NdbYWV+YNJld1GDpbezzwNc6JltQOsdo7hWZ0myIxFJ8xQ9FAa3r4/c2P
         AOZBVSFekRz7ixKQf17QZBnHE3Af1ZFxF9Wrosz8EofhO5solzCXmk9h6LYoEaLz3TiS
         evB8vpNBZUaGmxY/tprWKlDdXOzSYlqV7im/Q2K3icdyosXilCGartlGVFf3jV+ygyKU
         gfw7A4AIkutbc2okoYQSo1YzxlSI1we2c7GZ60vVrZzLKsUN8CoCS5R3Bc0dR0WovkWj
         i+Vr6lvcuKBu/MacwWpq3lalzI4DIMxAxc9jvE7+W4DtQ6zaQ0l3FeZ+0v7PGohNCUAx
         AzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHXIT4N9KmOzNTarDmuOaDKpO+uItT0wTFscppu/rBo=;
        b=DOg+ZoXFw0yCLoWvwfxnyCvN8Jr7rbeQM7GutHxeUIn0xIW5WeD8EMZpjvBvHQWSUL
         xezLPvG10J/Zq23nNohw1FisHBqElXHgxgsje4xMoEECoVsL0FiXdN5NUSxcAP4IwShH
         dQvt1MDf17AGgy4HDlgGH6eN4fGu1Rc3saBoPWHJfDHLHVyRky1o++nfslS3fN10zZZh
         WFKklgKgB++hwABYgXNlCD3p2XKIv4xu5xnl9FW0qkerihRc5gZoowVza5vJRYPlvhh7
         REJxTugt9OZinEw+Ja1GATbOB85bXtCjC//7AupDWDGr7Eo0kuhuFvBrnZaFJV0xAjz3
         DC9Q==
X-Gm-Message-State: AFqh2kqrQ8KqW0sth5AF0sTA2LYV57qrHJ5o6t3fDWYawU/Jg7vfm80E
        Aj4ySW6VUoJgRDCrovcVZ/5ZWQ==
X-Google-Smtp-Source: AMrXdXv+qHhTnRmEhq5+/o3qvxP6otkUh+A8D6v0WhUnryZU0XEo7Uy7wc7nbXo0txuXcYSATiUAaA==
X-Received: by 2002:a05:6512:3ca9:b0:4b5:61c5:8927 with SMTP id h41-20020a0565123ca900b004b561c58927mr5452062lfv.42.1672028522460;
        Sun, 25 Dec 2022 20:22:02 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 10/16] clk: qcom: gcc-qcs404: use parent_hws/_data instead of parent_names
Date:   Mon, 26 Dec 2022 06:21:48 +0200
Message-Id: <20221226042154.2666748-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
References: <20221226042154.2666748-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names. Use parent_hws where possible to refer parent
clocks directly, skipping the lookup.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 524 ++++++++++++++++++----------------
 1 file changed, 275 insertions(+), 249 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 9b200b378b6b..2726a48f2d5c 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -21,6 +21,15 @@
 #include "common.h"
 #include "reset.h"
 
+enum {
+	DT_XO,
+	DT_SLEEP_CLK,
+	DT_PCIE_0_PIPE_CLK,
+	DT_DSI0_PHY_PLL_OUT_DSICLK,
+	DT_DSI0_PHY_PLL_OUT_BYTECLK,
+	DT_HDMI_PHY_PLL_CLK,
+};
+
 enum {
 	P_DSI0_PHY_PLL_OUT_BYTECLK,
 	P_DSI0_PHY_PLL_OUT_DSICLK,
@@ -40,7 +49,9 @@ static struct clk_fixed_factor cxo = {
 	.div = 1,
 	.hw.init = &(struct clk_init_data){
 		.name = "cxo",
-		.parent_names = (const char *[]){ "xo-board" },
+		.parent_data = &(const struct clk_parent_data) {
+			.name = "xo-board",
+		},
 		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
@@ -55,7 +66,9 @@ static struct clk_alpha_pll gpll0_sleep_clk_src = {
 		.enable_is_inverted = true,
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_sleep_clk_src",
-			.parent_names = (const char *[]){ "cxo" },
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &cxo.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -71,8 +84,9 @@ static struct clk_alpha_pll gpll0_out_main = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_out_main",
-			.parent_names = (const char *[])
-					{ "cxo" },
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &cxo.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -88,7 +102,9 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_ao_out_main",
-			.parent_names = (const char *[]){ "cxo" },
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &cxo.hw,
+			},
 			.num_parents = 1,
 			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_alpha_pll_fixed_ops,
@@ -104,7 +120,9 @@ static struct clk_alpha_pll gpll1_out_main = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll1_out_main",
-			.parent_names = (const char *[]){ "cxo" },
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &cxo.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -135,7 +153,9 @@ static struct clk_alpha_pll gpll3_out_main = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll3_out_main",
-			.parent_names = (const char *[]){ "cxo" },
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &cxo.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -150,7 +170,9 @@ static struct clk_alpha_pll gpll4_out_main = {
 		.enable_mask = BIT(5),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll4_out_main",
-			.parent_names = (const char *[]){ "cxo" },
+			.parent_data = &(const struct clk_parent_data) {
+				.hw = &cxo.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -167,7 +189,9 @@ static struct clk_pll gpll6 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll6",
-		.parent_names = (const char *[]){ "cxo" },
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &cxo.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -178,7 +202,9 @@ static struct clk_regmap gpll6_out_aux = {
 	.enable_mask = BIT(7),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll6_out_aux",
-		.parent_names = (const char *[]){ "gpll6" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&gpll6.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -189,22 +215,22 @@ static const struct parent_map gcc_parent_map_0[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 };
 
-static const char * const gcc_parent_names_0[] = {
-	"cxo",
-	"gpll0_out_main",
+static const struct clk_parent_data gcc_parent_data_0[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
 };
 
-static const char * const gcc_parent_names_ao_0[] = {
-	"cxo",
-	"gpll0_ao_out_main",
+static const struct clk_parent_data gcc_parent_data_ao_0[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_ao_out_main.clkr.hw },
 };
 
 static const struct parent_map gcc_parent_map_1[] = {
 	{ P_XO, 0 },
 };
 
-static const char * const gcc_parent_names_1[] = {
-	"cxo",
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .hw = &cxo.hw },
 };
 
 static const struct parent_map gcc_parent_map_2[] = {
@@ -214,11 +240,11 @@ static const struct parent_map gcc_parent_map_2[] = {
 	{ P_SLEEP_CLK, 6 },
 };
 
-static const char * const gcc_parent_names_2[] = {
-	"cxo",
-	"gpll0_out_main",
-	"gpll6_out_aux",
-	"sleep_clk",
+static const struct clk_parent_data gcc_parent_data_2[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .hw = &gpll6_out_aux.hw },
+	{ .index = DT_SLEEP_CLK, .name = "sleep_clk" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
@@ -227,10 +253,10 @@ static const struct parent_map gcc_parent_map_3[] = {
 	{ P_GPLL6_OUT_AUX, 2 },
 };
 
-static const char * const gcc_parent_names_3[] = {
-	"cxo",
-	"gpll0_out_main",
-	"gpll6_out_aux",
+static const struct clk_parent_data gcc_parent_data_3[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .hw = &gpll6_out_aux.hw },
 };
 
 static const struct parent_map gcc_parent_map_4[] = {
@@ -238,9 +264,9 @@ static const struct parent_map gcc_parent_map_4[] = {
 	{ P_GPLL1_OUT_MAIN, 1 },
 };
 
-static const char * const gcc_parent_names_4[] = {
-	"cxo",
-	"gpll1_out_main",
+static const struct clk_parent_data gcc_parent_data_4[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll1_out_main.clkr.hw },
 };
 
 static const struct parent_map gcc_parent_map_5[] = {
@@ -248,9 +274,9 @@ static const struct parent_map gcc_parent_map_5[] = {
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 1 },
 };
 
-static const char * const gcc_parent_names_5[] = {
-	"cxo",
-	"dsi0pllbyte",
+static const struct clk_parent_data gcc_parent_data_5[] = {
+	{ .hw = &cxo.hw },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK, .name = "dsi0pllbyte" },
 };
 
 static const struct parent_map gcc_parent_map_6[] = {
@@ -258,9 +284,9 @@ static const struct parent_map gcc_parent_map_6[] = {
 	{ P_DSI0_PHY_PLL_OUT_BYTECLK, 2 },
 };
 
-static const char * const gcc_parent_names_6[] = {
-	"cxo",
-	"dsi0pllbyte",
+static const struct clk_parent_data gcc_parent_data_6[] = {
+	{ .hw = &cxo.hw },
+	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK, .name = "dsi0pllbyte" },
 };
 
 static const struct parent_map gcc_parent_map_7[] = {
@@ -270,11 +296,11 @@ static const struct parent_map gcc_parent_map_7[] = {
 	{ P_GPLL6_OUT_AUX, 3 },
 };
 
-static const char * const gcc_parent_names_7[] = {
-	"cxo",
-	"gpll0_out_main",
-	"gpll3_out_main",
-	"gpll6_out_aux",
+static const struct clk_parent_data gcc_parent_data_7[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .hw = &gpll3_out_main.clkr.hw },
+	{ .hw = &gpll6_out_aux.hw },
 };
 
 static const struct parent_map gcc_parent_map_8[] = {
@@ -282,9 +308,9 @@ static const struct parent_map gcc_parent_map_8[] = {
 	{ P_HDMI_PHY_PLL_CLK, 1 },
 };
 
-static const char * const gcc_parent_names_8[] = {
-	"cxo",
-	"hdmi_pll",
+static const struct clk_parent_data gcc_parent_data_8[] = {
+	{ .hw = &cxo.hw },
+	{ .index = DT_HDMI_PHY_PLL_CLK, .name = "hdmi_pll" },
 };
 
 static const struct parent_map gcc_parent_map_9[] = {
@@ -294,11 +320,11 @@ static const struct parent_map gcc_parent_map_9[] = {
 	{ P_GPLL6_OUT_AUX, 3 },
 };
 
-static const char * const gcc_parent_names_9[] = {
-	"cxo",
-	"gpll0_out_main",
-	"dsi0pll",
-	"gpll6_out_aux",
+static const struct clk_parent_data gcc_parent_data_9[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK, .name = "dsi0pll" },
+	{ .hw = &gpll6_out_aux.hw },
 };
 
 static const struct parent_map gcc_parent_map_10[] = {
@@ -306,9 +332,9 @@ static const struct parent_map gcc_parent_map_10[] = {
 	{ P_SLEEP_CLK, 1 },
 };
 
-static const char * const gcc_parent_names_10[] = {
-	"cxo",
-	"sleep_clk",
+static const struct clk_parent_data gcc_parent_data_10[] = {
+	{ .hw = &cxo.hw },
+	{ .index = DT_SLEEP_CLK, .name = "sleep_clk" },
 };
 
 static const struct parent_map gcc_parent_map_11[] = {
@@ -316,9 +342,9 @@ static const struct parent_map gcc_parent_map_11[] = {
 	{ P_PCIE_0_PIPE_CLK, 1 },
 };
 
-static const char * const gcc_parent_names_11[] = {
-	"cxo",
-	"pcie_0_pipe_clk",
+static const struct clk_parent_data gcc_parent_data_11[] = {
+	{ .hw = &cxo.hw },
+	{ .fw_name = "pcie_0_pipe_clk", .name = "pcie_0_pipe_clk" },
 };
 
 static const struct parent_map gcc_parent_map_12[] = {
@@ -326,9 +352,9 @@ static const struct parent_map gcc_parent_map_12[] = {
 	{ P_DSI0_PHY_PLL_OUT_DSICLK, 1 },
 };
 
-static const char * const gcc_parent_names_12[] = {
-	"cxo",
-	"dsi0pll",
+static const struct clk_parent_data gcc_parent_data_12[] = {
+	{ .hw = &cxo.hw },
+	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK, .name = "dsi0pll" },
 };
 
 static const struct parent_map gcc_parent_map_13[] = {
@@ -338,11 +364,11 @@ static const struct parent_map gcc_parent_map_13[] = {
 	{ P_GPLL6_OUT_AUX, 3 },
 };
 
-static const char * const gcc_parent_names_13[] = {
-	"cxo",
-	"gpll0_out_main",
-	"gpll4_out_main",
-	"gpll6_out_aux",
+static const struct clk_parent_data gcc_parent_data_13[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
+	{ .hw = &gpll4_out_main.clkr.hw },
+	{ .hw = &gpll6_out_aux.hw },
 };
 
 static const struct parent_map gcc_parent_map_14[] = {
@@ -350,17 +376,17 @@ static const struct parent_map gcc_parent_map_14[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 };
 
-static const char * const gcc_parent_names_14[] = {
-	"cxo",
-	"gpll0_out_main",
+static const struct clk_parent_data gcc_parent_data_14[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
 };
 
 static const struct parent_map gcc_parent_map_15[] = {
 	{ P_XO, 0 },
 };
 
-static const char * const gcc_parent_names_15[] = {
-	"cxo",
+static const struct clk_parent_data gcc_parent_data_15[] = {
+	{ .hw = &cxo.hw },
 };
 
 static const struct parent_map gcc_parent_map_16[] = {
@@ -368,9 +394,9 @@ static const struct parent_map gcc_parent_map_16[] = {
 	{ P_GPLL0_OUT_MAIN, 1 },
 };
 
-static const char * const gcc_parent_names_16[] = {
-	"cxo",
-	"gpll0_out_main",
+static const struct clk_parent_data gcc_parent_data_16[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
 };
 
 static const struct freq_tbl ftbl_apss_ahb_clk_src[] = {
@@ -389,8 +415,8 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 	.freq_tbl = ftbl_apss_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_ahb_clk_src",
-		.parent_names = gcc_parent_names_ao_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_ao_0),
+		.parent_data = gcc_parent_data_ao_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_ao_0),
 		.flags = CLK_IS_CRITICAL,
 		.ops = &clk_rcg2_ops,
 	},
@@ -410,8 +436,8 @@ static struct clk_rcg2 blsp1_qup0_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup0_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -435,8 +461,8 @@ static struct clk_rcg2 blsp1_qup0_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup0_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -449,8 +475,8 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -474,8 +500,8 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -488,8 +514,8 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -514,8 +540,8 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup2_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -528,8 +554,8 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -542,8 +568,8 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -556,8 +582,8 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -570,8 +596,8 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -604,8 +630,8 @@ static struct clk_rcg2 blsp1_uart0_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart0_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart0_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -618,8 +644,8 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart0_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -632,8 +658,8 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart0_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -647,8 +673,8 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart0_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart3_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -661,8 +687,8 @@ static struct clk_rcg2 blsp2_qup0_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_i2c_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup0_i2c_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -675,8 +701,8 @@ static struct clk_rcg2 blsp2_qup0_spi_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_qup0_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup0_spi_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -689,8 +715,8 @@ static struct clk_rcg2 blsp2_uart0_apps_clk_src = {
 	.freq_tbl = ftbl_blsp1_uart0_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_uart0_apps_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -702,8 +728,8 @@ static struct clk_rcg2 byte0_clk_src = {
 	.parent_map = gcc_parent_map_5,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
-		.parent_names = gcc_parent_names_5,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_5),
+		.parent_data = gcc_parent_data_5,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_byte2_ops,
 	},
@@ -725,8 +751,8 @@ static struct clk_rcg2 emac_clk_src = {
 	.freq_tbl = ftbl_emac_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "emac_clk_src",
-		.parent_names = gcc_parent_names_4,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
+		.parent_data = gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -746,8 +772,8 @@ static struct clk_rcg2 emac_ptp_clk_src = {
 	.freq_tbl = ftbl_emac_ptp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "emac_ptp_clk_src",
-		.parent_names = gcc_parent_names_4,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_4),
+		.parent_data = gcc_parent_data_4,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -765,8 +791,8 @@ static struct clk_rcg2 esc0_clk_src = {
 	.freq_tbl = ftbl_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
-		.parent_names = gcc_parent_names_6,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_6),
+		.parent_data = gcc_parent_data_6,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_6),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -799,8 +825,8 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	.freq_tbl = ftbl_gfx3d_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
-		.parent_names = gcc_parent_names_7,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_7),
+		.parent_data = gcc_parent_data_7,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_7),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -820,8 +846,8 @@ static struct clk_rcg2 gp1_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
-		.parent_names = gcc_parent_names_2,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -834,8 +860,8 @@ static struct clk_rcg2 gp2_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
-		.parent_names = gcc_parent_names_2,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -848,8 +874,8 @@ static struct clk_rcg2 gp3_clk_src = {
 	.freq_tbl = ftbl_gp1_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
-		.parent_names = gcc_parent_names_2,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_2),
+		.parent_data = gcc_parent_data_2,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_2),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -862,8 +888,8 @@ static struct clk_rcg2 hdmi_app_clk_src = {
 	.freq_tbl = ftbl_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_app_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -876,8 +902,8 @@ static struct clk_rcg2 hdmi_pclk_clk_src = {
 	.freq_tbl = ftbl_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_pclk_clk_src",
-		.parent_names = gcc_parent_names_8,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_8),
+		.parent_data = gcc_parent_data_8,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_8),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -903,8 +929,8 @@ static struct clk_rcg2 mdp_clk_src = {
 	.freq_tbl = ftbl_mdp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
-		.parent_names = gcc_parent_names_9,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_9),
+		.parent_data = gcc_parent_data_9,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_9),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -922,8 +948,8 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
 	.freq_tbl = ftbl_pcie_0_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_aux_clk_src",
-		.parent_names = gcc_parent_names_10,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_10),
+		.parent_data = gcc_parent_data_10,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_10),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -943,8 +969,8 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
 	.freq_tbl = ftbl_pcie_0_pipe_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcie_0_pipe_clk_src",
-		.parent_names = gcc_parent_names_11,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_11),
+		.parent_data = gcc_parent_data_11,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_11),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -956,8 +982,8 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.parent_map = gcc_parent_map_12,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
-		.parent_names = gcc_parent_names_12,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_12),
+		.parent_data = gcc_parent_data_12,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_12),
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_pixel_ops,
 	},
@@ -977,8 +1003,8 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.freq_tbl = ftbl_pdm2_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1005,8 +1031,8 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.freq_tbl = ftbl_sdcc1_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
-		.parent_names = gcc_parent_names_13,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_13),
+		.parent_data = gcc_parent_data_13,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_13),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1025,8 +1051,8 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
 	.freq_tbl = ftbl_sdcc1_ice_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_ice_core_clk_src",
-		.parent_names = gcc_parent_names_3,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_3),
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1051,8 +1077,8 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.freq_tbl = ftbl_sdcc2_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_parent_names_14,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_14),
+		.parent_data = gcc_parent_data_14,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_14),
 		.ops = &clk_rcg2_floor_ops,
 	},
 };
@@ -1065,8 +1091,8 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
 	.freq_tbl = ftbl_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb20_mock_utmi_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1087,8 +1113,8 @@ static struct clk_rcg2 usb30_master_clk_src = {
 	.freq_tbl = ftbl_usb30_master_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_master_clk_src",
-		.parent_names = gcc_parent_names_0,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_0),
+		.parent_data = gcc_parent_data_0,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_0),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1101,8 +1127,8 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
 	.freq_tbl = ftbl_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb30_mock_utmi_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1115,8 +1141,8 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
 	.freq_tbl = ftbl_pcie_0_aux_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb3_phy_aux_clk_src",
-		.parent_names = gcc_parent_names_1,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_1),
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1138,8 +1164,8 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.freq_tbl = ftbl_usb_hs_system_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
-		.parent_names = gcc_parent_names_3,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_3),
+		.parent_data = gcc_parent_data_3,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_3),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1152,8 +1178,8 @@ static struct clk_rcg2 vsync_clk_src = {
 	.freq_tbl = ftbl_esc0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
-		.parent_names = gcc_parent_names_15,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_15),
+		.parent_data = gcc_parent_data_15,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_15),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1174,8 +1200,8 @@ static struct clk_rcg2 cdsp_bimc_clk_src = {
 	.freq_tbl = ftbl_cdsp_bimc_clk_src,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "cdsp_bimc_clk_src",
-		.parent_names = gcc_parent_names_16,
-		.num_parents = ARRAY_SIZE(gcc_parent_names_16),
+		.parent_data = gcc_parent_data_16,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_16),
 		.ops = &clk_rcg2_ops,
 	},
 };
@@ -1188,8 +1214,8 @@ static struct clk_branch gcc_apss_ahb_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_apss_ahb_clk",
-			.parent_names = (const char *[]){
-				"apss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&apss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1220,8 +1246,8 @@ static struct clk_branch gcc_bimc_gfx_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_bimc_gfx_clk",
 			.ops = &clk_branch2_ops,
-			.parent_names = (const char *[]){
-				"gcc_apss_tcu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_apss_tcu_clk.clkr.hw,
 			},
 
 		},
@@ -1249,8 +1275,8 @@ static struct clk_branch gcc_bimc_cdsp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
 			.name = "gcc_bimc_cdsp_clk",
-			.parent_names = (const char *[]) {
-				"cdsp_bimc_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cdsp_bimc_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1319,8 +1345,8 @@ static struct clk_branch gcc_blsp1_qup0_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup0_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup0_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup0_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1337,8 +1363,8 @@ static struct clk_branch gcc_blsp1_qup0_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup0_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup0_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup0_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1355,8 +1381,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1373,8 +1399,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1391,8 +1417,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1409,8 +1435,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1427,8 +1453,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1445,8 +1471,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1463,8 +1489,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1481,8 +1507,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1499,8 +1525,8 @@ static struct clk_branch gcc_blsp1_uart0_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart0_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart0_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_uart0_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1517,8 +1543,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1535,8 +1561,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1553,8 +1579,8 @@ static struct clk_branch gcc_blsp1_uart3_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart3_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart3_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp1_uart3_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1584,8 +1610,8 @@ static struct clk_branch gcc_blsp2_qup0_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup0_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup0_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup0_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1602,8 +1628,8 @@ static struct clk_branch gcc_blsp2_qup0_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_qup0_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_qup0_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_qup0_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1620,8 +1646,8 @@ static struct clk_branch gcc_blsp2_uart0_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp2_uart0_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp2_uart0_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&blsp2_uart0_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1703,8 +1729,8 @@ static struct clk_branch gcc_eth_ptp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_eth_ptp_clk",
-			.parent_names = (const char *[]){
-				"emac_ptp_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&emac_ptp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1721,8 +1747,8 @@ static struct clk_branch gcc_eth_rgmii_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_eth_rgmii_clk",
-			.parent_names = (const char *[]){
-				"emac_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&emac_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1804,8 +1830,8 @@ static struct clk_branch gcc_cdsp_tbu_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data) {
 			.name = "gcc_cdsp_tbu_clk",
-			.parent_names = (const char *[]) {
-				"cdsp_bimc_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&cdsp_bimc_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1822,8 +1848,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_names = (const char *[]){
-				"gp1_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1840,8 +1866,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_names = (const char *[]){
-				"gp2_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1858,8 +1884,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_names = (const char *[]){
-				"gp3_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1928,8 +1954,8 @@ static struct clk_branch gcc_mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_byte0_clk",
-			.parent_names = (const char *[]){
-				"byte0_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1946,8 +1972,8 @@ static struct clk_branch gcc_mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_esc0_clk",
-			.parent_names = (const char *[]){
-				"esc0_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&esc0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1964,8 +1990,8 @@ static struct clk_branch gcc_mdss_hdmi_app_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_hdmi_app_clk",
-			.parent_names = (const char *[]){
-				"hdmi_app_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&hdmi_app_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1982,8 +2008,8 @@ static struct clk_branch gcc_mdss_hdmi_pclk_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_hdmi_pclk_clk",
-			.parent_names = (const char *[]){
-				"hdmi_pclk_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&hdmi_pclk_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2000,8 +2026,8 @@ static struct clk_branch gcc_mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_mdp_clk",
-			.parent_names = (const char *[]){
-				"mdp_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2018,8 +2044,8 @@ static struct clk_branch gcc_mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_pclk0_clk",
-			.parent_names = (const char *[]){
-				"pclk0_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2036,8 +2062,8 @@ static struct clk_branch gcc_mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_vsync_clk",
-			.parent_names = (const char *[]){
-				"vsync_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2067,8 +2093,8 @@ static struct clk_branch gcc_oxili_gfx3d_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_oxili_gfx3d_clk",
-			.parent_names = (const char *[]){
-				"gfx3d_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gfx3d_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2085,8 +2111,8 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
 		.enable_mask = BIT(27),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_aux_clk",
-			.parent_names = (const char *[]){
-				"pcie_0_aux_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcie_0_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2129,8 +2155,8 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
 		.enable_mask = BIT(28),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pcie_0_pipe_clk",
-			.parent_names = (const char *[]){
-				"pcie_0_pipe_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pcie_0_pipe_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2188,8 +2214,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_names = (const char *[]){
-				"pdm2_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2298,8 +2324,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdcc1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2316,8 +2342,8 @@ static struct clk_branch gcc_sdcc1_ice_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ice_core_clk",
-			.parent_names = (const char *[]){
-				"sdcc1_ice_core_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdcc1_ice_core_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2360,8 +2386,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2391,8 +2417,8 @@ static struct clk_branch gcc_sys_noc_usb3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sys_noc_usb3_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2421,8 +2447,8 @@ static struct clk_branch gcc_usb20_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb20_mock_utmi_clk",
-			.parent_names = (const char *[]){
-				"usb20_mock_utmi_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb20_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2452,8 +2478,8 @@ static struct clk_branch gcc_usb30_master_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_master_clk",
-			.parent_names = (const char *[]){
-				"usb30_master_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb30_master_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2470,8 +2496,8 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb30_mock_utmi_clk",
-			.parent_names = (const char *[]){
-				"usb30_mock_utmi_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb30_mock_utmi_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2501,8 +2527,8 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb3_phy_aux_clk",
-			.parent_names = (const char *[]){
-				"usb3_phy_aux_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb3_phy_aux_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2544,8 +2570,8 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_system_clk",
-			.parent_names = (const char *[]){
-				"usb_hs_system_clk_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb_hs_system_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.35.1

