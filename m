Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 564355B2947
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Sep 2022 00:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiIHW25 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 18:28:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbiIHW24 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 18:28:56 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3FDEF343C
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 15:28:54 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id s15so21699391ljp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 15:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=En/eL17w8Q/uCNcnjjzqqx4odQyBNyedY5XKGx95FUo=;
        b=hz5GskQjLm/GyiSHYzLGdBHtf9q/KGB1xe75sD0SldaMqac3bjn4CEzPHSQYYyCPBy
         IpnG8ccapIfrox4VAT7xgoXSjNbB+oNeC6X53MlZMB6ppZF2RbDt9jQvmeHmjFYhpOUs
         MQsrJX7ff8u2ZUeunc27kgq+vr0633F5WTtppeIv+dJS9ROQSbXY8cSXOWuZAV8Inr4n
         QIU45ltLWFh8pG++yWAXx3pD7vN9DUOaDsQDAghL2OFJ9RthA6zDAbJMz1aKOES0mao3
         Jn7oVHeb6tqFJ3BpbnCejkpqLLrfp6o4JGDrNSPkHI7Thn0AIbMQyYPErC99M+5FsaIV
         vFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=En/eL17w8Q/uCNcnjjzqqx4odQyBNyedY5XKGx95FUo=;
        b=1e9jAj1pvY2Gf5R+wJOdA+6IoufIW6k+AJznyzHgjygtBihMtyyEli1Bfag2cqCH//
         22sAkbhqIf70HoYjsBVELbI3U/9AGPB4d/FT7JffU98hmJgwwLXFAgiy542szLxtyEHR
         xp91hTMadtx0kt2T+smuTZ/vQpKu2WtAeVAuH6Lv8jEsVEf0hxYTaTq40Qt//BAxgFHg
         e+GnkWfBFqWVZbUNqtnnhIeeHYpX7ZAkBt/ltmE4cSfxsxoHQp8tYac/9t0+R9kGL7xF
         QToPAgeDVUVd5IL6iTXXRRakFJQDY+i6vtgIazQFTtX8blTjZr94uHQAPryF86+qhS8h
         ZGSA==
X-Gm-Message-State: ACgBeo0YiAH6qtKiqHqKtAcysinCW6S3s4jgPVsoGpueNV22Pnv2XvEY
        eTeOyFzWoELKycHi7PVhj2RKug==
X-Google-Smtp-Source: AA6agR4Xwz3yqrA/X+LCyqYtb1p9nxG29mcnXMqt0O5YTfFG7HQGCcpz64+w6sjIWQ8RQIm1AFei6g==
X-Received: by 2002:a2e:1f01:0:b0:25f:ea3a:4ef0 with SMTP id f1-20020a2e1f01000000b0025fea3a4ef0mr2982511ljf.330.1662676132877;
        Thu, 08 Sep 2022 15:28:52 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a25-20020ac25e79000000b00497a3e11608sm1389078lfr.303.2022.09.08.15.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 15:28:52 -0700 (PDT)
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
Subject: [PATCH v3 2/4] clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
Date:   Fri,  9 Sep 2022 01:28:48 +0300
Message-Id: <20220908222850.3552050-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
References: <20220908222850.3552050-1-dmitry.baryshkov@linaro.org>
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

