Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6A16FFE00
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 May 2023 02:32:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239665AbjELAco (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 May 2023 20:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239675AbjELAcn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 May 2023 20:32:43 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62A772A3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:38 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f1411e8111so10424184e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 May 2023 17:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851557; x=1686443557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wokvLB4E/PYGVb196XdxZfYyHsIhHMceF+n+PMLHuw=;
        b=q0pxiuw68YZ6ghTXXkQy9fCnQqiw2tsSR+ZJTYk8lBWLqc+PRYYq2WbmQBG7gRufeL
         xcwhHHaTPvDTuIDliqPwtn/PyMkc729kwwhEPh6UNN3Ua4GifKPVEk5wM10THqBRNbwO
         CtGxKmKq4Bgs7VWLGqA22qUntcX8/fTPgEhbyLwU0cLt3tRYSBAPc3UhKmVU0bZmwQun
         2SK0VcjKPx4OXBdm/1RPXV7VTN2fIzjhbhUtPv5WBPV4VJHoyu9A7IElhnCRWpdZQBWl
         9PU2muqoIr4alOt+i6BFt2SKIDdLyaXu9DW5tT9RhESjQAXNwhyy8fve3Dbq5DpOK6Hy
         7V/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851557; x=1686443557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wokvLB4E/PYGVb196XdxZfYyHsIhHMceF+n+PMLHuw=;
        b=huVUTbX6z2Em0NcOpzxheqez/RDoaNfYkav1FG8GrGuvm9DVjWmmBT4AXZJoWGN4L3
         Cs7ckpnGxBqhP4axwSDk6GzBu+n+TqhFEenWjsTRYxg9kXgI9IPMWubBDQuVn0PRu7WN
         6s9Behe2Q61ENc8gWD+HmXdwswPsryjgDaEbsgtdJnSavVwRIB6U5K5jedLfYIU/KDmM
         OR8gg8C/DpK4+ofc1Ab0wdB5D+SPE8rzUCX8+w9jY2Qvms+U4tp6O2ayrhFoXD1Bb/d1
         /EAiT/7k6SYqEwVfu6Mmani4dvTYetIeV3f+ElW/2yulw9PM0XTS0DaCXpVstObuKF3O
         fEGQ==
X-Gm-Message-State: AC+VfDzJikpzCBbx/FJTlqiHoZwBSWbPHL5z5ukHcSbM27rxKFG8RCn3
        r05AKxsYJJtKvKzWgcim4OLc4g==
X-Google-Smtp-Source: ACHHUZ7T+zyWnF+29jQ0myLshY6aytaXKJBd6vYtw8LzLVeOJvIT/2OppfksG4B0qYOPbhuC8osjQw==
X-Received: by 2002:a19:ac01:0:b0:4e8:77a:f894 with SMTP id g1-20020a19ac01000000b004e8077af894mr3136202lfc.25.1683851556953;
        Thu, 11 May 2023 17:32:36 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:36 -0700 (PDT)
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
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 07/10] clk: qcom: gcc-mdm9615: use parent_hws/_data instead of parent_names
Date:   Fri, 12 May 2023 03:32:27 +0300
Message-Id: <20230512003230.3043284-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the clock driver to specify parent data rather than parent
names, to actually bind using 'clock-names' specified in the DTS rather
than global clock names. Use parent_hws where possible to refer parent
clocks directly, skipping the lookup.

Note, the system names for xo clocks were changed from "cxo" to
"cxo_board" to follow the example of other platforms. This switches the
clocks to use DT-provided "cxo_board" clock instead of manually
registered "cxo" clock and allows us to drop the cxo clock.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9615.c | 206 ++++++++++++++++++++-------------
 1 file changed, 124 insertions(+), 82 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm9615.c
index 2f921891008d..458c18b639db 100644
--- a/drivers/clk/qcom/gcc-mdm9615.c
+++ b/drivers/clk/qcom/gcc-mdm9615.c
@@ -37,6 +37,25 @@ static struct clk_fixed_factor cxo = {
 	},
 };
 
+enum {
+	DT_CXO,
+	DT_PLL4,
+};
+
+enum {
+	P_CXO,
+	P_PLL8,
+	P_PLL14,
+};
+
+static const struct parent_map gcc_cxo_map[] = {
+	{ P_CXO, 0 },
+};
+
+static const struct clk_parent_data gcc_cxo[] = {
+	{ .index = DT_CXO, .name = "cxo_board" },
+};
+
 static struct clk_pll pll0 = {
 	.l_reg = 0x30c4,
 	.m_reg = 0x30c8,
@@ -47,8 +66,8 @@ static struct clk_pll pll0 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll0",
-		.parent_names = (const char *[]){ "cxo" },
-		.num_parents = 1,
+		.parent_data = gcc_cxo,
+		.num_parents = ARRAY_SIZE(gcc_cxo),
 		.ops = &clk_pll_ops,
 	},
 };
@@ -58,7 +77,9 @@ static struct clk_regmap pll0_vote = {
 	.enable_mask = BIT(0),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll0_vote",
-		.parent_names = (const char *[]){ "pll0" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&pll0.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -69,7 +90,9 @@ static struct clk_regmap pll4_vote = {
 	.enable_mask = BIT(4),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll4_vote",
-		.parent_names = (const char *[]){ "pll4" },
+		.parent_data = &(const struct clk_parent_data) {
+			.index = DT_PLL4, .name = "pll4",
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -85,8 +108,8 @@ static struct clk_pll pll8 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll8",
-		.parent_names = (const char *[]){ "cxo" },
-		.num_parents = 1,
+		.parent_data = gcc_cxo,
+		.num_parents = ARRAY_SIZE(gcc_cxo),
 		.ops = &clk_pll_ops,
 	},
 };
@@ -96,7 +119,9 @@ static struct clk_regmap pll8_vote = {
 	.enable_mask = BIT(8),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll8_vote",
-		.parent_names = (const char *[]){ "pll8" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&pll8.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
@@ -112,8 +137,8 @@ static struct clk_pll pll14 = {
 	.status_bit = 16,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "pll14",
-		.parent_names = (const char *[]){ "cxo" },
-		.num_parents = 1,
+		.parent_data = gcc_cxo,
+		.num_parents = ARRAY_SIZE(gcc_cxo),
 		.ops = &clk_pll_ops,
 	},
 };
@@ -123,26 +148,22 @@ static struct clk_regmap pll14_vote = {
 	.enable_mask = BIT(11),
 	.hw.init = &(struct clk_init_data){
 		.name = "pll14_vote",
-		.parent_names = (const char *[]){ "pll14" },
+		.parent_hws = (const struct clk_hw*[]) {
+			&pll14.clkr.hw,
+		},
 		.num_parents = 1,
 		.ops = &clk_pll_vote_ops,
 	},
 };
 
-enum {
-	P_CXO,
-	P_PLL8,
-	P_PLL14,
-};
-
 static const struct parent_map gcc_cxo_pll8_map[] = {
 	{ P_CXO, 0 },
 	{ P_PLL8, 3 }
 };
 
-static const char * const gcc_cxo_pll8[] = {
-	"cxo",
-	"pll8_vote",
+static const struct clk_parent_data gcc_cxo_pll8[] = {
+	{ .index = DT_CXO, .name = "cxo_board" },
+	{ .hw = &pll8_vote.hw },
 };
 
 static const struct parent_map gcc_cxo_pll14_map[] = {
@@ -150,17 +171,9 @@ static const struct parent_map gcc_cxo_pll14_map[] = {
 	{ P_PLL14, 4 }
 };
 
-static const char * const gcc_cxo_pll14[] = {
-	"cxo",
-	"pll14_vote",
-};
-
-static const struct parent_map gcc_cxo_map[] = {
-	{ P_CXO, 0 },
-};
-
-static const char * const gcc_cxo[] = {
-	"cxo",
+static const struct clk_parent_data gcc_cxo_pll14[] = {
+	{ .index = DT_CXO, .name = "cxo_board" },
+	{ .hw = &pll14_vote.hw },
 };
 
 static struct freq_tbl clk_tbl_gsbi_uart[] = {
@@ -206,7 +219,7 @@ static struct clk_rcg gsbi1_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_uart_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -222,8 +235,8 @@ static struct clk_branch gsbi1_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi1_uart_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi1_uart_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -257,7 +270,7 @@ static struct clk_rcg gsbi2_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_uart_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -273,8 +286,8 @@ static struct clk_branch gsbi2_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi2_uart_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi2_uart_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -308,7 +321,7 @@ static struct clk_rcg gsbi3_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_uart_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -324,8 +337,8 @@ static struct clk_branch gsbi3_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi3_uart_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi3_uart_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -359,7 +372,7 @@ static struct clk_rcg gsbi4_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_uart_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -375,8 +388,8 @@ static struct clk_branch gsbi4_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi4_uart_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi4_uart_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -410,7 +423,7 @@ static struct clk_rcg gsbi5_uart_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_uart_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -426,8 +439,8 @@ static struct clk_branch gsbi5_uart_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_uart_clk",
-			.parent_names = (const char *[]){
-				"gsbi5_uart_src",
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi5_uart_src.clkr.hw,
 			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
@@ -473,7 +486,7 @@ static struct clk_rcg gsbi1_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_qup_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -489,7 +502,9 @@ static struct clk_branch gsbi1_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi1_qup_clk",
-			.parent_names = (const char *[]){ "gsbi1_qup_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi1_qup_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -522,7 +537,7 @@ static struct clk_rcg gsbi2_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_qup_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -538,7 +553,9 @@ static struct clk_branch gsbi2_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi2_qup_clk",
-			.parent_names = (const char *[]){ "gsbi2_qup_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi2_qup_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -571,7 +588,7 @@ static struct clk_rcg gsbi3_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_qup_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -587,7 +604,9 @@ static struct clk_branch gsbi3_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi3_qup_clk",
-			.parent_names = (const char *[]){ "gsbi3_qup_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi3_qup_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -620,7 +639,7 @@ static struct clk_rcg gsbi4_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_qup_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -636,7 +655,9 @@ static struct clk_branch gsbi4_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi4_qup_clk",
-			.parent_names = (const char *[]){ "gsbi4_qup_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi4_qup_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -669,7 +690,7 @@ static struct clk_rcg gsbi5_qup_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_qup_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -685,7 +706,9 @@ static struct clk_branch gsbi5_qup_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gsbi5_qup_clk",
-			.parent_names = (const char *[]){ "gsbi5_qup_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&gsbi5_qup_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -724,7 +747,7 @@ static struct clk_rcg gp0_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp0_src",
-			.parent_names = gcc_cxo,
+			.parent_data = gcc_cxo,
 			.num_parents = ARRAY_SIZE(gcc_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_PARENT_GATE,
@@ -740,7 +763,9 @@ static struct clk_branch gp0_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp0_clk",
-			.parent_names = (const char *[]){ "gp0_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp0_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -773,7 +798,7 @@ static struct clk_rcg gp1_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp1_src",
-			.parent_names = gcc_cxo,
+			.parent_data = gcc_cxo,
 			.num_parents = ARRAY_SIZE(gcc_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -789,7 +814,9 @@ static struct clk_branch gp1_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp1_clk",
-			.parent_names = (const char *[]){ "gp1_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp1_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -822,7 +849,7 @@ static struct clk_rcg gp2_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp2_src",
-			.parent_names = gcc_cxo,
+			.parent_data = gcc_cxo,
 			.num_parents = ARRAY_SIZE(gcc_cxo),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -838,7 +865,9 @@ static struct clk_branch gp2_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "gp2_clk",
-			.parent_names = (const char *[]){ "gp2_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&gp2_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -874,7 +903,7 @@ static struct clk_rcg prng_src = {
 	.clkr = {
 		.hw.init = &(struct clk_init_data){
 			.name = "prng_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -890,7 +919,9 @@ static struct clk_branch prng_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "prng_clk",
-			.parent_names = (const char *[]){ "prng_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&prng_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 		},
@@ -936,7 +967,7 @@ static struct clk_rcg sdc1_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -951,7 +982,9 @@ static struct clk_branch sdc1_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc1_clk",
-			.parent_names = (const char *[]){ "sdc1_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdc1_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -984,7 +1017,7 @@ static struct clk_rcg sdc2_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 		},
@@ -999,7 +1032,9 @@ static struct clk_branch sdc2_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "sdc2_clk",
-			.parent_names = (const char *[]){ "sdc2_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&sdc2_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1037,7 +1072,7 @@ static struct clk_rcg usb_hs1_xcvr_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_xcvr_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1053,7 +1088,9 @@ static struct clk_branch usb_hs1_xcvr_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_xcvr_clk",
-			.parent_names = (const char *[]){ "usb_hs1_xcvr_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb_hs1_xcvr_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1086,7 +1123,7 @@ static struct clk_rcg usb_hsic_xcvr_fs_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_xcvr_fs_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1102,8 +1139,9 @@ static struct clk_branch usb_hsic_xcvr_fs_clk = {
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_xcvr_fs_clk",
-			.parent_names =
-				(const char *[]){ "usb_hsic_xcvr_fs_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb_hsic_xcvr_fs_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.ops = &clk_branch_ops,
 			.flags = CLK_SET_RATE_PARENT,
@@ -1141,7 +1179,7 @@ static struct clk_rcg usb_hs1_system_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hs1_system_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1156,8 +1194,9 @@ static struct clk_branch usb_hs1_system_clk = {
 		.enable_reg = 0x36a4,
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
-			.parent_names =
-				(const char *[]){ "usb_hs1_system_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb_hs1_system_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.name = "usb_hs1_system_clk",
 			.ops = &clk_branch_ops,
@@ -1196,7 +1235,7 @@ static struct clk_rcg usb_hsic_system_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_system_src",
-			.parent_names = gcc_cxo_pll8,
+			.parent_data = gcc_cxo_pll8,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll8),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1211,8 +1250,9 @@ static struct clk_branch usb_hsic_system_clk = {
 		.enable_reg = 0x2b58,
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
-			.parent_names =
-				(const char *[]){ "usb_hsic_system_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb_hsic_system_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.name = "usb_hsic_system_clk",
 			.ops = &clk_branch_ops,
@@ -1251,7 +1291,7 @@ static struct clk_rcg usb_hsic_hsic_src = {
 		.enable_mask = BIT(11),
 		.hw.init = &(struct clk_init_data){
 			.name = "usb_hsic_hsic_src",
-			.parent_names = gcc_cxo_pll14,
+			.parent_data = gcc_cxo_pll14,
 			.num_parents = ARRAY_SIZE(gcc_cxo_pll14),
 			.ops = &clk_rcg_ops,
 			.flags = CLK_SET_RATE_GATE,
@@ -1265,7 +1305,9 @@ static struct clk_branch usb_hsic_hsic_clk = {
 		.enable_reg = 0x2b50,
 		.enable_mask = BIT(9),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "usb_hsic_hsic_src" },
+			.parent_hws = (const struct clk_hw*[]) {
+				&usb_hsic_hsic_src.clkr.hw,
+			},
 			.num_parents = 1,
 			.name = "usb_hsic_hsic_clk",
 			.ops = &clk_branch_ops,
@@ -1281,8 +1323,8 @@ static struct clk_branch usb_hsic_hsio_cal_clk = {
 		.enable_reg = 0x2b48,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
+			.parent_data = gcc_cxo,
+			.num_parents = ARRAY_SIZE(gcc_cxo),
 			.name = "usb_hsic_hsio_cal_clk",
 			.ops = &clk_branch_ops,
 		},
-- 
2.39.2

