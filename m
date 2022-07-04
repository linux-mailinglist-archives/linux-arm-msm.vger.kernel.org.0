Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0A82565CF3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jul 2022 19:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234288AbiGDRZH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jul 2022 13:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234191AbiGDRZH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jul 2022 13:25:07 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDD821114A
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jul 2022 10:25:02 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id a11so11799893ljb.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jul 2022 10:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ogM+JQ//m0ii6n+CCm772l0lsol+iCvoJi7Y5PfB/aM=;
        b=VnW2OqFd+n31m/UKT+1wtuCiRxPKGlNLoWvn1YvBvggn08vShWtWQuBDyCJ4eHcGPW
         EZ9Pa/raoTqehEIsDlvHbxYcTV3WmBBMku+s9WctZOXZr4sutDMpr0ME6eOovy8hNtws
         V8MZpLJ1cRFLn22n/glAsiGduIJGLGcddHdfU/Xe6RckD8CY0Bw2jQaMRNl2Xvszt3Ve
         UE9gUgPkeseWg//j03VwaswuUg7o0JngAtFL/VqNUSmfXqS1DK92dQyDYVvFCoM94enB
         J4LfOjpRIgszSoegC6qxHBY5sUxMkNQqEZpwOU8PaOSQLdiJrM7sHeNY6T5N3F+pDo1t
         JcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ogM+JQ//m0ii6n+CCm772l0lsol+iCvoJi7Y5PfB/aM=;
        b=H43DD0ktMUtNyhc+NMvtlay9D2UVjwo2mMlwQyRDnwJJiEdLL2VjwYuZceTgOHb17F
         AxiwjPLXAcjIrVE4TwptNIaq5e+J0Z4NQP2Fx1FIaJtvpdG9X2NEmxP7T2idQaq+dFKD
         3iyJdCJz+gSA9I+sTxHebXKdE+IIXRUdOKDRXzJnmD9XVgqGf2YGyWHFvYuhXKJgxpeg
         z3FCRpz35bDY6lnCpIFoHl8AAYVHlFUuRSlrkg7n+N7SsJG1Wse7vd1qhi6cGRvFD1q0
         d2omY+9PwXl9LE3c2Nri+zMj92SRMIu4HpAu90jZbQ7l+SwQwxY2XcdnJ6IXwt10oeyV
         AUhA==
X-Gm-Message-State: AJIora9bHFSrKBkaXgrGsuZeqK5uGDv/oP0XNVtZgDnFS1WtEFWLXSf7
        yxKyShFAqjK/XHiyvv2kTFplpg==
X-Google-Smtp-Source: AGRyM1tDyUD8UcVljNLU8PUadksN7IjPx9YGyTq/fTjM8YUaqraQXZsiOy6webMlSwocoxH0/rGc9g==
X-Received: by 2002:a2e:bd0e:0:b0:253:c481:d1bd with SMTP id n14-20020a2ebd0e000000b00253c481d1bdmr17430255ljq.154.1656955500782;
        Mon, 04 Jul 2022 10:25:00 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u15-20020ac2518f000000b0048152c51812sm2339596lfi.154.2022.07.04.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 10:25:00 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v4 6/7] clk: qcom: gcc-msm8916: use parent_hws/_data instead of parent_names
Date:   Mon,  4 Jul 2022 20:24:52 +0300
Message-Id: <20220704172453.838303-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
References: <20220704172453.838303-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names. Use parent_hws where possible to refer parent
clocks directly, skipping the lookup.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 682 +++++++++++++++++----------------
 1 file changed, 349 insertions(+), 333 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index f965cde0e8d5..0c8fe19387a7 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -52,7 +52,9 @@ static struct clk_pll gpll0 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -63,7 +65,9 @@ static struct clk_regmap gpll0_vote = {
 	.enable_mask = BIT(0),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll0_vote",
-		.parent_names = (const char *[]){ "gpll0" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -79,7 +83,9 @@ static struct clk_pll gpll1 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll1",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -90,7 +96,9 @@ static struct clk_regmap gpll1_vote = {
 	.enable_mask = BIT(1),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll1_vote",
-		.parent_names = (const char *[]){ "gpll1" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll1.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -106,7 +114,9 @@ static struct clk_pll gpll2 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll2",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -117,7 +127,9 @@ static struct clk_regmap gpll2_vote = {
 	.enable_mask = BIT(2),
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll2_vote",
-		.parent_names = (const char *[]){ "gpll2" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll2.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -133,7 +145,9 @@ static struct clk_pll bimc_pll = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_pll",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -144,7 +158,9 @@ static struct clk_regmap bimc_pll_vote = {
 	.enable_mask = BIT(3),
 	.hw.init = &(struct clk_init_data){
 		.name = "bimc_pll_vote",
-		.parent_names = (const char *[]){ "bimc_pll" },
+		.parent_hws = (const struct clk_hw*[]){
+			&bimc_pll.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -155,9 +171,9 @@ static const struct parent_map gcc_xo_gpll0_map[] = {
 	{ P_GPLL0, 1 },
 };
 
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0_vote",
+static const struct clk_parent_data gcc_xo_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
 };
 
 static const struct parent_map gcc_xo_gpll0_bimc_map[] = {
@@ -166,10 +182,10 @@ static const struct parent_map gcc_xo_gpll0_bimc_map[] = {
 	{ P_BIMC, 2 },
 };
 
-static const char * const gcc_xo_gpll0_bimc[] = {
-	"xo",
-	"gpll0_vote",
-	"bimc_pll_vote",
+static const struct clk_parent_data gcc_xo_gpll0_bimc[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .hw = &bimc_pll_vote.hw },
 };
 
 static const struct parent_map gcc_xo_gpll0a_gpll1_gpll2a_map[] = {
@@ -179,11 +195,11 @@ static const struct parent_map gcc_xo_gpll0a_gpll1_gpll2a_map[] = {
 	{ P_GPLL2_AUX, 2 },
 };
 
-static const char * const gcc_xo_gpll0a_gpll1_gpll2a[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll1_vote",
-	"gpll2_vote",
+static const struct clk_parent_data gcc_xo_gpll0a_gpll1_gpll2a[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .hw = &gpll1_vote.hw },
+	{ .hw = &gpll2_vote.hw },
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll2_map[] = {
@@ -192,10 +208,10 @@ static const struct parent_map gcc_xo_gpll0_gpll2_map[] = {
 	{ P_GPLL2, 2 },
 };
 
-static const char * const gcc_xo_gpll0_gpll2[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll2_vote",
+static const struct clk_parent_data gcc_xo_gpll0_gpll2[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .hw = &gpll2_vote.hw },
 };
 
 static const struct parent_map gcc_xo_gpll0a_map[] = {
@@ -203,9 +219,9 @@ static const struct parent_map gcc_xo_gpll0a_map[] = {
 	{ P_GPLL0_AUX, 2 },
 };
 
-static const char * const gcc_xo_gpll0a[] = {
-	"xo",
-	"gpll0_vote",
+static const struct clk_parent_data gcc_xo_gpll0a[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll1a_sleep_map[] = {
@@ -215,11 +231,11 @@ static const struct parent_map gcc_xo_gpll0_gpll1a_sleep_map[] = {
 	{ P_SLEEP_CLK, 6 },
 };
 
-static const char * const gcc_xo_gpll0_gpll1a_sleep[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll1_vote",
-	"sleep_clk",
+static const struct clk_parent_data gcc_xo_gpll0_gpll1a_sleep[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .hw = &gpll1_vote.hw },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll1a_map[] = {
@@ -228,10 +244,10 @@ static const struct parent_map gcc_xo_gpll0_gpll1a_map[] = {
 	{ P_GPLL1_AUX, 2 },
 };
 
-static const char * const gcc_xo_gpll0_gpll1a[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll1_vote",
+static const struct clk_parent_data gcc_xo_gpll0_gpll1a[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .hw = &gpll1_vote.hw },
 };
 
 static const struct parent_map gcc_xo_dsibyte_map[] = {
@@ -239,9 +255,9 @@ static const struct parent_map gcc_xo_dsibyte_map[] = {
 	{ P_DSI0_PHYPLL_BYTE, 2 },
 };
 
-static const char * const gcc_xo_dsibyte[] = {
-	"xo",
-	"dsi0pllbyte",
+static const struct clk_parent_data gcc_xo_dsibyte[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "dsi0pllbyte", .name = "dsi0pllbyte" },
 };
 
 static const struct parent_map gcc_xo_gpll0a_dsibyte_map[] = {
@@ -250,10 +266,10 @@ static const struct parent_map gcc_xo_gpll0a_dsibyte_map[] = {
 	{ P_DSI0_PHYPLL_BYTE, 1 },
 };
 
-static const char * const gcc_xo_gpll0a_dsibyte[] = {
-	"xo",
-	"gpll0_vote",
-	"dsi0pllbyte",
+static const struct clk_parent_data gcc_xo_gpll0a_dsibyte[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .fw_name = "dsi0pllbyte", .name = "dsi0pllbyte" },
 };
 
 static const struct parent_map gcc_xo_gpll0_dsiphy_map[] = {
@@ -262,10 +278,10 @@ static const struct parent_map gcc_xo_gpll0_dsiphy_map[] = {
 	{ P_DSI0_PHYPLL_DSI, 2 },
 };
 
-static const char * const gcc_xo_gpll0_dsiphy[] = {
-	"xo",
-	"gpll0_vote",
-	"dsi0pll",
+static const struct clk_parent_data gcc_xo_gpll0_dsiphy[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
 };
 
 static const struct parent_map gcc_xo_gpll0a_dsiphy_map[] = {
@@ -274,10 +290,10 @@ static const struct parent_map gcc_xo_gpll0a_dsiphy_map[] = {
 	{ P_DSI0_PHYPLL_DSI, 1 },
 };
 
-static const char * const gcc_xo_gpll0a_dsiphy[] = {
-	"xo",
-	"gpll0_vote",
-	"dsi0pll",
+static const struct clk_parent_data gcc_xo_gpll0a_dsiphy[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
 };
 
 static const struct parent_map gcc_xo_gpll0a_gpll1_gpll2_map[] = {
@@ -287,11 +303,11 @@ static const struct parent_map gcc_xo_gpll0a_gpll1_gpll2_map[] = {
 	{ P_GPLL2, 2 },
 };
 
-static const char * const gcc_xo_gpll0a_gpll1_gpll2[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll1_vote",
-	"gpll2_vote",
+static const struct clk_parent_data gcc_xo_gpll0a_gpll1_gpll2[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .hw = &gpll1_vote.hw },
+	{ .hw = &gpll2_vote.hw },
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll1_sleep_map[] = {
@@ -301,11 +317,11 @@ static const struct parent_map gcc_xo_gpll0_gpll1_sleep_map[] = {
 	{ P_SLEEP_CLK, 6 }
 };
 
-static const char * const gcc_xo_gpll0_gpll1_sleep[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll1_vote",
-	"sleep_clk",
+static const struct clk_parent_data gcc_xo_gpll0_gpll1_sleep[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll0_vote.hw },
+	{ .hw = &gpll1_vote.hw },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static const struct parent_map gcc_xo_gpll1_epi2s_emclk_sleep_map[] = {
@@ -316,12 +332,12 @@ static const struct parent_map gcc_xo_gpll1_epi2s_emclk_sleep_map[] = {
 	{ P_SLEEP_CLK, 6 }
 };
 
-static const char * const gcc_xo_gpll1_epi2s_emclk_sleep[] = {
-	"xo",
-	"gpll1_vote",
-	"ext_pri_i2s",
-	"ext_mclk",
-	"sleep_clk",
+static const struct clk_parent_data gcc_xo_gpll1_epi2s_emclk_sleep[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll1_vote.hw },
+	{ .fw_name = "ext_pri_i2s", .name = "ext_pri_i2s" },
+	{ .fw_name = "ext_mclk", .name = "ext_mclk" },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static const struct parent_map gcc_xo_gpll1_esi2s_emclk_sleep_map[] = {
@@ -332,12 +348,12 @@ static const struct parent_map gcc_xo_gpll1_esi2s_emclk_sleep_map[] = {
 	{ P_SLEEP_CLK, 6 }
 };
 
-static const char * const gcc_xo_gpll1_esi2s_emclk_sleep[] = {
-	"xo",
-	"gpll1_vote",
-	"ext_sec_i2s",
-	"ext_mclk",
-	"sleep_clk",
+static const struct clk_parent_data gcc_xo_gpll1_esi2s_emclk_sleep[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll1_vote.hw },
+	{ .fw_name = "ext_sec_i2s", .name = "ext_sec_i2s" },
+	{ .fw_name = "ext_mclk", .name = "ext_mclk" },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static const struct parent_map gcc_xo_sleep_map[] = {
@@ -345,9 +361,9 @@ static const struct parent_map gcc_xo_sleep_map[] = {
 	{ P_SLEEP_CLK, 6 }
 };
 
-static const char * const gcc_xo_sleep[] = {
-	"xo",
-	"sleep_clk",
+static const struct clk_parent_data gcc_xo_sleep[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static const struct parent_map gcc_xo_gpll1_emclk_sleep_map[] = {
@@ -357,11 +373,11 @@ static const struct parent_map gcc_xo_gpll1_emclk_sleep_map[] = {
 	{ P_SLEEP_CLK, 6 }
 };
 
-static const char * const gcc_xo_gpll1_emclk_sleep[] = {
-	"xo",
-	"gpll1_vote",
-	"ext_mclk",
-	"sleep_clk",
+static const struct clk_parent_data gcc_xo_gpll1_emclk_sleep[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &gpll1_vote.hw },
+	{ .fw_name = "ext_mclk", .name = "ext_mclk" },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
@@ -370,7 +386,7 @@ static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	.parent_map = gcc_xo_gpll0_bimc_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pcnoc_bfdcd_clk_src",
-		.parent_names = gcc_xo_gpll0_bimc,
+		.parent_data = gcc_xo_gpll0_bimc,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.ops = &clk_rcg2_ops,
 	},
@@ -382,7 +398,7 @@ static struct clk_rcg2 system_noc_bfdcd_clk_src = {
 	.parent_map = gcc_xo_gpll0_bimc_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "system_noc_bfdcd_clk_src",
-		.parent_names = gcc_xo_gpll0_bimc,
+		.parent_data = gcc_xo_gpll0_bimc,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.ops = &clk_rcg2_ops,
 	},
@@ -402,7 +418,7 @@ static struct clk_rcg2 camss_ahb_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_ahb_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_ahb_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -423,7 +439,7 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 	.freq_tbl = ftbl_apss_ahb_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_ahb_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -442,7 +458,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_csi0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -455,7 +471,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_csi0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -483,7 +499,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	.freq_tbl = ftbl_gcc_oxili_gfx3d_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
-		.parent_names = gcc_xo_gpll0a_gpll1_gpll2a,
+		.parent_data = gcc_xo_gpll0a_gpll1_gpll2a,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2a),
 		.ops = &clk_rcg2_ops,
 	},
@@ -510,7 +526,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_vfe0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll2,
+		.parent_data = gcc_xo_gpll0_gpll2,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
@@ -529,7 +545,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -558,7 +574,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -571,7 +587,7 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -585,7 +601,7 @@ static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -598,7 +614,7 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -612,7 +628,7 @@ static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -625,7 +641,7 @@ static struct clk_rcg2 blsp1_qup4_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -639,7 +655,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -652,7 +668,7 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -666,7 +682,7 @@ static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -679,7 +695,7 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_i2c_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_i2c_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -693,7 +709,7 @@ static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_qup1_6_spi_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -726,7 +742,7 @@ static struct clk_rcg2 blsp1_uart1_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -740,7 +756,7 @@ static struct clk_rcg2 blsp1_uart2_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_blsp1_uart1_6_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_uart2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -759,7 +775,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_cci_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
-		.parent_names = gcc_xo_gpll0a,
+		.parent_data = gcc_xo_gpll0a,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
 		.ops = &clk_rcg2_ops,
 	},
@@ -792,7 +808,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_gp0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -806,7 +822,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_gp0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -826,7 +842,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_jpeg0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -847,7 +863,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_mclk0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -861,7 +877,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_mclk0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -880,7 +896,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_csi0_1phytimer_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a,
+		.parent_data = gcc_xo_gpll0_gpll1a,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
 		.ops = &clk_rcg2_ops,
 	},
@@ -893,7 +909,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_csi0_1phytimer_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a,
+		.parent_data = gcc_xo_gpll0_gpll1a,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
 		.ops = &clk_rcg2_ops,
 	},
@@ -913,7 +929,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_cpp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll2,
+		.parent_data = gcc_xo_gpll0_gpll2,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
@@ -934,7 +950,7 @@ static struct clk_rcg2 crypto_clk_src = {
 	.freq_tbl = ftbl_gcc_crypto_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "crypto_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -975,7 +991,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.freq_tbl = ftbl_gcc_gp1_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -989,7 +1005,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.freq_tbl = ftbl_gcc_gp1_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1003,7 +1019,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.freq_tbl = ftbl_gcc_gp1_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1015,7 +1031,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.parent_map = gcc_xo_gpll0a_dsibyte_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
-		.parent_names = gcc_xo_gpll0a_dsibyte,
+		.parent_data = gcc_xo_gpll0a_dsibyte,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1034,7 +1050,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.freq_tbl = ftbl_gcc_mdss_esc0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
-		.parent_names = gcc_xo_dsibyte,
+		.parent_data = gcc_xo_dsibyte,
 		.num_parents = ARRAY_SIZE(gcc_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1059,7 +1075,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.freq_tbl = ftbl_gcc_mdss_mdp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
-		.parent_names = gcc_xo_gpll0_dsiphy,
+		.parent_data = gcc_xo_gpll0_dsiphy,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_dsiphy),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1072,7 +1088,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.parent_map = gcc_xo_gpll0a_dsiphy_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
-		.parent_names = gcc_xo_gpll0a_dsiphy,
+		.parent_data = gcc_xo_gpll0a_dsiphy,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsiphy),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1091,7 +1107,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.freq_tbl = ftbl_gcc_mdss_vsync_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
-		.parent_names = gcc_xo_gpll0a,
+		.parent_data = gcc_xo_gpll0a,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1109,7 +1125,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.freq_tbl = ftbl_gcc_pdm2_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1134,7 +1150,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_sdcc1_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -1159,7 +1175,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_sdcc2_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -1179,7 +1195,7 @@ static struct clk_rcg2 apss_tcu_clk_src = {
 	.freq_tbl = ftbl_gcc_apss_tcu_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_tcu_clk_src",
-		.parent_names = gcc_xo_gpll0a_gpll1_gpll2,
+		.parent_data = gcc_xo_gpll0a_gpll1_gpll2,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1202,7 +1218,7 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
 	.freq_tbl = ftbl_gcc_bimc_gpu_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_gpu_clk_src",
-		.parent_names = gcc_xo_gpll0_bimc,
+		.parent_data = gcc_xo_gpll0_bimc,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.flags = CLK_GET_RATE_NOCACHE,
 		.ops = &clk_rcg2_ops,
@@ -1221,7 +1237,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.freq_tbl = ftbl_gcc_usb_hs_system_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1247,7 +1263,7 @@ static struct clk_rcg2 ultaudio_ahbfabric_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_ahb_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_ahbfabric_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1260,8 +1276,8 @@ static struct clk_branch gcc_ultaudio_ahbfabric_ixfabric_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_ahbfabric_ixfabric_clk",
-			.parent_names = (const char *[]){
-				"ultaudio_ahbfabric_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_ahbfabric_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1277,8 +1293,8 @@ static struct clk_branch gcc_ultaudio_ahbfabric_ixfabric_lpm_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_ahbfabric_ixfabric_lpm_clk",
-			.parent_names = (const char *[]){
-				"ultaudio_ahbfabric_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_ahbfabric_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1326,7 +1342,7 @@ static struct clk_rcg2 ultaudio_lpaif_pri_i2s_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_lpaif_i2s_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_pri_i2s_clk_src",
-		.parent_names = gcc_xo_gpll1_epi2s_emclk_sleep,
+		.parent_data = gcc_xo_gpll1_epi2s_emclk_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_epi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1339,8 +1355,8 @@ static struct clk_branch gcc_ultaudio_lpaif_pri_i2s_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_lpaif_pri_i2s_clk",
-			.parent_names = (const char *[]){
-				"ultaudio_lpaif_pri_i2s_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_lpaif_pri_i2s_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1357,7 +1373,7 @@ static struct clk_rcg2 ultaudio_lpaif_sec_i2s_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_lpaif_i2s_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_sec_i2s_clk_src",
-		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
+		.parent_data = gcc_xo_gpll1_esi2s_emclk_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1370,8 +1386,8 @@ static struct clk_branch gcc_ultaudio_lpaif_sec_i2s_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_lpaif_sec_i2s_clk",
-			.parent_names = (const char *[]){
-				"ultaudio_lpaif_sec_i2s_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_lpaif_sec_i2s_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1388,7 +1404,7 @@ static struct clk_rcg2 ultaudio_lpaif_aux_i2s_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_lpaif_i2s_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_aux_i2s_clk_src",
-		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
+		.parent_data = gcc_xo_gpll1_esi2s_emclk_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1401,8 +1417,8 @@ static struct clk_branch gcc_ultaudio_lpaif_aux_i2s_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_lpaif_aux_i2s_clk",
-			.parent_names = (const char *[]){
-				"ultaudio_lpaif_aux_i2s_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_lpaif_aux_i2s_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1423,7 +1439,7 @@ static struct clk_rcg2 ultaudio_xo_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_xo_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_xo_clk_src",
-		.parent_names = gcc_xo_sleep,
+		.parent_data = gcc_xo_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1436,8 +1452,8 @@ static struct clk_branch gcc_ultaudio_avsync_xo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_avsync_xo_clk",
-			.parent_names = (const char *[]){
-				"ultaudio_xo_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1453,8 +1469,8 @@ static struct clk_branch gcc_ultaudio_stc_xo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_stc_xo_clk",
-			.parent_names = (const char *[]){
-				"ultaudio_xo_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ultaudio_xo_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1479,7 +1495,7 @@ static struct clk_rcg2 codec_digcodec_clk_src = {
 	.freq_tbl = ftbl_codec_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "codec_digcodec_clk_src",
-		.parent_names = gcc_xo_gpll1_emclk_sleep,
+		.parent_data = gcc_xo_gpll1_emclk_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1492,8 +1508,8 @@ static struct clk_branch gcc_codec_digcodec_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_codec_digcodec_clk",
-			.parent_names = (const char *[]){
-				"codec_digcodec_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&codec_digcodec_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1509,8 +1525,8 @@ static struct clk_branch gcc_ultaudio_pcnoc_mport_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_pcnoc_mport_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1525,8 +1541,8 @@ static struct clk_branch gcc_ultaudio_pcnoc_sway_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_ultaudio_pcnoc_sway_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1549,7 +1565,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	.freq_tbl = ftbl_gcc_venus0_vcodec0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vcodec0_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1563,8 +1579,8 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1579,8 +1595,8 @@ static struct clk_branch gcc_blsp1_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_sleep_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk", .name = "sleep_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1596,8 +1612,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup1_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1613,8 +1629,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup1_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup1_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup1_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1630,8 +1646,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup2_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1647,8 +1663,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup2_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup2_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup2_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1664,8 +1680,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup3_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1681,8 +1697,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup3_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup3_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup3_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1698,8 +1714,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup4_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1715,8 +1731,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup4_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup4_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup4_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1732,8 +1748,8 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup5_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup5_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1749,8 +1765,8 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup5_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup5_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup5_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1766,8 +1782,8 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_i2c_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup6_i2c_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup6_i2c_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1783,8 +1799,8 @@ static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_qup6_spi_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_qup6_spi_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_qup6_spi_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1800,8 +1816,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart1_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1817,8 +1833,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_uart2_apps_clk",
-			.parent_names = (const char *[]){
-				"blsp1_uart2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&blsp1_uart2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1835,8 +1851,8 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_boot_rom_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1851,8 +1867,8 @@ static struct clk_branch gcc_camss_cci_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cci_ahb_clk",
-			.parent_names = (const char *[]){
-				"camss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1868,8 +1884,8 @@ static struct clk_branch gcc_camss_cci_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cci_clk",
-			.parent_names = (const char *[]){
-				"cci_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cci_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1885,8 +1901,8 @@ static struct clk_branch gcc_camss_csi0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0_ahb_clk",
-			.parent_names = (const char *[]){
-				"camss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1902,8 +1918,8 @@ static struct clk_branch gcc_camss_csi0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0_clk",
-			.parent_names = (const char *[]){
-				"csi0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1919,8 +1935,8 @@ static struct clk_branch gcc_camss_csi0phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0phy_clk",
-			.parent_names = (const char *[]){
-				"csi0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1936,8 +1952,8 @@ static struct clk_branch gcc_camss_csi0pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0pix_clk",
-			.parent_names = (const char *[]){
-				"csi0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1953,8 +1969,8 @@ static struct clk_branch gcc_camss_csi0rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0rdi_clk",
-			.parent_names = (const char *[]){
-				"csi0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1970,8 +1986,8 @@ static struct clk_branch gcc_camss_csi1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1_ahb_clk",
-			.parent_names = (const char *[]){
-				"camss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1987,8 +2003,8 @@ static struct clk_branch gcc_camss_csi1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1_clk",
-			.parent_names = (const char *[]){
-				"csi1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2004,8 +2020,8 @@ static struct clk_branch gcc_camss_csi1phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1phy_clk",
-			.parent_names = (const char *[]){
-				"csi1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2021,8 +2037,8 @@ static struct clk_branch gcc_camss_csi1pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1pix_clk",
-			.parent_names = (const char *[]){
-				"csi1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2038,8 +2054,8 @@ static struct clk_branch gcc_camss_csi1rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1rdi_clk",
-			.parent_names = (const char *[]){
-				"csi1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2055,8 +2071,8 @@ static struct clk_branch gcc_camss_csi_vfe0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi_vfe0_clk",
-			.parent_names = (const char *[]){
-				"vfe0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2072,8 +2088,8 @@ static struct clk_branch gcc_camss_gp0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_gp0_clk",
-			.parent_names = (const char *[]){
-				"camss_gp0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_gp0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2089,8 +2105,8 @@ static struct clk_branch gcc_camss_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_gp1_clk",
-			.parent_names = (const char *[]){
-				"camss_gp1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2106,8 +2122,8 @@ static struct clk_branch gcc_camss_ispif_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_ispif_ahb_clk",
-			.parent_names = (const char *[]){
-				"camss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2123,8 +2139,8 @@ static struct clk_branch gcc_camss_jpeg0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_jpeg0_clk",
-			.parent_names = (const char *[]){
-				"jpeg0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&jpeg0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2140,8 +2156,8 @@ static struct clk_branch gcc_camss_jpeg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_jpeg_ahb_clk",
-			.parent_names = (const char *[]){
-				"camss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2157,8 +2173,8 @@ static struct clk_branch gcc_camss_jpeg_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_jpeg_axi_clk",
-			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2174,8 +2190,8 @@ static struct clk_branch gcc_camss_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_mclk0_clk",
-			.parent_names = (const char *[]){
-				"mclk0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2191,8 +2207,8 @@ static struct clk_branch gcc_camss_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_mclk1_clk",
-			.parent_names = (const char *[]){
-				"mclk1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2208,8 +2224,8 @@ static struct clk_branch gcc_camss_micro_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_micro_ahb_clk",
-			.parent_names = (const char *[]){
-				"camss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2225,8 +2241,8 @@ static struct clk_branch gcc_camss_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi0phytimer_clk",
-			.parent_names = (const char *[]){
-				"csi0phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2242,8 +2258,8 @@ static struct clk_branch gcc_camss_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_csi1phytimer_clk",
-			.parent_names = (const char *[]){
-				"csi1phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1phytimer_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2259,8 +2275,8 @@ static struct clk_branch gcc_camss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_ahb_clk",
-			.parent_names = (const char *[]){
-				"camss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2276,8 +2292,8 @@ static struct clk_branch gcc_camss_top_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_top_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2293,8 +2309,8 @@ static struct clk_branch gcc_camss_cpp_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cpp_ahb_clk",
-			.parent_names = (const char *[]){
-				"camss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2310,8 +2326,8 @@ static struct clk_branch gcc_camss_cpp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_cpp_clk",
-			.parent_names = (const char *[]){
-				"cpp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cpp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2327,8 +2343,8 @@ static struct clk_branch gcc_camss_vfe0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_vfe0_clk",
-			.parent_names = (const char *[]){
-				"vfe0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2344,8 +2360,8 @@ static struct clk_branch gcc_camss_vfe_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_vfe_ahb_clk",
-			.parent_names = (const char *[]){
-				"camss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_ahb_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2361,8 +2377,8 @@ static struct clk_branch gcc_camss_vfe_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_camss_vfe_axi_clk",
-			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2379,8 +2395,8 @@ static struct clk_branch gcc_crypto_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2397,8 +2413,8 @@ static struct clk_branch gcc_crypto_axi_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_axi_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2415,8 +2431,8 @@ static struct clk_branch gcc_crypto_clk = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_clk",
-			.parent_names = (const char *[]){
-				"crypto_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&crypto_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2432,8 +2448,8 @@ static struct clk_branch gcc_oxili_gmem_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_oxili_gmem_clk",
-			.parent_names = (const char *[]){
-				"gfx3d_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2449,8 +2465,8 @@ static struct clk_branch gcc_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp1_clk",
-			.parent_names = (const char *[]){
-				"gp1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gp1_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2466,8 +2482,8 @@ static struct clk_branch gcc_gp2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp2_clk",
-			.parent_names = (const char *[]){
-				"gp2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gp2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2483,8 +2499,8 @@ static struct clk_branch gcc_gp3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gp3_clk",
-			.parent_names = (const char *[]){
-				"gp3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gp3_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2500,8 +2516,8 @@ static struct clk_branch gcc_mdss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2517,8 +2533,8 @@ static struct clk_branch gcc_mdss_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_axi_clk",
-			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2534,8 +2550,8 @@ static struct clk_branch gcc_mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_byte0_clk",
-			.parent_names = (const char *[]){
-				"byte0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&byte0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2551,8 +2567,8 @@ static struct clk_branch gcc_mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_esc0_clk",
-			.parent_names = (const char *[]){
-				"esc0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&esc0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2568,8 +2584,8 @@ static struct clk_branch gcc_mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_mdp_clk",
-			.parent_names = (const char *[]){
-				"mdp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mdp_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2585,8 +2601,8 @@ static struct clk_branch gcc_mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_pclk0_clk",
-			.parent_names = (const char *[]){
-				"pclk0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2602,8 +2618,8 @@ static struct clk_branch gcc_mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdss_vsync_clk",
-			.parent_names = (const char *[]){
-				"vsync_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vsync_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2619,8 +2635,8 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_cfg_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2636,8 +2652,8 @@ static struct clk_branch gcc_oxili_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_oxili_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2653,8 +2669,8 @@ static struct clk_branch gcc_oxili_gfx3d_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_oxili_gfx3d_clk",
-			.parent_names = (const char *[]){
-				"gfx3d_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2670,8 +2686,8 @@ static struct clk_branch gcc_pdm2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm2_clk",
-			.parent_names = (const char *[]){
-				"pdm2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pdm2_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2687,8 +2703,8 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2705,8 +2721,8 @@ static struct clk_branch gcc_prng_ahb_clk = {
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_prng_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2721,8 +2737,8 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2738,8 +2754,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc1_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sdcc1_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2755,8 +2771,8 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2772,8 +2788,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_apps_clk",
-			.parent_names = (const char *[]){
-				"sdcc2_apps_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&sdcc2_apps_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2788,7 +2804,7 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
 	.parent_map = gcc_xo_gpll0_bimc_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_ddr_clk_src",
-		.parent_names = gcc_xo_gpll0_bimc,
+		.parent_data = gcc_xo_gpll0_bimc,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_GET_RATE_NOCACHE,
@@ -2802,8 +2818,8 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
-			.parent_names = (const char *[]){
-				"bimc_ddr_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_ddr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2819,8 +2835,8 @@ static struct clk_branch gcc_apss_tcu_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_apss_tcu_clk",
-			.parent_names = (const char *[]){
-				"bimc_ddr_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_ddr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2835,8 +2851,8 @@ static struct clk_branch gcc_gfx_tcu_clk = {
 		.enable_mask = BIT(2),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gfx_tcu_clk",
-			.parent_names = (const char *[]){
-				"bimc_ddr_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_ddr_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2851,8 +2867,8 @@ static struct clk_branch gcc_gtcu_ahb_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_gtcu_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2868,8 +2884,8 @@ static struct clk_branch gcc_bimc_gfx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_bimc_gfx_clk",
-			.parent_names = (const char *[]){
-				"bimc_gpu_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_gpu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2885,8 +2901,8 @@ static struct clk_branch gcc_bimc_gpu_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_bimc_gpu_clk",
-			.parent_names = (const char *[]){
-				"bimc_gpu_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&bimc_gpu_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2902,8 +2918,8 @@ static struct clk_branch gcc_jpeg_tbu_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_jpeg_tbu_clk",
-			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2919,8 +2935,8 @@ static struct clk_branch gcc_mdp_tbu_clk = {
 		.enable_mask = BIT(4),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mdp_tbu_clk",
-			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2936,8 +2952,8 @@ static struct clk_branch gcc_smmu_cfg_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_smmu_cfg_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2953,8 +2969,8 @@ static struct clk_branch gcc_venus_tbu_clk = {
 		.enable_mask = BIT(5),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus_tbu_clk",
-			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2970,8 +2986,8 @@ static struct clk_branch gcc_vfe_tbu_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_vfe_tbu_clk",
-			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2987,8 +3003,8 @@ static struct clk_branch gcc_usb2a_phy_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb2a_phy_sleep_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = &(const struct clk_parent_data){
+				.fw_name = "sleep_clk", .name = "sleep_clk_src",
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3004,8 +3020,8 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3021,8 +3037,8 @@ static struct clk_branch gcc_usb_hs_system_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_system_clk",
-			.parent_names = (const char *[]){
-				"usb_hs_system_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&usb_hs_system_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3038,8 +3054,8 @@ static struct clk_branch gcc_venus0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus0_ahb_clk",
-			.parent_names = (const char *[]){
-				"pcnoc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pcnoc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3055,8 +3071,8 @@ static struct clk_branch gcc_venus0_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus0_axi_clk",
-			.parent_names = (const char *[]){
-				"system_noc_bfdcd_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&system_noc_bfdcd_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -3072,8 +3088,8 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_venus0_vcodec0_clk",
-			.parent_names = (const char *[]){
-				"vcodec0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vcodec0_clk_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.35.1

