Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EC39612B66
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Oct 2022 16:55:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229667AbiJ3Pzc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Oct 2022 11:55:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbiJ3Pza (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Oct 2022 11:55:30 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EA8CFB
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 08:55:28 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id a15so14113897ljb.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Oct 2022 08:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a4b3VDC5du5iio3wMznYg7ulqmdVJGK4H8IaPURNvGQ=;
        b=m/lKYAevAKU9h7hlPA/pUvsf8tshU3aCAwwVeLCM3Q5U4JEnwjRzBMSyT+WaoI0mX9
         VnKJb7bo9VQYhqbKFsi+wE/5wD0aeKkXtnjfUVJwxcvLZbiNne9WITiAb5q1TaUKz8XG
         YdBom7zs4Qq5cksk0Jg6co3kePBq+GYzD7EcDr4i7p0zKHxU9/rK33KRgG/xXSI+HE1b
         MuWXYdVK6cslGEwzGGyAfzwU1QVqFGxFwnVo4BPPJWJA4D6ppoiPG/gbnDiUaJxYo2sY
         wvP3sJljloVfRTc2hjd53FgLNTGkBJoUCyBAhcGX3nzGQV2EBNE4WK3mX4K5Hg95Afo0
         BCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a4b3VDC5du5iio3wMznYg7ulqmdVJGK4H8IaPURNvGQ=;
        b=kZ/41R/Un7jF6TGh7a34QRzFChGjD4N5x6FEGfUbam5RNhjPzSZSJZuRDR6zuKwdGM
         e+5VxexnIcvDRKy5CRydQNEL5fIBg/mHi1bgzn3mrs2yj6Rrlncu4qI1WDMC9bIAAiXs
         ELhArbK1XRNizCcakWr/1fwq7oGYrdfhAvejtNk9S/taf82huBAvV0IA6z8RJO2Zydx0
         burevej2rWfprJiDWQsuX4CSSKKMC8Iepttq6k8x7/KkJ19zo2i9CzC8IU2lLsaRle7c
         kQAEHChYDCYVHcfb4kNuxuIDxka4Sx9m6qwYO/kZRyM22fNEdgXqfhFY0C7UCEvj3dxB
         EV/A==
X-Gm-Message-State: ACrzQf3e88nujFl7T2iyB9aZtQ2oLhdnwb11Zd2784PHzPJKPbpkYxdD
        so6/Z05HoGpfNGngDs7J9O1mHg==
X-Google-Smtp-Source: AMsMyM6+7wnYu4mqedwKw61PRdaJBs1gdyAjeREmzz9DDnrqA7cSS0hN9USGTHlkTzLF+UuXDTg5OQ==
X-Received: by 2002:a2e:8793:0:b0:277:4b8:192f with SMTP id n19-20020a2e8793000000b0027704b8192fmr3495093lji.442.1667145327300;
        Sun, 30 Oct 2022 08:55:27 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id f4-20020ac24e44000000b00497a1f92a72sm842982lfr.221.2022.10.30.08.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 08:55:27 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 04/11] clk: qcom: gcc-msm8974: move clock parent tables down
Date:   Sun, 30 Oct 2022 18:55:13 +0300
Message-Id: <20221030155520.91629-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
References: <20221030155520.91629-1-dmitry.baryshkov@linaro.org>
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

Rearrage clock parent tables and PLL declarations (pull parents down
and gpll4 up), so that we can use pll hw clock fields in the next
commit.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8974.c | 98 +++++++++++++++++-----------------
 1 file changed, 49 insertions(+), 49 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8974.c b/drivers/clk/qcom/gcc-msm8974.c
index b847ce852ef8..77f3497265a0 100644
--- a/drivers/clk/qcom/gcc-msm8974.c
+++ b/drivers/clk/qcom/gcc-msm8974.c
@@ -32,28 +32,6 @@ enum {
 	P_GPLL4,
 };
 
-static const struct parent_map gcc_xo_gpll0_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 }
-};
-
-static const char * const gcc_xo_gpll0[] = {
-	"xo",
-	"gpll0_vote",
-};
-
-static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_GPLL4, 5 }
-};
-
-static const char * const gcc_xo_gpll0_gpll4[] = {
-	"xo",
-	"gpll0_vote",
-	"gpll4_vote",
-};
-
 static struct clk_pll gpll0 = {
 	.l_reg = 0x0004,
 	.m_reg = 0x0008,
@@ -81,6 +59,55 @@ static struct clk_regmap gpll0_vote = {
 	},
 };
 
+static struct clk_pll gpll4 = {
+	.l_reg = 0x1dc4,
+	.m_reg = 0x1dc8,
+	.n_reg = 0x1dcc,
+	.config_reg = 0x1dd4,
+	.mode_reg = 0x1dc0,
+	.status_reg = 0x1ddc,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll4",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll4_vote = {
+	.enable_reg = 0x1480,
+	.enable_mask = BIT(4),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll4_vote",
+		.parent_names = (const char *[]){ "gpll4" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static const struct parent_map gcc_xo_gpll0_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 }
+};
+
+static const char * const gcc_xo_gpll0[] = {
+	"xo",
+	"gpll0_vote",
+};
+
+static const struct parent_map gcc_xo_gpll0_gpll4_map[] = {
+	{ P_XO, 0 },
+	{ P_GPLL0, 1 },
+	{ P_GPLL4, 5 }
+};
+
+static const char * const gcc_xo_gpll0_gpll4[] = {
+	"xo",
+	"gpll0_vote",
+	"gpll4_vote",
+};
+
 static struct clk_rcg2 config_noc_clk_src = {
 	.cmd_rcgr = 0x0150,
 	.hid_width = 5,
@@ -144,33 +171,6 @@ static struct clk_regmap gpll1_vote = {
 	},
 };
 
-static struct clk_pll gpll4 = {
-	.l_reg = 0x1dc4,
-	.m_reg = 0x1dc8,
-	.n_reg = 0x1dcc,
-	.config_reg = 0x1dd4,
-	.mode_reg = 0x1dc0,
-	.status_reg = 0x1ddc,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll4",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll4_vote = {
-	.enable_reg = 0x1480,
-	.enable_mask = BIT(4),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll4_vote",
-		.parent_names = (const char *[]){ "gpll4" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_usb30_master_clk[] = {
 	F(125000000, P_GPLL0, 1, 5, 24),
 	{ }
-- 
2.35.1

