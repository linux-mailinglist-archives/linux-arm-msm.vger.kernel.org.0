Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88AA051F7E5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 May 2022 11:26:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237130AbiEIJQZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 May 2022 05:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237258AbiEIJF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 May 2022 05:05:59 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1023F83B1C
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 May 2022 02:01:54 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id v4so16183916ljd.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 May 2022 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kmq0qX5rZBrOn+EiEOWlsQTnWTwLO0dKtKwWNOTxB2s=;
        b=lH/Y9vYhEjrL6lgdO6hFTDFkoQ5bKDeTGEOd5ROxIB3I5FQRZ6Fi6NruZ3wdVpT4Z6
         ZXjsMSI7pAwOXdozwuNKXW1fVlXgO2odfutrfs363XO/O/e/8xnBkYgtK41RhoaTNqG5
         ReQ4VQMA4d3MsZ70T4EPA90qWBG+yy1svPxdTIoeUwjZb8+xBYalFG/i1A5eJPTAuaNe
         dFAIDcf7FkjjBkKTR9eG+LEwYjdhAePMYHe83+IcjjEwJaL2LGvg9Cg7IsC15wGuaWze
         BhUaim001FFUe4UkYkhzbs6K7uSp2W5Vk5+tO8a5hnoLK7oQmGvxjXt118dHbOjXv2ql
         2QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kmq0qX5rZBrOn+EiEOWlsQTnWTwLO0dKtKwWNOTxB2s=;
        b=SpBa4TwfZ6j90diSmfry8tKaoceFaymaupPI9Rsv3YJaFjT81nS4IJyRISsk45d0YU
         fbPNDyBxbT+IskNzOcoQ5eicdtxnTDd0iqxMzMPCudsI3O2ukbjYEYZmz5sqW53a0pcs
         o3YYmuAO9bb5jV8r7IdfTcRTAePrBH1H147QoD3j1/CTbbBaPNY/S+nW8ifxGlJQFzD6
         M/gAjpRELoLizMky4tJzFJlYGItmnDxV85GLg4Fr/kDH3NrhHhvkyPSANoqo7xrADRHU
         nhkUKIR6m6EyG/IJiBTWBhhQekdX7DJ3B32J8N2/DleOjCXwTp/lg2jx6qFcxOxqe6ZI
         Koxg==
X-Gm-Message-State: AOAM53338Qn2sVXNdro2Cp1PFKh11UQZhWD/znybwXrDnAX9lS/76AJu
        RRR6Yu2b5T2oNlrEUlQNEoIiWw==
X-Google-Smtp-Source: ABdhPJyXBaJaQe7Ppz6sFxeKtfyJxkJlRDvHlcLMC3lAiDKGPQVZPuR4UBoXsc7ndRpudlQOdYnbtg==
X-Received: by 2002:a2e:9949:0:b0:24f:140b:4319 with SMTP id r9-20020a2e9949000000b0024f140b4319mr10159843ljj.294.1652086910925;
        Mon, 09 May 2022 02:01:50 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id v13-20020a056512348d00b0047255d211ecsm1875785lfr.283.2022.05.09.02.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 02:01:50 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Mon,  9 May 2022 12:01:48 +0300
Message-Id: <20220509090148.4141020-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
References: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
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
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v3 to v5:
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

