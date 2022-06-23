Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EC15579D8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jun 2022 14:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231583AbiFWMEi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jun 2022 08:04:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231614AbiFWMEf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jun 2022 08:04:35 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CEC4969A
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:28 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id e4so23053761ljl.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jun 2022 05:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wgNRajidUBsVnzZirjYFoTrI0Y1nfrcAjaj1yhGj2t8=;
        b=nrj9LZK6VwCvN0CaZ3KFeqCp+CTwx6BDSq/wzPzbuEWB84C7jHzpUbfDZCGPGYSdWs
         k0bX1CSJltLl8I6yJ9y7bSaujXGc4FJEOUEg4f31adfNBtYHb4drjZgXFhFyHpGVSHGz
         ar158o+Vm7EqNoO+CHSHzIVatUTceXMjSxJw+fP9s/FnqUM6TUWGwnsIYZVTCD6EizMK
         veniAJMJOTPTP19x+qUtEuMfCTzICmHYsGqsyCP4Y2swEy5G+bx6xrNVHYUb0ynHqgLy
         qHpLK9lMNHSowsc3hanL2HZaA3aCa7ufzqP2AfB++tadksgzRiqE6aM/YdAlZBIG/zHS
         t55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wgNRajidUBsVnzZirjYFoTrI0Y1nfrcAjaj1yhGj2t8=;
        b=wkDfswzlxi+/vg4uUh2sViJmcKjXlPgWBZJGRShmeu4wn3c9gPVd2t4mJTyETlo+iv
         mb3IBsN895mKCpYm9t3/cSOMVddTPthZWi2QX90QayOV2F8WGOVT8qOVa8bCMZio+wJh
         2QjuchpjiQXzPiTutYskg27qPVDaPYNEVXz0xDszVxRKX0CjIyb0XQ1GvaYljRsXBFAF
         1sIxZZS01zVOACJaKnZGOZoCdvRH5SZwAtqqsB1Gt0IjZwfwXdQpd0U9oNzQg9xT60qa
         ty6+88cgOovTM4GRk/BUyiRh2ETiTPO2asRHHdxvO0BJgYSJ266hBEksh0nlPA+mBJWi
         wd7w==
X-Gm-Message-State: AJIora8Hyo4wdOpQ8pmp0+z0ponErQI2q+0S+EI7aFZzvm2zSgHiiX4P
        6BvtuAY2IvFS6XKlUnWZQTWEfA==
X-Google-Smtp-Source: AGRyM1tkX9ODmrhCNqyy3YTz8DKNqpMcK/+d/JgqX2aBn7ledReT+up+NSfvqEZ2bJEhrUFZvd5nJw==
X-Received: by 2002:a05:651c:229:b0:25a:8352:cef1 with SMTP id z9-20020a05651c022900b0025a8352cef1mr4577910ljn.291.1655985865778;
        Thu, 23 Jun 2022 05:04:25 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id 18-20020ac25f52000000b0047f6b4a53cdsm1799888lfz.172.2022.06.23.05.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 05:04:25 -0700 (PDT)
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
Subject: [PATCH 08/15] clk: qcom: mmcc-msm8960: move clock parent tables down
Date:   Thu, 23 Jun 2022 15:04:11 +0300
Message-Id: <20220623120418.250589-9-dmitry.baryshkov@linaro.org>
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

Move clock parent tables down, after the PLL declrataions, so that we
can use pll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-msm8960.c | 92 ++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-msm8960.c b/drivers/clk/qcom/mmcc-msm8960.c
index d5c989a71e13..0cab41da80ff 100644
--- a/drivers/clk/qcom/mmcc-msm8960.c
+++ b/drivers/clk/qcom/mmcc-msm8960.c
@@ -41,6 +41,52 @@ enum {
 
 #define F_MN(f, s, _m, _n) { .freq = f, .src = s, .m = _m, .n = _n }
 
+static struct clk_pll pll2 = {
+	.l_reg = 0x320,
+	.m_reg = 0x324,
+	.n_reg = 0x328,
+	.config_reg = 0x32c,
+	.mode_reg = 0x31c,
+	.status_reg = 0x334,
+	.status_bit = 16,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pll2",
+		.parent_names = (const char *[]){ "pxo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_pll pll15 = {
+	.l_reg = 0x33c,
+	.m_reg = 0x340,
+	.n_reg = 0x344,
+	.config_reg = 0x348,
+	.mode_reg = 0x338,
+	.status_reg = 0x350,
+	.status_bit = 16,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "pll15",
+		.parent_names = (const char *[]){ "pxo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static const struct pll_config pll15_config = {
+	.l = 33,
+	.m = 1,
+	.n = 3,
+	.vco_val = 0x2 << 16,
+	.vco_mask = 0x3 << 16,
+	.pre_div_val = 0x0,
+	.pre_div_mask = BIT(19),
+	.post_div_val = 0x0,
+	.post_div_mask = 0x3 << 20,
+	.mn_ena_mask = BIT(22),
+	.main_output_mask = BIT(23),
+};
+
 static const struct parent_map mmcc_pxo_pll8_pll2_map[] = {
 	{ P_PXO, 0 },
 	{ P_PLL8, 2 },
@@ -105,52 +151,6 @@ static const char * const mmcc_pxo_dsi1_dsi2_byte[] = {
 	"dsi2pllbyte",
 };
 
-static struct clk_pll pll2 = {
-	.l_reg = 0x320,
-	.m_reg = 0x324,
-	.n_reg = 0x328,
-	.config_reg = 0x32c,
-	.mode_reg = 0x31c,
-	.status_reg = 0x334,
-	.status_bit = 16,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "pll2",
-		.parent_names = (const char *[]){ "pxo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_pll pll15 = {
-	.l_reg = 0x33c,
-	.m_reg = 0x340,
-	.n_reg = 0x344,
-	.config_reg = 0x348,
-	.mode_reg = 0x338,
-	.status_reg = 0x350,
-	.status_bit = 16,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "pll15",
-		.parent_names = (const char *[]){ "pxo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static const struct pll_config pll15_config = {
-	.l = 33,
-	.m = 1,
-	.n = 3,
-	.vco_val = 0x2 << 16,
-	.vco_mask = 0x3 << 16,
-	.pre_div_val = 0x0,
-	.pre_div_mask = BIT(19),
-	.post_div_val = 0x0,
-	.post_div_mask = 0x3 << 20,
-	.mn_ena_mask = BIT(22),
-	.main_output_mask = BIT(23),
-};
-
 static struct freq_tbl clk_tbl_cam[] = {
 	{   6000000, P_PLL8, 4, 1, 16 },
 	{   8000000, P_PLL8, 4, 1, 12 },
-- 
2.35.1

