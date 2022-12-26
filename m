Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E122655FCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Dec 2022 05:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbiLZEWP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Dec 2022 23:22:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbiLZEWE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Dec 2022 23:22:04 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565C22BF5
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:02 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id g13so14672607lfv.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Dec 2022 20:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrxMv/Z8ebZRiFFe33vJ4k21IdEd7NjyuXb4pwJX7SA=;
        b=HfZjYZCYUYjyr5YJBBLrCUAIbRlzTLCPWmdE+qoQTbcWessk7s1QW3NsnIrwcNHS90
         RD4BQPcsX+j5t1SXJP9s/X6OQpdQHMG1gGOrv1Z0qbI/pEQy9CESay0n0OhaO94CRGwy
         qbPpnn1Jm2RdVXGEyENbe1PSUXZr/9mKxCZ9zjvz+RjtrC0ZOUydypM7MXH66EYIniT9
         6gxr1v++3BoQEyIEwhaH3RRsx7alydhtHnJaWVXUZLmUJfFnbdSvaXZWlUUzUMLp0HAA
         AlJo9MGgdgDUY/qEOMj2Qbq8MHB69A2KzKUhz+QbbGf7aRiihpJ6TaHD29O9OG19Rn1o
         csgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrxMv/Z8ebZRiFFe33vJ4k21IdEd7NjyuXb4pwJX7SA=;
        b=8K57iwrhxgowIIjM0eCYlLhClryuqRQgNYscSIbEV6n/hbuZ3HEyhAwa76KkJew4cc
         ImJCSKRJYkF3za5IF/scvIkk7zlm6qOOwt+HBRBZrW+S1rbUGAAWU4IpZsjhH/DLXoFX
         2A4419gccG+8ylF4nlRlMq1oy2UM+lMrTIsQOFFXfm/ooNW+9HqhuwLEOoXKpZRZJs8n
         Ue6MnazyyJ4eo9JSoVbCuy/uOlr8gSjzHJzHPSGyw2gzaj5OE5fe54gvej5EQ4jUaVZ/
         yiTtJisplc+3yP10TMJZ18A/rRR4wcJHgpQ181S3e6e2STBd1BdOukjuo9e2ul3ngscR
         eTvQ==
X-Gm-Message-State: AFqh2kotvvpjUMe6USaGLGNFMaqCM7UiqnfSdxJGgDmne4iEF20Ux08Y
        fp/We/833TgqAGzr36vJi5qvHQ==
X-Google-Smtp-Source: AMrXdXt7+uN6Zck8hu+BJ2CHZtVrebLR3rzTmP8II/nr1Z4aciM/wypoN2Tz6j0ChOYC5/jZk/49Wg==
X-Received: by 2002:a05:6512:3f26:b0:4a4:68b9:66bf with SMTP id y38-20020a0565123f2600b004a468b966bfmr5890328lfa.10.1672028521751;
        Sun, 25 Dec 2022 20:22:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id o9-20020ac25e29000000b004b4b5da5f80sm1641129lfg.219.2022.12.25.20.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Dec 2022 20:22:01 -0800 (PST)
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
Subject: [PATCH v2 09/16] clk: qcom: gcc-qcs404: move PLL clocks up
Date:   Mon, 26 Dec 2022 06:21:47 +0200
Message-Id: <20221226042154.2666748-10-dmitry.baryshkov@linaro.org>
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

Move PLL clock declarations up, before clock parent tables, so that we
can use pll hw clock fields in the next commit.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 298 +++++++++++++++++-----------------
 1 file changed, 149 insertions(+), 149 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index e1d1d3a700f7..9b200b378b6b 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -35,6 +35,155 @@ enum {
 	P_XO,
 };
 
+static struct clk_fixed_factor cxo = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "cxo",
+		.parent_names = (const char *[]){ "xo-board" },
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll0_sleep_clk_src = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45008,
+		.enable_mask = BIT(23),
+		.enable_is_inverted = true,
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0_sleep_clk_src",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll0_out_main = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.flags = SUPPORTS_FSM_MODE,
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0_out_main",
+			.parent_names = (const char *[])
+					{ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll0_ao_out_main = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.flags = SUPPORTS_FSM_MODE,
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0_ao_out_main",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_alpha_pll_fixed_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll1_out_main = {
+	.offset = 0x20000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll1_out_main",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+/* 930MHz configuration */
+static const struct alpha_pll_config gpll3_config = {
+	.l = 48,
+	.alpha = 0x0,
+	.alpha_en_mask = BIT(24),
+	.post_div_mask = 0xf << 8,
+	.post_div_val = 0x1 << 8,
+	.vco_mask = 0x3 << 20,
+	.main_output_mask = 0x1,
+	.config_ctl_val = 0x4001055b,
+};
+
+static const struct pll_vco gpll3_vco[] = {
+	{ 700000000, 1400000000, 0 },
+};
+
+static struct clk_alpha_pll gpll3_out_main = {
+	.offset = 0x22000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.vco_table = gpll3_vco,
+	.num_vco = ARRAY_SIZE(gpll3_vco),
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll3_out_main",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll4_out_main = {
+	.offset = 0x24000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll4_out_main",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_pll gpll6 = {
+	.l_reg = 0x37004,
+	.m_reg = 0x37008,
+	.n_reg = 0x3700C,
+	.config_reg = 0x37014,
+	.mode_reg = 0x37000,
+	.status_reg = 0x3701C,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll6",
+		.parent_names = (const char *[]){ "cxo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll6_out_aux = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(7),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll6_out_aux",
+		.parent_names = (const char *[]){ "gpll6" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
 static const struct parent_map gcc_parent_map_0[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
@@ -224,155 +373,6 @@ static const char * const gcc_parent_names_16[] = {
 	"gpll0_out_main",
 };
 
-static struct clk_fixed_factor cxo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "cxo",
-		.parent_names = (const char *[]){ "xo-board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
-static struct clk_alpha_pll gpll0_sleep_clk_src = {
-	.offset = 0x21000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr = {
-		.enable_reg = 0x45008,
-		.enable_mask = BIT(23),
-		.enable_is_inverted = true,
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll0_sleep_clk_src",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-static struct clk_alpha_pll gpll0_out_main = {
-	.offset = 0x21000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.flags = SUPPORTS_FSM_MODE,
-	.clkr = {
-		.enable_reg = 0x45000,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll0_out_main",
-			.parent_names = (const char *[])
-					{ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-static struct clk_alpha_pll gpll0_ao_out_main = {
-	.offset = 0x21000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.flags = SUPPORTS_FSM_MODE,
-	.clkr = {
-		.enable_reg = 0x45000,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll0_ao_out_main",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_alpha_pll_fixed_ops,
-		},
-	},
-};
-
-static struct clk_alpha_pll gpll1_out_main = {
-	.offset = 0x20000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr = {
-		.enable_reg = 0x45000,
-		.enable_mask = BIT(1),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll1_out_main",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-/* 930MHz configuration */
-static const struct alpha_pll_config gpll3_config = {
-	.l = 48,
-	.alpha = 0x0,
-	.alpha_en_mask = BIT(24),
-	.post_div_mask = 0xf << 8,
-	.post_div_val = 0x1 << 8,
-	.vco_mask = 0x3 << 20,
-	.main_output_mask = 0x1,
-	.config_ctl_val = 0x4001055b,
-};
-
-static const struct pll_vco gpll3_vco[] = {
-	{ 700000000, 1400000000, 0 },
-};
-
-static struct clk_alpha_pll gpll3_out_main = {
-	.offset = 0x22000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.vco_table = gpll3_vco,
-	.num_vco = ARRAY_SIZE(gpll3_vco),
-	.clkr = {
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll3_out_main",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-static struct clk_alpha_pll gpll4_out_main = {
-	.offset = 0x24000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr = {
-		.enable_reg = 0x45000,
-		.enable_mask = BIT(5),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll4_out_main",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-static struct clk_pll gpll6 = {
-	.l_reg = 0x37004,
-	.m_reg = 0x37008,
-	.n_reg = 0x3700C,
-	.config_reg = 0x37014,
-	.mode_reg = 0x37000,
-	.status_reg = 0x3701C,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll6",
-		.parent_names = (const char *[]){ "cxo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll6_out_aux = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(7),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll6_out_aux",
-		.parent_names = (const char *[]){ "gpll6" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_apss_ahb_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
-- 
2.35.1

