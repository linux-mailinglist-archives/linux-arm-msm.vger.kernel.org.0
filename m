Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43CEA640E19
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 19:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234492AbiLBS72 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 13:59:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234454AbiLBS6v (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 13:58:51 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D257A5551
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 10:58:49 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id x6so6361231lji.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 10:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=12Ofeq1A0F6ndWyXdo5HT6aKjFxm9M+CWg8kDhQP65k=;
        b=dcSrcji/WotoiHuFXz0drO64pgz2xtXnOHgGVt2Tjy5JPSx8Q9f4B3yaRU9F9KAKEN
         /aGyeAuruEgraD+8HFya3N/RZLml0dTFhjNH7ErEE1XhTs7AV2CnjxO/N908+8D904rf
         HoWwNr2xIOo34omiqbJWIU0yT/kFiBLjIcgMb4pZFH10uVbq2dzuOlelzFRdwggNbp6Q
         UfLNOabKfQjNOrEBfYuJvlTlm7t5Ig3z1ZeZCH3G+dUwmYBROSTIFFzJzFjcbcK3EBdt
         tqCQMLqYjt5qO4b/+MeegTH3aMw5aF8O+RkHL+QvRK3DyNuZFPkeZrfjzMST1iQBg68T
         2VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12Ofeq1A0F6ndWyXdo5HT6aKjFxm9M+CWg8kDhQP65k=;
        b=hCixbr4HUiLjFUAhL0cpi/iLoufRquJTn9fEmpYa3UKGvzHHCFL7L6XLv9LJVJZkwO
         sKmu5rUx+b7zTMNJRL+n9aU7KGFlmUZ783Unnz4t+CqZVdFtewrvmhkU7z7vf35/ocX3
         jT6N1JqenQ18S+WTVneGsAhJ9LsVU9cJfcORX1H6bwFRclMofhCcSEuuSwkUYYVVwdmw
         IeuPqo07Qw6DkJ4cH2vdbmcOs3Py/QZevGVcYzZYWZ8toWg21v6eWA4pVUbsQ7hcCBjK
         CCdlcYFHYEPeq3Z9ol1xLZ55woD/4r36AtcvTgzTXZ9pOeUuLzTlvfEZtLX1GkgYor4F
         L/8Q==
X-Gm-Message-State: ANoB5pmwPBaMFiUWXGibQBxYilqPAxHzIyUirflc261hKUE489+vLD7o
        rZWj0n846+qUDAk/ibSlKvQiUw==
X-Google-Smtp-Source: AA0mqf5csdplAeEas6kK8Xwbrk19JA9ljyYek4eeYa+mafo6sPSO0mngTYCmXbakUw/H91TahJRWbA==
X-Received: by 2002:a05:651c:2104:b0:277:2eb5:39ee with SMTP id a4-20020a05651c210400b002772eb539eemr18380190ljq.518.1670007529145;
        Fri, 02 Dec 2022 10:58:49 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004b4a0482a53sm546529lfr.231.2022.12.02.10.58.48
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
Subject: [PATCH v3 7/8] clk: qcom: rpmh: rename VRM clock data
Date:   Fri,  2 Dec 2022 20:58:42 +0200
Message-Id: <20221202185843.721673-8-dmitry.baryshkov@linaro.org>
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

RPMH VRM clocks are frequently shared between several platfoms. It makes
little sense to encode the SoC name into the clock name, if the same
clock is used for other SoCs.

Rework the VRM clock defintions to add resource-specific suffix. Keep the
userspace-visible clock name, but encode the part of cmd resource and
the divider into the variable name. This also make it obvious which
variant is used, making the code less error-prone.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 258 ++++++++++++++++++------------------
 1 file changed, 129 insertions(+), 129 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 439cace44bd1..b543939de1c8 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -115,8 +115,8 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 	__DEFINE_CLK_RPMH(_platform, _name, _name##_##div##_div, _res_name, \
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
-#define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
-	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
+#define DEFINE_CLK_RPMH_VRM(_platform, _name, _suffix, _res_name, _div)	\
+	__DEFINE_CLK_RPMH(_platform, _name, _name##_suffix, _res_name,	\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
 #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
@@ -345,28 +345,28 @@ DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, "xo.lvl", 0x3, 2);
 DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, "xo.lvl", 0x3, 4);
 DEFINE_CLK_RPMH_ARC(sm6350, qlink, "qphy.lvl", 0x1, 4);
 
-DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, "lnbclka1", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, "lnbclka2", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, _a2, "lnbclka1", 2);
+DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, _a2, "lnbclka2", 2);
+DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, _a2, "lnbclka3", 2);
 
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, "lnbclka1", 4);
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, "lnbclka2", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, _a4, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, _a4,  "lnbclka2", 4);
 
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, "lnbclkg2", 4);
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, "lnbclkg3", 4);
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, _g4, "lnbclkg2", 4);
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, _g4, "lnbclkg3", 4);
 
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, "rfclka1", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, "rfclka2", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, "rfclka3", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, "rfclka4", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, "rfclka5", 1);
+DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, _a, "rfclka1", 1);
+DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, _a, "rfclka2", 1);
+DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, _a, "rfclka3", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, _a, "rfclka4", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, _a, "rfclka5", 1);
 
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, "rfclkd2", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, "rfclkd3", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, _d, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, _d, "rfclkd2", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, _d, "rfclkd3", 1);
+DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, _d, "rfclkd4", 1);
 
-DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
+DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, _div2, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
@@ -377,16 +377,16 @@ DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
 };
@@ -399,14 +399,14 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
 static struct clk_hw *sdm670_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
 };
@@ -419,10 +419,10 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 static struct clk_hw *sdx55_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
+	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_d_ao.hw,
 	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
@@ -435,16 +435,16 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
 static struct clk_hw *sm8150_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
@@ -455,14 +455,14 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
 static struct clk_hw *sc7180_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
@@ -474,16 +474,16 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
 static struct clk_hw *sc8180x_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
-	[RPMH_RF_CLK3]		= &sc8180x_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]	= &sc8180x_rf_clk3_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_d_ao.hw,
+	[RPMH_RF_CLK3]		= &sc8180x_rf_clk3_d.hw,
+	[RPMH_RF_CLK3_A]	= &sc8180x_rf_clk3_d_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
@@ -494,16 +494,16 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
-	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_a2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
@@ -514,20 +514,20 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 static struct clk_hw *sm8350_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_DIV_CLK1]		= &sm8350_div_clk1.hw,
-	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_ao.hw,
-	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
-	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
-	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
-	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
-	[RPMH_RF_CLK5]		= &sm8350_rf_clk5.hw,
-	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_ao.hw,
+	[RPMH_DIV_CLK1]		= &sm8350_div_clk1_div2.hw,
+	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_a2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &sm8350_rf_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_a_ao.hw,
+	[RPMH_RF_CLK5]		= &sm8350_rf_clk5_a.hw,
+	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
@@ -541,8 +541,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
+	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_a2_ao.hw,
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
@@ -556,18 +556,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
 static struct clk_hw *sm8450_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
 	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1.hw,
-	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sm8450_ln_bb_clk2_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_ao.hw,
-	[RPMH_RF_CLK4]		= &sm8350_rf_clk4.hw,
-	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1_a4.hw,
+	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_a4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2_a4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sm8450_ln_bb_clk2_a4_ao.hw,
+	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &sm8350_rf_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
@@ -579,14 +579,14 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
 static struct clk_hw *sc7280_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo_div4.hw,
 	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK3]      = &sdm845_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
-	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
-	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
+	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_a2_ao.hw,
+	[RPMH_RF_CLK1]      = &sdm845_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK3]      = &sdm845_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]      = &sm8350_rf_clk4_a.hw,
+	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_a_ao.hw,
 	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
@@ -600,10 +600,10 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 static struct clk_hw *sm6350_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
 	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2_g4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_g4_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3_g4.hw,
+	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_g4_ao.hw,
 	[RPMH_QLINK_CLK]	= &sm6350_qlink_div4.hw,
 	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_div4_ao.hw,
 };
@@ -616,16 +616,16 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 static struct clk_hw *sdx65_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo_div4.hw,
 	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
-	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
-	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_ao.hw,
-	[RPMH_RF_CLK3]          = &sdm845_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_ao.hw,
-	[RPMH_RF_CLK4]          = &sm8350_rf_clk4.hw,
-	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_ao.hw,
+	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1_a4.hw,
+	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_a4_ao.hw,
+	[RPMH_RF_CLK1]          = &sdm845_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]          = &sdm845_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]          = &sdm845_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]          = &sm8350_rf_clk4_a.hw,
+	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_a_ao.hw,
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
 };
-- 
2.35.1

