Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BDA4640E1D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 19:59:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234687AbiLBS7b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 13:59:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234507AbiLBS6x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 13:58:53 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B26429D2E6
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 10:58:51 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id b3so8751405lfv.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 10:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VO8IPQE5qq773o9sIarCSe5boljUzi9sEGC09bPdcI=;
        b=jsMqB9TqlvISnAJjxBT8FHyZhAkBWpsD21eB00n2R2+larfB8U61FMQI+cyhOJRjja
         Qt1/IzgryeoqaGP42W93grK/h1WzTV1fw3uD9J+AF9AM34AKkn4bAYHe/DIamTwAQY9I
         83l7apJe5xpJeeE1s5D+D1kPBWoIb3u1IGXXTy0SysPev258YMSvqjIh99qPyFUuW5N3
         O4dHp18biuzPVtCCo9HH7x4z9z4i1rPteLyT1J/+PN4rEMZHz8VT8TRsvXVS5/0uVdwI
         O45OOM95nkpOwdFUltRu6dCezeUCS5x0GFrlLvFqsL+nCLmVEx5yWEhPBauNHj+aa80F
         pRMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9VO8IPQE5qq773o9sIarCSe5boljUzi9sEGC09bPdcI=;
        b=X+1YKwGLOr2n3HIYQQctXl1oHU6TXQmYmQ10BI79QDVuJS4QY7mfSm491lVT3DJbSu
         phBgYrscQyvxUDHGxyagoLNh/QLpUL8pBHF8gOctT6zws+q95KMBGUFaBterOOyKdlAy
         kLbK+N1cTmF9MYowyAcf4xRR8OfufWFKt+z6S2aBevIU0GWN/eGnxsW/RMgWf3RnmR6i
         vJweswLuBPh5a8+1GZYnEPqR3CEXQR1+zCnsznuY4OTDGzawDgDnkV1c2elE711X4nE6
         u64L0xcf8Sfhlp8WBFPxRHsV+8OQ4iP6gFpwwiE/EfgOt7050cVxu7/2YzYt9UpIIkdS
         ihtw==
X-Gm-Message-State: ANoB5pmG8L9OmGLXd6UZBngKjrkR7UtReSFNWvQuJxLEVUULFTwvxSIe
        CUDAz3lvDVIwzrqQyTR3RuksRA==
X-Google-Smtp-Source: AA0mqf5IqiS/xnhoy8Tk2QPss0lvsRx/zykyY3oaECLI6P195mV6UWJHT9A0GpwH4kV/mLmtOTrpTg==
X-Received: by 2002:a05:6512:33c5:b0:4b5:237a:fb0d with SMTP id d5-20020a05651233c500b004b5237afb0dmr6127455lfg.658.1670007529883;
        Fri, 02 Dec 2022 10:58:49 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004b4a0482a53sm546529lfr.231.2022.12.02.10.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:58:49 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v3 8/8] clk: qcom: rpmh: remove usage of platform name
Date:   Fri,  2 Dec 2022 20:58:43 +0200
Message-Id: <20221202185843.721673-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
References: <20221202185843.721673-1-dmitry.baryshkov@linaro.org>
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

Now that all clocks have individual names, remove the names of SoCs from
the RPMH clock definitions. Replace it with the common clk_rpmh_ prefix.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 342 ++++++++++++++++++------------------
 1 file changed, 171 insertions(+), 171 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index b543939de1c8..2c2ef4b6d130 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -70,15 +70,15 @@ struct clk_rpmh_desc {
 
 static DEFINE_MUTEX(rpmh_clk_lock);
 
-#define __DEFINE_CLK_RPMH(_platform, _name, _clk_name, _res_name,	\
+#define __DEFINE_CLK_RPMH(_name, _clk_name, _res_name,			\
 			  _res_en_offset, _res_on, _div)		\
-	static struct clk_rpmh _platform##_##_clk_name##_ao;		\
-	static struct clk_rpmh _platform##_##_clk_name = {		\
+	static struct clk_rpmh clk_rpmh_##_clk_name##_ao;		\
+	static struct clk_rpmh clk_rpmh_##_clk_name = {			\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_clk_name##_ao,			\
+		.peer = &clk_rpmh_##_clk_name##_ao,			\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
 				      BIT(RPMH_SLEEP_STATE)),		\
@@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 			.num_parents = 1,				\
 		},							\
 	};								\
-	static struct clk_rpmh _platform##_##_clk_name##_ao= {		\
+	static struct clk_rpmh clk_rpmh_##_clk_name##_ao= {		\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_clk_name,			\
+		.peer = &clk_rpmh_##_clk_name,				\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
 		.hw.init = &(struct clk_init_data){			\
@@ -111,12 +111,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		},							\
 	}
 
-#define DEFINE_CLK_RPMH_ARC(_platform, _name, _res_name, _res_on, _div)	\
-	__DEFINE_CLK_RPMH(_platform, _name, _name##_##div##_div, _res_name, \
+#define DEFINE_CLK_RPMH_ARC(_name, _res_name, _res_on, _div)		\
+	__DEFINE_CLK_RPMH(_name, _name##_##div##_div, _res_name,	\
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
-#define DEFINE_CLK_RPMH_VRM(_platform, _name, _suffix, _res_name, _div)	\
-	__DEFINE_CLK_RPMH(_platform, _name, _name##_suffix, _res_name,	\
+#define DEFINE_CLK_RPMH_VRM(_name, _suffix, _res_name, _div)		\
+	__DEFINE_CLK_RPMH(_name, _name##_suffix, _res_name,		\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
 #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
@@ -340,33 +340,33 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
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
 
-DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, _a2, "lnbclka1", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, _a2, "lnbclka2", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, _a2, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2, "lnbclka1", 2);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2, "lnbclka2", 2);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2, "lnbclka3", 2);
 
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, _a4, "lnbclka1", 4);
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, _a4,  "lnbclka2", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a4, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a4, "lnbclka2", 4);
 
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, _g4, "lnbclkg2", 4);
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, _g4, "lnbclkg3", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _g4, "lnbclkg2", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _g4, "lnbclkg3", 4);
 
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, _a, "rfclka1", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, _a, "rfclka2", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, _a, "rfclka3", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, _a, "rfclka4", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, _a, "rfclka5", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk1, _a, "rfclka1", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk2, _a, "rfclka2", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk3, _a, "rfclka3", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _a, "rfclka4", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk5, _a, "rfclka5", 1);
 
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, _d, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, _d, "rfclkd2", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, _d, "rfclkd3", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, _d, "rfclkd4", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk1, _d, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk2, _d, "rfclkd2", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
 
-DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, _div2, "divclka1", 2);
+DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
 DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
@@ -375,18 +375,18 @@ DEFINE_CLK_RPMH_BCM(pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
 
 static struct clk_hw *sdm845_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
 };
@@ -397,16 +397,16 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
 };
 
 static struct clk_hw *sdm670_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
 };
@@ -417,12 +417,12 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 };
 
 static struct clk_hw *sdx55_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1_d.hw,
-	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_d_ao.hw,
-	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2_d.hw,
-	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_d_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
 	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
@@ -433,18 +433,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
 };
 
 static struct clk_hw *sm8150_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
@@ -453,16 +453,16 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
 };
 
 static struct clk_hw *sc7180_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
@@ -472,18 +472,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
 };
 
 static struct clk_hw *sc8180x_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
-	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1_d.hw,
-	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_d_ao.hw,
-	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2_d.hw,
-	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_d_ao.hw,
-	[RPMH_RF_CLK3]		= &sc8180x_rf_clk3_d.hw,
-	[RPMH_RF_CLK3_A]	= &sc8180x_rf_clk3_d_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_d_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
@@ -492,18 +492,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 };
 
 static struct clk_hw *sm8250_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1_a2.hw,
-	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_a2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3_a2.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_a2_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
@@ -512,22 +512,22 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 };
 
 static struct clk_hw *sm8350_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_DIV_CLK1]		= &sm8350_div_clk1_div2.hw,
-	[RPMH_DIV_CLK1_A]	= &sm8350_div_clk1_div2_ao.hw,
-	[RPMH_LN_BB_CLK1]	= &sm8250_ln_bb_clk1_a2.hw,
-	[RPMH_LN_BB_CLK1_A]	= &sm8250_ln_bb_clk1_a2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2_a2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_a2_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
-	[RPMH_RF_CLK4]		= &sm8350_rf_clk4_a.hw,
-	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_a_ao.hw,
-	[RPMH_RF_CLK5]		= &sm8350_rf_clk5_a.hw,
-	[RPMH_RF_CLK5_A]	= &sm8350_rf_clk5_a_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_div_clk1_div2.hw,
+	[RPMH_DIV_CLK1_A]	= &clk_rpmh_div_clk1_div2_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a2.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a2_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5_a.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
@@ -539,10 +539,10 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 };
 
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo_div2.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3_a2.hw,
-	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_a2_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
+	[RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_a2_ao.hw,
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
@@ -554,20 +554,20 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
 };
 
 static struct clk_hw *sm8450_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
-	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK1]	= &sm8450_ln_bb_clk1_a4.hw,
-	[RPMH_LN_BB_CLK1_A]	= &sm8450_ln_bb_clk1_a4_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sm8450_ln_bb_clk2_a4.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sm8450_ln_bb_clk2_a4_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1_a.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_a_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2_a.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_a_ao.hw,
-	[RPMH_RF_CLK3]		= &sdm845_rf_clk3_a.hw,
-	[RPMH_RF_CLK3_A]	= &sdm845_rf_clk3_a_ao.hw,
-	[RPMH_RF_CLK4]		= &sm8350_rf_clk4_a.hw,
-	[RPMH_RF_CLK4_A]	= &sm8350_rf_clk4_a_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a4.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_a4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_a4_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4_a.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_a_ao.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
@@ -577,16 +577,16 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
 };
 
 static struct clk_hw *sc7280_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo_div4.hw,
-	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2_a2.hw,
-	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_a2_ao.hw,
-	[RPMH_RF_CLK1]      = &sdm845_rf_clk1_a.hw,
-	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_a_ao.hw,
-	[RPMH_RF_CLK3]      = &sdm845_rf_clk3_a.hw,
-	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_a_ao.hw,
-	[RPMH_RF_CLK4]      = &sm8350_rf_clk4_a.hw,
-	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_a_ao.hw,
+	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]   = &clk_rpmh_ln_bb_clk2_a2.hw,
+	[RPMH_LN_BB_CLK2_A] = &clk_rpmh_ln_bb_clk2_a2_ao.hw,
+	[RPMH_RF_CLK1]      = &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]    = &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK3]      = &clk_rpmh_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]    = &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]      = &clk_rpmh_rf_clk4_a.hw,
+	[RPMH_RF_CLK4_A]    = &clk_rpmh_rf_clk4_a_ao.hw,
 	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
@@ -598,14 +598,14 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 };
 
 static struct clk_hw *sm6350_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo_div4.hw,
-	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2_g4.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_g4_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3_g4.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_g4_ao.hw,
-	[RPMH_QLINK_CLK]	= &sm6350_qlink_div4.hw,
-	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_div4_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_g4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_g4_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_g4.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_g4_ao.hw,
+	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink_div4.hw,
+	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_div4_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
@@ -614,18 +614,18 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 };
 
 static struct clk_hw *sdx65_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo_div4.hw,
-	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1_a4.hw,
-	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_a4_ao.hw,
-	[RPMH_RF_CLK1]          = &sdm845_rf_clk1_a.hw,
-	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_a_ao.hw,
-	[RPMH_RF_CLK2]          = &sdm845_rf_clk2_a.hw,
-	[RPMH_RF_CLK2_A]        = &sdm845_rf_clk2_a_ao.hw,
-	[RPMH_RF_CLK3]          = &sdm845_rf_clk3_a.hw,
-	[RPMH_RF_CLK3_A]        = &sdm845_rf_clk3_a_ao.hw,
-	[RPMH_RF_CLK4]          = &sm8350_rf_clk4_a.hw,
-	[RPMH_RF_CLK4_A]        = &sm8350_rf_clk4_a_ao.hw,
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div4_ao.hw,
+	[RPMH_LN_BB_CLK1]       = &clk_rpmh_ln_bb_clk1_a4.hw,
+	[RPMH_LN_BB_CLK1_A]     = &clk_rpmh_ln_bb_clk1_a4_ao.hw,
+	[RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1_a.hw,
+	[RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_a_ao.hw,
+	[RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2_a.hw,
+	[RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_a_ao.hw,
+	[RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3_a.hw,
+	[RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_a_ao.hw,
+	[RPMH_RF_CLK4]          = &clk_rpmh_rf_clk4_a.hw,
+	[RPMH_RF_CLK4_A]        = &clk_rpmh_rf_clk4_a_ao.hw,
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
 };
@@ -636,8 +636,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
 };
 
 static struct clk_hw *qdu1000_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo_div1.hw,
-	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_div1_ao.hw,
+	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div1_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_qdu1000 = {
-- 
2.35.1

