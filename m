Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 793C05B267E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 21:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbiIHTKw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 15:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231953AbiIHTKu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 15:10:50 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851ABEC751
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 12:10:48 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id m15so9675758lfl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 12:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=En/eL17w8Q/uCNcnjjzqqx4odQyBNyedY5XKGx95FUo=;
        b=dgY1+rC2Ba91GJBjXFw4aHgM/NdbCURU412CbcicGe/szB3Wk6mHzb0QW5LuppPSLz
         P0GSyDJ4bRl3XbxkViR9oY9xzf7RikKzduNV9DUHXbqeQyJJN+AqiLl1e3rCQV5b7xuy
         7fdKvOJIjqjJ104FSJ6SzdFhRMyCUa6NaUCaspDIEmgxiR9STrGewCNDsc58nIbVEghD
         4K5gXwOsBgi9R9z2Bk92VwtzjBhgzKpQHtInehIQIaaEUqRCvIHbx8BzhsMcRtphdss5
         ZBktExEmFnBerumAzTGlBkKfJmqHFfO+/7CH/jcFHvFQLL0eHetjX6EXQi3VzTbqz/aF
         J7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=En/eL17w8Q/uCNcnjjzqqx4odQyBNyedY5XKGx95FUo=;
        b=ghFoenUljUTZK368/kKawm4xX/HCE0lIhhIPLlrut+9zgpIwGDYhZjF0rNfXygDBdH
         xqgDQAa9a1fzt4jatqjjPK/SialNEeTGIfMiyPpdbM4GXDBGYuwEiArSGeixXxJCDeN+
         bxOrG133sXz9g0LZ9lKmr+G0n+5LjEBxKKf/04pJ4LLTc/Y+7UZlfiIyQqQE7vAbHph0
         t4lWXfSnT011vFd2te+GdgOay6Lm2m/O8eZEPz2A/z/syVe4Napn3VQoaPPFhuZsZV/k
         SyuRKD9L3o/TqlI0+0Luy4nOeXd8Q0JXvDoWmxI3GmmW1tVoR7aFE+y5cFJ3CY9ppGhE
         CINQ==
X-Gm-Message-State: ACgBeo0wPIcKoiJV6q7HdKwHZj54JMCVx1Trv5JdgUx0BXXIYS7SqXOb
        LGuPoGcKgMp6MJO/YetfrG7x4A==
X-Google-Smtp-Source: AA6agR677TvfgOtRpfAIOZCm+ZDzx9vxFfn1qyeO8sNH3iYEbA+X+bttcmj6+qXELfXsGTNKw4hYXQ==
X-Received: by 2002:a19:5e4f:0:b0:497:aa47:86b8 with SMTP id z15-20020a195e4f000000b00497aa4786b8mr2483991lfi.261.1662664246888;
        Thu, 08 Sep 2022 12:10:46 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v17-20020a2e4811000000b0026ad316375esm634904lja.38.2022.09.08.12.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 12:10:46 -0700 (PDT)
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
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/4] clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
Date:   Thu,  8 Sep 2022 22:10:42 +0300
Message-Id: <20220908191044.3538823-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220908191044.3538823-1-dmitry.baryshkov@linaro.org>
References: <20220908191044.3538823-1-dmitry.baryshkov@linaro.org>
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

PLLs can be kept in standby (default configuration) or in off mode
when disabled during power collapse. Hence add support for pll
disable off mode for lucid evo PLL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 40 +++++++++++++++++++++++++++++---
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index b42684703fbb..9cc38234d45d 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2088,7 +2088,7 @@ static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
 	return ret;
 }
 
-static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
+static void _alpha_pll_lucid_evo_disable(struct clk_hw *hw, bool reset)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	struct regmap *regmap = pll->clkr.regmap;
@@ -2117,9 +2117,12 @@ static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
 
 	/* Place the PLL mode in STANDBY */
 	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	if (reset)
+		regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, 0);
 }
 
-static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
+static int _alpha_pll_lucid_evo_prepare(struct clk_hw *hw, bool reset)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	struct clk_hw *p;
@@ -2139,11 +2142,31 @@ static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
-	alpha_pll_lucid_evo_disable(hw);
+	_alpha_pll_lucid_evo_disable(hw, reset);
 
 	return 0;
 }
 
+static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
+{
+	_alpha_pll_lucid_evo_disable(hw, false);
+}
+
+static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
+{
+	return _alpha_pll_lucid_evo_prepare(hw, false);
+}
+
+static void alpha_pll_reset_lucid_evo_disable(struct clk_hw *hw)
+{
+	_alpha_pll_lucid_evo_disable(hw, true);
+}
+
+static int alpha_pll_reset_lucid_evo_prepare(struct clk_hw *hw)
+{
+	return _alpha_pll_lucid_evo_prepare(hw, true);
+}
+
 static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw,
 						     unsigned long parent_rate)
 {
@@ -2191,6 +2214,17 @@ const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_evo_ops);
 
+const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
+	.prepare = alpha_pll_reset_lucid_evo_prepare,
+	.enable = alpha_pll_lucid_evo_enable,
+	.disable = alpha_pll_reset_lucid_evo_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = alpha_pll_lucid_5lpe_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
+
 void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				  const struct alpha_pll_config *config)
 {
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 447efb82fe59..ea90a61bf774 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -155,6 +155,7 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
+extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 
-- 
2.35.1

