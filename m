Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEE3A63BDB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 11:12:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232021AbiK2KMX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 05:12:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232490AbiK2KLt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 05:11:49 -0500
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2FA61527
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:10:31 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id r8so16224486ljn.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2aZ+JQzoER6zcqw4GJBmhWffzgkvUfkj0aZBVcM2XqA=;
        b=h7WKoSQuCVodAj2o3eleJFJHlDVO6bdDrWbzTeZm8wz8u4CFRsB7MU4PjBLx+CwhvU
         ZYBLoTrEZ8I7XJznJBek08DSC+sG8tGOKRmyaHgae1kwz13LA3yJVkWF0Czdh+eYXua7
         OOXU6KnRmV6d4VNfZIipFXeby63O5CfPkWceDJUJ4Q+fggnXOtR7PmnUKMQRphLqhzQc
         PTDlHxaMPFn1Q2M0RpPU38Q/1IT3/0Z1dShrJeAtGF5aPjnMToxUM8wiTqj5ntD1GRk/
         dNWpjFxdgk28bw55VMaxwumHyjkZustnNsAo2KNvw8Lv8AyjaWRGLDqEu9+LewNtCmgO
         mNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2aZ+JQzoER6zcqw4GJBmhWffzgkvUfkj0aZBVcM2XqA=;
        b=A9xWzPqxluewIViQToGy/d/P1Yr+kYyUIoHtVkomYGKBzA+GgHMN33MMSowUpVCYC3
         iF18yP5q7/CRARz3gC766N2sIhi70qbNqulM5BAoin32klvbG5aeYHiSUuz1p1Gqm42U
         rmu0WjjAEDRmSHeYYL7AahNM6H/aPpeym+kYkfQvc+L/mgY7BBwHWMjMPFXOsz2fGo1X
         T2YIffYWRt9aE5g8cTok/GXtpMito1vhU71FGAHoWa6roTvxBPCN7vnYXA/013KiQwk4
         H6XRmXexayKjfc4/oQ8NnA9+aFh1z10fE0X+raT7UzNgg/LAYCtcnpC8xRsG+63fNp5e
         F44g==
X-Gm-Message-State: ANoB5pkM1kyVIRwjiFnhVcWWw6FU6ToxPOM5mrNiPehIymKrBurueH7y
        rwd705ly8bMSeQLymS9fCI1AVQ==
X-Google-Smtp-Source: AA0mqf4MMsW3Apxo5hDLf9YCOGgmql5INNmqZToMkhmnIHerruY8iUCyPK3ZurPKyi2RTMjKEQpQOg==
X-Received: by 2002:a05:651c:1a2b:b0:277:5545:2ee5 with SMTP id by43-20020a05651c1a2b00b0027755452ee5mr13383915ljb.313.1669716629325;
        Tue, 29 Nov 2022 02:10:29 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a12-20020ac25e6c000000b004b0a1e77cb2sm2146642lfr.137.2022.11.29.02.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 02:10:28 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 3/4] clk: qcom: rpmh: drop the platform from clock definitions
Date:   Tue, 29 Nov 2022 12:10:24 +0200
Message-Id: <20221129101025.960110-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
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

A single clock definition can be used on different platforms. Thus the
platform part of the clock name is not correct (and can be misleading).

Remove the platform-specific part of the defined clock. To keep the name
visible to the userspace add an extra optional 'suffix' argument which
is used to distinguish similar clocks in the code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 396 ++++++++++++++++++------------------
 1 file changed, 198 insertions(+), 198 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index c4852bbd00bf..513c3a025f4b 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -70,15 +70,15 @@ struct clk_rpmh_desc {
 
 static DEFINE_MUTEX(rpmh_clk_lock);
 
-#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
+#define __DEFINE_CLK_RPMH(_name, _name_active, _suffix,	_res_name,	\
 			  _res_en_offset, _res_on, _div)		\
-	static struct clk_rpmh _platform##_##_name_active;		\
-	static struct clk_rpmh _platform##_##_name = {			\
+	static struct clk_rpmh clk_rpmh_##_name_active ## _suffix;	\
+	static struct clk_rpmh clk_rpmh_##_name ## _suffix = {		\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_name_active,			\
+		.peer = &clk_rpmh_##_name_active ## _suffix,		\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 				      BIT(RPMH_ACTIVE_ONLY_STATE) |	\
 				      BIT(RPMH_SLEEP_STATE)),		\
@@ -92,12 +92,12 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 			.num_parents = 1,				\
 		},							\
 	};								\
-	static struct clk_rpmh _platform##_##_name_active = {		\
+	static struct clk_rpmh clk_rpmh_##_name_active ## _suffix = {	\
 		.res_name = _res_name,					\
 		.res_addr = _res_en_offset,				\
 		.res_on_val = _res_on,					\
 		.div = _div,						\
-		.peer = &_platform##_##_name,				\
+		.peer = &clk_rpmh_##_name ## _suffix,			\
 		.valid_state_mask = (BIT(RPMH_WAKE_ONLY_STATE) |	\
 					BIT(RPMH_ACTIVE_ONLY_STATE)),	\
 		.hw.init = &(struct clk_init_data){			\
@@ -111,18 +111,18 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 		},							\
 	}
 
-#define DEFINE_CLK_RPMH_ARC(_platform, _name, _name_active, _res_name,	\
+#define DEFINE_CLK_RPMH_ARC(_name, _name_active, _suffix, _res_name,	\
 			    _res_on, _div)				\
-	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
+	__DEFINE_CLK_RPMH(_name, _name_active,_suffix, _res_name,	\
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
-#define DEFINE_CLK_RPMH_VRM(_platform, _name, _name_active, _res_name,	\
-				_div)					\
-	__DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,	\
+#define DEFINE_CLK_RPMH_VRM(_name, _name_active, _suffix, _res_name,	\
+			    _div)					\
+	__DEFINE_CLK_RPMH(_name, _name_active, _suffix, _res_name,	\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
-#define DEFINE_CLK_RPMH_BCM(_platform, _name, _res_name)		\
-	static struct clk_rpmh _platform##_##_name = {			\
+#define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
+	static struct clk_rpmh clk_rpmh_##_name = {			\
 		.res_name = _res_name,					\
 		.valid_state_mask = BIT(RPMH_ACTIVE_ONLY_STATE),	\
 		.div = 1,						\
@@ -342,55 +342,55 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 };
 
 /* Resource name must match resource id present in cmd-db */
-DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
-DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
-DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
-DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
+DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div1, "xo.lvl", 0x3, 1);
+DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div2, "xo.lvl", 0x3, 2);
+DEFINE_CLK_RPMH_ARC(bi_tcxo, bi_tcxo_ao, _div4,  "xo.lvl", 0x3, 4);
+DEFINE_CLK_RPMH_ARC(qlink, qlink_ao,, "qphy.lvl", 0x1, 4);
 
-DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk1, ln_bb_clk1_ao, , "lnbclka1", 2);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, ln_bb_clk2_ao, , "lnbclka2", 2);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk3, ln_bb_clk3_ao, , "lnbclka3", 2);
 
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk1, ln_bb_clk1_ao, _a4, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, ln_bb_clk2_ao, _a4, "lnbclka2", 4);
 
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, ln_bb_clk2_ao, _g4, "lnbclkg2", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk3, ln_bb_clk3_ao, _g4, "lnbclkg3", 4);
 
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk1, rf_clk1_ao,, "rfclka1", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk2, rf_clk2_ao,, "rfclka2", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk3, rf_clk3_ao,, "rfclka3", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk4, rf_clk4_ao,, "rfclka4", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk5, rf_clk5_ao,, "rfclka5", 1);
 
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk1, rf_clk1_ao, _d, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk2, rf_clk2_ao, _d, "rfclkd2", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk3, rf_clk3_ao, _d, "rfclkd3", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk4, rf_clk4_ao, _d, "rfclkd4", 1);
 
-DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
+DEFINE_CLK_RPMH_VRM(div_clk1, div_clk1_ao,, "divclka1", 2);
 
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
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
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
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
-	[RPMH_CE_CLK]		= &sdm845_ce.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
@@ -399,18 +399,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
 };
 
 static struct clk_hw *sdm670_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
-	[RPMH_CE_CLK]		= &sdm845_ce.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+	[RPMH_CE_CLK]		= &clk_rpmh_ce.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
@@ -419,14 +419,14 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 };
 
 static struct clk_hw *sdx55_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
-	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
-	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao_d.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao_d.hw,
+	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
@@ -435,18 +435,18 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
 };
 
 static struct clk_hw *sm8150_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
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
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
@@ -455,17 +455,17 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
 };
 
 static struct clk_hw *sc7180_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
@@ -474,18 +474,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
 };
 
 static struct clk_hw *sc8180x_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
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
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao_d.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao_d.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3_d.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao_d.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
@@ -494,18 +494,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 };
 
 static struct clk_hw *sm8250_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
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
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
@@ -514,25 +514,25 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 };
 
 static struct clk_hw *sm8350_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
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
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
-	[RPMH_PKA_CLK]		= &sm8350_pka.hw,
-	[RPMH_HWKM_CLK]		= &sm8350_hwkm.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
+	[RPMH_DIV_CLK1]		= &clk_rpmh_div_clk1.hw,
+	[RPMH_DIV_CLK1_A]	= &clk_rpmh_div_clk1_ao.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_ao.hw,
+	[RPMH_RF_CLK5]		= &clk_rpmh_rf_clk5.hw,
+	[RPMH_RF_CLK5_A]	= &clk_rpmh_rf_clk5_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
+	[RPMH_PKA_CLK]		= &clk_rpmh_pka.hw,
+	[RPMH_HWKM_CLK]		= &clk_rpmh_hwkm.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
@@ -541,13 +541,13 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 };
 
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
-	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
-	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
-	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div2.hw,
+	[RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_ao.hw,
+	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
+	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
+	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
@@ -556,21 +556,21 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
 };
 
 static struct clk_hw *sm8450_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
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
-	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div4.hw,
+	[RPMH_LN_BB_CLK1]	= &clk_rpmh_ln_bb_clk1_a4.hw,
+	[RPMH_LN_BB_CLK1_A]	= &clk_rpmh_ln_bb_clk1_ao_a4.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_a4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao_a4.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_ao.hw,
+	[RPMH_RF_CLK3]		= &clk_rpmh_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]	= &clk_rpmh_rf_clk3_ao.hw,
+	[RPMH_RF_CLK4]		= &clk_rpmh_rf_clk4.hw,
+	[RPMH_RF_CLK4_A]	= &clk_rpmh_rf_clk4_ao.hw,
+	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
@@ -579,19 +579,19 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
 };
 
 static struct clk_hw *sc7280_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]      = &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]    = &sc7280_bi_tcxo_ao.hw,
-	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK3]      = &sdm845_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
-	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
-	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
-	[RPMH_IPA_CLK]      = &sdm845_ipa.hw,
-	[RPMH_PKA_CLK]      = &sm8350_pka.hw,
-	[RPMH_HWKM_CLK]     = &sm8350_hwkm.hw,
+	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_ao_div4.hw,
+	[RPMH_LN_BB_CLK2]   = &clk_rpmh_ln_bb_clk2.hw,
+	[RPMH_LN_BB_CLK2_A] = &clk_rpmh_ln_bb_clk2_ao.hw,
+	[RPMH_RF_CLK1]      = &clk_rpmh_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]    = &clk_rpmh_rf_clk1_ao.hw,
+	[RPMH_RF_CLK3]      = &clk_rpmh_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]    = &clk_rpmh_rf_clk3_ao.hw,
+	[RPMH_RF_CLK4]      = &clk_rpmh_rf_clk4.hw,
+	[RPMH_RF_CLK4_A]    = &clk_rpmh_rf_clk4_ao.hw,
+	[RPMH_IPA_CLK]      = &clk_rpmh_ipa.hw,
+	[RPMH_PKA_CLK]      = &clk_rpmh_pka.hw,
+	[RPMH_HWKM_CLK]     = &clk_rpmh_hwkm.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
@@ -600,14 +600,14 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 };
 
 static struct clk_hw *sm6350_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
-	[RPMH_QLINK_CLK]	= &sm6350_qlink.hw,
-	[RPMH_QLINK_CLK_A]	= &sm6350_qlink_ao.hw,
+	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_ao_div4.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_g4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_ao_g4.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_g4.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_ao_g4.hw,
+	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink.hw,
+	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_ao.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
@@ -616,20 +616,20 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 };
 
 static struct clk_hw *sdx65_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
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
-	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
-	[RPMH_QPIC_CLK]         = &sdx55_qpic_clk.hw,
+	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
+	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_ao_div4.hw,
+	[RPMH_LN_BB_CLK1]       = &clk_rpmh_ln_bb_clk1_a4.hw,
+	[RPMH_LN_BB_CLK1_A]     = &clk_rpmh_ln_bb_clk1_ao_a4.hw,
+	[RPMH_RF_CLK1]          = &clk_rpmh_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]        = &clk_rpmh_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]          = &clk_rpmh_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]        = &clk_rpmh_rf_clk2_ao.hw,
+	[RPMH_RF_CLK3]          = &clk_rpmh_rf_clk3.hw,
+	[RPMH_RF_CLK3_A]        = &clk_rpmh_rf_clk3_ao.hw,
+	[RPMH_RF_CLK4]          = &clk_rpmh_rf_clk4.hw,
+	[RPMH_RF_CLK4_A]        = &clk_rpmh_rf_clk4_ao.hw,
+	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
+	[RPMH_QPIC_CLK]         = &clk_rpmh_qpic_clk.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
@@ -638,8 +638,8 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
 };
 
 static struct clk_hw *qdu1000_rpmh_clocks[] = {
-	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
-	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
+	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div1.hw,
+	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_ao_div1.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_qdu1000 = {
-- 
2.35.1

