Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32640550D3D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jun 2022 23:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237389AbiFSV1o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 19 Jun 2022 17:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237361AbiFSV1m (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 19 Jun 2022 17:27:42 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDA15AE61
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:27:40 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w20so14369438lfa.11
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jun 2022 14:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1XfJMqbTrvbGcMadqMaMwRzo8TXWgiYVxdNJ7Eqss70=;
        b=qkzhAUYadtYwUojxmgrY3L01StY+sqqSZG4EUl4QcYQ9TVyml9RW4/UpRoe0V0xAaA
         UojUyLHAlNmXCw+lVjFRKBKj4RE0Y6PLjvewF8L/DzKFbwnMcFALVNQK6+JjzhUuqQ7F
         uWqlQ5o0trz1DLFu5sPgqeVBXUrCNuBMvWzat7GJ015u7WZaWHZxvjofDKJD/WA3+cxv
         UsJtV4TL7uXTNzN1HlQfErAaduTq66SFkr9yUMbwrgP6HbINW696Npp69WUQ7MeopAqi
         0otZYoKib/FYDnmOmoneXIe+wsXe5qrr+36jLUN7AWET7vOKH9pRtX2DkNF6caZDHPXF
         8LOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1XfJMqbTrvbGcMadqMaMwRzo8TXWgiYVxdNJ7Eqss70=;
        b=PTypXndz/+OOGQZjYWfkowyu5RuTW4z8QXQZ0905H19s6kcwHv7ZN2t6MtabHtE8Tr
         1ROC6qykgMxZ9kf7EadCMBlDR5Mx63XYeJNNyXOhQ/Qf/hH5kY1L08CY/0NnK3sf/bHN
         Ltcw9BcO7qnkJleLvhhyuEXPSLcHqdxr+PJmmMYKUdNzlDaIgZQWHaAflfrd5ZKdUlFu
         g9xncl27BV1Z70kSJ9TJpzJPpIzKqrvpjerSWrl9FYI7pdcy7NOc/6d2F0gYgVwFtYPQ
         itPNplHvOtVJR/rqxFfrx6Ar2YnT4aw2Pfxpyaks5HT87PNtWQBNgKvWgtEbW9iLDaA2
         H7MA==
X-Gm-Message-State: AJIora8rT2E/CFLy3Z45jfQEzms/kx4DXUbSTo80WMhjKLjrOPpk0/NW
        CX5f1CkwMtkQDAS1+kzgKbLkxw==
X-Google-Smtp-Source: AGRyM1vd+PY0A2xqd09kEcPEJu/P4wecqkftGzOE9HcxRikZqaFJ6anIkcHHpEj1W//jkTSeOMQWfw==
X-Received: by 2002:a05:6512:686:b0:47d:b7f3:e6a4 with SMTP id t6-20020a056512068600b0047db7f3e6a4mr11832595lfe.138.1655674060508;
        Sun, 19 Jun 2022 14:27:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512215300b004796a17246esm649078lfr.252.2022.06.19.14.27.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:27:39 -0700 (PDT)
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
Subject: [PATCH v3 4/7] clk: qcom: gcc-msm8916: move clock parent tables down
Date:   Mon, 20 Jun 2022 00:27:32 +0300
Message-Id: <20220619212735.1244953-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
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

