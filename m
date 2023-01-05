Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94BDD65ED7E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Jan 2023 14:42:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbjAENmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Jan 2023 08:42:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbjAENlt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Jan 2023 08:41:49 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD3C05FA0
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Jan 2023 05:41:44 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id v25so7629902lfe.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Jan 2023 05:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWLnbqp5BQ0bEGns7NkUj5+nnm11nbOjtLFnC86I4NA=;
        b=LEvMLFMdINnfOpwlxqT2R8gcidW1Eg5h4CU8F646djX4oSyA0ID5ONvu4HfPR5CnjM
         CalGL9+7OIEa2aDYpPkJnw1PvmPkdITXP7b74fMEpZjHTtlUHiULomQRiXq4h3cx3f8T
         Mrwt/brruXMAnNt3lCin4Vw+1xLJ7lwOn03rTq1MsW40x92zg1ikzL/y9BSd0H8cQu8E
         WnyRXatxZfwiTe9rnOjRRYQ3qDvLRPObXDgCx2FyuDXj11huwQuxogtVNWxe6uJIwLRy
         4RgI/ncbO4ctAK3jjhYvkePyhEEvSEh9OPDBxGXw1meX35LzrIUc8i8OhTKSrA9YQIpA
         wKjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWLnbqp5BQ0bEGns7NkUj5+nnm11nbOjtLFnC86I4NA=;
        b=ZYWEQhMLI7UY2bu9OZ7Vl+qXum09q1Dpe1Q2QslAI+x9XmydEnKHrxjP1QROwyVEYc
         qRgkcfMU7ruWPp1iTmo3zEPSYm3qi0BZTDT3lfkGp+0r7KaTipgFcIbwH+zbOc7Bbw0r
         yskNvzw9yVJNZS7c1/eI+QqJ2Ps7Sw0sKasLxFrccpOc5bQ/XSMyHE21Mc/hewQMHj/s
         6yrC3rehUiYr8dGeOGtSuKjjaWmoVs4OykEGAJMQaJ1ZR2A8Bwn2GeeEgAA4Oeayzn1A
         /F2/k6s3ejxLteCPZ+SQQMqtsi26On7VceA0x3MkCB9r/Wmt9iKC0hLtt95/M+tt0bwB
         ztPg==
X-Gm-Message-State: AFqh2kpX2OA6KaStlFi9WHT/LlEtCfGjoaAkxbb9vypYGXa5DmohRTh/
        gAAQ6FiXHzZJfPg1L51zdENKqg==
X-Google-Smtp-Source: AMrXdXsRRNnN/WYeGrRvauq3qpg41ShCXTIKzr74dHdyar7N68Ero2ZoEVtdIy8Wnxk/qe9PUCvEQw==
X-Received: by 2002:ac2:4bd3:0:b0:4a4:68b7:d638 with SMTP id o19-20020ac24bd3000000b004a468b7d638mr13440315lfq.31.1672926102864;
        Thu, 05 Jan 2023 05:41:42 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bq25-20020a056512151900b004b592043413sm5461315lfb.12.2023.01.05.05.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 05:41:42 -0800 (PST)
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
Subject: [PATCH v2 11/12] clk: qcom: mmcc-apq8084: use parent_hws/_data instead of parent_names
Date:   Thu,  5 Jan 2023 15:41:32 +0200
Message-Id: <20230105134133.1550618-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
References: <20230105134133.1550618-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names. Use parent_hws where possible to refer parent
clocks directly, skipping the lookup.

Note, the system names for xo clocks were changed from "xo" to
"xo_board" to follow the example of other platforms. This switches the
clocks to use DT-provided "xo_board" clock instead of manually
registered "xo" clock and allows us to drop qcom_cc_register_board_clk()
call from the driver at some point.

In the same way change the looked up system "sleep_clk_src" clock to
"sleep_clk", which is registered from DT.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-apq8084.c | 644 ++++++++++++++++----------------
 1 file changed, 331 insertions(+), 313 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index 631b1ff8cf01..02fc21208dd1 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -50,7 +50,9 @@ static struct clk_pll mmpll0 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll0",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -61,7 +63,9 @@ static struct clk_regmap mmpll0_vote = {
 	.enable_mask = BIT(0),
 	.hw.init = &(struct clk_init_data){
 		.name = "mmpll0_vote",
-		.parent_names = (const char *[]){ "mmpll0" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll0.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -77,7 +81,9 @@ static struct clk_pll mmpll1 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll1",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -88,7 +94,9 @@ static struct clk_regmap mmpll1_vote = {
 	.enable_mask = BIT(1),
 	.hw.init = &(struct clk_init_data){
 		.name = "mmpll1_vote",
-		.parent_names = (const char *[]){ "mmpll1" },
+		.parent_hws = (const struct clk_hw*[]){
+			&mmpll1.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -103,7 +111,9 @@ static struct clk_pll mmpll2 = {
 	.status_reg = 0x411c,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll2",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -119,7 +129,9 @@ static struct clk_pll mmpll3 = {
 	.status_bit = 17,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll3",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -134,7 +146,9 @@ static struct clk_pll mmpll4 = {
 	.status_reg = 0x00bc,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmpll4",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_ops,
 	},
@@ -147,11 +161,11 @@ static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
 	{ P_GPLL0, 5 }
 };
 
-static const char * const mmcc_xo_mmpll0_mmpll1_gpll0[] = {
-	"xo",
-	"mmpll0_vote",
-	"mmpll1_vote",
-	"mmss_gpll0_vote",
+static const struct clk_parent_data mmcc_xo_mmpll0_mmpll1_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0_vote.hw },
+	{ .hw = &mmpll1_vote.hw },
+	{ .fw_name = "mmss_gpll0_vote", .name = "mmss_gpll0_vote" },
 };
 
 static const struct parent_map mmcc_xo_mmpll0_dsi_hdmi_gpll0_map[] = {
@@ -163,13 +177,13 @@ static const struct parent_map mmcc_xo_mmpll0_dsi_hdmi_gpll0_map[] = {
 	{ P_DSI1PLL, 3 }
 };
 
-static const char * const mmcc_xo_mmpll0_dsi_hdmi_gpll0[] = {
-	"xo",
-	"mmpll0_vote",
-	"hdmipll",
-	"mmss_gpll0_vote",
-	"dsi0pll",
-	"dsi1pll",
+static const struct clk_parent_data mmcc_xo_mmpll0_dsi_hdmi_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0_vote.hw },
+	{ .fw_name = "hdmipll", .name = "hdmipll" },
+	{ .fw_name = "mmss_gpll0_vote", .name = "mmss_gpll0_vote" },
+	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
+	{ .fw_name = "dsi1pll", .name = "dsi1pll" },
 };
 
 static const struct parent_map mmcc_xo_mmpll0_1_2_gpll0_map[] = {
@@ -180,12 +194,12 @@ static const struct parent_map mmcc_xo_mmpll0_1_2_gpll0_map[] = {
 	{ P_MMPLL2, 3 }
 };
 
-static const char * const mmcc_xo_mmpll0_1_2_gpll0[] = {
-	"xo",
-	"mmpll0_vote",
-	"mmpll1_vote",
-	"mmss_gpll0_vote",
-	"mmpll2",
+static const struct clk_parent_data mmcc_xo_mmpll0_1_2_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0_vote.hw },
+	{ .hw = &mmpll1_vote.hw },
+	{ .fw_name = "mmss_gpll0_vote", .name = "mmss_gpll0_vote" },
+	{ .hw = &mmpll2.clkr.hw },
 };
 
 static const struct parent_map mmcc_xo_mmpll0_1_3_gpll0_map[] = {
@@ -196,12 +210,12 @@ static const struct parent_map mmcc_xo_mmpll0_1_3_gpll0_map[] = {
 	{ P_MMPLL3, 3 }
 };
 
-static const char * const mmcc_xo_mmpll0_1_3_gpll0[] = {
-	"xo",
-	"mmpll0_vote",
-	"mmpll1_vote",
-	"mmss_gpll0_vote",
-	"mmpll3",
+static const struct clk_parent_data mmcc_xo_mmpll0_1_3_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0_vote.hw },
+	{ .hw = &mmpll1_vote.hw },
+	{ .fw_name = "mmss_gpll0_vote", .name = "mmss_gpll0_vote" },
+	{ .hw = &mmpll3.clkr.hw },
 };
 
 static const struct parent_map mmcc_xo_dsi_hdmi_edp_map[] = {
@@ -213,13 +227,13 @@ static const struct parent_map mmcc_xo_dsi_hdmi_edp_map[] = {
 	{ P_DSI1PLL, 2 }
 };
 
-static const char * const mmcc_xo_dsi_hdmi_edp[] = {
-	"xo",
-	"edp_link_clk",
-	"hdmipll",
-	"edp_vco_div",
-	"dsi0pll",
-	"dsi1pll",
+static const struct clk_parent_data mmcc_xo_dsi_hdmi_edp[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "edp_link_clk", .name = "edp_link_clk" },
+	{ .fw_name = "hdmipll", .name = "hdmipll" },
+	{ .fw_name = "edp_vco_div", .name = "edp_vco_div" },
+	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
+	{ .fw_name = "dsi1pll", .name = "dsi1pll" },
 };
 
 static const struct parent_map mmcc_xo_dsi_hdmi_edp_gpll0_map[] = {
@@ -231,13 +245,13 @@ static const struct parent_map mmcc_xo_dsi_hdmi_edp_gpll0_map[] = {
 	{ P_DSI1PLL, 2 }
 };
 
-static const char * const mmcc_xo_dsi_hdmi_edp_gpll0[] = {
-	"xo",
-	"edp_link_clk",
-	"hdmipll",
-	"gpll0_vote",
-	"dsi0pll",
-	"dsi1pll",
+static const struct clk_parent_data mmcc_xo_dsi_hdmi_edp_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "edp_link_clk", .name = "edp_link_clk" },
+	{ .fw_name = "hdmipll", .name = "hdmipll" },
+	{ .fw_name = "gpll0_vote", .name = "gpll0_vote" },
+	{ .fw_name = "dsi0pll", .name = "dsi0pll" },
+	{ .fw_name = "dsi1pll", .name = "dsi1pll" },
 };
 
 static const struct parent_map mmcc_xo_dsibyte_hdmi_edp_gpll0_map[] = {
@@ -249,13 +263,13 @@ static const struct parent_map mmcc_xo_dsibyte_hdmi_edp_gpll0_map[] = {
 	{ P_DSI1PLL_BYTE, 2 }
 };
 
-static const char * const mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
-	"xo",
-	"edp_link_clk",
-	"hdmipll",
-	"gpll0_vote",
-	"dsi0pllbyte",
-	"dsi1pllbyte",
+static const struct clk_parent_data mmcc_xo_dsibyte_hdmi_edp_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .fw_name = "edp_link_clk", .name = "edp_link_clk" },
+	{ .fw_name = "hdmipll", .name = "hdmipll" },
+	{ .fw_name = "gpll0_vote", .name = "gpll0_vote" },
+	{ .fw_name = "dsi0pllbyte", .name = "dsi0pllbyte" },
+	{ .fw_name = "dsi1pllbyte", .name = "dsi1pllbyte" },
 };
 
 static const struct parent_map mmcc_xo_mmpll0_1_4_gpll0_map[] = {
@@ -266,12 +280,12 @@ static const struct parent_map mmcc_xo_mmpll0_1_4_gpll0_map[] = {
 	{ P_MMPLL4, 3 }
 };
 
-static const char * const mmcc_xo_mmpll0_1_4_gpll0[] = {
-	"xo",
-	"mmpll0",
-	"mmpll1",
-	"mmpll4",
-	"gpll0",
+static const struct clk_parent_data mmcc_xo_mmpll0_1_4_gpll0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll1.clkr.hw },
+	{ .hw = &mmpll4.clkr.hw },
+	{ .fw_name = "gpll0", .name = "gpll0" },
 };
 
 static const struct parent_map mmcc_xo_mmpll0_1_4_gpll1_0_map[] = {
@@ -283,13 +297,13 @@ static const struct parent_map mmcc_xo_mmpll0_1_4_gpll1_0_map[] = {
 	{ P_GPLL1, 4 }
 };
 
-static const char * const mmcc_xo_mmpll0_1_4_gpll1_0[] = {
-	"xo",
-	"mmpll0",
-	"mmpll1",
-	"mmpll4",
-	"gpll1",
-	"gpll0",
+static const struct clk_parent_data mmcc_xo_mmpll0_1_4_gpll1_0[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll1.clkr.hw },
+	{ .hw = &mmpll4.clkr.hw },
+	{ .fw_name = "gpll1", .name = "gpll1" },
+	{ .fw_name = "gpll0", .name = "gpll0" },
 };
 
 static const struct parent_map mmcc_xo_mmpll0_1_4_gpll1_0_sleep_map[] = {
@@ -302,14 +316,14 @@ static const struct parent_map mmcc_xo_mmpll0_1_4_gpll1_0_sleep_map[] = {
 	{ P_MMSLEEP, 6 }
 };
 
-static const char * const mmcc_xo_mmpll0_1_4_gpll1_0_sleep[] = {
-	"xo",
-	"mmpll0",
-	"mmpll1",
-	"mmpll4",
-	"gpll1",
-	"gpll0",
-	"sleep_clk_src",
+static const struct clk_parent_data mmcc_xo_mmpll0_1_4_gpll1_0_sleep[] = {
+	{ .fw_name = "xo", .name = "xo_board" },
+	{ .hw = &mmpll0.clkr.hw },
+	{ .hw = &mmpll1.clkr.hw },
+	{ .hw = &mmpll4.clkr.hw },
+	{ .fw_name = "gpll1", .name = "gpll1" },
+	{ .fw_name = "gpll0", .name = "gpll0" },
+	{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 };
 
 static struct clk_rcg2 mmss_ahb_clk_src = {
@@ -318,7 +332,7 @@ static struct clk_rcg2 mmss_ahb_clk_src = {
 	.parent_map = mmcc_xo_mmpll0_mmpll1_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmss_ahb_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -343,7 +357,7 @@ static struct clk_rcg2 mmss_axi_clk_src = {
 	.freq_tbl = ftbl_mmss_axi_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mmss_axi_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -367,7 +381,7 @@ static struct clk_rcg2 ocmemnoc_clk_src = {
 	.freq_tbl = ftbl_ocmemnoc_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "ocmemnoc_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -386,7 +400,7 @@ static struct clk_rcg2 csi0_clk_src = {
 	.freq_tbl = ftbl_camss_csi0_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -399,7 +413,7 @@ static struct clk_rcg2 csi1_clk_src = {
 	.freq_tbl = ftbl_camss_csi0_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -412,7 +426,7 @@ static struct clk_rcg2 csi2_clk_src = {
 	.freq_tbl = ftbl_camss_csi0_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -425,7 +439,7 @@ static struct clk_rcg2 csi3_clk_src = {
 	.freq_tbl = ftbl_camss_csi0_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi3_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -455,7 +469,7 @@ static struct clk_rcg2 vfe0_clk_src = {
 	.freq_tbl = ftbl_camss_vfe_vfe0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe0_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -468,7 +482,7 @@ static struct clk_rcg2 vfe1_clk_src = {
 	.freq_tbl = ftbl_camss_vfe_vfe0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vfe1_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -496,7 +510,7 @@ static struct clk_rcg2 mdp_clk_src = {
 	.freq_tbl = ftbl_mdss_mdp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mdp_clk_src",
-		.parent_names = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
+		.parent_data = mmcc_xo_mmpll0_dsi_hdmi_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_dsi_hdmi_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -508,7 +522,7 @@ static struct clk_rcg2 gfx3d_clk_src = {
 	.parent_map = mmcc_xo_mmpll0_1_2_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gfx3d_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_2_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_2_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_2_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -531,7 +545,7 @@ static struct clk_rcg2 jpeg0_clk_src = {
 	.freq_tbl = ftbl_camss_jpeg_jpeg0_2_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg0_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -544,7 +558,7 @@ static struct clk_rcg2 jpeg1_clk_src = {
 	.freq_tbl = ftbl_camss_jpeg_jpeg0_2_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg1_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -557,7 +571,7 @@ static struct clk_rcg2 jpeg2_clk_src = {
 	.freq_tbl = ftbl_camss_jpeg_jpeg0_2_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "jpeg2_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -570,7 +584,7 @@ static struct clk_rcg2 pclk0_clk_src = {
 	.parent_map = mmcc_xo_dsi_hdmi_edp_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk0_clk_src",
-		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
+		.parent_data = mmcc_xo_dsi_hdmi_edp_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -584,7 +598,7 @@ static struct clk_rcg2 pclk1_clk_src = {
 	.parent_map = mmcc_xo_dsi_hdmi_edp_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pclk1_clk_src",
-		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
+		.parent_data = mmcc_xo_dsi_hdmi_edp_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_pixel_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -609,7 +623,7 @@ static struct clk_rcg2 vcodec0_clk_src = {
 	.freq_tbl = ftbl_venus0_vcodec0_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vcodec0_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_3_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_3_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_3_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -628,7 +642,7 @@ static struct clk_rcg2 vp_clk_src = {
 	.freq_tbl = ftbl_avsync_vp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vp_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -647,7 +661,7 @@ static struct clk_rcg2 cci_clk_src = {
 	.freq_tbl = ftbl_camss_cci_cci_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cci_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll1_0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -671,7 +685,7 @@ static struct clk_rcg2 camss_gp0_clk_src = {
 	.freq_tbl = ftbl_camss_gp0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp0_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0_sleep,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll1_0_sleep,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -685,7 +699,7 @@ static struct clk_rcg2 camss_gp1_clk_src = {
 	.freq_tbl = ftbl_camss_gp0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "camss_gp1_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0_sleep,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll1_0_sleep,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0_sleep),
 		.ops = &clk_rcg2_ops,
 	},
@@ -713,7 +727,7 @@ static struct clk_rcg2 mclk0_clk_src = {
 	.freq_tbl = ftbl_camss_mclk0_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk0_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll1_0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -727,7 +741,7 @@ static struct clk_rcg2 mclk1_clk_src = {
 	.freq_tbl = ftbl_camss_mclk0_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk1_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll1_0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -741,7 +755,7 @@ static struct clk_rcg2 mclk2_clk_src = {
 	.freq_tbl = ftbl_camss_mclk0_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk2_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll1_0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -755,7 +769,7 @@ static struct clk_rcg2 mclk3_clk_src = {
 	.freq_tbl = ftbl_camss_mclk0_3_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "mclk3_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll1_0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll1_0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll1_0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -774,7 +788,7 @@ static struct clk_rcg2 csi0phytimer_clk_src = {
 	.freq_tbl = ftbl_camss_phy0_2_csi0_2phytimer_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi0phytimer_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -787,7 +801,7 @@ static struct clk_rcg2 csi1phytimer_clk_src = {
 	.freq_tbl = ftbl_camss_phy0_2_csi0_2phytimer_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi1phytimer_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -800,7 +814,7 @@ static struct clk_rcg2 csi2phytimer_clk_src = {
 	.freq_tbl = ftbl_camss_phy0_2_csi0_2phytimer_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "csi2phytimer_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -823,7 +837,7 @@ static struct clk_rcg2 cpp_clk_src = {
 	.freq_tbl = ftbl_camss_vfe_cpp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "cpp_clk_src",
-		.parent_names = mmcc_xo_mmpll0_1_4_gpll0,
+		.parent_data = mmcc_xo_mmpll0_1_4_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_1_4_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -835,7 +849,7 @@ static struct clk_rcg2 byte0_clk_src = {
 	.parent_map = mmcc_xo_dsibyte_hdmi_edp_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte0_clk_src",
-		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
+		.parent_data = mmcc_xo_dsibyte_hdmi_edp_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -848,7 +862,7 @@ static struct clk_rcg2 byte1_clk_src = {
 	.parent_map = mmcc_xo_dsibyte_hdmi_edp_gpll0_map,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "byte1_clk_src",
-		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
+		.parent_data = mmcc_xo_dsibyte_hdmi_edp_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_byte2_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -867,7 +881,7 @@ static struct clk_rcg2 edpaux_clk_src = {
 	.freq_tbl = ftbl_mdss_edpaux_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "edpaux_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -886,7 +900,7 @@ static struct clk_rcg2 edplink_clk_src = {
 	.freq_tbl = ftbl_mdss_edplink_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "edplink_clk_src",
-		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
+		.parent_data = mmcc_xo_dsi_hdmi_edp_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_rcg2_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -906,7 +920,7 @@ static struct clk_rcg2 edppixel_clk_src = {
 	.freq_tbl = edp_pixel_freq_tbl,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "edppixel_clk_src",
-		.parent_names = mmcc_xo_dsi_hdmi_edp,
+		.parent_data = mmcc_xo_dsi_hdmi_edp,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp),
 		.ops = &clk_edp_pixel_ops,
 	},
@@ -924,7 +938,7 @@ static struct clk_rcg2 esc0_clk_src = {
 	.freq_tbl = ftbl_mdss_esc0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc0_clk_src",
-		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
+		.parent_data = mmcc_xo_dsibyte_hdmi_edp_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -937,7 +951,7 @@ static struct clk_rcg2 esc1_clk_src = {
 	.freq_tbl = ftbl_mdss_esc0_1_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "esc1_clk_src",
-		.parent_names = mmcc_xo_dsibyte_hdmi_edp_gpll0,
+		.parent_data = mmcc_xo_dsibyte_hdmi_edp_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsibyte_hdmi_edp_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -955,7 +969,7 @@ static struct clk_rcg2 extpclk_clk_src = {
 	.freq_tbl = extpclk_freq_tbl,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "extpclk_clk_src",
-		.parent_names = mmcc_xo_dsi_hdmi_edp_gpll0,
+		.parent_data = mmcc_xo_dsi_hdmi_edp_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_dsi_hdmi_edp_gpll0),
 		.ops = &clk_byte_ops,
 		.flags = CLK_SET_RATE_PARENT,
@@ -974,7 +988,7 @@ static struct clk_rcg2 hdmi_clk_src = {
 	.freq_tbl = ftbl_mdss_hdmi_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hdmi_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -992,7 +1006,7 @@ static struct clk_rcg2 vsync_clk_src = {
 	.freq_tbl = ftbl_mdss_vsync_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vsync_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1010,7 +1024,7 @@ static struct clk_rcg2 rbcpr_clk_src = {
 	.freq_tbl = ftbl_mmss_rbcpr_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbcpr_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1028,7 +1042,7 @@ static struct clk_rcg2 rbbmtimer_clk_src = {
 	.freq_tbl = ftbl_oxili_rbbmtimer_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "rbbmtimer_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1051,7 +1065,7 @@ static struct clk_rcg2 maple_clk_src = {
 	.freq_tbl = ftbl_vpu_maple_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "maple_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1073,7 +1087,7 @@ static struct clk_rcg2 vdp_clk_src = {
 	.freq_tbl = ftbl_vpu_vdp_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vdp_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1092,7 +1106,7 @@ static struct clk_rcg2 vpu_bus_clk_src = {
 	.freq_tbl = ftbl_vpu_bus_clk,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "vpu_bus_clk_src",
-		.parent_names = mmcc_xo_mmpll0_mmpll1_gpll0,
+		.parent_data = mmcc_xo_mmpll0_mmpll1_gpll0,
 		.num_parents = ARRAY_SIZE(mmcc_xo_mmpll0_mmpll1_gpll0),
 		.ops = &clk_rcg2_ops,
 	},
@@ -1105,7 +1119,9 @@ static struct clk_branch mmss_cxo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_cxo_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "xo", .name = "xo_board" },
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -1120,8 +1136,8 @@ static struct clk_branch mmss_sleepclk_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_sleepclk_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1137,8 +1153,8 @@ static struct clk_branch avsync_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "avsync_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1154,8 +1170,8 @@ static struct clk_branch avsync_edppixel_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "avsync_edppixel_clk",
-			.parent_names = (const char *[]){
-				"edppixel_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&edppixel_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1171,8 +1187,8 @@ static struct clk_branch avsync_extpclk_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "avsync_extpclk_clk",
-			.parent_names = (const char *[]){
-				"extpclk_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&extpclk_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1188,8 +1204,8 @@ static struct clk_branch avsync_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "avsync_pclk0_clk",
-			.parent_names = (const char *[]){
-				"pclk0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1205,8 +1221,8 @@ static struct clk_branch avsync_pclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "avsync_pclk1_clk",
-			.parent_names = (const char *[]){
-				"pclk1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1222,8 +1238,8 @@ static struct clk_branch avsync_vp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "avsync_vp_clk",
-			.parent_names = (const char *[]){
-				"vp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vp_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1239,8 +1255,8 @@ static struct clk_branch camss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1256,8 +1272,8 @@ static struct clk_branch camss_cci_cci_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_cci_cci_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1272,8 +1288,8 @@ static struct clk_branch camss_cci_cci_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_cci_cci_clk",
-			.parent_names = (const char *[]){
-				"cci_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cci_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1289,8 +1305,8 @@ static struct clk_branch camss_csi0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1305,8 +1321,8 @@ static struct clk_branch camss_csi0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0_clk",
-			.parent_names = (const char *[]){
-				"csi0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1322,8 +1338,8 @@ static struct clk_branch camss_csi0phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0phy_clk",
-			.parent_names = (const char *[]){
-				"csi0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1339,8 +1355,8 @@ static struct clk_branch camss_csi0pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0pix_clk",
-			.parent_names = (const char *[]){
-				"csi0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1356,8 +1372,8 @@ static struct clk_branch camss_csi0rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi0rdi_clk",
-			.parent_names = (const char *[]){
-				"csi0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1373,8 +1389,8 @@ static struct clk_branch camss_csi1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1390,8 +1406,8 @@ static struct clk_branch camss_csi1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1_clk",
-			.parent_names = (const char *[]){
-				"csi1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1407,8 +1423,8 @@ static struct clk_branch camss_csi1phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1phy_clk",
-			.parent_names = (const char *[]){
-				"csi1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1424,8 +1440,8 @@ static struct clk_branch camss_csi1pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1pix_clk",
-			.parent_names = (const char *[]){
-				"csi1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1441,8 +1457,8 @@ static struct clk_branch camss_csi1rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi1rdi_clk",
-			.parent_names = (const char *[]){
-				"csi1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1458,8 +1474,8 @@ static struct clk_branch camss_csi2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1474,8 +1490,8 @@ static struct clk_branch camss_csi2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2_clk",
-			.parent_names = (const char *[]){
-				"csi2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1491,8 +1507,8 @@ static struct clk_branch camss_csi2phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2phy_clk",
-			.parent_names = (const char *[]){
-				"csi2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1508,8 +1524,8 @@ static struct clk_branch camss_csi2pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2pix_clk",
-			.parent_names = (const char *[]){
-				"csi2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1525,8 +1541,8 @@ static struct clk_branch camss_csi2rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi2rdi_clk",
-			.parent_names = (const char *[]){
-				"csi2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1542,8 +1558,8 @@ static struct clk_branch camss_csi3_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1558,8 +1574,8 @@ static struct clk_branch camss_csi3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3_clk",
-			.parent_names = (const char *[]){
-				"csi3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi3_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1575,8 +1591,8 @@ static struct clk_branch camss_csi3phy_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3phy_clk",
-			.parent_names = (const char *[]){
-				"csi3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi3_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1592,8 +1608,8 @@ static struct clk_branch camss_csi3pix_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3pix_clk",
-			.parent_names = (const char *[]){
-				"csi3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi3_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1609,8 +1625,8 @@ static struct clk_branch camss_csi3rdi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi3rdi_clk",
-			.parent_names = (const char *[]){
-				"csi3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi3_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1626,8 +1642,8 @@ static struct clk_branch camss_csi_vfe0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi_vfe0_clk",
-			.parent_names = (const char *[]){
-				"vfe0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1643,8 +1659,8 @@ static struct clk_branch camss_csi_vfe1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_csi_vfe1_clk",
-			.parent_names = (const char *[]){
-				"vfe1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1660,8 +1676,8 @@ static struct clk_branch camss_gp0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_gp0_clk",
-			.parent_names = (const char *[]){
-				"camss_gp0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_gp0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1677,8 +1693,8 @@ static struct clk_branch camss_gp1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_gp1_clk",
-			.parent_names = (const char *[]){
-				"camss_gp1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&camss_gp1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1694,8 +1710,8 @@ static struct clk_branch camss_ispif_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_ispif_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1711,8 +1727,8 @@ static struct clk_branch camss_jpeg_jpeg0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg_jpeg0_clk",
-			.parent_names = (const char *[]){
-				"jpeg0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&jpeg0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1728,8 +1744,8 @@ static struct clk_branch camss_jpeg_jpeg1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg_jpeg1_clk",
-			.parent_names = (const char *[]){
-				"jpeg1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&jpeg1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1745,8 +1761,8 @@ static struct clk_branch camss_jpeg_jpeg2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg_jpeg2_clk",
-			.parent_names = (const char *[]){
-				"jpeg2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&jpeg2_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1762,8 +1778,8 @@ static struct clk_branch camss_jpeg_jpeg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg_jpeg_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1778,8 +1794,8 @@ static struct clk_branch camss_jpeg_jpeg_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_jpeg_jpeg_axi_clk",
-			.parent_names = (const char *[]){
-				"mmss_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_axi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1794,8 +1810,8 @@ static struct clk_branch camss_mclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_mclk0_clk",
-			.parent_names = (const char *[]){
-				"mclk0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1811,8 +1827,8 @@ static struct clk_branch camss_mclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_mclk1_clk",
-			.parent_names = (const char *[]){
-				"mclk1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1828,8 +1844,8 @@ static struct clk_branch camss_mclk2_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_mclk2_clk",
-			.parent_names = (const char *[]){
-				"mclk2_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk2_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1845,8 +1861,8 @@ static struct clk_branch camss_mclk3_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_mclk3_clk",
-			.parent_names = (const char *[]){
-				"mclk3_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mclk3_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1862,8 +1878,8 @@ static struct clk_branch camss_micro_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_micro_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -1878,8 +1894,8 @@ static struct clk_branch camss_phy0_csi0phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_phy0_csi0phytimer_clk",
-			.parent_names = (const char *[]){
-				"csi0phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi0phytimer_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1895,8 +1911,8 @@ static struct clk_branch camss_phy1_csi1phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_phy1_csi1phytimer_clk",
-			.parent_names = (const char *[]){
-				"csi1phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi1phytimer_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1912,8 +1928,8 @@ static struct clk_branch camss_phy2_csi2phytimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_phy2_csi2phytimer_clk",
-			.parent_names = (const char *[]){
-				"csi2phytimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&csi2phytimer_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1929,8 +1945,8 @@ static struct clk_branch camss_top_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_top_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1946,8 +1962,8 @@ static struct clk_branch camss_vfe_cpp_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe_cpp_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1963,8 +1979,8 @@ static struct clk_branch camss_vfe_cpp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe_cpp_clk",
-			.parent_names = (const char *[]){
-				"cpp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&cpp_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1980,8 +1996,8 @@ static struct clk_branch camss_vfe_vfe0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe_vfe0_clk",
-			.parent_names = (const char *[]){
-				"vfe0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1997,8 +2013,8 @@ static struct clk_branch camss_vfe_vfe1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe_vfe1_clk",
-			.parent_names = (const char *[]){
-				"vfe1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vfe1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2014,8 +2030,8 @@ static struct clk_branch camss_vfe_vfe_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe_vfe_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2031,8 +2047,8 @@ static struct clk_branch camss_vfe_vfe_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "camss_vfe_vfe_axi_clk",
-			.parent_names = (const char *[]){
-				"mmss_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_axi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2048,8 +2064,8 @@ static struct clk_branch mdss_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2065,8 +2081,8 @@ static struct clk_branch mdss_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_axi_clk",
-			.parent_names = (const char *[]){
-				"mmss_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_axi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2082,8 +2098,8 @@ static struct clk_branch mdss_byte0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_byte0_clk",
-			.parent_names = (const char *[]){
-				"byte0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&byte0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2099,8 +2115,8 @@ static struct clk_branch mdss_byte1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_byte1_clk",
-			.parent_names = (const char *[]){
-				"byte1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&byte1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2116,8 +2132,8 @@ static struct clk_branch mdss_edpaux_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_edpaux_clk",
-			.parent_names = (const char *[]){
-				"edpaux_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&edpaux_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2133,8 +2149,8 @@ static struct clk_branch mdss_edplink_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_edplink_clk",
-			.parent_names = (const char *[]){
-				"edplink_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&edplink_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2150,8 +2166,8 @@ static struct clk_branch mdss_edppixel_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_edppixel_clk",
-			.parent_names = (const char *[]){
-				"edppixel_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&edppixel_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2167,8 +2183,8 @@ static struct clk_branch mdss_esc0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_esc0_clk",
-			.parent_names = (const char *[]){
-				"esc0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&esc0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2184,8 +2200,8 @@ static struct clk_branch mdss_esc1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_esc1_clk",
-			.parent_names = (const char *[]){
-				"esc1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&esc1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2201,8 +2217,8 @@ static struct clk_branch mdss_extpclk_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_extpclk_clk",
-			.parent_names = (const char *[]){
-				"extpclk_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&extpclk_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2218,8 +2234,8 @@ static struct clk_branch mdss_hdmi_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_hdmi_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2235,8 +2251,8 @@ static struct clk_branch mdss_hdmi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_hdmi_clk",
-			.parent_names = (const char *[]){
-				"hdmi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&hdmi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2252,8 +2268,8 @@ static struct clk_branch mdss_mdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_mdp_clk",
-			.parent_names = (const char *[]){
-				"mdp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mdp_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2269,8 +2285,8 @@ static struct clk_branch mdss_mdp_lut_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_mdp_lut_clk",
-			.parent_names = (const char *[]){
-				"mdp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mdp_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2286,8 +2302,8 @@ static struct clk_branch mdss_pclk0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_pclk0_clk",
-			.parent_names = (const char *[]){
-				"pclk0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2303,8 +2319,8 @@ static struct clk_branch mdss_pclk1_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_pclk1_clk",
-			.parent_names = (const char *[]){
-				"pclk1_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&pclk1_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2320,8 +2336,8 @@ static struct clk_branch mdss_vsync_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mdss_vsync_clk",
-			.parent_names = (const char *[]){
-				"vsync_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vsync_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2337,8 +2353,8 @@ static struct clk_branch mmss_rbcpr_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_rbcpr_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2354,8 +2370,8 @@ static struct clk_branch mmss_rbcpr_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_rbcpr_clk",
-			.parent_names = (const char *[]){
-				"rbcpr_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&rbcpr_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2371,8 +2387,8 @@ static struct clk_branch mmss_misc_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_misc_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2388,8 +2404,8 @@ static struct clk_branch mmss_mmssnoc_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_mmssnoc_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2405,8 +2421,8 @@ static struct clk_branch mmss_mmssnoc_bto_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_mmssnoc_bto_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2422,8 +2438,8 @@ static struct clk_branch mmss_mmssnoc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_mmssnoc_axi_clk",
-			.parent_names = (const char *[]){
-				"mmss_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_axi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED,
@@ -2439,8 +2455,8 @@ static struct clk_branch mmss_s0_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "mmss_s0_axi_clk",
-			.parent_names = (const char *[]){
-				"mmss_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_axi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.ops = &clk_branch2_ops,
@@ -2456,8 +2472,8 @@ static struct clk_branch ocmemcx_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "ocmemcx_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2473,8 +2489,8 @@ static struct clk_branch ocmemcx_ocmemnoc_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "ocmemcx_ocmemnoc_clk",
-			.parent_names = (const char *[]){
-				"ocmemnoc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ocmemnoc_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2490,8 +2506,8 @@ static struct clk_branch oxili_ocmemgx_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "oxili_ocmemgx_clk",
-			.parent_names = (const char *[]){
-				"gfx3d_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2507,8 +2523,8 @@ static struct clk_branch oxili_gfx3d_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "oxili_gfx3d_clk",
-			.parent_names = (const char *[]){
-				"gfx3d_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&gfx3d_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2524,8 +2540,8 @@ static struct clk_branch oxili_rbbmtimer_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "oxili_rbbmtimer_clk",
-			.parent_names = (const char *[]){
-				"rbbmtimer_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&rbbmtimer_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2541,8 +2557,8 @@ static struct clk_branch oxilicx_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "oxilicx_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2558,8 +2574,8 @@ static struct clk_branch venus0_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "venus0_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2575,8 +2591,8 @@ static struct clk_branch venus0_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "venus0_axi_clk",
-			.parent_names = (const char *[]){
-				"mmss_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_axi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2592,8 +2608,8 @@ static struct clk_branch venus0_core0_vcodec_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "venus0_core0_vcodec_clk",
-			.parent_names = (const char *[]){
-				"vcodec0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vcodec0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2609,8 +2625,8 @@ static struct clk_branch venus0_core1_vcodec_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "venus0_core1_vcodec_clk",
-			.parent_names = (const char *[]){
-				"vcodec0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vcodec0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2626,8 +2642,8 @@ static struct clk_branch venus0_ocmemnoc_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "venus0_ocmemnoc_clk",
-			.parent_names = (const char *[]){
-				"ocmemnoc_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&ocmemnoc_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2643,8 +2659,8 @@ static struct clk_branch venus0_vcodec0_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "venus0_vcodec0_clk",
-			.parent_names = (const char *[]){
-				"vcodec0_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vcodec0_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2660,8 +2676,8 @@ static struct clk_branch vpu_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vpu_ahb_clk",
-			.parent_names = (const char *[]){
-				"mmss_ahb_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_ahb_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2677,8 +2693,8 @@ static struct clk_branch vpu_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vpu_axi_clk",
-			.parent_names = (const char *[]){
-				"mmss_axi_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&mmss_axi_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2694,8 +2710,8 @@ static struct clk_branch vpu_bus_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vpu_bus_clk",
-			.parent_names = (const char *[]){
-				"vpu_bus_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vpu_bus_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2711,7 +2727,9 @@ static struct clk_branch vpu_cxo_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vpu_cxo_clk",
-			.parent_names = (const char *[]){ "xo" },
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "xo", .name = "xo_board" },
+			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
@@ -2726,8 +2744,8 @@ static struct clk_branch vpu_maple_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vpu_maple_clk",
-			.parent_names = (const char *[]){
-				"maple_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&maple_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2743,8 +2761,8 @@ static struct clk_branch vpu_sleep_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vpu_sleep_clk",
-			.parent_names = (const char *[]){
-				"sleep_clk_src",
+			.parent_data = (const struct clk_parent_data[]){
+				{ .fw_name = "sleep_clk", .name = "sleep_clk" },
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
@@ -2760,8 +2778,8 @@ static struct clk_branch vpu_vdp_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "vpu_vdp_clk",
-			.parent_names = (const char *[]){
-				"vdp_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&vdp_clk_src.clkr.hw
 			},
 			.num_parents = 1,
 			.flags = CLK_SET_RATE_PARENT,
-- 
2.39.0

