Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A810E64F63B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 01:24:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiLQAYT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Dec 2022 19:24:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiLQAXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Dec 2022 19:23:20 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B61A7E2A2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:41 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id bf43so5891695lfb.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Dec 2022 16:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8xUD8U6MUoZl7boj5+/8yhNFybEvEm178rLirV3qkg=;
        b=NY3K/4+2LZFG/o+TKP6Avy+LcBrXa3dNZxvjTQH9IAyhcukSnodRQ079FRHuPURUps
         SozXFaIYuPMOlmk09XPLVJ/CDc6gpCu5K1RnkOV4bcqUCXCGcjFRw96eZgKqmmF9xUem
         dylzr4+emH4UEhvw0tH50zYFvY6iQF7vXvPs11d+IssyLMx8MmeduInsAfGWhQe9cFhM
         59VN5ETMbvMTIqnL3FewJB/319fMcJz6MjDhpPs5nHRut8qJose2MSgB+TUIgWaca5SI
         pOORCYWSVFqp7mCbFLVJU6G3l6RVoKPzFwoEjxkI3DTvGeqJB0cBcM9ClAQWxKp9O16T
         4P9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8xUD8U6MUoZl7boj5+/8yhNFybEvEm178rLirV3qkg=;
        b=Idc+pwewBgiDP8tluNcdCC7BUWR+1wnQZyU7ETCdX1IapW5dQNaNbCkftNuSKggwYn
         btQC+bIKnYbNMdv3WrGmk40KKd3B3JRDTa2Ak7zSbCxDjp+d/EB6eheRMhqAwTyFgzjy
         Kp+EgviaWL4VluSL9WBsWO5HXA9PhYMthausdecyDEMj3KYXhzzgQ4eEuG1B5w0cLI5A
         JhaxmvbhBSSGJheVd7paeNiey0FivxJqgNKcH+Bzf6iSSJwbhhayysWWlZ9SAVJL00na
         5pXfZrYq2ujtEQEqGMGNmO9stZC96gi2ctfdD0fjb7DRlusfSm634K9OjU9uTaeVGO2s
         WOaQ==
X-Gm-Message-State: ANoB5pnMMpIpMbMW+2TGB2HfvTjD2aSw3MPkyXBi3+5a482y6XnAmoMo
        fJOJiixRObpgWPMRZB/kVRZsLA==
X-Google-Smtp-Source: AA0mqf7tKWNp18LViY+utWA4oFDduRBYo97RMrOyjuIqht8T/ECjMhM0v36AD/nn/ieFytEaTQYURw==
X-Received: by 2002:a05:6512:3e06:b0:4b5:9bfa:801a with SMTP id i6-20020a0565123e0600b004b59bfa801amr11163373lfv.46.1671236259518;
        Fri, 16 Dec 2022 16:17:39 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:39 -0800 (PST)
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
Subject: [PATCH 10/15] clk: qcom: gcc-qcs404: use parent_hws/_data instead of parent_names
Date:   Sat, 17 Dec 2022 02:17:25 +0200
Message-Id: <20221217001730.540502-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 515 ++++++++++++++++++----------------
 1 file changed, 266 insertions(+), 249 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 5ae7a6b2a326..3941175d73a5 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -42,7 +42,9 @@ static struct clk_fixed_factor cxo = {
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
@@ -57,7 +59,9 @@ static struct clk_alpha_pll gpll0_sleep_clk_src = {
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
@@ -73,8 +77,9 @@ static struct clk_alpha_pll gpll0_out_main = {
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
@@ -90,7 +95,9 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
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
@@ -106,7 +113,9 @@ static struct clk_alpha_pll gpll1_out_main = {
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
@@ -137,7 +146,9 @@ static struct clk_alpha_pll gpll3_out_main = {
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
@@ -152,7 +163,9 @@ static struct clk_alpha_pll gpll4_out_main = {
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
@@ -169,7 +182,9 @@ static struct clk_pll gpll6 = {
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
@@ -180,7 +195,9 @@ static struct clk_regmap gpll6_out_aux = {
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
@@ -191,22 +208,22 @@ static const struct parent_map gcc_parent_map_0[] = {
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
@@ -216,11 +233,11 @@ static const struct parent_map gcc_parent_map_2[] = {
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
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static const struct parent_map gcc_parent_map_3[] = {
@@ -229,10 +246,10 @@ static const struct parent_map gcc_parent_map_3[] = {
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
@@ -240,9 +257,9 @@ static const struct parent_map gcc_parent_map_4[] = {
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
@@ -251,9 +268,9 @@ static const struct parent_map gcc_parent_map_5[] = {
 	/* { P_GPLL0_OUT_AUX, 2 }, */
 };
 
-static const char * const gcc_parent_names_5[] = {
-	"cxo",
-	"dsi0pllbyte",
+static const struct clk_parent_data gcc_parent_data_5[] = {
+	{ .hw = &cxo.hw },
+	{ .fw_name = "dsi0pllbyte", .name = "dsi0pllbyte" },
 	/* "gpll0_out_aux", */
 };
 
@@ -263,9 +280,9 @@ static const struct parent_map gcc_parent_map_6[] = {
 	/* { P_GPLL0_OUT_AUX, 3 }, */
 };
 
-static const char * const gcc_parent_names_6[] = {
-	"cxo",
-	"dsi0pllbyte",
+static const struct clk_parent_data gcc_parent_data_6[] = {
+	{ .hw = &cxo.hw },
+	{ .fw_name = "dsi0pllbyte", .name = "dsi0pllbyte" },
 	/* "gpll0_out_aux", */
 };
 
@@ -277,11 +294,11 @@ static const struct parent_map gcc_parent_map_7[] = {
 	/* { P_GPLL4_OUT_AUX, 4 }, */
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
 	/* "gpll4_out_aux", */
 };
 
@@ -290,9 +307,9 @@ static const struct parent_map gcc_parent_map_8[] = {
 	{ P_HDMI_PHY_PLL_CLK, 1 },
 };
 
-static const char * const gcc_parent_names_8[] = {
-	"cxo",
-	"hdmi_pll",
+static const struct clk_parent_data gcc_parent_data_8[] = {
+	{ .hw = &cxo.hw },
+	{ .fw_name = "hdmi_pll", .name = "hdmi_pll" },
 };
 
 static const struct parent_map gcc_parent_map_9[] = {
@@ -302,11 +319,11 @@ static const struct parent_map gcc_parent_map_9[] = {
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
+	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
+	{ .hw = &gpll6_out_aux.hw },
 };
 
 static const struct parent_map gcc_parent_map_10[] = {
@@ -314,9 +331,9 @@ static const struct parent_map gcc_parent_map_10[] = {
 	{ P_SLEEP_CLK, 1 },
 };
 
-static const char * const gcc_parent_names_10[] = {
-	"cxo",
-	"sleep_clk",
+static const struct clk_parent_data gcc_parent_data_10[] = {
+	{ .hw = &cxo.hw },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static const struct parent_map gcc_parent_map_11[] = {
@@ -324,9 +341,9 @@ static const struct parent_map gcc_parent_map_11[] = {
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
@@ -335,9 +352,9 @@ static const struct parent_map gcc_parent_map_12[] = {
 	/* { P_GPLL0_OUT_AUX, 2 }, */
 };
 
-static const char * const gcc_parent_names_12[] = {
-	"cxo",
-	"dsi0pll",
+static const struct clk_parent_data gcc_parent_data_12[] = {
+	{ .hw = &cxo.hw },
+	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
 	/* "gpll0_out_aux", */
 };
 
@@ -348,11 +365,11 @@ static const struct parent_map gcc_parent_map_13[] = {
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
@@ -361,9 +378,9 @@ static const struct parent_map gcc_parent_map_14[] = {
 	/* { P_GPLL4_OUT_AUX, 2 }, */
 };
 
-static const char * const gcc_parent_names_14[] = {
-	"cxo",
-	"gpll0_out_main",
+static const struct clk_parent_data gcc_parent_data_14[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
 	/* "gpll4_out_aux", */
 };
 
@@ -372,8 +389,8 @@ static const struct parent_map gcc_parent_map_15[] = {
 	/* { P_GPLL0_OUT_AUX, 2 }, */
 };
 
-static const char * const gcc_parent_names_15[] = {
-	"cxo",
+static const struct clk_parent_data gcc_parent_data_15[] = {
+	{ .hw = &cxo.hw },
 	/* "gpll0_out_aux", */
 };
 
@@ -383,9 +400,9 @@ static const struct parent_map gcc_parent_map_16[] = {
 	/* { P_GPLL0_OUT_AUX, 2 }, */
 };
 
-static const char * const gcc_parent_names_16[] = {
-	"cxo",
-	"gpll0_out_main",
+static const struct clk_parent_data gcc_parent_data_16[] = {
+	{ .hw = &cxo.hw },
+	{ .hw = &gpll0_out_main.clkr.hw },
 	/* "gpll0_out_aux", */
 };
 
@@ -405,8 +422,8 @@ static struct clk_rcg2 apss_ahb_clk_src = {
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
@@ -426,8 +443,8 @@ static struct clk_rcg2 blsp1_qup0_i2c_apps_clk_src = {
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
@@ -451,8 +468,8 @@ static struct clk_rcg2 blsp1_qup0_spi_apps_clk_src = {
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
@@ -465,8 +482,8 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
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
@@ -490,8 +507,8 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
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
@@ -504,8 +521,8 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
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
@@ -530,8 +547,8 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
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
@@ -544,8 +561,8 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
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
@@ -558,8 +575,8 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
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
@@ -572,8 +589,8 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
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
@@ -586,8 +603,8 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
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
@@ -620,8 +637,8 @@ static struct clk_rcg2 blsp1_uart0_apps_clk_src = {
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
@@ -634,8 +651,8 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
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
@@ -648,8 +665,8 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
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
@@ -663,8 +680,8 @@ static struct clk_rcg2 blsp1_uart3_apps_clk_src = {
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
@@ -677,8 +694,8 @@ static struct clk_rcg2 blsp2_qup0_i2c_apps_clk_src = {
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
@@ -691,8 +708,8 @@ static struct clk_rcg2 blsp2_qup0_spi_apps_clk_src = {
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
@@ -705,8 +722,8 @@ static struct clk_rcg2 blsp2_uart0_apps_clk_src = {
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
@@ -718,8 +735,8 @@ static struct clk_rcg2 byte0_clk_src = {
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
@@ -741,8 +758,8 @@ static struct clk_rcg2 emac_clk_src = {
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
@@ -762,8 +779,8 @@ static struct clk_rcg2 emac_ptp_clk_src = {
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
@@ -781,8 +798,8 @@ static struct clk_rcg2 esc0_clk_src = {
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
@@ -815,8 +832,8 @@ static struct clk_rcg2 gfx3d_clk_src = {
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
@@ -836,8 +853,8 @@ static struct clk_rcg2 gp1_clk_src = {
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
@@ -850,8 +867,8 @@ static struct clk_rcg2 gp2_clk_src = {
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
@@ -864,8 +881,8 @@ static struct clk_rcg2 gp3_clk_src = {
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
@@ -878,8 +895,8 @@ static struct clk_rcg2 hdmi_app_clk_src = {
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
@@ -892,8 +909,8 @@ static struct clk_rcg2 hdmi_pclk_clk_src = {
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
@@ -919,8 +936,8 @@ static struct clk_rcg2 mdp_clk_src = {
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
@@ -938,8 +955,8 @@ static struct clk_rcg2 pcie_0_aux_clk_src = {
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
@@ -959,8 +976,8 @@ static struct clk_rcg2 pcie_0_pipe_clk_src = {
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
@@ -972,8 +989,8 @@ static struct clk_rcg2 pclk0_clk_src = {
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
@@ -993,8 +1010,8 @@ static struct clk_rcg2 pdm2_clk_src = {
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
@@ -1021,8 +1038,8 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
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
@@ -1041,8 +1058,8 @@ static struct clk_rcg2 sdcc1_ice_core_clk_src = {
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
@@ -1067,8 +1084,8 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
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
@@ -1081,8 +1098,8 @@ static struct clk_rcg2 usb20_mock_utmi_clk_src = {
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
@@ -1103,8 +1120,8 @@ static struct clk_rcg2 usb30_master_clk_src = {
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
@@ -1117,8 +1134,8 @@ static struct clk_rcg2 usb30_mock_utmi_clk_src = {
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
@@ -1131,8 +1148,8 @@ static struct clk_rcg2 usb3_phy_aux_clk_src = {
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
@@ -1154,8 +1171,8 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
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
@@ -1168,8 +1185,8 @@ static struct clk_rcg2 vsync_clk_src = {
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
@@ -1190,8 +1207,8 @@ static struct clk_rcg2 cdsp_bimc_clk_src = {
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
@@ -1204,8 +1221,8 @@ static struct clk_branch gcc_apss_ahb_clk = {
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
@@ -1236,8 +1253,8 @@ static struct clk_branch gcc_bimc_gfx_clk = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_bimc_gfx_clk",
 			.ops = &clk_branch2_ops,
-			.parent_names = (const char *[]){
-				"gcc_apss_tcu_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gcc_apss_tcu_clk.clkr.hw,
 			},
 
 		},
@@ -1265,8 +1282,8 @@ static struct clk_branch gcc_bimc_cdsp_clk = {
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
@@ -1335,8 +1352,8 @@ static struct clk_branch gcc_blsp1_qup0_i2c_apps_clk = {
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
@@ -1353,8 +1370,8 @@ static struct clk_branch gcc_blsp1_qup0_spi_apps_clk = {
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
@@ -1371,8 +1388,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
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
@@ -1389,8 +1406,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
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
@@ -1407,8 +1424,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
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
@@ -1425,8 +1442,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
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
@@ -1443,8 +1460,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
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
@@ -1461,8 +1478,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
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
@@ -1479,8 +1496,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
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
@@ -1497,8 +1514,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
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
@@ -1515,8 +1532,8 @@ static struct clk_branch gcc_blsp1_uart0_apps_clk = {
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
@@ -1533,8 +1550,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
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
@@ -1551,8 +1568,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
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
@@ -1569,8 +1586,8 @@ static struct clk_branch gcc_blsp1_uart3_apps_clk = {
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
@@ -1600,8 +1617,8 @@ static struct clk_branch gcc_blsp2_qup0_i2c_apps_clk = {
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
@@ -1618,8 +1635,8 @@ static struct clk_branch gcc_blsp2_qup0_spi_apps_clk = {
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
@@ -1636,8 +1653,8 @@ static struct clk_branch gcc_blsp2_uart0_apps_clk = {
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
@@ -1719,8 +1736,8 @@ static struct clk_branch gcc_eth_ptp_clk = {
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
@@ -1737,8 +1754,8 @@ static struct clk_branch gcc_eth_rgmii_clk = {
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
@@ -1820,8 +1837,8 @@ static struct clk_branch gcc_cdsp_tbu_clk = {
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
@@ -1838,8 +1855,8 @@ static struct clk_branch gcc_gp1_clk = {
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
@@ -1856,8 +1873,8 @@ static struct clk_branch gcc_gp2_clk = {
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
@@ -1874,8 +1891,8 @@ static struct clk_branch gcc_gp3_clk = {
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
@@ -1944,8 +1961,8 @@ static struct clk_branch gcc_mdss_byte0_clk = {
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
@@ -1962,8 +1979,8 @@ static struct clk_branch gcc_mdss_esc0_clk = {
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
@@ -1980,8 +1997,8 @@ static struct clk_branch gcc_mdss_hdmi_app_clk = {
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
@@ -1998,8 +2015,8 @@ static struct clk_branch gcc_mdss_hdmi_pclk_clk = {
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
@@ -2016,8 +2033,8 @@ static struct clk_branch gcc_mdss_mdp_clk = {
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
@@ -2034,8 +2051,8 @@ static struct clk_branch gcc_mdss_pclk0_clk = {
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
@@ -2052,8 +2069,8 @@ static struct clk_branch gcc_mdss_vsync_clk = {
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
@@ -2083,8 +2100,8 @@ static struct clk_branch gcc_oxili_gfx3d_clk = {
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
@@ -2101,8 +2118,8 @@ static struct clk_branch gcc_pcie_0_aux_clk = {
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
@@ -2145,8 +2162,8 @@ static struct clk_branch gcc_pcie_0_pipe_clk = {
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
@@ -2204,8 +2221,8 @@ static struct clk_branch gcc_pdm2_clk = {
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
@@ -2314,8 +2331,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
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
@@ -2332,8 +2349,8 @@ static struct clk_branch gcc_sdcc1_ice_core_clk = {
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
@@ -2376,8 +2393,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
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
@@ -2407,8 +2424,8 @@ static struct clk_branch gcc_sys_noc_usb3_clk = {
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
@@ -2437,8 +2454,8 @@ static struct clk_branch gcc_usb20_mock_utmi_clk = {
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
@@ -2468,8 +2485,8 @@ static struct clk_branch gcc_usb30_master_clk = {
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
@@ -2486,8 +2503,8 @@ static struct clk_branch gcc_usb30_mock_utmi_clk = {
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
@@ -2517,8 +2534,8 @@ static struct clk_branch gcc_usb3_phy_aux_clk = {
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
@@ -2560,8 +2577,8 @@ static struct clk_branch gcc_usb_hs_system_clk = {
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

