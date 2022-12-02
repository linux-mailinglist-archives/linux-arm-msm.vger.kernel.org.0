Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCE9F640E1B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 19:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234454AbiLBS73 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 13:59:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234458AbiLBS6v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 13:58:51 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2010C9D2CC
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 10:58:50 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id a19so6429964ljk.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 10:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gbEeSo2EZGz4vc7maMv+pIoXI7Kpm8ZdolHilkLFeOo=;
        b=nVz3b8b1Dp1K2JfeW8ZUepJx6xPejV7FOs+rsXAaiFRlJR6IF4WMFcHwK8use6Ti4u
         EZUtYM88h8l1bnQwHLiszd944H52huf9diLTtxI0zCwfRrFfl4x1ab1QiIzsiv70PaG7
         /DL63LTDTZpr7kVayUwMFbzkW0IOMuNWaDFyHEBdNKKMtg5xmEvUmjH+z6gLSnI98Jhf
         xDOIMJKBHWK5xf+lEJZ67ycqBemRXCIlRU55wzRfu8c38Ky2Cp0GZO4savsOmUO76xIP
         TIUmshss9KMIu0ig+yKffWQm/7VbKzJaMU9nhPEj3WCghC9/VoIvUotvbSc8+o6e+Hpp
         MGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbEeSo2EZGz4vc7maMv+pIoXI7Kpm8ZdolHilkLFeOo=;
        b=Fx4ziELfrDMNMDGv14VVRHhccO0H8C93lZXeeIT55NaRVS2++bONMwyvGAO8jqk4iK
         vKh1kuZ7x1kuZw2gWFMm/HJLnvwvcVFT7vkKQz6Ook8hPIFg71+OrGIRBF1KnPyj1pcy
         6V9tvU2h7jYAcfhm8alIJtyUi/o03rsDPqgbiTS/lHcflFTD4hQZWI2dsPsjhmHFaFz9
         4GAKv8Lhlg626FIZO0AnMIj03rQV3YeAizHgvtC1vaPOg2jtvGXtI5qOUhJ+8aLqrX6R
         PVAe2ffW2oOQDHR7d4zgxAjLjSaiqWlvnXKX8SOGCp5XnroKlJU69XPRf/7asez8pfV+
         OX7w==
X-Gm-Message-State: ANoB5plNo0R7IiROq/LrGKXImnZVpjVuaJ8WOpNKheZxinvGJzFFjZuo
        mnSnQnmhNOfclXmOWW7X//eCCg==
X-Google-Smtp-Source: AA0mqf5gd+jsIj6e2/xQP4+zPREq3GDGmo8+KtUjn5jIM6FIZyY6lUCE/7YDoAkCoTszuybW1PcPlA==
X-Received: by 2002:a05:651c:1796:b0:26c:3ec4:b71e with SMTP id bn22-20020a05651c179600b0026c3ec4b71emr24431688ljb.193.1670007528491;
        Fri, 02 Dec 2022 10:58:48 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004b4a0482a53sm546529lfr.231.2022.12.02.10.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:58:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v3 6/8] clk: qcom: rpmh: rename ARC clock data
Date:   Fri,  2 Dec 2022 20:58:41 +0200
Message-Id: <20221202185843.721673-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

RPMH ARC clocks are frequently shared between several platfoms. It makes
little sense to encode the SoC name into the clock name, if the same
clock is used for other SoCs.

Rework the ARC clock defintions to remove the SoC name. Keep the
userspace-visible clock name, but encode the divider into the variable
name. This also makes it obvious which divider is used by the platform,
making the code less error-prone.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 62 ++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 34099bb6b899..439cace44bd1 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -112,7 +112,7 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 	}
 
 #define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
-	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
+	__DEFINE_CLK_RPMH(_platform, _name, _name##_##div##_div, _res_name, \
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
 #define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
@@ -375,8 +375,8 @@ DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
 static struct clk_hw *sdm845_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -397,8 +397,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
 };
 
 static struct clk_hw *sdm670_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -417,8 +417,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 };
 
 static struct clk_hw *sdx55_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
 	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
 	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
 	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
@@ -433,8 +433,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
 };
 
 static struct clk_hw *sm8150_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -453,8 +453,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
 };
 
 static struct clk_hw *sc7180_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -472,8 +472,8 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
 };
 
 static struct clk_hw *sc8180x_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -492,8 +492,8 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 };
 
 static struct clk_hw *sm8250_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
 	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
@@ -512,8 +512,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 };
 
 static struct clk_hw *sm8350_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
 	[RPMH_DIV_CLK1]		= &sm8350_div_clk1.hw,
 	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_ao.hw,
 	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
@@ -539,8 +539,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 };
 
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
 	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
@@ -554,8 +554,8 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
 };
 
 static struct clk_hw *sm8450_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
 	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1.hw,
 	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2.hw,
@@ -577,8 +577,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
 };
 
 static struct clk_hw *sc7280_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_div4_ao.hw,
 	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
@@ -598,14 +598,14 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 };
 
 static struct clk_hw *sm6350_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
 	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
-	[RPMH_QLINK_CLK]	= &sm6350_qlink.hw,
-	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_ao.hw,
+	[RPMH_QLINK_CLK]	= &sm6350_qlink_div4.hw,
+	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_div4_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
@@ -614,8 +614,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 };
 
 static struct clk_hw *sdx65_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_div4_ao.hw,
 	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
 	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
 	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
@@ -636,8 +636,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
 };
 
 static struct clk_hw *qdu1000_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_div1_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_qdu1000 = {
-- 
2.35.1

