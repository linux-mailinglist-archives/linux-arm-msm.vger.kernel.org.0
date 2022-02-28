Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFF04C6B97
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Feb 2022 13:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236118AbiB1MEX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 28 Feb 2022 07:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236101AbiB1MEW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 28 Feb 2022 07:04:22 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DBB1CB0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:03:40 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j7so20935050lfu.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Feb 2022 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qq9dTW6gbLY/ve5ehTRpDEnNxOPOXDUjIljMGUur/vM=;
        b=aN/fbfvJYkMaQ6JZsaQplTCNBbqYo/36NQ1agdTDibMAY9McVKtjS4P2feFAtBg6ko
         o2+1FTh/60giuzyFw+f7pr6/XVul/fmtHyOb+dh39T6cVetTqx/vV/eh833MLGU26EIj
         yZMyCYb/gW88BpWIqjHKWn3ZkCfAlcvNt6VaaJT6rajeJjN1lWQtRBtiyiMMcCscYClW
         it313JJX/COllsAesyCOwpZO5fRVvsIHrQzCCCK1sYFjaPcC1hMjX4EOdhmHTD1bIM9t
         tASbS3tOWTqYh0+7+ZG9BYjywO+2GEgvMJ/xeXlVLIF86ouxWpG1pMMDKiIkl8lLdKNW
         kgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qq9dTW6gbLY/ve5ehTRpDEnNxOPOXDUjIljMGUur/vM=;
        b=QWoVSCnOK1nKp+stiYRbkmmj2zcdmnC5YzzKGmuj3ue+/K9X+LpqL5Q6Nft+H549m7
         DwD+++JOf9rv2S2a76ptibUxyV1+aw0Jnv3RKqPUaSIbP56lSsZYIu9CCH0oxIFa+uci
         +MY1ZtGLJzlaGCIwWbfR22XDYeQOnGLKINR5RvIHcdHRmn7wS+GfRz/ZIbr45rfMq3PB
         i77Pk1rqfwj1zh6wqPjT3KelOiGNeTCYRK89Y1FfBvzc/wO4vVdDFLnXyIaoA+NNYv+K
         7MuU9EvwWicwMB/uG5HWMk5WnjOJCrs4AQ22Z5SyzZlMx2+jwT4KAF1XWU9LWT3wQ5sT
         wddQ==
X-Gm-Message-State: AOAM530Kj8Ffb5TqN1zdLdPnRraGzOEFhnsAw2trkqDmIXCJdi7X7/7O
        E4ngn+9kzHDzb05lSXT7qtn+gg==
X-Google-Smtp-Source: ABdhPJzDzsXT3v6dRlixV+zSbvGbPhlqakW8MzcoPsYwLdv+t1kIvHsN654An7b6c+N1KHIuvxBz4w==
X-Received: by 2002:ac2:5963:0:b0:442:eff6:4219 with SMTP id h3-20020ac25963000000b00442eff64219mr12520251lfp.56.1646049818978;
        Mon, 28 Feb 2022 04:03:38 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b004433c8459a6sm928146lfe.157.2022.02.28.04.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:03:38 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 4/8] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Mon, 28 Feb 2022 14:03:37 +0200
Message-Id: <20220228120337.997079-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
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

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
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

