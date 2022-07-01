Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADF69562B90
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Jul 2022 08:27:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234680AbiGAG1e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 1 Jul 2022 02:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbiGAG1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 1 Jul 2022 02:27:32 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F25014551B
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 23:27:30 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id t25so2151578lfg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jun 2022 23:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JhGL47TiZg+EogNLmI0i062TaYjrylto5C4CjjElA2c=;
        b=qXkbn4vEUd3AdFUJvFtcJprBcSqDTXksFOo+2V6XLspY6kD/sBbNbj0qsHYE8qjfxf
         KZjWStEctfhaLiDecmaJJutGDs+QKUTJaqruVkqeojrm3nJ5XyUgQZ9yPOYd/L0tTEwL
         YNcF0Gl14ubT5Me6P2sGagPsxT9qSfMw9VYOLjCQIL6q5PK9bgTZcZFGxVCt3WFzOwSi
         kMKE3FCk/f/1xWx8Ied94L85QwSpfy1z9zNKYhKf36hSEmTysMRFHbYElox6w/BCJe/r
         G7HUf7PTmqRQU0WgIlqtDWAhfPttfnMNgxZqQA8LIGikYLLI5MFdtPzmp0IRwEsqt0w+
         jLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JhGL47TiZg+EogNLmI0i062TaYjrylto5C4CjjElA2c=;
        b=OqyN2Ckd6OIEzDB3GttkTj3TUuWxlVOWBVP1C+qSsvAH9lFf1U6G0Fv7KfacW09x2j
         EB0HTvBKvCOyaeS6R9DUQM29YVWUnZfswJeboCgCuem4uZRYYFUbNFvLro3zYdleVB0B
         OpYSQUGUKorPOwmFodj42oJ1SMFk3lV39HCm3SOAmEgLPimSnx+5uU2JmyzU3TpEhiDg
         DcJYbmjbdThadYKuvTGyn8x9Dz5O2ImgkaOPwRJr0CTvhSeDABPDoyss1gDxMbLgKf3Y
         Mlat8IkYaHA6ZYr0lm9WE24ddEGhCFIPL+W8AEGzOUugPIG0Zc3X0ucejy2iNxikFKvQ
         Xhhg==
X-Gm-Message-State: AJIora+qRZDy+YqBSWNW/8/K0dNIfgDeJO4DDUVTp1js+3fke/Ac4otE
        kpg8hC7RoKO6N0/XpYwTK524PA==
X-Google-Smtp-Source: AGRyM1sSR/ZM8+14vgRUj6RmZeVuifkekLxI1sfqLKwGmFWO9s3aWWs6ctY1gH59kenVu2sxapM9AA==
X-Received: by 2002:a05:6512:1050:b0:481:d58:c1c4 with SMTP id c16-20020a056512105000b004810d58c1c4mr8416645lfb.518.1656656849331;
        Thu, 30 Jun 2022 23:27:29 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id e18-20020ac25472000000b0047fa941066bsm3466694lfn.96.2022.06.30.23.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 23:27:28 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v10 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Fri,  1 Jul 2022 09:27:20 +0300
Message-Id: <20220701062720.2757874-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
References: <20220701062622.2757831-1-vladimir.zapolskiy@linaro.org>
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
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes	from v9 to v10:
* added reviewed tag by Vinod.

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

