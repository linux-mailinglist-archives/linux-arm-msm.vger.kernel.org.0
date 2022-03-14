Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 780754D8178
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Mar 2022 12:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239605AbiCNLpF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Mar 2022 07:45:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240496AbiCNLoA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Mar 2022 07:44:00 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C0D1A6
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 04:42:50 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id h11so21439946ljb.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 04:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qq9dTW6gbLY/ve5ehTRpDEnNxOPOXDUjIljMGUur/vM=;
        b=JDYM2WmmHXGLb5VWToLUskc15H+29Tu+HtUvqkKnXKsRP2OTKfjVDK0+xnXhuS7Wc3
         i0NjWGG4aObhW1zNlwWdHf3qGs4APnyWwIT9bb/GF2UBd70EDlZ9VtN3u6gbnITGGT41
         vmUL9JuV0c1mEIjQI3d3NCIoRh9hkwgBa9WkIdjQza/bihuHKiBMti051Jl0yjhAvo6x
         mRTuaa6rqwLsmGpyMkon1Z8bsx9IhSvODQJLW/ZOw95T+OjY68Adpbyg+XQptFIknprE
         r2S8ivOj9mzz7Qb2jAHO0lkAHS9SYXjIVRk27E5LgL45t/u9XmpMj4Aj84QsOor7U89v
         6n/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qq9dTW6gbLY/ve5ehTRpDEnNxOPOXDUjIljMGUur/vM=;
        b=jIQiJATFBtRsoHz8xE1HMmdoEhX/PGdJ6V/jYJb3/GgbrZ/GQVWDiq6Lv1lau+axIi
         +nVcVG0RyWzxCTgwgGy3vgtetLrqAQuHcpRnSj01Oj8cX7kXQPbgn9H59RytGyqQ7I6e
         ykcQHv6WH47bq6Midd4woBHZo5n+5Vc4sbplGqnlgsYDtxvoj4H22pw9vtkYI8hOJfE/
         HfSkJwH/h0FaNi31PjyFMoUZLiePpPBcw2o/NMhvM2UIpQ2sxu3ciKG/ua3V5wED5bJ2
         Ra/Lf6xYiL7d8tULY3EHaUbhfMUSqGoQPal2HJCVZaHt3lOnSI0ENdgsVPfiCM+FVN/T
         QfLQ==
X-Gm-Message-State: AOAM533uhgqyMG/9CKoocb7YuPefMESKQ3hCWhTAR4sx7YxRYVTp66ay
        E9pGVIoLKp03J5kQlzyf3njZmh7MFeGQMUb0Ky4=
X-Google-Smtp-Source: ABdhPJxAYLeEwbvD+chVwWk4vypPLS9H42TX2q+iWyvPdYlgVj/+Ic0xiSmN+mdUjCBf4MTgpdcpKQ==
X-Received: by 2002:a2e:b706:0:b0:247:ff35:cfd7 with SMTP id j6-20020a2eb706000000b00247ff35cfd7mr13652799ljo.510.1647258169349;
        Mon, 14 Mar 2022 04:42:49 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id g27-20020a19e05b000000b004485c877230sm2840850lfj.235.2022.03.14.04.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:42:49 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Mon, 14 Mar 2022 13:42:48 +0200
Message-Id: <20220314114248.1636620-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
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

