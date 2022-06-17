Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E9D454F986
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 16:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382923AbiFQOrd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 10:47:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382921AbiFQOr3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 10:47:29 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B298563AE
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 07:47:24 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id w2so1627262lji.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ak8vycvFBhx1uBePISdmc1mvPJEq30VaKwko0j77Tao=;
        b=EU+/KRz9ik//Gwf3nnkSYEN3GjAWmtME8ssPsKIb9lupJJqrA90GszkRfxcvMuWnj4
         FAng3/jSQY8O5VU2vplsmJhLi3fOACYWJ6hCT7BqvsM2mv3z0KC20Mx8lqMIqD/OPpWP
         QShaEKxRALOwLezE9ATRyjCP4Dc1siF7cJ+QYgawKtu/ioMdjZjpd3b1PYYw3vA8xXnb
         mGOQmRs0tw842I8yUUoTKxcuH2U5dKvfTj/KwCBo4q5GHslvL3FL6v2YKU8Hp2V8jjpp
         JvTQL9lepb1Pd9DleTm4GHPl1icQuBEXlA7HaTcUMceycoAWFIXyevD07U6VYP+W58/M
         UHPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ak8vycvFBhx1uBePISdmc1mvPJEq30VaKwko0j77Tao=;
        b=XbXAvO7nrrlObgYIWbJh9KbYm4EZv/KW/SaMY+qmHpW1RKO01T3BSyhuTJxW9MMFSs
         x5PS9VOgZ7JGDr7LbfATgoo3iTJimm0geIgT1XhbjKWBBBs1hLz2lFUlc0oxUgpzac5K
         OW2LWsckFyIogO6eNAC4s8Ld2hj/kTnyARixkzKDVbaHhKy2QB2zFc12/UVVku47wQtE
         Hn4JeaUoFJhSrH0fEFxQAvAe8TEt0xW1ttt+mF4UrlEk4WQ/R4mP6w6gDOKJsA9mB8os
         EZhvdastHHltrsJIc/ZPyk58BuvgLowDdN6g4+dCRJDbr9XlTqjeMet+UFGfCC6QBUa3
         Finw==
X-Gm-Message-State: AJIora8fkqKqXYp6pUvfaPb7WnQ1PMSLMHInCV3qNzX6jCWYTbNeNAwF
        nV2UL2q3uxxON0UoS6FSSWIzZg==
X-Google-Smtp-Source: AGRyM1s1F+1NATHaDWxM1B9yN1O8MhoToM8RTgulAf7BPqL+Puf3I6rCKV4XXqnuTi3BorhjHPwX3A==
X-Received: by 2002:a2e:b0e4:0:b0:255:5cfe:bd2a with SMTP id h4-20020a2eb0e4000000b002555cfebd2amr4969635ljl.346.1655477242006;
        Fri, 17 Jun 2022 07:47:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5-20020a2eb165000000b002553ab60e17sm571867ljm.122.2022.06.17.07.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:47:21 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 6/7] clk: qcom: gcc-msm8916: use parent_hws/_data instead of parent_names
Date:   Fri, 17 Jun 2022 17:47:13 +0300
Message-Id: <20220617144714.817765-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
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
 drivers/clk/qcom/gcc-msm8916.c | 682 +++++++++++++++++----------------
 1 file changed, 349 insertions(+), 333 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 4d726ca4b0da..148dbbf7cecc 100644
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
@@ -779,7 +795,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_gp0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -793,7 +809,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_gp0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -813,7 +829,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_jpeg0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -834,7 +850,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_mclk0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -848,7 +864,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_mclk0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -867,7 +883,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_csi0_1phytimer_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a,
+		.parent_data = gcc_xo_gpll0_gpll1a,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
 		.ops = &clk_rcg2_ops,
 	},
@@ -880,7 +896,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_csi0_1phytimer_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a,
+		.parent_data = gcc_xo_gpll0_gpll1a,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a),
 		.ops = &clk_rcg2_ops,
 	},
@@ -900,7 +916,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.freq_tbl = ftbl_gcc_camss_cpp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll2,
+		.parent_data = gcc_xo_gpll0_gpll2,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
@@ -921,7 +937,7 @@ static struct clk_rcg2 crypto_clk_src = {
 	.freq_tbl = ftbl_gcc_crypto_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "crypto_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -940,7 +956,7 @@ static struct clk_rcg2 gp1_clk_src = {
 	.freq_tbl = ftbl_gcc_gp1_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp1_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -954,7 +970,7 @@ static struct clk_rcg2 gp2_clk_src = {
 	.freq_tbl = ftbl_gcc_gp1_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp2_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -968,7 +984,7 @@ static struct clk_rcg2 gp3_clk_src = {
 	.freq_tbl = ftbl_gcc_gp1_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gp3_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1a_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1a_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1a_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -980,7 +996,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.parent_map = gcc_xo_gpll0a_dsibyte_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
-		.parent_names = gcc_xo_gpll0a_dsibyte,
+		.parent_data = gcc_xo_gpll0a_dsibyte,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsibyte),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -999,7 +1015,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.freq_tbl = ftbl_gcc_mdss_esc0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
-		.parent_names = gcc_xo_dsibyte,
+		.parent_data = gcc_xo_dsibyte,
 		.num_parents = ARRAY_SIZE(gcc_xo_dsibyte),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1024,7 +1040,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.freq_tbl = ftbl_gcc_mdss_mdp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
-		.parent_names = gcc_xo_gpll0_dsiphy,
+		.parent_data = gcc_xo_gpll0_dsiphy,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_dsiphy),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1037,7 +1053,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.parent_map = gcc_xo_gpll0a_dsiphy_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
-		.parent_names = gcc_xo_gpll0a_dsiphy,
+		.parent_data = gcc_xo_gpll0a_dsiphy,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_dsiphy),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -1056,7 +1072,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.freq_tbl = ftbl_gcc_mdss_vsync_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
-		.parent_names = gcc_xo_gpll0a,
+		.parent_data = gcc_xo_gpll0a,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1074,7 +1090,7 @@ static struct clk_rcg2 pdm2_clk_src = {
 	.freq_tbl = ftbl_gcc_pdm2_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pdm2_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1099,7 +1115,7 @@ static struct clk_rcg2 sdcc1_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_sdcc1_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc1_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -1124,7 +1140,7 @@ static struct clk_rcg2 sdcc2_apps_clk_src = {
 	.freq_tbl = ftbl_gcc_sdcc2_apps_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "sdcc2_apps_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_floor_ops,
 	},
@@ -1144,7 +1160,7 @@ static struct clk_rcg2 apss_tcu_clk_src = {
 	.freq_tbl = ftbl_gcc_apss_tcu_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "apss_tcu_clk_src",
-		.parent_names = gcc_xo_gpll0a_gpll1_gpll2,
+		.parent_data = gcc_xo_gpll0a_gpll1_gpll2,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0a_gpll1_gpll2),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1167,7 +1183,7 @@ static struct clk_rcg2 bimc_gpu_clk_src = {
 	.freq_tbl = ftbl_gcc_bimc_gpu_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_gpu_clk_src",
-		.parent_names = gcc_xo_gpll0_bimc,
+		.parent_data = gcc_xo_gpll0_bimc,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.flags = CLK_GET_RATE_NOCACHE,
 		.ops = &clk_rcg2_ops,
@@ -1186,7 +1202,7 @@ static struct clk_rcg2 usb_hs_system_clk_src = {
 	.freq_tbl = ftbl_gcc_usb_hs_system_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "usb_hs_system_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1212,7 +1228,7 @@ static struct clk_rcg2 ultaudio_ahbfabric_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_ahb_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_ahbfabric_clk_src",
-		.parent_names = gcc_xo_gpll0_gpll1_sleep,
+		.parent_data = gcc_xo_gpll0_gpll1_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll1_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1225,8 +1241,8 @@ static struct clk_branch gcc_ultaudio_ahbfabric_ixfabric_clk = {
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
@@ -1242,8 +1258,8 @@ static struct clk_branch gcc_ultaudio_ahbfabric_ixfabric_lpm_clk = {
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
@@ -1291,7 +1307,7 @@ static struct clk_rcg2 ultaudio_lpaif_pri_i2s_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_lpaif_i2s_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_pri_i2s_clk_src",
-		.parent_names = gcc_xo_gpll1_epi2s_emclk_sleep,
+		.parent_data = gcc_xo_gpll1_epi2s_emclk_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_epi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1304,8 +1320,8 @@ static struct clk_branch gcc_ultaudio_lpaif_pri_i2s_clk = {
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
@@ -1322,7 +1338,7 @@ static struct clk_rcg2 ultaudio_lpaif_sec_i2s_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_lpaif_i2s_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_sec_i2s_clk_src",
-		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
+		.parent_data = gcc_xo_gpll1_esi2s_emclk_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1335,8 +1351,8 @@ static struct clk_branch gcc_ultaudio_lpaif_sec_i2s_clk = {
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
@@ -1353,7 +1369,7 @@ static struct clk_rcg2 ultaudio_lpaif_aux_i2s_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_lpaif_i2s_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_lpaif_aux_i2s_clk_src",
-		.parent_names = gcc_xo_gpll1_esi2s_emclk_sleep,
+		.parent_data = gcc_xo_gpll1_esi2s_emclk_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_esi2s_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1366,8 +1382,8 @@ static struct clk_branch gcc_ultaudio_lpaif_aux_i2s_clk = {
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
@@ -1388,7 +1404,7 @@ static struct clk_rcg2 ultaudio_xo_clk_src = {
 	.freq_tbl = ftbl_gcc_ultaudio_xo_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ultaudio_xo_clk_src",
-		.parent_names = gcc_xo_sleep,
+		.parent_data = gcc_xo_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1401,8 +1417,8 @@ static struct clk_branch gcc_ultaudio_avsync_xo_clk = {
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
@@ -1418,8 +1434,8 @@ static struct clk_branch gcc_ultaudio_stc_xo_clk = {
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
@@ -1444,7 +1460,7 @@ static struct clk_rcg2 codec_digcodec_clk_src = {
 	.freq_tbl = ftbl_codec_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "codec_digcodec_clk_src",
-		.parent_names = gcc_xo_gpll1_emclk_sleep,
+		.parent_data = gcc_xo_gpll1_emclk_sleep,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll1_emclk_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1457,8 +1473,8 @@ static struct clk_branch gcc_codec_digcodec_clk = {
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
@@ -1474,8 +1490,8 @@ static struct clk_branch gcc_ultaudio_pcnoc_mport_clk = {
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
@@ -1490,8 +1506,8 @@ static struct clk_branch gcc_ultaudio_pcnoc_sway_clk = {
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
@@ -1514,7 +1530,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	.freq_tbl = ftbl_gcc_venus0_vcodec0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vcodec0_clk_src",
-		.parent_names = gcc_xo_gpll0,
+		.parent_data = gcc_xo_gpll0,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1528,8 +1544,8 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
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
@@ -1544,8 +1560,8 @@ static struct clk_branch gcc_blsp1_sleep_clk = {
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
@@ -1561,8 +1577,8 @@ static struct clk_branch gcc_blsp1_qup1_i2c_apps_clk = {
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
@@ -1578,8 +1594,8 @@ static struct clk_branch gcc_blsp1_qup1_spi_apps_clk = {
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
@@ -1595,8 +1611,8 @@ static struct clk_branch gcc_blsp1_qup2_i2c_apps_clk = {
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
@@ -1612,8 +1628,8 @@ static struct clk_branch gcc_blsp1_qup2_spi_apps_clk = {
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
@@ -1629,8 +1645,8 @@ static struct clk_branch gcc_blsp1_qup3_i2c_apps_clk = {
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
@@ -1646,8 +1662,8 @@ static struct clk_branch gcc_blsp1_qup3_spi_apps_clk = {
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
@@ -1663,8 +1679,8 @@ static struct clk_branch gcc_blsp1_qup4_i2c_apps_clk = {
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
@@ -1680,8 +1696,8 @@ static struct clk_branch gcc_blsp1_qup4_spi_apps_clk = {
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
@@ -1697,8 +1713,8 @@ static struct clk_branch gcc_blsp1_qup5_i2c_apps_clk = {
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
@@ -1714,8 +1730,8 @@ static struct clk_branch gcc_blsp1_qup5_spi_apps_clk = {
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
@@ -1731,8 +1747,8 @@ static struct clk_branch gcc_blsp1_qup6_i2c_apps_clk = {
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
@@ -1748,8 +1764,8 @@ static struct clk_branch gcc_blsp1_qup6_spi_apps_clk = {
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
@@ -1765,8 +1781,8 @@ static struct clk_branch gcc_blsp1_uart1_apps_clk = {
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
@@ -1782,8 +1798,8 @@ static struct clk_branch gcc_blsp1_uart2_apps_clk = {
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
@@ -1800,8 +1816,8 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
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
@@ -1816,8 +1832,8 @@ static struct clk_branch gcc_camss_cci_ahb_clk = {
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
@@ -1833,8 +1849,8 @@ static struct clk_branch gcc_camss_cci_clk = {
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
@@ -1850,8 +1866,8 @@ static struct clk_branch gcc_camss_csi0_ahb_clk = {
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
@@ -1867,8 +1883,8 @@ static struct clk_branch gcc_camss_csi0_clk = {
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
@@ -1884,8 +1900,8 @@ static struct clk_branch gcc_camss_csi0phy_clk = {
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
@@ -1901,8 +1917,8 @@ static struct clk_branch gcc_camss_csi0pix_clk = {
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
@@ -1918,8 +1934,8 @@ static struct clk_branch gcc_camss_csi0rdi_clk = {
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
@@ -1935,8 +1951,8 @@ static struct clk_branch gcc_camss_csi1_ahb_clk = {
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
@@ -1952,8 +1968,8 @@ static struct clk_branch gcc_camss_csi1_clk = {
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
@@ -1969,8 +1985,8 @@ static struct clk_branch gcc_camss_csi1phy_clk = {
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
@@ -1986,8 +2002,8 @@ static struct clk_branch gcc_camss_csi1pix_clk = {
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
@@ -2003,8 +2019,8 @@ static struct clk_branch gcc_camss_csi1rdi_clk = {
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
@@ -2020,8 +2036,8 @@ static struct clk_branch gcc_camss_csi_vfe0_clk = {
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
@@ -2037,8 +2053,8 @@ static struct clk_branch gcc_camss_gp0_clk = {
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
@@ -2054,8 +2070,8 @@ static struct clk_branch gcc_camss_gp1_clk = {
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
@@ -2071,8 +2087,8 @@ static struct clk_branch gcc_camss_ispif_ahb_clk = {
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
@@ -2088,8 +2104,8 @@ static struct clk_branch gcc_camss_jpeg0_clk = {
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
@@ -2105,8 +2121,8 @@ static struct clk_branch gcc_camss_jpeg_ahb_clk = {
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
@@ -2122,8 +2138,8 @@ static struct clk_branch gcc_camss_jpeg_axi_clk = {
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
@@ -2139,8 +2155,8 @@ static struct clk_branch gcc_camss_mclk0_clk = {
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
@@ -2156,8 +2172,8 @@ static struct clk_branch gcc_camss_mclk1_clk = {
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
@@ -2173,8 +2189,8 @@ static struct clk_branch gcc_camss_micro_ahb_clk = {
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
@@ -2190,8 +2206,8 @@ static struct clk_branch gcc_camss_csi0phytimer_clk = {
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
@@ -2207,8 +2223,8 @@ static struct clk_branch gcc_camss_csi1phytimer_clk = {
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
@@ -2224,8 +2240,8 @@ static struct clk_branch gcc_camss_ahb_clk = {
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
@@ -2241,8 +2257,8 @@ static struct clk_branch gcc_camss_top_ahb_clk = {
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
@@ -2258,8 +2274,8 @@ static struct clk_branch gcc_camss_cpp_ahb_clk = {
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
@@ -2275,8 +2291,8 @@ static struct clk_branch gcc_camss_cpp_clk = {
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
@@ -2292,8 +2308,8 @@ static struct clk_branch gcc_camss_vfe0_clk = {
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
@@ -2309,8 +2325,8 @@ static struct clk_branch gcc_camss_vfe_ahb_clk = {
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
@@ -2326,8 +2342,8 @@ static struct clk_branch gcc_camss_vfe_axi_clk = {
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
@@ -2344,8 +2360,8 @@ static struct clk_branch gcc_crypto_ahb_clk = {
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
@@ -2362,8 +2378,8 @@ static struct clk_branch gcc_crypto_axi_clk = {
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
@@ -2380,8 +2396,8 @@ static struct clk_branch gcc_crypto_clk = {
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
@@ -2397,8 +2413,8 @@ static struct clk_branch gcc_oxili_gmem_clk = {
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
@@ -2414,8 +2430,8 @@ static struct clk_branch gcc_gp1_clk = {
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
@@ -2431,8 +2447,8 @@ static struct clk_branch gcc_gp2_clk = {
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
@@ -2448,8 +2464,8 @@ static struct clk_branch gcc_gp3_clk = {
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
@@ -2465,8 +2481,8 @@ static struct clk_branch gcc_mdss_ahb_clk = {
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
@@ -2482,8 +2498,8 @@ static struct clk_branch gcc_mdss_axi_clk = {
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
@@ -2499,8 +2515,8 @@ static struct clk_branch gcc_mdss_byte0_clk = {
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
@@ -2516,8 +2532,8 @@ static struct clk_branch gcc_mdss_esc0_clk = {
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
@@ -2533,8 +2549,8 @@ static struct clk_branch gcc_mdss_mdp_clk = {
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
@@ -2550,8 +2566,8 @@ static struct clk_branch gcc_mdss_pclk0_clk = {
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
@@ -2567,8 +2583,8 @@ static struct clk_branch gcc_mdss_vsync_clk = {
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
@@ -2584,8 +2600,8 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
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
@@ -2601,8 +2617,8 @@ static struct clk_branch gcc_oxili_ahb_clk = {
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
@@ -2618,8 +2634,8 @@ static struct clk_branch gcc_oxili_gfx3d_clk = {
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
@@ -2635,8 +2651,8 @@ static struct clk_branch gcc_pdm2_clk = {
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
@@ -2652,8 +2668,8 @@ static struct clk_branch gcc_pdm_ahb_clk = {
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
@@ -2670,8 +2686,8 @@ static struct clk_branch gcc_prng_ahb_clk = {
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
@@ -2686,8 +2702,8 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
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
@@ -2703,8 +2719,8 @@ static struct clk_branch gcc_sdcc1_apps_clk = {
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
@@ -2720,8 +2736,8 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
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
@@ -2737,8 +2753,8 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
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
@@ -2753,7 +2769,7 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
 	.parent_map = gcc_xo_gpll0_bimc_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "bimc_ddr_clk_src",
-		.parent_names = gcc_xo_gpll0_bimc,
+		.parent_data = gcc_xo_gpll0_bimc,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_GET_RATE_NOCACHE,
@@ -2767,8 +2783,8 @@ static struct clk_branch gcc_apss_tcu_clk = {
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
@@ -2783,8 +2799,8 @@ static struct clk_branch gcc_gfx_tcu_clk = {
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
@@ -2799,8 +2815,8 @@ static struct clk_branch gcc_gtcu_ahb_clk = {
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
@@ -2816,8 +2832,8 @@ static struct clk_branch gcc_bimc_gfx_clk = {
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
@@ -2833,8 +2849,8 @@ static struct clk_branch gcc_bimc_gpu_clk = {
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
@@ -2850,8 +2866,8 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
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
@@ -2867,8 +2883,8 @@ static struct clk_branch gcc_jpeg_tbu_clk = {
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
@@ -2884,8 +2900,8 @@ static struct clk_branch gcc_mdp_tbu_clk = {
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
@@ -2901,8 +2917,8 @@ static struct clk_branch gcc_smmu_cfg_clk = {
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
@@ -2918,8 +2934,8 @@ static struct clk_branch gcc_venus_tbu_clk = {
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
@@ -2935,8 +2951,8 @@ static struct clk_branch gcc_vfe_tbu_clk = {
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
@@ -2952,8 +2968,8 @@ static struct clk_branch gcc_usb2a_phy_sleep_clk = {
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
@@ -2969,8 +2985,8 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
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
@@ -2986,8 +3002,8 @@ static struct clk_branch gcc_usb_hs_system_clk = {
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
@@ -3003,8 +3019,8 @@ static struct clk_branch gcc_venus0_ahb_clk = {
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
@@ -3020,8 +3036,8 @@ static struct clk_branch gcc_venus0_axi_clk = {
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
@@ -3037,8 +3053,8 @@ static struct clk_branch gcc_venus0_vcodec0_clk = {
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

