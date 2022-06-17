Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 801E254F76B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jun 2022 14:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381881AbiFQMWr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Jun 2022 08:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381867AbiFQMWq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Jun 2022 08:22:46 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC199F5AD
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:22:44 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id w20so6661006lfa.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jun 2022 05:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+8Hz6RwX6Z9+ywwFoKsBVNQPwB4TMirFCh7x3fR+Uw=;
        b=WURm67L4CJsXhBC5Pa+bw35vmUJU3bITRNhOvR67+G4TypNqExmELTLuIenlWIWkcq
         0SaVK9kMCRTwi/jU/Hcdgvqn67G9UCpR+vaMMLghOu82MO+95mqAtEWb0rhvirU5pzCt
         hz8FRayFkvCLdCvec/70QYTqzNd24+n3WkrLdFJetcUa+KN4l2glIhOfat7/2+hS5mUS
         wlhy+XR8OEySxVFOUJdJCMimnzi6RQ+MSP/Fxnp8UUkzLrb3TlU26B1lQiJQwQH++tLJ
         erwkp8cAB8NmmzRPAj6bmxsARkM8kIFS2+rOX4/h8z81Trm55JzqgQNBTsnD30gxeHaT
         H4wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+8Hz6RwX6Z9+ywwFoKsBVNQPwB4TMirFCh7x3fR+Uw=;
        b=qJA1RFfeLAJBQ89CyMj5GhQOdb+YYP8pq9/Dfg238NfpuW3n94tMcWRwN/cUeH6tBt
         +4h+WF/lj9b3vbd9FKuRpWvLQnIffYWc0kFW/uJJdFfTOOoUon79j9Ks1ziBEtHfFP+f
         F0p+3lII0El//AT8Wd8mHxTlGzugq8qRlayoyDYGijo5uRulNF5uuuIQP0MnZKy1+BZ+
         Ww69+g/EOPnxVJEZru3QCj3maaKrFHWxp4yfMXPEdvU7JnH7k0m5RqNYV7iJ6rtw8gYo
         ySK5AaKnQD32EaKa5Rjdv8e1B5u4kdi5WFS0ZahQEhef5U/iLBBs91uW+f1PDeDsO3Lp
         8EQA==
X-Gm-Message-State: AJIora8LIEkFSQIwA0+IdpRr327+0vh9yfICQMUlhEPqxhiAME+sc1on
        ua4FuTtVNdS9/t2TUlh2TBJRHw==
X-Google-Smtp-Source: AGRyM1vkVT5pWT1QVy6X81u2yuHflqasjWKG8bcHGBgXT++kGKLLAjURvqs/drGVqOU0U14mfC335A==
X-Received: by 2002:a05:6512:1109:b0:479:79ee:b5f8 with SMTP id l9-20020a056512110900b0047979eeb5f8mr5375539lfg.608.1655468563012;
        Fri, 17 Jun 2022 05:22:43 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j7-20020a056512028700b004795cd9c938sm622731lfp.82.2022.06.17.05.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 05:22:42 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH] clk: qcom: clk-cpu-8996: use parent_hws/_data instead of parent_names
Date:   Fri, 17 Jun 2022 15:22:41 +0300
Message-Id: <20220617122241.768736-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

The ACD clocks (which were not defined before) are modelled using 1:1
fixed factor clocks to fill the gap in CPU clocks definitions.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 139 ++++++++++++++++++++++----------
 1 file changed, 98 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 4a4fde8dd12d..03abca379d47 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -117,7 +117,9 @@ static struct clk_alpha_pll perfcl_pll = {
 	.flags = SUPPORTS_DYNAMIC_UPDATE | SUPPORTS_FSM_MODE,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "perfcl_pll",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_huayra_ops,
 	},
@@ -129,7 +131,9 @@ static struct clk_alpha_pll pwrcl_pll = {
 	.flags = SUPPORTS_DYNAMIC_UPDATE | SUPPORTS_FSM_MODE,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pwrcl_pll",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_huayra_ops,
 	},
@@ -161,7 +165,9 @@ static struct clk_alpha_pll perfcl_alt_pll = {
 	.flags = SUPPORTS_OFFLINE_REQ | SUPPORTS_FSM_MODE,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_alt_pll",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
@@ -175,12 +181,70 @@ static struct clk_alpha_pll pwrcl_alt_pll = {
 	.flags = SUPPORTS_OFFLINE_REQ | SUPPORTS_FSM_MODE,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_alt_pll",
-		.parent_names = (const char *[]){ "xo" },
+		.parent_data = &(const struct clk_parent_data){
+			.fw_name = "xo", .name = "xo_board",
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
 };
 
+static struct clk_fixed_factor perfcl_pll_main = {
+	.hw.init = &(struct clk_init_data) {
+		.name = "perfcl_pll_main",
+		.parent_hws = (const struct clk_hw*[]){
+			&perfcl_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+	.mult = 1,
+	.div = 2,
+};
+
+static struct clk_fixed_factor pwrcl_pll_main = {
+	.hw.init = &(struct clk_init_data) {
+		.name = "pwrcl_pll_main",
+		.parent_hws = (const struct clk_hw*[]){
+			&pwrcl_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+	.mult = 1,
+	.div = 2,
+};
+
+static struct clk_fixed_factor perfcl_pll_acd = {
+	.hw.init = &(struct clk_init_data) {
+		.name = "perfcl_pll_acd",
+		.parent_hws = (const struct clk_hw*[]){
+			&perfcl_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+	.mult = 1,
+	.div = 1,
+};
+
+static struct clk_fixed_factor pwrcl_pll_acd = {
+	.hw.init = &(struct clk_init_data) {
+		.name = "pwrcl_pll_acd",
+		.parent_hws = (const struct clk_hw*[]){
+			&pwrcl_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+	.mult = 1,
+	.div = 1,
+};
+
 struct clk_cpu_8996_mux {
 	u32	reg;
 	u8	shift;
@@ -257,11 +321,12 @@ static struct clk_cpu_8996_mux pwrcl_smux = {
 	.reg = PWRCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 2,
 	.width = 2,
+	.pll = &pwrcl_pll_main.hw,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_smux",
-		.parent_names = (const char *[]){
-			"xo",
-			"pwrcl_pll_main",
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+			{ .hw = &pwrcl_pll_main.hw },
 		},
 		.num_parents = 2,
 		.ops = &clk_cpu_8996_mux_ops,
@@ -273,11 +338,12 @@ static struct clk_cpu_8996_mux perfcl_smux = {
 	.reg = PERFCL_REG_OFFSET + MUX_OFFSET,
 	.shift = 2,
 	.width = 2,
+	.pll = &perfcl_pll_main.hw,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_smux",
-		.parent_names = (const char *[]){
-			"xo",
-			"perfcl_pll_main",
+		.parent_data = (const struct clk_parent_data[]){
+			{ .fw_name = "xo", .name = "xo_board" },
+			{ .hw = &perfcl_pll_main.hw },
 		},
 		.num_parents = 2,
 		.ops = &clk_cpu_8996_mux_ops,
@@ -294,11 +360,11 @@ static struct clk_cpu_8996_mux pwrcl_pmux = {
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "pwrcl_pmux",
-		.parent_names = (const char *[]){
-			"pwrcl_smux",
-			"pwrcl_pll",
-			"pwrcl_pll_acd",
-			"pwrcl_alt_pll",
+		.parent_hws = (const struct clk_hw*[]){
+			&pwrcl_smux.clkr.hw,
+			&pwrcl_pll.clkr.hw,
+			&pwrcl_pll_acd.hw,
+			&pwrcl_alt_pll.clkr.hw,
 		},
 		.num_parents = 4,
 		.ops = &clk_cpu_8996_mux_ops,
@@ -316,11 +382,11 @@ static struct clk_cpu_8996_mux perfcl_pmux = {
 	.nb.notifier_call = cpu_clk_notifier_cb,
 	.clkr.hw.init = &(struct clk_init_data) {
 		.name = "perfcl_pmux",
-		.parent_names = (const char *[]){
-			"perfcl_smux",
-			"perfcl_pll",
-			"perfcl_pll_acd",
-			"perfcl_alt_pll",
+		.parent_hws = (const struct clk_hw*[]){
+			&perfcl_smux.clkr.hw,
+			&perfcl_pll.clkr.hw,
+			&perfcl_pll_acd.hw,
+			&perfcl_alt_pll.clkr.hw,
 		},
 		.num_parents = 4,
 		.ops = &clk_cpu_8996_mux_ops,
@@ -338,6 +404,13 @@ static const struct regmap_config cpu_msm8996_regmap_config = {
 	.val_format_endian	= REGMAP_ENDIAN_LITTLE,
 };
 
+static struct clk_hw *cpu_msm8996_clks_hw[] = {
+	&perfcl_pll_main.hw,
+	&pwrcl_pll_main.hw,
+	&perfcl_pll_acd.hw,
+	&pwrcl_pll_acd.hw,
+};
+
 static struct clk_regmap *cpu_msm8996_clks[] = {
 	&perfcl_pll.clkr,
 	&pwrcl_pll.clkr,
@@ -354,32 +427,16 @@ static int qcom_cpu_clk_msm8996_register_clks(struct device *dev,
 {
 	int i, ret;
 
-	perfcl_smux.pll = clk_hw_register_fixed_factor(dev, "perfcl_pll_main",
-						       "perfcl_pll",
-						       CLK_SET_RATE_PARENT,
-						       1, 2);
-	if (IS_ERR(perfcl_smux.pll)) {
-		dev_err(dev, "Failed to initialize perfcl_pll_main\n");
-		return PTR_ERR(perfcl_smux.pll);
-	}
-
-	pwrcl_smux.pll = clk_hw_register_fixed_factor(dev, "pwrcl_pll_main",
-						      "pwrcl_pll",
-						      CLK_SET_RATE_PARENT,
-						      1, 2);
-	if (IS_ERR(pwrcl_smux.pll)) {
-		dev_err(dev, "Failed to initialize pwrcl_pll_main\n");
-		clk_hw_unregister(perfcl_smux.pll);
-		return PTR_ERR(pwrcl_smux.pll);
+	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_clks_hw); i++) {
+		ret = devm_clk_hw_register(dev, cpu_msm8996_clks_hw[i]);
+		if (ret)
+			return ret;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(cpu_msm8996_clks); i++) {
 		ret = devm_clk_register_regmap(dev, cpu_msm8996_clks[i]);
-		if (ret) {
-			clk_hw_unregister(perfcl_smux.pll);
-			clk_hw_unregister(pwrcl_smux.pll);
+		if (ret)
 			return ret;
-		}
 	}
 
 	clk_alpha_pll_configure(&perfcl_pll, regmap, &hfpll_config);
-- 
2.35.1

