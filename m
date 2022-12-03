Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36E52641848
	for <lists+linux-arm-msm@lfdr.de>; Sat,  3 Dec 2022 18:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbiLCR61 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 3 Dec 2022 12:58:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbiLCR6V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 3 Dec 2022 12:58:21 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21A4E12759
        for <linux-arm-msm@vger.kernel.org>; Sat,  3 Dec 2022 09:58:20 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j4so12274552lfk.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Dec 2022 09:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85Qk/zAs4un057kYtjXPCiBj9tHraJ+hn3Pxtnl3NMY=;
        b=JKKNXw5pLfggxjIshXkBCp0yqLcEWPPnnRbOvcJppy3TesIqXQDH0TSG7HhXIToVdi
         go5+Jjq/Q2Up3EwNb2p2NfMH3uoSlXlamp2QZG+Rbs4vzTshOz7SQaPS3zgmdKXakJ+a
         cwpni9qADIZ9HCeG6r9lfEtYe3Sc0Unkecj54qJjhbYmR7bAvOESddLvm/G5DIR9P3lh
         l/QfSzqwkEmfNNSrvkj71cgGE1RZoPaBLqejfLtGbN0hYVVQT6jfgqCZdaj9LI/YMvoM
         L8NCTo390oLf285vWmcsvSKz0a5v2dGT7NyBwq0EOwOVDHZh6eqftE8pcRHR+TcNWPd1
         oiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85Qk/zAs4un057kYtjXPCiBj9tHraJ+hn3Pxtnl3NMY=;
        b=X4TF6q5pUxevvT7ykf4m6vFqBFdvArpQQC50pnG9gq4Ukp7ePoCwlQv6iENslhiry9
         FJTBbtqsKFEjmfjXX7pIhf7fYcBUY9VLLNWTOZpOUb9Axcc5IvIw12wt9Ir/+qMzeiXq
         AA0pNI+Db0WCy/xuQ/PoiWn5PunRhcB7Yr04LzPOJy0yWyw7IcsnA8KKoxC0eRwKk+iP
         1nyogXxwZp2/pHXyRZZVipQhyOZpFiwUb5vKh+Ks0UA5WKQNzqCDeUttodzS+VHPiOyn
         pkGbdNiCfC9P1ZfbiVxJpM1iEZdh3Ez5UAmoBVrIhrk/BlpOdpA+d5qZXLwL6y8NXq59
         UECg==
X-Gm-Message-State: ANoB5pmHTV99eO4Y5OQ99FhGPEgaY44Cma1tVbNXqujppZ5U1oQjiGGt
        aKueprYN4Rc1XBOzL9khj8HuFQ==
X-Google-Smtp-Source: AA0mqf7H134xzKeCAX5nC7NhKdoSMpCCUbptc/Ns0mEZUe71d6ooUFxaC9+4KFEqoMIZPujxuBOgsw==
X-Received: by 2002:a19:3853:0:b0:4a2:3955:109a with SMTP id d19-20020a193853000000b004a23955109amr29183820lfj.73.1670090298437;
        Sat, 03 Dec 2022 09:58:18 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id m4-20020a056512358400b004b19f766b07sm1124703lfr.91.2022.12.03.09.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 09:58:18 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 10/16] clk: qcom: smd-rpm: rename some msm8974 active-only clocks
Date:   Sat,  3 Dec 2022 19:58:02 +0200
Message-Id: <20221203175808.859067-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
References: <20221203175808.859067-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Rename msm8974_diff_a_clk, msm8974_div_a_clk1 and msm8974_div_a_clk2 to
move the _a suffix to the end of the name. This follows the patter used
by other active-only clocks and thus makes it possible to simplify clock
definitions.
This changes the userspace-visible names for this clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 761a5b0b4b94..cb47d69889fb 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -474,9 +474,9 @@ DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a0, cxo_a0_a, 4, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a1, cxo_a1_a, 5, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8974, cxo_a2, cxo_a2_a, 6, 19200000);
 
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_a_clk, 7, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_a_clk1, 11, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_a_clk2, 12, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, diff_clk, diff_clk_a, 7, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk1, div_clk1_a, 11, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8974, div_clk2, div_clk2_a, 12, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
 
 static struct clk_smd_rpm *msm8909_clks[] = {
@@ -607,11 +607,11 @@ static struct clk_smd_rpm *msm8974_clks[] = {
 	[RPM_SMD_CXO_A2]		= &msm8974_cxo_a2,
 	[RPM_SMD_CXO_A2_A]		= &msm8974_cxo_a2_a,
 	[RPM_SMD_DIFF_CLK]		= &msm8974_diff_clk,
-	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_a_clk,
+	[RPM_SMD_DIFF_A_CLK]		= &msm8974_diff_clk_a,
 	[RPM_SMD_DIV_CLK1]		= &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1]		= &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
 	[RPM_SMD_CXO_D0_PIN]		= &msm8974_cxo_d0_pin,
 	[RPM_SMD_CXO_D0_A_PIN]		= &msm8974_cxo_d0_a_pin,
 	[RPM_SMD_CXO_D1_PIN]		= &msm8974_cxo_d1_pin,
@@ -653,7 +653,7 @@ static struct clk_smd_rpm *msm8976_clks[] = {
 	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
 	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 };
@@ -687,9 +687,9 @@ static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
 	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
@@ -745,9 +745,9 @@ static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
 	[RPM_SMD_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
@@ -813,9 +813,9 @@ static struct clk_smd_rpm *msm8996_clks[] = {
 	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
 	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
@@ -875,9 +875,9 @@ static struct clk_smd_rpm *msm8998_clks[] = {
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2] = &msm8974_div_clk2_a,
 	[RPM_SMD_DIV_CLK3] = &msm8992_div_clk3,
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
@@ -945,7 +945,7 @@ static struct clk_smd_rpm *sdm660_clks[] = {
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
-	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
+	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_clk1_a,
 	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
 	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
 	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
@@ -1013,7 +1013,7 @@ static struct clk_smd_rpm *msm8953_clks[] = {
 	[RPM_SMD_RF_CLK3]		= &qcs404_ln_bb_clk,
 	[RPM_SMD_RF_CLK3_A]		= &qcs404_ln_bb_clk_a,
 	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
-	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
+	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_clk2_a,
 	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
 	[RPM_SMD_BB_CLK1_A_PIN]		= &msm8916_bb_clk1_a_pin,
 	[RPM_SMD_BB_CLK2_PIN]		= &msm8916_bb_clk2_pin,
-- 
2.35.1

