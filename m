Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 296DE5598FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jun 2022 14:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231378AbiFXMAF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 24 Jun 2022 08:00:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbiFXMAE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 24 Jun 2022 08:00:04 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92ACF6F79A
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 05:00:03 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id z13so4010067lfj.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jun 2022 05:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plNiI3oDyZpIsvYGpGc4Tdhg6uL7UgysJCNMjlKgt1M=;
        b=IM2iMgjiXxWFNsgQw2qKPTv8ufgAdmFi6Ln+XfYcY764c30jwyZRgt0E8LVLNs22om
         5OxmJEgrQziwg5HkOnC8AGIeo7z82c5zGOvWAnaReeuFNNJdk9k9OWM9ygutwK7VV8bJ
         b3XvoPRssZwNHp59iGfytf/burTf7MFMHHqJkAf3xBpRZyCSiZBS1tZPN39trgcjYq25
         DLD3vnN86rLGFa7k4BMSZMf00GnmPiYQ8cn7e2i2Narv1GbE7Z9eJKKf99ionlXTtNQs
         xQlQny6qRkE1ucQlBkSKSy/xva5cWvXeDpTVjyRAgikdjtXuyxjAuhAdPDpLKXo80aqd
         NHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plNiI3oDyZpIsvYGpGc4Tdhg6uL7UgysJCNMjlKgt1M=;
        b=3zZZT0YLnxte1oy2eL08EE7DjbMFJTxw/rdQkX6+egspA7uLkmZxOmlIw+zoTixzdE
         fDqX9T4VW1Xqnc1XMLNJb5OHLFIfmdPS+qnfHY3KwFNr5BhBNyCkGZxapqVZ8hV0T+zC
         ACvPFaaQFtL1unGGmCywTPQOjWtNst+xnduEw8E29/XPny/ZvV5rCY3bI2ff4u/PJONb
         ZIhioRr9SN4ogSKhLeIyI9pA/kD25fytbe41bLTip4wYXc9GQe2UFasQUftRdBiwrmOG
         Th4c8kCWh13usUywp41x9QoNyR3hO2Wlx2sD+z94tjQ7+8MoloXsf5Yu0TrcAwhYLBLq
         fz9w==
X-Gm-Message-State: AJIora8Hf1n3F/++YGtnMnDqObBWTCIJK2gSGalT8tAVnToe7Uye1KSl
        yr44qr+tu4ux/wiUL6ZatahlMw==
X-Google-Smtp-Source: AGRyM1sFd/enWUXANLahy73Rdv94cXBJRg70QBVoRtxrTpKLIC2gfQGiLkyRItqB37Nn1s6E4eCtQw==
X-Received: by 2002:a05:6512:22c1:b0:479:54b6:8281 with SMTP id g1-20020a05651222c100b0047954b68281mr8925063lfu.291.1656072003143;
        Fri, 24 Jun 2022 05:00:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025a67779931sm262869ljc.57.2022.06.24.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 05:00:02 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v8 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Fri, 24 Jun 2022 14:59:59 +0300
Message-Id: <20220624115959.2524911-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
References: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
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

Unify all exported PLL clock configuration functions and data structures
as GPL symbols.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v7 to v8:
* added Stephen's tag.

Changes from v3 to v7:
* none.

Changes from v2 to v3:
* added Bjorn's reviewed-by tag

 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 288692f0ea39..47879ee5a677 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1823,7 +1823,7 @@ const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = alpha_pll_lucid_5lpe_set_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_lucid_5lpe_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_5lpe_ops);
 
 const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
 	.enable = alpha_pll_lucid_5lpe_enable,
@@ -1832,14 +1832,14 @@ const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
 	.recalc_rate = clk_trion_pll_recalc_rate,
 	.round_rate = clk_alpha_pll_round_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_fixed_lucid_5lpe_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_5lpe_ops);
 
 const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
 	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
 	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
 
 void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
@@ -1992,7 +1992,7 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_zonda_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 
 static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
 {
-- 
2.33.0

