Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 29A695614C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jun 2022 10:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233484AbiF3IUX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jun 2022 04:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233024AbiF3IUA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jun 2022 04:20:00 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE14319020
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 01:18:26 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a11so22075512ljb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 01:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ooMsAxxCH/hbBLEuWr4m0HgpjiSoPlP+w2mHKiMJv4Y=;
        b=w6QOx6BodDB7x1gqhb+KO9tGfJ3Nomq0u6QMUl/J+SbszxNx4dkJc7dgbiaqIFrUBj
         JLziUZwMV6rCP2fhbkdf0vyMh840Nh44v5V/v/cMqN8CVfuZqODYbQjp8gZT+5Wfoz4U
         N6hpzROQfh3UnC+OftKpvfdllTb6yEqQVUpaOFly56Q2SuCBYb/u9eIErZAnmI3+omxE
         NySuOqTAzkAGFZUfY+DfOgeBVx4NnkZvzDMR8zwTiNjuIRhNg0cocLMFBnQTCTvbP14E
         J0kSIEjyumJOMa9dHz0Y3ZPbP5my6TE8OH4Eg1dRvisMqShId13sFIeUUDGH6f9Zlg1h
         4yJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ooMsAxxCH/hbBLEuWr4m0HgpjiSoPlP+w2mHKiMJv4Y=;
        b=0tYU5/YNFdgzLcDeFJKl9KT0bBrqjvNqo0XzCQmLV5ulWacLFRfdl0R1Vtiseo2CzJ
         Q/GbM1PPFaWfDWYQcSGAYtV8zoL7PaVlKxEIIyecDZWYiUPvaztTQXZxlNXEYHuiUhzE
         C2o5D4nOLsRmbRmJFALwXeV3R0X79vp4VobPtRXDP1ii1DzJ/JeGfgkpqZ0hBbAe4vo5
         fHdFoh9WOoZ06KOjZafx9Wq1vPTdXrsf8XK55ZpF/SJqdhNU5j51Kog8TQCnY0nefOVb
         gckyFxKcoNCOTBHVzanpLKl8NSO8LPg2IqmOcnu5TwE0v/HWP6oJI+K1bGtjeriWKELh
         9tpg==
X-Gm-Message-State: AJIora+ZUTsSwxJtxIDtlrDC0ENzKGjMM09x34gT5AtBfQ14anhdrQpP
        Z0huetRQIkitt7f1SFl27vt6Ag==
X-Google-Smtp-Source: AGRyM1twDa58+hVPBo/QugAMysYnMlnbtzaBAn4A5Op7UeMrdPsE76+AHD45tMz0O+YerN2MWAgcmw==
X-Received: by 2002:a2e:8558:0:b0:25a:742f:d7 with SMTP id u24-20020a2e8558000000b0025a742f00d7mr4225469ljj.178.1656577105091;
        Thu, 30 Jun 2022 01:18:25 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id i11-20020ac25b4b000000b0047f705e37aasm2970412lfp.65.2022.06.30.01.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:18:24 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v9 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Thu, 30 Jun 2022 11:18:21 +0300
Message-Id: <20220630081821.2554050-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
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

Unify all exported PLL clock configuration functions and data structures
as GPL symbols.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v8 to v9:
* none.

Changes from v7 to v8:
* added Stephen's tag.

Changes from v3 to v7:
* none.

Changes from v2 to v3:
* added Bjorn's reviewed-by tag

Changes from v1 to v2:
* none.

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

