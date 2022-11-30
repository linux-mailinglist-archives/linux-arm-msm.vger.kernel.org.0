Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7347F63D653
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 14:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235571AbiK3NKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 08:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235557AbiK3NKK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 08:10:10 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E379E6CA32
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:08 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id g7so26873284lfv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcjnLOxp/MVZG9kAvam77qBm0fRxGbijyapmGrNxfjQ=;
        b=YRNnUA417vKrQRUmSgaP//ALdZNfNRxR/T+1/Ose5piP3utwMUuGwNtD/qAjAsP0cR
         yk5bRixfpMq9zhGoeKzkk458QNlsdGx0iXqNectqCDlFj3Ja2Z2qghfGiGkgSv6N50yo
         9eWOhCd0LIRT3+Zfhnqh/Yeg18KNAWZU2Gnx0KCquFd5XheFdEDC4SXV+kgOW+ejFRbe
         B/Dt6Ecw0bxQPl0XgGCQAi2Xmuc6UEiyIfbwbYXh9LTvYdaY+YnSK1Z4mxiXsgBCZMHS
         rYExL18XtDgiZeQ9rh2oZf2Pxs+Tq+3bStAQAhGeSL1xjUQtkxEhvAWwafDUvl2Qr9yI
         Cl0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcjnLOxp/MVZG9kAvam77qBm0fRxGbijyapmGrNxfjQ=;
        b=D+PFiJF+uJ595GPG5LH80xJ8QmR6antZ1WfcS/Jwcr78LFH+ix9Y7K1LxzBt6nGT0b
         DhFwl0cE5D8kjSDeDJRg5Hh/QUdEpTG6kXm1dM0CrgKOTDSB3vu8EBdw5tzsXXOFF38M
         vudV0Vcf8/lH1RiW4gd7omLqmIfuGZczMerf0w6N/2ykuG44930GVkWioaPM5CpuVfKJ
         /eyNMTXqDRtTXw34ZIG4nHwViNab5A5OvzQwdYFzXEncsVwsPK/9bLXrNWtMrG0eHKiF
         57kLkJe4ItrNyQ/9vtaDtmTSE2JL9zqpD2HMu+2oemGoDHWYwZATDkew0AA/B5d+Fz+h
         lyEQ==
X-Gm-Message-State: ANoB5pm7QJTxklAv1uFGYjL21yWEWFqr82BGYYbIvqFAeBa/PeLIWV5i
        5/U5bNqnVKeG2BYQStBcGngq2w==
X-Google-Smtp-Source: AA0mqf7ShY1FeyaikPqo7Xx8K6ElHrlT+dANeBLWTHCyKpGg6q752cSixut9bMI3Eu+4cK6hGHW3TQ==
X-Received: by 2002:ac2:508e:0:b0:4a2:2a60:ecda with SMTP id f14-20020ac2508e000000b004a22a60ecdamr20886967lfm.81.1669813807260;
        Wed, 30 Nov 2022 05:10:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p9-20020ac246c9000000b004b01305732bsm250083lfo.216.2022.11.30.05.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:10:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 4/8] clk: qcom: rpmh: remove platform names from BCM clocks
Date:   Wed, 30 Nov 2022 15:09:57 +0200
Message-Id: <20221130131001.20912-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
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

There are no platform-specific parts in the BCM clocks, drop the
platform name from the clock definitions, replacing it with clk_rpmh to
have the common prefix.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 52 ++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 00c0c8f851bd..5044f9fa156d 100644
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
+DEFINE_CLK_RPMH_BCM(ipa, "IP0");
+DEFINE_CLK_RPMH_BCM(ce, "CE0");
+DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
+DEFINE_CLK_RPMH_BCM(pka, "PKA0");
+DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 
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

