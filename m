Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81EA05464B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jun 2022 12:54:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348798AbiFJKya (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jun 2022 06:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349299AbiFJKx2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jun 2022 06:53:28 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CF12EE12D
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 03:49:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a15so42195223lfb.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jun 2022 03:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yMD52w9Oyrl8ZgTo1iPw5qIiXMueLXQiGcqyg24szcc=;
        b=bxSpDWQP+43HxqimOfL4GUMckma6t9vZBEtJX7gM6l60Vt586/lA6/j+JfNzYLb2+Y
         wd1e7E/bnY4UEgnYMwZLiY4BUhsAnR6Ys04VBJNZS4xNdKbcz6CNUKuqjNi0+VWrJmWs
         7FUGrzBCi5+Oo2d64+bgkE6xeeJiITV12qTWvsl1kRbuWcTiovzJQiDmughDiGrYxHrj
         8FPL8egKpeGW8kTeqxSqaK21GubOC3YgimPr9jvhOLuNXcAbQAy3ueWAvTz41XQHkOrt
         RCYKFjWqKDa96M47HeFXI763L4JFsaE9BE5JZ+kcRamcwUTXAPRMz+YhOCpUYrKq6auS
         l1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yMD52w9Oyrl8ZgTo1iPw5qIiXMueLXQiGcqyg24szcc=;
        b=mXiqo5zi7Jjeub0gUNpUMXbvYLoz1Ty56dKBYucD7kJPcBMgxgcJLO5HXv/q7bWqix
         pK8km6f5l8QRXm4BsSNbckYr16vFZKB5Lmxip9WglLhbild0TQ46EohSf8X6dBE8NNXE
         fDxvemMPHmH2ihtysovjV97K5k7rhVfC6bfPtYlYF10ujMEwogOswsNifZ++eNLPJnw3
         vuibpTL1H5BSX4kprDoBt8Uv1sMcEqHjlNeO+oJuStsZICFUkxR6+M1oAXPY6P0I2aBD
         xA7uFKWxBz+rxGOxkBw6p1eIQk7TjeB0yXjDz6s8kMEERUB54gGyANmlhZSuFhfnejeL
         QP6g==
X-Gm-Message-State: AOAM5305a/LoBl18fNdWrqwemKJCfctDLRH8IjcBug41EyghCyg4byNZ
        5s0Y3qlUF74glR2KfqunG3NGVQ==
X-Google-Smtp-Source: ABdhPJy73QIU/YG/PaZCzuBqCTJe/THnd8WOMsOtUi2T6aTVd+AR3I/MTIVt5Y3jUjyK6O/71TTacg==
X-Received: by 2002:a05:6512:398e:b0:47d:aa13:3925 with SMTP id j14-20020a056512398e00b0047daa133925mr2857261lfu.81.1654858191541;
        Fri, 10 Jun 2022 03:49:51 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id k19-20020ac24f13000000b00477b9b1766dsm4687085lfr.13.2022.06.10.03.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jun 2022 03:49:51 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v7 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Fri, 10 Jun 2022 13:49:50 +0300
Message-Id: <20220610104950.2296514-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
References: <20220610104911.2296472-1-vladimir.zapolskiy@linaro.org>
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

Unify all exported PLL clock configuration functions and data structures
as GPL symbols.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
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

