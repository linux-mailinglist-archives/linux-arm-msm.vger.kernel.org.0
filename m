Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 882345579D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbiFWMEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbiFWMEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:34 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51932496A8
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:26 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id x3so5284708lfd.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UiJAIQH+L9+uN6VGb9S2vDqkLLCLa8YUEqig3NBbRlk=;
        b=aAgLgHKEcHviHjnGyIFIm7C4pWEW5M5SdEv7SLjLLhWjzGj1YoZ699Hsge+KuddEkN
         dJO8WJtLb8a8COdPIvLpM4h19GffgVi5CrnkDZgLzPKBKWv1DSqoxo73opBJiI8dIVxy
         E1p96BnTAjrwt02lYHZ+X+xAIApSM3YrQu4NzoFc3QIIutmBtzyiaORZR+tU/jm7BiId
         5SXkmVU5R/XZXSnOgfa03V11IVYinw63Fi6RzgVOPigZNEG/wJQOL8u8qR7Cjw+4JWFt
         6Y3Djh8kws2CZmbhfEwJTAuDOw+DNqQI/Cqr9Fjc+ic2+rt1JjZXdMKzzX5g6bj9YF8+
         TSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UiJAIQH+L9+uN6VGb9S2vDqkLLCLa8YUEqig3NBbRlk=;
        b=mcw1gr/lSw3HdDTQ4eX2gADKVmomyJe4yYf+pUTFsUdgOv5kxhteWPU64RSFj/MELs
         HLoOOTjocaGt3p3VKPJyNk6vOSK+D1NUTE2uZm0msMqBWsZSr68ooWHCaMbnfJIGfyIT
         dF+BtCDj7F96hHfFkErqzEd22nphEqKOmvxlh52z1R68Y0+C6uOX6TTAGUBL1mT8sKYO
         q/zW8x98pmSpuhWnzGORl+7bREXPkPYysZDzEenxcLvk2Uvk0WvbXoj39j60t1LG2+if
         GKpBNvz19FTj94gRx42KMTd4AHmUdSuNCTdN++dn2V+GnQKGJWlt5+l1o1Kn3S1FnuvQ
         tlgg==
X-Gm-Message-State: AJIora9B2mAMQLSVtW/SrFvio0AoyECz5hoSAhhOV34/wCthJbuln9v/
        IS9qtnB5uxib4BGAd86+lMJjtg==
X-Google-Smtp-Source: AGRyM1sseeHX1Ai+SIGx5XMY4hZMPKiSM7468kskgD20dhPzboifXHxSx2ujW40qscIZ+wuRRCWr5w==
X-Received: by 2002:a05:6512:3042:b0:47f:ac02:28e9 with SMTP id b2-20020a056512304200b0047fac0228e9mr943511lfb.448.1655985864353;
        Thu, 23 Jun 2022 05:04:24 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:23 -0700 (PDT)
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
Subject: [PATCH 06/15] clk: qcom: lcc-msm8960: use parent_hws/_data instead of parent_names
Date:   Thu, 23 Jun 2022 15:04:09 +0300
Message-Id: <20220623120418.250589-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
References: <20220623120418.250589-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/lcc-msm8960.c | 69 ++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/qcom/lcc-msm8960.c b/drivers/clk/qcom/lcc-msm8960.c
index 99a3d2d486b4..3926184cc91b 100644
--- a/drivers/clk/qcom/lcc-msm8960.c
+++ b/drivers/clk/qcom/lcc-msm8960.c
@@ -33,7 +33,9 @@ static struct clk_pll pll4 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll4",
-		.parent_names = (const char *[]){ "pxo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "pxo", .name = "pxo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -49,9 +51,9 @@ static const struct parent_map lcc_pxo_pll4_map[] = {
 	{ P_PLL4, 2 }
 };
 
-static const char * const lcc_pxo_pll4[] = {
-	"pxo",
-	"pll4_vote",
+static const struct clk_parent_data lcc_pxo_pll4[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
+	{ .fw_name = "pll4_vote", .name = "pll4_vote" },
 };
 
 static struct freq_tbl clk_tbl_aif_osr_492[] = {
@@ -112,17 +114,13 @@ static struct clk_rcg prefix##_osr_src = {			\
 		.enable_mask = BIT(9),				\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_osr_src",		\
-			.parent_names = lcc_pxo_pll4,		\
-			.num_parents = 2,			\
+			.parent_data = lcc_pxo_pll4,		\
+			.num_parents = ARRAY_SIZE(lcc_pxo_pll4), \
 			.ops = &clk_rcg_ops,			\
 			.flags = CLK_SET_RATE_GATE,		\
 		},						\
 	},							\
 };								\
-								\
-static const char * const lcc_##prefix##_parents[] = {		\
-	#prefix "_osr_src",					\
-};								\
 
 #define CLK_AIF_OSR_CLK(prefix, _ns, hr, en_bit)		\
 static struct clk_branch prefix##_osr_clk = {			\
@@ -134,7 +132,9 @@ static struct clk_branch prefix##_osr_clk = {			\
 		.enable_mask = BIT(en_bit),			\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_osr_clk",		\
-			.parent_names = lcc_##prefix##_parents,	\
+			.parent_hws = (const struct clk_hw*[]){	\
+				&prefix##_osr_src.clkr.hw,	\
+			},					\
 			.num_parents = 1,			\
 			.ops = &clk_branch_ops,			\
 			.flags = CLK_SET_RATE_PARENT,		\
@@ -150,7 +150,9 @@ static struct clk_regmap_div prefix##_div_clk = {		\
 	.clkr = {						\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_div_clk",		\
-			.parent_names = lcc_##prefix##_parents,	\
+			.parent_hws = (const struct clk_hw*[]){	\
+				&prefix##_osr_src.clkr.hw,	\
+			},					\
 			.num_parents = 1,			\
 			.ops = &clk_regmap_div_ops,		\
 		},						\
@@ -167,9 +169,9 @@ static struct clk_branch prefix##_bit_div_clk = {		\
 		.enable_mask = BIT(en_bit),			\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_bit_div_clk",		\
-			.parent_names = (const char *[]){	\
-				#prefix "_div_clk"		\
-			}, 					\
+			.parent_hws = (const struct clk_hw*[]){	\
+				&prefix##_div_clk.clkr.hw,	\
+			},					\
 			.num_parents = 1,			\
 			.ops = &clk_branch_ops,			\
 			.flags = CLK_SET_RATE_PARENT,		\
@@ -185,9 +187,10 @@ static struct clk_regmap_mux prefix##_bit_clk = {		\
 	.clkr = {						\
 		.hw.init = &(struct clk_init_data){		\
 			.name = #prefix "_bit_clk",		\
-			.parent_names = (const char *[]){	\
-				#prefix "_bit_div_clk",		\
-				#prefix "_codec_clk",		\
+			.parent_data = (const struct clk_parent_data[]){ \
+				{ .hw = &prefix##_bit_div_clk.clkr.hw, }, \
+				{ .fw_name = #prefix "_codec_clk", \
+				  .name = #prefix "_codec_clk", }, \
 			},					\
 			.num_parents = 2,			\
 			.ops = &clk_regmap_mux_closest_ops,	\
@@ -273,8 +276,8 @@ static struct clk_rcg pcm_src = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "pcm_src",
-			.parent_names = lcc_pxo_pll4,
-			.num_parents = 2,
+			.parent_data = lcc_pxo_pll4,
+			.num_parents = ARRAY_SIZE(lcc_pxo_pll4),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
@@ -290,7 +293,9 @@ static struct clk_branch pcm_clk_out = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "pcm_clk_out",
-			.parent_names = (const char *[]){ "pcm_src" },
+			.parent_hws = (const struct clk_hw*[]){
+				&pcm_src.clkr.hw
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -305,9 +310,9 @@ static struct clk_regmap_mux pcm_clk = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "pcm_clk",
-			.parent_names = (const char *[]){
-				"pcm_clk_out",
-				"pcm_codec_clk",
+			.parent_data = (const struct clk_parent_data[]){
+				{ .hw = &pcm_clk_out.clkr.hw },
+				{ .fw_name = "pcm_codec_clk", .name = "pcm_codec_clk" },
 			},
 			.num_parents = 2,
 			.ops = &clk_regmap_mux_closest_ops,
@@ -341,18 +346,14 @@ static struct clk_rcg slimbus_src = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "slimbus_src",
-			.parent_names = lcc_pxo_pll4,
-			.num_parents = 2,
+			.parent_data = lcc_pxo_pll4,
+			.num_parents = ARRAY_SIZE(lcc_pxo_pll4),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
 		},
 	},
 };
 
-static const char * const lcc_slimbus_parents[] = {
-	"slimbus_src",
-};
-
 static struct clk_branch audio_slimbus_clk = {
 	.halt_reg = 0xd4,
 	.halt_bit = 0,
@@ -362,7 +363,9 @@ static struct clk_branch audio_slimbus_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "audio_slimbus_clk",
-			.parent_names = lcc_slimbus_parents,
+			.parent_hws = (const struct clk_hw*[]){
+				&slimbus_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -379,7 +382,9 @@ static struct clk_branch sps_slimbus_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "sps_slimbus_clk",
-			.parent_names = lcc_slimbus_parents,
+			.parent_hws = (const struct clk_hw*[]){
+				&slimbus_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.35.1

