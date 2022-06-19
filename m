Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D26B4550D26
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 23:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234654AbiFSV0A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 17:26:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236347AbiFSVZ6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 17:25:58 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19AC7656B
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:25:57 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id j22so3321920ljg.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XfJMqbTrvbGcMadqMaMwRzo8TXWgiYVxdNJ7Eqss70=;
        b=CbtILTZF6dTmisXfA1a16lZSofY1OkzuGs8v0V9ofFzMLbo/ZERy+f3TZGcg/sUv3V
         wncCTAacvcHYcUrgnGvDrqLzGbzxX3LOHeTmt9TDYo097d9zkiw29NFMziJ8MbyhkqaV
         SSYQWOfwOmS2BR/UDZIEbXB5ZEhQ5l0UtRCtaiDgbGZFSWUtBjlSnC6dp5E11Jr7MB0n
         Tsec9/VBnhsxnli7HnYvHYZnjkTIn5vQZdqk3o71dg4VVhtAc5ZoJ+tPmb4fg0qCI9Wl
         YLoWO2EWbiwcO/eXzVIYh6r1zY9LbDaHC1vsnWHHv/ytr+IwqzoDz1Sd3DpTWIIoMnbl
         Hrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XfJMqbTrvbGcMadqMaMwRzo8TXWgiYVxdNJ7Eqss70=;
        b=ND7qZ0eWszFob14MTNOmTjCelzmCzJWY7QypRjS4PJ65ShytxUojKXFAQYmaQjyCwZ
         JzUzcvz1n6vFoaGlf25XxCqwCCF787bxMpy8SRHj+X+FPJ9H4I4TJTMbMxx2tYKW7xNr
         OXZfqxUNz2+O9DccPZtOWLkYa1jJWVQN2B1YSXVb5pMM604La0pQk/YSo9DeRWPhaq5X
         /jv0qHxAK0AzPrcj1f+qLdPTTGktkDdobP3vl5MROY2DP0AqbRA+PfksKFUPLvKKUmDb
         WsFlEme/54VlatrHZ6Zv/Xj1Ngj2rqv2KebrXXaUumKiyISbhSVX4h8CZ7YrtpeQZ3JG
         HPYw==
X-Gm-Message-State: AJIora9BDczsoHl4iBwxdzRLqZ0y/+blhZEniaL+D8QVcVrjYSRRDRg6
        /kl/KWbH41uGZVdJU8tsY+I2Tw==
X-Google-Smtp-Source: AGRyM1tYZ0WAJjcvUNSHlDb9frFXs0f3/Ggxsnof5ZA1OICtLvok8UmxpHW6ZG+ZK+8tsqd8oW63CQ==
X-Received: by 2002:a2e:b048:0:b0:25a:6dc9:dcd0 with SMTP id d8-20020a2eb048000000b0025a6dc9dcd0mr1664923ljl.402.1655673955408;
        Sun, 19 Jun 2022 14:25:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u3-20020ac258c3000000b00478de10cf5esm626866lfo.247.2022.06.19.14.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:25:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v2 4/7] clk: qcom: gcc-msm8916: move clock parent tables down
Date:   Mon, 20 Jun 2022 00:25:46 +0300
Message-Id: <20220619212549.1240891-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
References: <20220619212549.1240891-1-dmitry.baryshkov@linaro.org>
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

Move clock parent tables down, after the GPLL declrataions, so that we
can use gpll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8916.c | 216 ++++++++++++++++-----------------
 1 file changed, 108 insertions(+), 108 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8916.c b/drivers/clk/qcom/gcc-msm8916.c
index 40c27ba6286f..7962edbdbcf6 100644
--- a/drivers/clk/qcom/gcc-msm8916.c
+++ b/drivers/clk/qcom/gcc-msm8916.c
@@ -42,6 +42,114 @@ enum {
 	P_EXT_MCLK,
 };
 
+static struct clk_pll gpll0 = {
+	.l_reg = 0x21004,
+	.m_reg = 0x21008,
+	.n_reg = 0x2100c,
+	.config_reg = 0x21010,
+	.mode_reg = 0x21000,
+	.status_reg = 0x2101c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll0",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll0_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(0),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll0_vote",
+		.parent_names = (const char *[]){ "gpll0" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll gpll1 = {
+	.l_reg = 0x20004,
+	.m_reg = 0x20008,
+	.n_reg = 0x2000c,
+	.config_reg = 0x20010,
+	.mode_reg = 0x20000,
+	.status_reg = 0x2001c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll1",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll1_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(1),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll1_vote",
+		.parent_names = (const char *[]){ "gpll1" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll gpll2 = {
+	.l_reg = 0x4a004,
+	.m_reg = 0x4a008,
+	.n_reg = 0x4a00c,
+	.config_reg = 0x4a010,
+	.mode_reg = 0x4a000,
+	.status_reg = 0x4a01c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll2",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll2_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(2),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll2_vote",
+		.parent_names = (const char *[]){ "gpll2" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll bimc_pll = {
+	.l_reg = 0x23004,
+	.m_reg = 0x23008,
+	.n_reg = 0x2300c,
+	.config_reg = 0x23010,
+	.mode_reg = 0x23000,
+	.status_reg = 0x2301c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "bimc_pll",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap bimc_pll_vote = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(3),
+	.hw.init = &(struct clk_init_data){
+		.name = "bimc_pll_vote",
+		.parent_names = (const char *[]){ "bimc_pll" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
 static const struct parent_map gcc_xo_gpll0_map[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0, 1 },
@@ -256,114 +364,6 @@ static const char * const gcc_xo_gpll1_emclk_sleep[] = {
 	"sleep_clk",
 };
 
-static struct clk_pll gpll0 = {
-	.l_reg = 0x21004,
-	.m_reg = 0x21008,
-	.n_reg = 0x2100c,
-	.config_reg = 0x21010,
-	.mode_reg = 0x21000,
-	.status_reg = 0x2101c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll0",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll0_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(0),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll0_vote",
-		.parent_names = (const char *[]){ "gpll0" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll gpll1 = {
-	.l_reg = 0x20004,
-	.m_reg = 0x20008,
-	.n_reg = 0x2000c,
-	.config_reg = 0x20010,
-	.mode_reg = 0x20000,
-	.status_reg = 0x2001c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll1",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll1_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(1),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll1_vote",
-		.parent_names = (const char *[]){ "gpll1" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll gpll2 = {
-	.l_reg = 0x4a004,
-	.m_reg = 0x4a008,
-	.n_reg = 0x4a00c,
-	.config_reg = 0x4a010,
-	.mode_reg = 0x4a000,
-	.status_reg = 0x4a01c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll2",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll2_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(2),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll2_vote",
-		.parent_names = (const char *[]){ "gpll2" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll bimc_pll = {
-	.l_reg = 0x23004,
-	.m_reg = 0x23008,
-	.n_reg = 0x2300c,
-	.config_reg = 0x23010,
-	.mode_reg = 0x23000,
-	.status_reg = 0x2301c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap bimc_pll_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(3),
-	.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll_vote",
-		.parent_names = (const char *[]){ "bimc_pll" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
 static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
 	.cmd_rcgr = 0x27000,
 	.hid_width = 5,
-- 
2.35.1

