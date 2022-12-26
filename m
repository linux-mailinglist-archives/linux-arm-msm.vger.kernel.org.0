Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DC19655FD8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbiLZEWV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231590AbiLZEWH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:22:07 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC97B2DD4
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:04 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id bp15so14652207lfb.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIx7HE1YspqQa0r7eyhFqYmEA7OT5Q00tyYl8HNz71o=;
        b=P769JKfcvOl1osNUabAk5YEWH+3F1uiHZd2AeXE6GDTZkzdTAapQG73SkPZkMcEAgh
         dcLZ12Er8hF8fH/D6VnnUgQIUVwPxHcSU8WHQq+A4QpETbancey5P4WskWDNqJxin9Yb
         mZrTU8ANnnHHANzbE2T6Bn6MI/rpKYEk8eorc9vi19lSKbn4cMYM/Ua51fi4cVtkI6z/
         VOOtA1Qg/UisRVHN9Id1pzc6K1wpi7uKwSPqpjXzFz2V53Kt8GekjiyLlsswGA82JA3h
         UCVB7xKy08sdYKa1MRCjNZS1jJI3nndM3DM36QXTNFvX3jYokIJ89yzOlEmFkKlueWIV
         y/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iIx7HE1YspqQa0r7eyhFqYmEA7OT5Q00tyYl8HNz71o=;
        b=Q4byjekB09dJ/ShziuFypcWvONjn5honfkUzd8e5L9/YBdyQ1Lx23Xv7/+a6f4NZaC
         lG3TCSRIuRNoWvUGAe+7NwhMoo5sdli5LdPcCKnFprGJn9HoTTTBkepBeFR9gz4KN0wA
         mccc96wQrmI0iD7kx/Ql+s0/IoCmgygNeP2gK4sI2kgcI/KE19RiJELKcMogCDLAl+T9
         RbS38+qrJYC3XdNXGI9Ch/FPAKCJ1JtNuEBRbzzpWwS7nOHJzi0e5at0tWkQIDls/n9m
         S9f6XCEp6oRQ/I0wsCBl3mo5TmG0oVTh8XdS1B8LzN4CY5Y/dtY+bN79/u95jQELksY2
         5uEw==
X-Gm-Message-State: AFqh2krjOXkaEGXro7sa3lQfYjWO8jrXXhfuWnyDHuKaXLjMp/8gBgrU
        ys4ytD8urz6YXiVBY438a/D/eg==
X-Google-Smtp-Source: AMrXdXvM8Xjb4IO/VgqQFticH+n2U5q4Oo7gwg1mGjiILkj/vwLcssm8UygiVxipnL42LtlWIQu7GA==
X-Received: by 2002:a05:6512:3601:b0:4b5:9bfa:801a with SMTP id f1-20020a056512360100b004b59bfa801amr4287240lfs.46.1672028523110;
        Sun, 25 Dec 2022 20:22:03 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.02
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
Subject: [PATCH v2 11/16] clk: qcom: gcc-qcs404: sort out the cxo clock
Date:   Mon, 26 Dec 2022 06:21:49 +0200
Message-Id: <20221226042154.2666748-12-dmitry.baryshkov@linaro.org>
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

The GCC driver registers the cxo clock as a thin wrapper around board's
xo_board clock. Nowadays we can use the xo_board directly in all the
clocks that use it. Use the fw_name "cxo" for this clock.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 97 +++++++++++++++--------------------
 1 file changed, 41 insertions(+), 56 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index 2726a48f2d5c..fa2adf242648 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -44,14 +44,21 @@ enum {
 	P_XO,
 };
 
+static const struct parent_map gcc_parent_map_1[] = {
+	{ P_XO, 0 },
+};
+
+static const struct clk_parent_data gcc_parent_data_1[] = {
+	{ .index = DT_XO, .name = "xo-board" },
+};
+
 static struct clk_fixed_factor cxo = {
 	.mult = 1,
 	.div = 1,
 	.hw.init = &(struct clk_init_data){
 		.name = "cxo",
-		.parent_data = &(const struct clk_parent_data) {
-			.name = "xo-board",
-		},
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.num_parents = 1,
 		.ops = &clk_fixed_factor_ops,
 	},
@@ -66,10 +73,8 @@ static struct clk_alpha_pll gpll0_sleep_clk_src = {
 		.enable_is_inverted = true,
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_sleep_clk_src",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -84,10 +89,8 @@ static struct clk_alpha_pll gpll0_out_main = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -102,10 +105,8 @@ static struct clk_alpha_pll gpll0_ao_out_main = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll0_ao_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.flags = CLK_IS_CRITICAL,
 			.ops = &clk_alpha_pll_fixed_ops,
 		},
@@ -120,10 +121,8 @@ static struct clk_alpha_pll gpll1_out_main = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll1_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -153,10 +152,8 @@ static struct clk_alpha_pll gpll3_out_main = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll3_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -170,10 +167,8 @@ static struct clk_alpha_pll gpll4_out_main = {
 		.enable_mask = BIT(5),
 		.hw.init = &(struct clk_init_data){
 			.name = "gpll4_out_main",
-			.parent_data = &(const struct clk_parent_data) {
-				.hw = &cxo.hw,
-			},
-			.num_parents = 1,
+			.parent_data = gcc_parent_data_1,
+			.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 			.ops = &clk_alpha_pll_ops,
 		},
 	},
@@ -189,10 +184,8 @@ static struct clk_pll gpll6 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll6",
-		.parent_data = &(const struct clk_parent_data) {
-			.hw = &cxo.hw,
-		},
-		.num_parents = 1,
+		.parent_data = gcc_parent_data_1,
+		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
 		.ops = &clk_pll_ops,
 	},
 };
@@ -216,23 +209,15 @@ static const struct parent_map gcc_parent_map_0[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_0[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 };
 
 static const struct clk_parent_data gcc_parent_data_ao_0[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll0_ao_out_main.clkr.hw },
 };
 
-static const struct parent_map gcc_parent_map_1[] = {
-	{ P_XO, 0 },
-};
-
-static const struct clk_parent_data gcc_parent_data_1[] = {
-	{ .hw = &cxo.hw },
-};
-
 static const struct parent_map gcc_parent_map_2[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
@@ -241,7 +226,7 @@ static const struct parent_map gcc_parent_map_2[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_2[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll6_out_aux.hw },
 	{ .index = DT_SLEEP_CLK, .name = "sleep_clk" },
@@ -254,7 +239,7 @@ static const struct parent_map gcc_parent_map_3[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_3[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll6_out_aux.hw },
 };
@@ -265,7 +250,7 @@ static const struct parent_map gcc_parent_map_4[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_4[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll1_out_main.clkr.hw },
 };
 
@@ -275,7 +260,7 @@ static const struct parent_map gcc_parent_map_5[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_5[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK, .name = "dsi0pllbyte" },
 };
 
@@ -285,7 +270,7 @@ static const struct parent_map gcc_parent_map_6[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_6[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .index = DT_DSI0_PHY_PLL_OUT_BYTECLK, .name = "dsi0pllbyte" },
 };
 
@@ -297,7 +282,7 @@ static const struct parent_map gcc_parent_map_7[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_7[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll3_out_main.clkr.hw },
 	{ .hw = &gpll6_out_aux.hw },
@@ -309,7 +294,7 @@ static const struct parent_map gcc_parent_map_8[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_8[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .index = DT_HDMI_PHY_PLL_CLK, .name = "hdmi_pll" },
 };
 
@@ -321,7 +306,7 @@ static const struct parent_map gcc_parent_map_9[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_9[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK, .name = "dsi0pll" },
 	{ .hw = &gpll6_out_aux.hw },
@@ -333,7 +318,7 @@ static const struct parent_map gcc_parent_map_10[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_10[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .index = DT_SLEEP_CLK, .name = "sleep_clk" },
 };
 
@@ -343,7 +328,7 @@ static const struct parent_map gcc_parent_map_11[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_11[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .fw_name = "pcie_0_pipe_clk", .name = "pcie_0_pipe_clk" },
 };
 
@@ -353,7 +338,7 @@ static const struct parent_map gcc_parent_map_12[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_12[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .index = DT_DSI0_PHY_PLL_OUT_DSICLK, .name = "dsi0pll" },
 };
 
@@ -365,7 +350,7 @@ static const struct parent_map gcc_parent_map_13[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_13[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 	{ .hw = &gpll4_out_main.clkr.hw },
 	{ .hw = &gpll6_out_aux.hw },
@@ -377,7 +362,7 @@ static const struct parent_map gcc_parent_map_14[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_14[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 };
 
@@ -386,7 +371,7 @@ static const struct parent_map gcc_parent_map_15[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_15[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 };
 
 static const struct parent_map gcc_parent_map_16[] = {
@@ -395,7 +380,7 @@ static const struct parent_map gcc_parent_map_16[] = {
 };
 
 static const struct clk_parent_data gcc_parent_data_16[] = {
-	{ .hw = &cxo.hw },
+	{ .index = DT_XO, .name = "xo-board" },
 	{ .hw = &gpll0_out_main.clkr.hw },
 };
 
-- 
2.35.1

