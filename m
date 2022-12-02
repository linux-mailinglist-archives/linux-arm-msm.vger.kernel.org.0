Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0670640E11
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 19:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbiLBS7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 13:59:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234735AbiLBS6t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 13:58:49 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C24289D2E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 10:58:48 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id l8so6357065ljh.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 10:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RW/TH/+76WMem2vnQ36+6SCv8HHVJ+6n+o1HDNYd1wI=;
        b=LDtf24OsMiPRGv16LskZaPI8OrgniAOLEU3yFWZUqE5AB1HZx0C3S/OGURXaXuv5mH
         4d3jRyWPxLbUMywjgYElXED7k7lU4c+jBLDsC07UndTGwkcpyoZPlGjS5e16h/+T59+1
         V0t6WYY2ityYK/tS04NihagAfn0pIANjYTLOKj5AE/sfU7IR0nlS7WfNh3ehSrxUnwqs
         V5H6ygXjZ60f3xN2pDxR1jVNfgQS5z10k0EUn8adNRjVYLKQrk12yEqAyr8tkx2d1ELm
         EWStkpisdg+j6UYO/GM2SDX/WRMgsurxZrV0L1hdMHV5/L6FeiB+HeagBUzQxkMNlzEA
         L+lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RW/TH/+76WMem2vnQ36+6SCv8HHVJ+6n+o1HDNYd1wI=;
        b=3AzeMQVmOFQvlZIw9azUS9t6oCJmNfqq2NgWBBT3dewoVTyKtBhR+OKfUplX2oucIU
         QRCLSUOj7oH8mFL6mqy2evab/u8cLzkjiOE0oFjrTetkBnyXh0ZcTmAIaZIGt5Bdeyf2
         o7a5Mwt0C3fZVhc8bEdh2ex8jgFHEK7FpfcJ9oaCENkMOS2kza735bHXlCoov0d7cZou
         iUvb+JY/gDCHayo9pUPnZXWmBCvR65aOGNXd9DkJ6d16XZ2CAL5LnMK15FRydNVFo2jI
         EDA0QHm2uhMDSNfV6UOCqxrXMzEVmFjgRj1A06+VxtzN89MF3jX3syCxeoRYDrrvePK3
         ZhAA==
X-Gm-Message-State: ANoB5pkzJA+mRnAM7HxgQfue053hnZD0nxbsjs/7NL6/5N6GQz2zJ3z/
        6B0j60GQF+tBnSymekY1MCuUig==
X-Google-Smtp-Source: AA0mqf7Gc+JN0iV/Jvx1VVeZvwO+Bfq5CcHOhdeTpsyiNDIUcJSMNkXnm6i7c9JR31yz3ZSok1Us7A==
X-Received: by 2002:a2e:9ec9:0:b0:279:c19f:a6d with SMTP id h9-20020a2e9ec9000000b00279c19f0a6dmr4955530ljk.37.1670007527181;
        Fri, 02 Dec 2022 10:58:47 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004b4a0482a53sm546529lfr.231.2022.12.02.10.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:58:46 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v3 4/8] clk: qcom: rpmh: remove platform names from BCM clocks
Date:   Fri,  2 Dec 2022 20:58:39 +0200
Message-Id: <20221202185843.721673-5-dmitry.baryshkov@linaro.org>
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

There are no platform-specific parts in the BCM clocks, drop the
platform name from the clock definitions, replacing it with clk_rpmh to
have the common prefix.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 52 ++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00c0c8f851bd..2ab406c1dab5 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -119,8 +119,8 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
-#define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
-	static struct clk_rpmh _platform##_##_name = {			\
+#define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
+	static struct clk_rpmh clk_rpmh_##_name = {			\
 		.res_name = _res_name,					\
 		.valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),	\
 		.div = 1,						\
@@ -368,11 +368,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
 
 DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
 
-DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
-DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
-DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
-DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
-DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
+DEFINE_CLK_RPMH_BCM(ce, "CE0");
+DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
+DEFINE_CLK_RPMH_BCM(ipa, "IP0");
+DEFINE_CLK_RPMH_BCM(pka, "PKA0");
+DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
 static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
@@ -387,8 +387,8 @@ static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
 	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
 	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
-	[RPMH_CE_CLK]		= &sdm845_ce.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
@@ -407,8 +407,8 @@ static struct clk_hw *sdm670_rpmh_clocks[] = {
 	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
 	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
 	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
-	[RPMH_CE_CLK]		= &sdm845_ce.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
@@ -423,8 +423,8 @@ static struct clk_hw *sdx55_rpmh_clocks[] = {
 	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
 	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
 	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
-	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
@@ -463,7 +463,7 @@ static struct clk_hw *sc7180_rpmh_clocks[] = {
 	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
 	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
 	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
@@ -528,9 +528,9 @@ static struct clk_hw *sm8350_rpmh_clocks[] = {
 	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
 	[RPMH_RF_CLK5]		= &sm8350_rf_clk5.hw,
 	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_ao.hw,
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
-	[RPMH_PKA_CLK]		= &sm8350_pka.hw,
-	[RPMH_HWKM_CLK]		= &sm8350_hwkm.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
+	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
@@ -543,9 +543,9 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
 	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
 	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
-	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
-	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
+	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
+	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
+	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
@@ -568,7 +568,7 @@ static struct clk_hw *sm8450_rpmh_clocks[] = {
 	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
 	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
 	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
@@ -587,9 +587,9 @@ static struct clk_hw *sc7280_rpmh_clocks[] = {
 	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
 	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
 	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
-	[RPMH_IPA_CLK]      = &sdm845_ipa.hw,
-	[RPMH_PKA_CLK]      = &sm8350_pka.hw,
-	[RPMH_HWKM_CLK]     = &sm8350_hwkm.hw,
+	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
+	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
+	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
@@ -626,8 +626,8 @@ static struct clk_hw *sdx65_rpmh_clocks[] = {
 	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
 	[RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
 	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
-	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
-	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
+	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
+	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
-- 
2.35.1

