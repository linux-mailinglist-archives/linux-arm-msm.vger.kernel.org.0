Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDED254F794
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 14:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382325AbiFQM3f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 08:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382272AbiFQM3e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 08:29:34 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FE1C6160D
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:30 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id d18so4581695ljc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9Q+tvhVN3xogHM67wT4Tn0zO0RAnAZHu1B2mFfK3VvA=;
        b=NwirziAiZeWD68ylX6ERKZP7QBUUWQCf8nPzcw+ces6kItzmu4TSH9dvK/wWvziWzF
         uHGdoR1L4/cTUu7gOUaFSq7wLdN4eU0BCDYL1SFrTt31Bg3TweZWz90u1Icpwxmaq8k3
         MGDLIRDgto0CfbJomrEBF6Wj9CAdRmIEPT9cpjdYh959WAyO1gRkeLEl4Z6AbWGSMUtI
         2o6T33k3O79G+iKj8qRI3Mpq6DVuGxeoKgv4pHrd53kKCPAsaXX8l1XHkBcThPC0Ad7K
         qMmSFT+L/Wr6J601TPZbX4DnV8x179p1Kvtbdn+EgLWSRb1TNIXAiTgrgaIrHVrC1tnu
         S3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9Q+tvhVN3xogHM67wT4Tn0zO0RAnAZHu1B2mFfK3VvA=;
        b=I1IHdiFQSxoEg0DAlI4lfXNiwpF1BG9fc9dEqI+Emz5kQOwguI8q6m4WXpY6zJYOwM
         3jgISvn2vPXuQxNtVjmpq0S9YFS7BthQt8K0u0TvUHUYwcWKZJconD77Erka3c7VnEuo
         0B4RDKnM5TxHPKb3BNng8u7z/pgj4ZkQfCIgbWuxa4uTD3sF8GzGbZADVy2Doh+xown/
         N2yrLyslnki4bUVdJNEzE1Jl6DcarOhOYgeOjANxa3VHzJz9jW2q/LTCmn03Qg6GpgnH
         TiZcO2OjedJkEtlRPOPBncFrUgZ4kuzDiAA8h+fvVh54BzMijDtcQOhPnHTiL+nd81E0
         lUnw==
X-Gm-Message-State: AJIora9N92u1A75Byi1peENoPp+wiSkjCDGDsWj0adGFJetbgxmPKewF
        9S2/uD64lKgb8N4uaoNLAmXQBw==
X-Google-Smtp-Source: AGRyM1vAX6JX+HVuiNseeVA2ufcwkh7fhGE06/9IeOYPeDp+8Qsi/y3qI+7I5j7p66l1hBaKArdpaQ==
X-Received: by 2002:a2e:740c:0:b0:255:5ce8:2bc2 with SMTP id p12-20020a2e740c000000b002555ce82bc2mr4823596ljc.61.1655468967561;
        Fri, 17 Jun 2022 05:29:27 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b8-20020a2e8948000000b0025568a2a018sm539471ljk.129.2022.06.17.05.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:29:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 5/6] clk: qcom: mmcc-msm8996: use parent_hws/_data instead of parent_names
Date:   Fri, 17 Jun 2022 15:29:21 +0300
Message-Id: <20220617122922.769562-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
References: <20220617122922.769562-1-dmitry.baryshkov@linaro.org>
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8996.c | 734 +++++++++++++++++++++-----------
 1 file changed, 495 insertions(+), 239 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8996.c b/drivers/clk/qcom/mmcc-msm8996.c
index 27c92818c49c..80330dab4d81 100644
--- a/drivers/clk/qcom/mmcc-msm8996.c
+++ b/drivers/clk/qcom/mmcc-msm8996.c
@@ -50,7 +50,9 @@ static struct clk_fixed_factor gpll0_div = {
 	.div = 2,
 	.hw.init = &(struct clk_init_data){
 		.name = "gpll0_div",
-		.parent_names = (const char *[]){ "gpll0" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "gpll0", .name = "gpll0" },
+		},
 		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
@@ -83,7 +85,9 @@ static struct clk_alpha_pll mmpll0_early = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmpll0_early",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "xo", .name = "xo_board" },
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		},
@@ -96,7 +100,9 @@ static struct clk_alpha_pll_postdiv mmpll0 = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll0",
-		.parent_names = (const char *[]){ "mmpll0_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll0_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -113,7 +119,9 @@ static struct clk_alpha_pll mmpll1_early = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmpll1_early",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "xo", .name = "xo_board" },
+			},
 			.num_parents = 1,
 			.ops = &clk_alpha_pll_ops,
 		}
@@ -126,7 +134,9 @@ static struct clk_alpha_pll_postdiv mmpll1 = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll1",
-		.parent_names = (const char *[]){ "mmpll1_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll1_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -140,7 +150,9 @@ static struct clk_alpha_pll mmpll2_early = {
 	.num_vco = ARRAY_SIZE(mmpll_gfx_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll2_early",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
 	},
@@ -152,7 +164,9 @@ static struct clk_alpha_pll_postdiv mmpll2 = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll2",
-		.parent_names = (const char *[]){ "mmpll2_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll2_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -166,7 +180,9 @@ static struct clk_alpha_pll mmpll3_early = {
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll3_early",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
 	},
@@ -178,7 +194,9 @@ static struct clk_alpha_pll_postdiv mmpll3 = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll3",
-		.parent_names = (const char *[]){ "mmpll3_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll3_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -192,7 +210,9 @@ static struct clk_alpha_pll mmpll4_early = {
 	.num_vco = ARRAY_SIZE(mmpll_t_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll4_early",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
 	},
@@ -204,7 +224,9 @@ static struct clk_alpha_pll_postdiv mmpll4 = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll4",
-		.parent_names = (const char *[]){ "mmpll4_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll4_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -218,7 +240,9 @@ static struct clk_alpha_pll mmpll5_early = {
 	.num_vco = ARRAY_SIZE(mmpll_p_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll5_early",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
 	},
@@ -230,7 +254,9 @@ static struct clk_alpha_pll_postdiv mmpll5 = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll5",
-		.parent_names = (const char *[]){ "mmpll5_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll5_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -244,7 +270,9 @@ static struct clk_alpha_pll mmpll8_early = {
 	.num_vco = ARRAY_SIZE(mmpll_gfx_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll8_early",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
 	},
@@ -256,7 +284,9 @@ static struct clk_alpha_pll_postdiv mmpll8 = {
 	.width = 4,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll8",
-		.parent_names = (const char *[]){ "mmpll8_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll8_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -270,7 +300,9 @@ static struct clk_alpha_pll mmpll9_early = {
 	.num_vco = ARRAY_SIZE(mmpll_t_vco),
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll9_early",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_ops,
 	},
@@ -282,7 +314,9 @@ static struct clk_alpha_pll_postdiv mmpll9 = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll9",
-		.parent_names = (const char *[]){ "mmpll9_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll9_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -294,9 +328,9 @@ static const struct parent_map mmss_xo_hdmi_map[] = {
 	{ P_HDMIPLL, 1 }
 };
 
-static const char * const mmss_xo_hdmi[] = {
-	"xo",
-	"hdmipll"
+static const struct clk_parent_data mmss_xo_hdmi[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "hdmipll", .name = "hdmipll" }
 };
 
 static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
@@ -305,10 +339,10 @@ static const struct parent_map mmss_xo_dsi0pll_dsi1pll_map[] = {
 	{ P_DSI1PLL, 2 }
 };
 
-static const char * const mmss_xo_dsi0pll_dsi1pll[] = {
-	"xo",
-	"dsi0pll",
-	"dsi1pll"
+static const struct clk_parent_data mmss_xo_dsi0pll_dsi1pll[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
+	{ .fw_name = "dsi1pll", .name = "dsi1pll" }
 };
 
 static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
@@ -317,10 +351,10 @@ static const struct parent_map mmss_xo_gpll0_gpll0_div_map[] = {
 	{ P_GPLL0_DIV, 6 }
 };
 
-static const char * const mmss_xo_gpll0_gpll0_div[] = {
-	"xo",
-	"gpll0",
-	"gpll0_div"
+static const struct clk_parent_data mmss_xo_gpll0_gpll0_div[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .hw = &gpll0_div.hw }
 };
 
 static const struct parent_map mmss_xo_dsibyte_map[] = {
@@ -329,10 +363,10 @@ static const struct parent_map mmss_xo_dsibyte_map[] = {
 	{ P_DSI1PLL_BYTE, 2 }
 };
 
-static const char * const mmss_xo_dsibyte[] = {
-	"xo",
-	"dsi0pllbyte",
-	"dsi1pllbyte"
+static const struct clk_parent_data mmss_xo_dsibyte[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "dsi0pllbyte", .name = "dsi0pllbyte" },
+	{ .fw_name = "dsi1pllbyte", .name = "dsi1pllbyte" }
 };
 
 static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
@@ -342,11 +376,11 @@ static const struct parent_map mmss_xo_mmpll0_gpll0_gpll0_div_map[] = {
 	{ P_GPLL0_DIV, 6 }
 };
 
-static const char * const mmss_xo_mmpll0_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"gpll0",
-	"gpll0_div"
+static const struct clk_parent_data mmss_xo_mmpll0_gpll0_gpll0_div[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .hw = &gpll0_div.hw }
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
@@ -357,12 +391,12 @@ static const struct parent_map mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div_map[] = {
 	{ P_GPLL0_DIV, 6 }
 };
 
-static const char * const mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll1",
-	"gpll0",
-	"gpll0_div"
+static const struct clk_parent_data mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll1.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .hw = &gpll0_div.hw }
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div_map[] = {
@@ -373,12 +407,12 @@ static const struct parent_map mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div_map[] = {
 	{ P_GPLL0_DIV, 6 }
 };
 
-static const char * const mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll3",
-	"gpll0",
-	"gpll0_div"
+static const struct clk_parent_data mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll3.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .hw = &gpll0_div.hw }
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
@@ -389,12 +423,12 @@ static const struct parent_map mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div_map[] = {
 	{ P_GPLL0_DIV, 6 }
 };
 
-static const char * const mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll5",
-	"gpll0",
-	"gpll0_div"
+static const struct clk_parent_data mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll5.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .hw = &gpll0_div.hw }
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div_map[] = {
@@ -405,12 +439,12 @@ static const struct parent_map mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div_map[] = {
 	{ P_GPLL0_DIV, 6 }
 };
 
-static const char * const mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll4",
-	"gpll0",
-	"gpll0_div"
+static const struct clk_parent_data mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll4.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .hw = &gpll0_div.hw }
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map[] = {
@@ -422,13 +456,13 @@ static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map[] =
 	{ P_GPLL0, 5 }
 };
 
-static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0[] = {
-	"xo",
-	"mmpll0",
-	"mmpll9",
-	"mmpll2",
-	"mmpll8",
-	"gpll0"
+static const struct clk_parent_data mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll9.clkr.hw },
+	{ .hw = &mmpll2.clkr.hw },
+	{ .hw = &mmpll8.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div_map[] = {
@@ -441,14 +475,14 @@ static const struct parent_map mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_d
 	{ P_GPLL0_DIV, 6 }
 };
 
-static const char * const mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll9",
-	"mmpll2",
-	"mmpll8",
-	"gpll0",
-	"gpll0_div"
+static const struct clk_parent_data mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll9.clkr.hw },
+	{ .hw = &mmpll2.clkr.hw },
+	{ .hw = &mmpll8.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .hw = &gpll0_div.hw }
 };
 
 static const struct parent_map mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div_map[] = {
@@ -461,14 +495,14 @@ static const struct parent_map mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_d
 	{ P_GPLL0_DIV, 6 }
 };
 
-static const char * const mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div[] = {
-	"xo",
-	"mmpll0",
-	"mmpll1",
-	"mmpll4",
-	"mmpll3",
-	"gpll0",
-	"gpll0_div"
+static const struct clk_parent_data mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll1.clkr.hw },
+	{ .hw = &mmpll4.clkr.hw },
+	{ .hw = &mmpll3.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .hw = &gpll0_div.hw }
 };
 
 static const struct freq_tbl ftbl_ahb_clk_src[] = {
@@ -485,7 +519,7 @@ static struct clk_rcg2 ahb_clk_src = {
 	.freq_tbl = ftbl_ahb_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ahb_clk_src",
-		.parent_names = mmss_xo_mmpll0_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -509,7 +543,7 @@ static struct clk_rcg2 axi_clk_src = {
 	.freq_tbl = ftbl_axi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "axi_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -522,7 +556,7 @@ static struct clk_rcg2 maxi_clk_src = {
 	.freq_tbl = ftbl_axi_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "maxi_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -535,7 +569,7 @@ static struct clk_rcg2_gfx3d gfx3d_clk_src = {
 		.parent_map = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_map,
 		.clkr.hw.init = &(struct clk_init_data){
 			.name = "gfx3d_clk_src",
-			.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0,
+			.parent_data = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0,
 			.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0),
 			.ops = &clk_gfx3d_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -560,7 +594,7 @@ static struct clk_rcg2 rbbmtimer_clk_src = {
 	.freq_tbl = ftbl_rbbmtimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbbmtimer_clk_src",
-		.parent_names = mmss_xo_mmpll0_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -572,7 +606,7 @@ static struct clk_rcg2 isense_clk_src = {
 	.parent_map = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "isense_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll9_mmpll2_mmpll8_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -591,7 +625,7 @@ static struct clk_rcg2 rbcpr_clk_src = {
 	.freq_tbl = ftbl_rbcpr_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbcpr_clk_src",
-		.parent_names = mmss_xo_mmpll0_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -613,7 +647,7 @@ static struct clk_rcg2 video_core_clk_src = {
 	.freq_tbl = ftbl_video_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_core_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -627,7 +661,7 @@ static struct clk_rcg2 video_subcore0_clk_src = {
 	.freq_tbl = ftbl_video_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_subcore0_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -641,7 +675,7 @@ static struct clk_rcg2 video_subcore1_clk_src = {
 	.freq_tbl = ftbl_video_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_subcore1_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -654,7 +688,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.parent_map = mmss_xo_dsi0pll_dsi1pll_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
-		.parent_names = mmss_xo_dsi0pll_dsi1pll,
+		.parent_data = mmss_xo_dsi0pll_dsi1pll,
 		.num_parents = ARRAY_SIZE(mmss_xo_dsi0pll_dsi1pll),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -668,7 +702,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	.parent_map = mmss_xo_dsi0pll_dsi1pll_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk1_clk_src",
-		.parent_names = mmss_xo_dsi0pll_dsi1pll,
+		.parent_data = mmss_xo_dsi0pll_dsi1pll,
 		.num_parents = ARRAY_SIZE(mmss_xo_dsi0pll_dsi1pll),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -695,7 +729,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.freq_tbl = ftbl_mdp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll5_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -713,7 +747,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	.freq_tbl = extpclk_freq_tbl,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "extpclk_clk_src",
-		.parent_names = mmss_xo_hdmi,
+		.parent_data = mmss_xo_hdmi,
 		.num_parents = ARRAY_SIZE(mmss_xo_hdmi),
 		.ops = &clk_byte_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -732,7 +766,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.freq_tbl = ftbl_mdss_vsync_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
-		.parent_names = mmss_xo_gpll0_gpll0_div,
+		.parent_data = mmss_xo_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -750,7 +784,7 @@ static struct clk_rcg2 hdmi_clk_src = {
 	.freq_tbl = ftbl_mdss_hdmi_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_clk_src",
-		.parent_names = mmss_xo_gpll0_gpll0_div,
+		.parent_data = mmss_xo_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -762,7 +796,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.parent_map = mmss_xo_dsibyte_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
-		.parent_names = mmss_xo_dsibyte,
+		.parent_data = mmss_xo_dsibyte,
 		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -775,7 +809,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	.parent_map = mmss_xo_dsibyte_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte1_clk_src",
-		.parent_names = mmss_xo_dsibyte,
+		.parent_data = mmss_xo_dsibyte,
 		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -794,7 +828,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.freq_tbl = ftbl_mdss_esc0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
-		.parent_names = mmss_xo_dsibyte,
+		.parent_data = mmss_xo_dsibyte,
 		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
@@ -807,7 +841,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	.freq_tbl = ftbl_mdss_esc0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc1_clk_src",
-		.parent_names = mmss_xo_dsibyte,
+		.parent_data = mmss_xo_dsibyte,
 		.num_parents = ARRAY_SIZE(mmss_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
@@ -831,7 +865,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.freq_tbl = ftbl_camss_gp0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -845,7 +879,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.freq_tbl = ftbl_camss_gp0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -873,7 +907,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.freq_tbl = ftbl_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -887,7 +921,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.freq_tbl = ftbl_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -901,7 +935,7 @@ static struct clk_rcg2 mclk2_clk_src = {
 	.freq_tbl = ftbl_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk2_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -915,7 +949,7 @@ static struct clk_rcg2 mclk3_clk_src = {
 	.freq_tbl = ftbl_mclk0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk3_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -937,7 +971,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.freq_tbl = ftbl_cci_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -957,7 +991,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.freq_tbl = ftbl_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -970,7 +1004,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.freq_tbl = ftbl_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -983,7 +1017,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	.freq_tbl = ftbl_csi0phytimer_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2phytimer_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1004,7 +1038,7 @@ static struct clk_rcg2 csiphy0_3p_clk_src = {
 	.freq_tbl = ftbl_csiphy0_3p_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csiphy0_3p_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1017,7 +1051,7 @@ static struct clk_rcg2 csiphy1_3p_clk_src = {
 	.freq_tbl = ftbl_csiphy0_3p_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csiphy1_3p_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1030,7 +1064,7 @@ static struct clk_rcg2 csiphy2_3p_clk_src = {
 	.freq_tbl = ftbl_csiphy0_3p_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csiphy2_3p_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1053,7 +1087,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.freq_tbl = ftbl_jpeg0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1075,7 +1109,7 @@ static struct clk_rcg2 jpeg2_clk_src = {
 	.freq_tbl = ftbl_jpeg2_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg2_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1088,7 +1122,7 @@ static struct clk_rcg2 jpeg_dma_clk_src = {
 	.freq_tbl = ftbl_jpeg0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg_dma_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1111,7 +1145,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.freq_tbl = ftbl_vfe0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1124,7 +1158,7 @@ static struct clk_rcg2 vfe1_clk_src = {
 	.freq_tbl = ftbl_vfe0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe1_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1146,7 +1180,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.freq_tbl = ftbl_cpp_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1168,7 +1202,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.freq_tbl = ftbl_csi0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1181,7 +1215,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.freq_tbl = ftbl_csi0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1194,7 +1228,7 @@ static struct clk_rcg2 csi2_clk_src = {
 	.freq_tbl = ftbl_csi0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1207,7 +1241,7 @@ static struct clk_rcg2 csi3_clk_src = {
 	.freq_tbl = ftbl_csi0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi3_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll1_mmpll4_mmpll3_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1227,7 +1261,7 @@ static struct clk_rcg2 fd_core_clk_src = {
 	.freq_tbl = ftbl_fd_core_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "fd_core_clk_src",
-		.parent_names = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
+		.parent_data = mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div,
 		.num_parents = ARRAY_SIZE(mmss_xo_mmpll0_mmpll4_gpll0_gpll0_div),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1240,7 +1274,9 @@ static struct clk_branch mmss_mmagic_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_mmagic_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
@@ -1255,7 +1291,9 @@ static struct clk_branch mmss_mmagic_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_mmagic_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
@@ -1270,7 +1308,9 @@ static struct clk_branch mmss_misc_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_misc_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1285,7 +1325,9 @@ static struct clk_branch mmss_misc_cxo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_misc_cxo_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "xo", .name = "xo_board" },
+			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
@@ -1299,7 +1341,9 @@ static struct clk_branch mmss_mmagic_maxi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_mmagic_maxi_clk",
-			.parent_names = (const char *[]){ "maxi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&maxi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1314,7 +1358,9 @@ static struct clk_branch mmagic_camss_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmagic_camss_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
@@ -1329,7 +1375,9 @@ static struct clk_branch mmagic_camss_noc_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmagic_camss_noc_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "gcc_mmss_noc_cfg_ahb_clk", .name = "gcc_mmss_noc_cfg_ahb_clk" },
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
@@ -1344,7 +1392,9 @@ static struct clk_branch smmu_vfe_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_vfe_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1359,7 +1409,9 @@ static struct clk_branch smmu_vfe_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_vfe_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1374,7 +1426,9 @@ static struct clk_branch smmu_cpp_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_cpp_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1389,7 +1443,9 @@ static struct clk_branch smmu_cpp_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_cpp_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1404,7 +1460,9 @@ static struct clk_branch smmu_jpeg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_jpeg_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1419,7 +1477,9 @@ static struct clk_branch smmu_jpeg_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_jpeg_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1434,7 +1494,9 @@ static struct clk_branch mmagic_mdss_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmagic_mdss_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
@@ -1449,7 +1511,9 @@ static struct clk_branch mmagic_mdss_noc_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmagic_mdss_noc_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "gcc_mmss_noc_cfg_ahb_clk", .name = "gcc_mmss_noc_cfg_ahb_clk" },
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
@@ -1464,7 +1528,9 @@ static struct clk_branch smmu_rot_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_rot_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1479,7 +1545,9 @@ static struct clk_branch smmu_rot_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_rot_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1494,7 +1562,9 @@ static struct clk_branch smmu_mdp_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_mdp_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1509,7 +1579,9 @@ static struct clk_branch smmu_mdp_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_mdp_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1524,7 +1596,9 @@ static struct clk_branch mmagic_video_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmagic_video_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
@@ -1539,7 +1613,9 @@ static struct clk_branch mmagic_video_noc_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmagic_video_noc_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "gcc_mmss_noc_cfg_ahb_clk", .name = "gcc_mmss_noc_cfg_ahb_clk" },
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 			.ops = &clk_branch2_ops,
@@ -1554,7 +1630,9 @@ static struct clk_branch smmu_video_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_video_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1569,7 +1647,9 @@ static struct clk_branch smmu_video_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "smmu_video_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1584,7 +1664,9 @@ static struct clk_branch mmagic_bimc_noc_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmagic_bimc_noc_cfg_ahb_clk",
-			.parent_names = (const char *[]){ "gcc_mmss_noc_cfg_ahb_clk" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "gcc_mmss_noc_cfg_ahb_clk", .name = "gcc_mmss_noc_cfg_ahb_clk" },
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1599,7 +1681,9 @@ static struct clk_branch gpu_gx_gfx3d_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_gx_gfx3d_clk",
-			.parent_names = (const char *[]){ "gfx3d_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.rcg.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1614,7 +1698,9 @@ static struct clk_branch gpu_gx_rbbmtimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_gx_rbbmtimer_clk",
-			.parent_names = (const char *[]){ "rbbmtimer_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&rbbmtimer_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1629,7 +1715,9 @@ static struct clk_branch gpu_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1644,7 +1732,9 @@ static struct clk_branch gpu_aon_isense_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpu_aon_isense_clk",
-			.parent_names = (const char *[]){ "isense_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&isense_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1659,7 +1749,9 @@ static struct clk_branch vmem_maxi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vmem_maxi_clk",
-			.parent_names = (const char *[]){ "maxi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&maxi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1674,7 +1766,9 @@ static struct clk_branch vmem_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vmem_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1689,7 +1783,9 @@ static struct clk_branch mmss_rbcpr_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_rbcpr_clk",
-			.parent_names = (const char *[]){ "rbcpr_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&rbcpr_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1704,7 +1800,9 @@ static struct clk_branch mmss_rbcpr_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_rbcpr_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1719,7 +1817,9 @@ static struct clk_branch video_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_core_clk",
-			.parent_names = (const char *[]){ "video_core_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&video_core_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1734,7 +1834,9 @@ static struct clk_branch video_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1749,7 +1851,9 @@ static struct clk_branch video_maxi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_maxi_clk",
-			.parent_names = (const char *[]){ "maxi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&maxi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1764,7 +1868,9 @@ static struct clk_branch video_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1779,7 +1885,9 @@ static struct clk_branch video_subcore0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_subcore0_clk",
-			.parent_names = (const char *[]){ "video_subcore0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&video_subcore0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1794,7 +1902,9 @@ static struct clk_branch video_subcore1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "video_subcore1_clk",
-			.parent_names = (const char *[]){ "video_subcore1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&video_subcore1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1809,7 +1919,9 @@ static struct clk_branch mdss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1824,7 +1936,9 @@ static struct clk_branch mdss_hdmi_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_hdmi_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1839,7 +1953,9 @@ static struct clk_branch mdss_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1854,7 +1970,9 @@ static struct clk_branch mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_pclk0_clk",
-			.parent_names = (const char *[]){ "pclk0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1869,7 +1987,9 @@ static struct clk_branch mdss_pclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_pclk1_clk",
-			.parent_names = (const char *[]){ "pclk1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1884,7 +2004,9 @@ static struct clk_branch mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_mdp_clk",
-			.parent_names = (const char *[]){ "mdp_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&mdp_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1899,7 +2021,9 @@ static struct clk_branch mdss_extpclk_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_extpclk_clk",
-			.parent_names = (const char *[]){ "extpclk_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&extpclk_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1914,7 +2038,9 @@ static struct clk_branch mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_vsync_clk",
-			.parent_names = (const char *[]){ "vsync_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vsync_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1929,7 +2055,9 @@ static struct clk_branch mdss_hdmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_hdmi_clk",
-			.parent_names = (const char *[]){ "hdmi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&hdmi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1944,7 +2072,9 @@ static struct clk_branch mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_byte0_clk",
-			.parent_names = (const char *[]){ "byte0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&byte0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1959,7 +2089,9 @@ static struct clk_branch mdss_byte1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_byte1_clk",
-			.parent_names = (const char *[]){ "byte1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&byte1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1974,7 +2106,9 @@ static struct clk_branch mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_esc0_clk",
-			.parent_names = (const char *[]){ "esc0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&esc0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1989,7 +2123,9 @@ static struct clk_branch mdss_esc1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_esc1_clk",
-			.parent_names = (const char *[]){ "esc1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&esc1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2004,7 +2140,9 @@ static struct clk_branch camss_top_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_top_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2019,7 +2157,9 @@ static struct clk_branch camss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2034,7 +2174,9 @@ static struct clk_branch camss_micro_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_micro_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2049,7 +2191,9 @@ static struct clk_branch camss_gp0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_gp0_clk",
-			.parent_names = (const char *[]){ "camss_gp0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_gp0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2064,7 +2208,9 @@ static struct clk_branch camss_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_gp1_clk",
-			.parent_names = (const char *[]){ "camss_gp1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_gp1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2079,7 +2225,9 @@ static struct clk_branch camss_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_mclk0_clk",
-			.parent_names = (const char *[]){ "mclk0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2094,7 +2242,9 @@ static struct clk_branch camss_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_mclk1_clk",
-			.parent_names = (const char *[]){ "mclk1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2109,7 +2259,9 @@ static struct clk_branch camss_mclk2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_mclk2_clk",
-			.parent_names = (const char *[]){ "mclk2_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk2_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2124,7 +2276,9 @@ static struct clk_branch camss_mclk3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_mclk3_clk",
-			.parent_names = (const char *[]){ "mclk3_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk3_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2139,7 +2293,9 @@ static struct clk_branch camss_cci_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_cci_clk",
-			.parent_names = (const char *[]){ "cci_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&cci_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2154,7 +2310,9 @@ static struct clk_branch camss_cci_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_cci_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2169,7 +2327,9 @@ static struct clk_branch camss_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0phytimer_clk",
-			.parent_names = (const char *[]){ "csi0phytimer_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0phytimer_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2184,7 +2344,9 @@ static struct clk_branch camss_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1phytimer_clk",
-			.parent_names = (const char *[]){ "csi1phytimer_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1phytimer_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2199,7 +2361,9 @@ static struct clk_branch camss_csi2phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2phytimer_clk",
-			.parent_names = (const char *[]){ "csi2phytimer_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2phytimer_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2214,7 +2378,9 @@ static struct clk_branch camss_csiphy0_3p_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csiphy0_3p_clk",
-			.parent_names = (const char *[]){ "csiphy0_3p_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csiphy0_3p_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2229,7 +2395,9 @@ static struct clk_branch camss_csiphy1_3p_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csiphy1_3p_clk",
-			.parent_names = (const char *[]){ "csiphy1_3p_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csiphy1_3p_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2244,7 +2412,9 @@ static struct clk_branch camss_csiphy2_3p_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csiphy2_3p_clk",
-			.parent_names = (const char *[]){ "csiphy2_3p_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csiphy2_3p_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2259,7 +2429,9 @@ static struct clk_branch camss_jpeg0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg0_clk",
-			.parent_names = (const char *[]){ "jpeg0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&jpeg0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2274,7 +2446,9 @@ static struct clk_branch camss_jpeg2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg2_clk",
-			.parent_names = (const char *[]){ "jpeg2_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&jpeg2_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2289,7 +2463,9 @@ static struct clk_branch camss_jpeg_dma_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg_dma_clk",
-			.parent_names = (const char *[]){ "jpeg_dma_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&jpeg_dma_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2304,7 +2480,9 @@ static struct clk_branch camss_jpeg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2319,7 +2497,9 @@ static struct clk_branch camss_jpeg_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2334,7 +2514,9 @@ static struct clk_branch camss_vfe_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2349,7 +2531,9 @@ static struct clk_branch camss_vfe_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2364,7 +2548,9 @@ static struct clk_branch camss_vfe0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe0_clk",
-			.parent_names = (const char *[]){ "vfe0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2379,7 +2565,9 @@ static struct clk_branch camss_vfe0_stream_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe0_stream_clk",
-			.parent_names = (const char *[]){ "vfe0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2394,7 +2582,9 @@ static struct clk_branch camss_vfe0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe0_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2409,7 +2599,9 @@ static struct clk_branch camss_vfe1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe1_clk",
-			.parent_names = (const char *[]){ "vfe1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2424,7 +2616,9 @@ static struct clk_branch camss_vfe1_stream_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe1_stream_clk",
-			.parent_names = (const char *[]){ "vfe1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2439,7 +2633,9 @@ static struct clk_branch camss_vfe1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe1_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2454,7 +2650,9 @@ static struct clk_branch camss_csi_vfe0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi_vfe0_clk",
-			.parent_names = (const char *[]){ "vfe0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2469,7 +2667,9 @@ static struct clk_branch camss_csi_vfe1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi_vfe1_clk",
-			.parent_names = (const char *[]){ "vfe1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2484,7 +2684,9 @@ static struct clk_branch camss_cpp_vbif_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_cpp_vbif_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2499,7 +2701,9 @@ static struct clk_branch camss_cpp_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_cpp_axi_clk",
-			.parent_names = (const char *[]){ "axi_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&axi_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2514,7 +2718,9 @@ static struct clk_branch camss_cpp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_cpp_clk",
-			.parent_names = (const char *[]){ "cpp_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&cpp_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2529,7 +2735,9 @@ static struct clk_branch camss_cpp_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_cpp_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2544,7 +2752,9 @@ static struct clk_branch camss_csi0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0_clk",
-			.parent_names = (const char *[]){ "csi0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2559,7 +2769,9 @@ static struct clk_branch camss_csi0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2574,7 +2786,9 @@ static struct clk_branch camss_csi0phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0phy_clk",
-			.parent_names = (const char *[]){ "csi0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2589,7 +2803,9 @@ static struct clk_branch camss_csi0rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0rdi_clk",
-			.parent_names = (const char *[]){ "csi0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2604,7 +2820,9 @@ static struct clk_branch camss_csi0pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0pix_clk",
-			.parent_names = (const char *[]){ "csi0_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2619,7 +2837,9 @@ static struct clk_branch camss_csi1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1_clk",
-			.parent_names = (const char *[]){ "csi1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2634,7 +2854,9 @@ static struct clk_branch camss_csi1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2649,7 +2871,9 @@ static struct clk_branch camss_csi1phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1phy_clk",
-			.parent_names = (const char *[]){ "csi1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2664,7 +2888,9 @@ static struct clk_branch camss_csi1rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1rdi_clk",
-			.parent_names = (const char *[]){ "csi1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2679,7 +2905,9 @@ static struct clk_branch camss_csi1pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1pix_clk",
-			.parent_names = (const char *[]){ "csi1_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2694,7 +2922,9 @@ static struct clk_branch camss_csi2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2_clk",
-			.parent_names = (const char *[]){ "csi2_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2709,7 +2939,9 @@ static struct clk_branch camss_csi2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2724,7 +2956,9 @@ static struct clk_branch camss_csi2phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2phy_clk",
-			.parent_names = (const char *[]){ "csi2_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2739,7 +2973,9 @@ static struct clk_branch camss_csi2rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2rdi_clk",
-			.parent_names = (const char *[]){ "csi2_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2754,7 +2990,9 @@ static struct clk_branch camss_csi2pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2pix_clk",
-			.parent_names = (const char *[]){ "csi2_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2769,7 +3007,9 @@ static struct clk_branch camss_csi3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3_clk",
-			.parent_names = (const char *[]){ "csi3_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi3_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2784,7 +3024,9 @@ static struct clk_branch camss_csi3_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2799,7 +3041,9 @@ static struct clk_branch camss_csi3phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3phy_clk",
-			.parent_names = (const char *[]){ "csi3_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi3_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2814,7 +3058,9 @@ static struct clk_branch camss_csi3rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3rdi_clk",
-			.parent_names = (const char *[]){ "csi3_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi3_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2829,7 +3075,9 @@ static struct clk_branch camss_csi3pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3pix_clk",
-			.parent_names = (const char *[]){ "csi3_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&csi3_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2844,7 +3092,9 @@ static struct clk_branch camss_ispif_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_ispif_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2859,7 +3109,9 @@ static struct clk_branch fd_core_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "fd_core_clk",
-			.parent_names = (const char *[]){ "fd_core_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&fd_core_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2874,7 +3126,9 @@ static struct clk_branch fd_core_uar_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "fd_core_uar_clk",
-			.parent_names = (const char *[]){ "fd_core_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&fd_core_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2889,7 +3143,9 @@ static struct clk_branch fd_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "fd_ahb_clk",
-			.parent_names = (const char *[]){ "ahb_clk_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&ahb_clk_src.clkr.hw
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
-- 
2.35.1

