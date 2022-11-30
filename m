Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7727463D656
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 14:10:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233781AbiK3NKM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 08:10:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234022AbiK3NKL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 08:10:11 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 072E56B3A4
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:10 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id d3so20829463ljl.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jrj5yVzQhvepfPvamvBCTAj0aEaeJCmjm0ZXV9chkw8=;
        b=Y6pvGfLiqNCB9LdfJqas9KKlsukXuOChEU62YQOUegDhu782g7bCWinNkaGH8oFmj+
         a4CRHElqTwEMgKZcIZIqOzti92QDSmY58XjOCffYD9cUzXvB6dw6co9gu1b0dMNM2DSJ
         tGOhP75M2ecWvUNuLHjhmelvhDCFIYybs2+eObjGLecL56n4/TcM06/ERKGLjNQGnlZ5
         LdXX0vF0zsmgN68np2ib8j64KVUI0sxKOXQ8Hg+sQFcQRW+lKaZdup70axXtMs8jmwHK
         /BfWutcPfbtix78BWWDCK+JGLkydo0ll9ApwUzD+vGCBLHfrs4AH84cnTfvdv05HwzSh
         2BEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jrj5yVzQhvepfPvamvBCTAj0aEaeJCmjm0ZXV9chkw8=;
        b=QueMqA3iIewmGMztQWflY4HxAjCXtju11L6WlwfqOWYuVAvZbegnmJmUNlMSWfBfdX
         dwpBkxL1Oyzp0npCDx9iICJBOqV9vLdd6hkvNJpk33s1eigcbZBaqC0uR9s2jq87gqEj
         IFj6KE7pZpHsVhscJUb7K50pWeWUOshQ3CzPVEEYy6OeCH4SLxftjT6CfKbuQaWe+3pP
         zI6Fg5jYpCxgB3+JCb3sAZCSx4bsYezt9hSfFKHT5RokUiQDSadSC+h6wNA50KPjUOFY
         kPqhNksBaHjVDZyT9LvxfqgLtrS0WKMO8s2DAOJDp0t7yyLfTDfzvL8Nc1bdhLolI4Gn
         d/uA==
X-Gm-Message-State: ANoB5pl0naSF47Mle2iWoKYeMKOWG6Kmzw0fDE7pzyOsLpIGo/FPVihe
        QXB6bmYRysvwRJlK1Cb2GD+B0w==
X-Google-Smtp-Source: AA0mqf7uRkXiQL5azoAwl6VhRhFxssyKv1g7QSIDPVgC4zccpYKB8/ReG80pBpJC+apysUCfQ5tgBg==
X-Received: by 2002:a05:651c:1a2b:b0:277:5545:2ee5 with SMTP id by43-20020a05651c1a2b00b0027755452ee5mr15187536ljb.313.1669813808344;
        Wed, 30 Nov 2022 05:10:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p9-20020ac246c9000000b004b01305732bsm250083lfo.216.2022.11.30.05.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:10:07 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 5/8] clk: qcom: rpmh: rename ARC clock data
Date:   Wed, 30 Nov 2022 15:09:58 +0200
Message-Id: <20221130131001.20912-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
References: <20221130131001.20912-1-dmitry.baryshkov@linaro.org>
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

Rework the ARC clocks defintions to remove the SoC name. Keep the
userspace-visible clock name, but encode the divider into the variable
name. This also make it obvious which divider is used by the platform,
making the code less error-prone.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 86 ++++++++++++++++++-------------------
 1 file changed, 43 insertions(+), 43 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 5044f9fa156d..bd6cb07b6154 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -70,15 +70,15 @@ struct clk_rpmh_desc {
 
 static DEFINE_MUTEX(rpmh_clk_lock);
 
-#define __DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
+#define __DEFINE_CLK_RPMH(_platform, _name, _cname, _res_name,		\
 			  _res_en_offset, _res_on, _div)		\
-	static struct clk_rpmh _platform##_##_name##_ao;		\
-	static struct clk_rpmh _platform##_##_name = {			\
+	static struct clk_rpmh _platform##_##_cname##_ao;		\
+	static struct clk_rpmh _platform##_##_cname = {			\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_name##_ao,			\
+		.peer = &_platform##_##_cname##_ao,			\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
 				      BIT(RPMH_SLEEP_STATE)),		\
@@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 			.num_parents = 1,				\
 		},							\
 	};								\
-	static struct clk_rpmh _platform##_##_name##_ao= {		\
+	static struct clk_rpmh _platform##_##_cname##_ao= {		\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_name,				\
+		.peer = &_platform##_##_cname,				\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
 		.hw.init = &(struct clk_init_data){			\
@@ -111,12 +111,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		},							\
 	}
 
-#define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
-	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
+#define DEFINE_CLK_RPMH_ARC(_name, _res_name, _res_on, _div)		\
+	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_##div##_div, _res_name, \
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
 #define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
-	__DEFINE_CLK_RPMH(_platform, _name, _res_name,			\
+	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
 #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
@@ -340,10 +340,10 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 };
 
 /* Resource name must match resource id present in cmd-db */
-DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, "xo.lvl", 0x3, 1);
-DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, "xo.lvl", 0x3, 2);
-DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, "xo.lvl", 0x3, 4);
-DEFINE_CLK_RPMH_ARC(sm6350, qlink, "qphy.lvl", 0x1, 4);
+DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 1);
+DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 2);
+DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 4);
+DEFINE_CLK_RPMH_ARC(qlink, "qphy.lvl", 0x1, 4);
 
 DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, "lnbclka1", 2);
 DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, "lnbclka2", 2);
@@ -375,8 +375,8 @@ DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 
 static struct clk_hw *sdm845_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -397,8 +397,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
 };
 
 static struct clk_hw *sdm670_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -417,8 +417,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 };
 
 static struct clk_hw *sdx55_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
 	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
 	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
 	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
@@ -433,8 +433,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
 };
 
 static struct clk_hw *sm8150_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -453,8 +453,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
 };
 
 static struct clk_hw *sc7180_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -472,8 +472,8 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
 };
 
 static struct clk_hw *sc8180x_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
@@ -492,8 +492,8 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 };
 
 static struct clk_hw *sm8250_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
 	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
@@ -512,8 +512,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 };
 
 static struct clk_hw *sm8350_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
 	[RPMH_DIV_CLK1]		= &sm8350_div_clk1.hw,
 	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_ao.hw,
 	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1.hw,
@@ -539,8 +539,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 };
 
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
 	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
 	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
@@ -554,8 +554,8 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
 };
 
 static struct clk_hw *sm8450_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
 	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1.hw,
 	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2.hw,
@@ -577,8 +577,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
 };
 
 static struct clk_hw *sc7280_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div4_ao.hw,
 	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
 	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
@@ -598,14 +598,14 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 };
 
 static struct clk_hw *sm6350_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
 	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
 	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
 	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
 	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
-	[RPMH_QLINK_CLK]	= &sm6350_qlink.hw,
-	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_ao.hw,
+	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink_div4.hw,
+	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_div4_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
@@ -614,8 +614,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 };
 
 static struct clk_hw *sdx65_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div4_ao.hw,
 	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
 	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
 	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
@@ -636,8 +636,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
 };
 
 static struct clk_hw *qdu1000_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div1_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_qdu1000 = {
-- 
2.35.1

