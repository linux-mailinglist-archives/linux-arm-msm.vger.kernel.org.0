Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E34B55749FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 12:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237452AbiGNKD6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 06:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237636AbiGNKD4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 06:03:56 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5483E2DD9
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:55 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id r9so1944283lfp.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WtGXMZeQ1/E9YVNo9kt0RDpVQ/UMPDWOUEtZUMYvREM=;
        b=ur1fHf53L/VK6/p1uxz8CdbnajFUATp9dy1USmYBHhlezIMaXowPBJYM6E14tIPCcG
         uSOJMN7FGQdw8TlZMAMPpbiJg8FRhIJG+QOF3Q+6clhjAJgvx6Y+sl5uKMnJ8Gjdko/1
         bds0rSADuDMu0WaMGvETRvSJ953KXusi4HB5H5DWlpGD1nvylDJm++EHPQXzjtRNAVfg
         TLQ1C/q9vLH626GNiyXnvNfVftpOdkI3FVsdrMAxCuTHWJdFN5UpYl+pvg44niyc9B6Q
         ZlOfMNcIAHOXl960c94zVv5rCcTDa8gNJYnqQyVpPqiGBliAVRwoeUVZEH9rMRRMcoDA
         wceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WtGXMZeQ1/E9YVNo9kt0RDpVQ/UMPDWOUEtZUMYvREM=;
        b=Gq0BY1o7fyTlFYOGMlDEO0wUJOCo/V9jdMAgO3dBpNW3lWsP5Lh7h5H0h7qErCVdH0
         EIX56CRVWuDDIxkpeFaygZjALvX4KaPJobt91QqQvufX3AGEkTZRw4/q/cGcQUgLfQ3m
         DnJbJ80f9wYIaQVcgyuacuWUo4OoD7ebLUoqOPyOc2cQwu0BRz0fveIxKmnfWMfaQJYc
         EKWK1gQdMMsccAPsMgtZQ2wRVoRp/ejslnUNtjTBhyUivri2NPTcQDE1cEfMnonnN+85
         o73ZuofoOK53qWcrGp95MucGSmfeo+JqIdplEDUCzJLSPDmQL9F4aUGNLtwSFXmdZXD3
         N7gg==
X-Gm-Message-State: AJIora8OYFhZ3itbBTf0NEOJ7/bsiivRukbqPqUxEVFyCobskVIpzT0x
        5HU0MtAP2extzq5hETAYZlK8ImkVmzu6NQ==
X-Google-Smtp-Source: AGRyM1tQsov6jq1AQpedk7p9vnY/OmyxCp39xokGY0eLArLiBx4ZW1Hr2b4L5JCoCW+y149By92eqg==
X-Received: by 2002:a05:6512:e83:b0:489:c6fe:e121 with SMTP id bi3-20020a0565120e8300b00489c6fee121mr4647150lfb.100.1657793033674;
        Thu, 14 Jul 2022 03:03:53 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id c9-20020a056512074900b00489c92779f8sm273355lfs.184.2022.07.14.03.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 03:03:53 -0700 (PDT)
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
        Yassine Oudjana <yassine.oudjana@gmail.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>
Subject: [PATCH 1/6] clk: qcom: msm8996-cpu: Use parent_data/_hws for all clocks
Date:   Thu, 14 Jul 2022 13:03:46 +0300
Message-Id: <20220714100351.1834711-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
References: <20220714100351.1834711-1-dmitry.baryshkov@linaro.org>
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Replace parent_names in PLLs, secondary muxes and primary muxes with
parent_data. For primary muxes there were never any *cl_pll_acd clocks,
so instead of adding them, put the primary PLLs in both PLL_INDEX and
ACD_INDEX, then make sure ACD_INDEX is always picked over PLL_INDEX when
setting parent since we always want ACD when using the primary PLLs.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
[DB: switch to parent_hws for pmux clocks]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 79 ++++++++++++++++++++-------------
 1 file changed, 47 insertions(+), 32 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index b3ad9245874d..708a8ad0c933 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -112,14 +112,18 @@ static const struct alpha_pll_config hfpll_config = {
 	.early_output_mask = BIT(3),
 };
 
+static const struct clk_parent_data pll_parent[] = {
+	{ .fw_name = "xo" },
+};
+
 static struct clk_alpha_pll pwrcl_pll = {
 	.offset = PWRCL_REG_OFFSET,
 	.regs = prim_pll_regs,
 	.flags = SUPPORTS_DYNAMIC_UPDATE | SUPPORTS_FSM_MODE,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pwrcl_pll",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
+		.parent_data = pll_parent,
+		.num_parents = ARRAY_SIZE(pll_parent),
 		.ops = &clk_alpha_pll_huayra_ops,
 	},
 };
@@ -130,8 +134,8 @@ static struct clk_alpha_pll perfcl_pll = {
 	.flags = SUPPORTS_DYNAMIC_UPDATE | SUPPORTS_FSM_MODE,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "perfcl_pll",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
+		.parent_data = pll_parent,
+		.num_parents = ARRAY_SIZE(pll_parent),
 		.ops = &clk_alpha_pll_huayra_ops,
 	},
 };
@@ -190,8 +194,8 @@ static struct clk_alpha_pll pwrcl_alt_pll = {
 	.flags = SUPPORTS_OFFLINE_REQ | SUPPORTS_FSM_MODE,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_alt_pll",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
+		.parent_data = pll_parent,
+		.num_parents = ARRAY_SIZE(pll_parent),
 		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
 };
@@ -204,8 +208,8 @@ static struct clk_alpha_pll perfcl_alt_pll = {
 	.flags = SUPPORTS_OFFLINE_REQ | SUPPORTS_FSM_MODE,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_alt_pll",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
+		.parent_data = pll_parent,
+		.num_parents = ARRAY_SIZE(pll_parent),
 		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
 };
@@ -252,6 +256,9 @@ static int clk_cpu_8996_pmux_set_parent(struct clk_hw *hw, u8 index)
 	u32 val;
 
 	val = index;
+	/* We always want ACD when using the primary PLL */
+	if (val == PLL_INDEX)
+		val = ACD_INDEX;
 	val <<= cpuclk->shift;
 
 	return regmap_update_bits(clkr->regmap, cpuclk->reg, mask, val);
@@ -282,17 +289,24 @@ static const struct clk_ops clk_cpu_8996_pmux_ops = {
 	.determine_rate = clk_cpu_8996_pmux_determine_rate,
 };
 
+static const struct clk_parent_data pwrcl_smux_parents[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &pwrcl_pll_postdiv.hw },
+};
+
+static const struct clk_parent_data perfcl_smux_parents[] = {
+	{ .fw_name = "xo" },
+	{ .hw = &perfcl_pll_postdiv.hw },
+};
+
 static struct clk_regmap_mux pwrcl_smux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 2,
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_smux",
-		.parent_names = (const char *[]){
-			"xo",
-			"pwrcl_pll_postdiv",
-		},
-		.num_parents = 2,
+		.parent_data = pwrcl_smux_parents,
+		.num_parents = ARRAY_SIZE(pwrcl_smux_parents),
 		.ops = &clk_regmap_mux_closest_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
@@ -304,16 +318,27 @@ static struct clk_regmap_mux perfcl_smux = {
 	.width = 2,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_smux",
-		.parent_names = (const char *[]){
-			"xo",
-			"perfcl_pll_postdiv",
-		},
-		.num_parents = 2,
+		.parent_data = perfcl_smux_parents,
+		.num_parents = ARRAY_SIZE(perfcl_smux_parents),
 		.ops = &clk_regmap_mux_closest_ops,
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
+static const struct clk_hw *pwrcl_pmux_parents[] = {
+	[SMUX_INDEX] = &pwrcl_smux.clkr.hw,
+	[PLL_INDEX] = &pwrcl_pll.clkr.hw,
+	[ACD_INDEX] = &pwrcl_pll.clkr.hw,
+	[ALT_INDEX] = &pwrcl_alt_pll.clkr.hw,
+};
+
+static const struct clk_hw *perfcl_pmux_parents[] = {
+	[SMUX_INDEX] = &perfcl_smux.clkr.hw,
+	[PLL_INDEX] = &perfcl_pll.clkr.hw,
+	[ACD_INDEX] = &perfcl_pll.clkr.hw,
+	[ALT_INDEX] = &perfcl_alt_pll.clkr.hw,
+};
+
 static struct clk_cpu_8996_pmux pwrcl_pmux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 0,
@@ -323,13 +348,8 @@ static struct clk_cpu_8996_pmux pwrcl_pmux = {
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_pmux",
-		.parent_names = (const char *[]){
-			"pwrcl_smux",
-			"pwrcl_pll",
-			"pwrcl_pll_acd",
-			"pwrcl_alt_pll",
-		},
-		.num_parents = 4,
+		.parent_hws = pwrcl_pmux_parents,
+		.num_parents = ARRAY_SIZE(pwrcl_pmux_parents),
 		.ops = &clk_cpu_8996_pmux_ops,
 		/* CPU clock is critical and should never be gated */
 		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
@@ -345,13 +365,8 @@ static struct clk_cpu_8996_pmux perfcl_pmux = {
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_pmux",
-		.parent_names = (const char *[]){
-			"perfcl_smux",
-			"perfcl_pll",
-			"perfcl_pll_acd",
-			"perfcl_alt_pll",
-		},
-		.num_parents = 4,
+		.parent_hws = perfcl_pmux_parents,
+		.num_parents = ARRAY_SIZE(perfcl_pmux_parents),
 		.ops = &clk_cpu_8996_pmux_ops,
 		/* CPU clock is critical and should never be gated */
 		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
-- 
2.35.1

