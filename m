Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 682C463D657
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Nov 2022 14:10:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235587AbiK3NKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Nov 2022 08:10:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235557AbiK3NKN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Nov 2022 08:10:13 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F8F6C72A
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:11 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id z4so20822969ljq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Nov 2022 05:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f42umZ4L1MBU02pFMvVCYvy3gksip6eZq2uEh+sCsco=;
        b=pI0bk9HDR/tV7Rga1E+psscAYLmqw55BTekgVVrL/mp1ME/g3KPKWwguF5eyH9H6g8
         apSZy0Ll7hmSABJHD6Nz7MoygEWQgAJypVdHIVDqDPXu/RzOU6TqUEpzIe4qi/LmUWzo
         09l4NEudRfzMcg76fuE1dROqZwVnWJOmtCtrCstTc2SYeccgZ9spwPryGiZQ5JlYPsAo
         sJgZJWuMHDCVLWwMDY+rQFVxYu3Wd9fp8r9hnhCG1n22QnTCothyEzF2wJNlme5XTEmQ
         YfkF/9ZjHcpIq1E3yT3j07l0HlkHVAf9w1RoWtm5u4iUXDN3Cnm4ZVLzJe9SYJA1V5BA
         XxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f42umZ4L1MBU02pFMvVCYvy3gksip6eZq2uEh+sCsco=;
        b=o9EW1ZcQaH5FaQDKtkgivvZCMPqJvgoJyFhWEGxCpYRv/vLH6RWq73/feIgRKGWyol
         LagVPxMtAE7dxzyPlnNSgt6qOtYQWfiKUJLmHY8Qso+/F4gGUzR9xj3F9iQximT916qy
         b/qfVjcbsX3g/ZY5CjCa2rJExcW74Rlrgi/oSiyveitN6LSFNcPDP+6u8A2LS0gDORMj
         Tpv78Br43CLzgwPGh2igrUnheUAkbG5odX/i4qrorczTnVPyD9MW05iGuonA2Ze+lPqG
         zBXyq2pvmW3Vb3RYQQM5V4PZEnfJvQIs4fitNLBZqW9EiPIHB0n9Ei3LBh6XgVf2vdFE
         eriQ==
X-Gm-Message-State: ANoB5plw7bPmOQOrqlgErzjQfjSteW6sYC49MlDrsW6lX3ZOD0w9rXdp
        Nr9ykp9B9osIB4cPo40+f9QIKA==
X-Google-Smtp-Source: AA0mqf73vZxSZ8Mx1B22rfOWZZEgQz59PIG6IgtVOuOLCtv9WOx8N7a6T2TbPCVbscME/hfUfK4x1g==
X-Received: by 2002:a05:651c:158c:b0:26c:90f:f8fe with SMTP id h12-20020a05651c158c00b0026c090ff8femr20750476ljq.2.1669813809445;
        Wed, 30 Nov 2022 05:10:09 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p9-20020ac246c9000000b004b01305732bsm250083lfo.216.2022.11.30.05.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 05:10:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v2 6/8] clk: qcom: rpmh: rename VRM clock data
Date:   Wed, 30 Nov 2022 15:09:59 +0200
Message-Id: <20221130131001.20912-7-dmitry.baryshkov@linaro.org>
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

RPMH VRM clocks are frequently shared between several platfoms. It makes
little sense to encode the SoC name into the clock name, if the same
clock is used for other SoCs.

Rework the VRM clocks defintions to remove the SoC name. Keep the
userspace-visible clock name, but encode the part of cmd resource and
the divider into the variable name. This also make it obvious which
variant is used, making the code less error-prone.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 258 ++++++++++++++++++------------------
 1 file changed, 129 insertions(+), 129 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index bd6cb07b6154..dcac84614b06 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -115,8 +115,8 @@ static DEFINE_MUTEX(rpmh_clk_lock);
 	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_##div##_div, _res_name, \
 			  CLK_RPMH_ARC_EN_OFFSET, _res_on, _div)
 
-#define DEFINE_CLK_RPMH_VRM(_platform, _name, _res_name, _div)		\
-	__DEFINE_CLK_RPMH(_platform, _name, _name, _res_name,		\
+#define DEFINE_CLK_RPMH_VRM(_name, _suffix, _res_name, _div)		\
+	__DEFINE_CLK_RPMH(clk_rpmh, _name, _name##_suffix, _res_name,	\
 			  CLK_RPMH_VRM_EN_OFFSET, 1, _div)
 
 #define DEFINE_CLK_RPMH_BCM(_name, _res_name)				\
@@ -345,28 +345,28 @@ DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 2);
 DEFINE_CLK_RPMH_ARC(bi_tcxo, "xo.lvl", 0x3, 4);
 DEFINE_CLK_RPMH_ARC(qlink, "qphy.lvl", 0x1, 4);
 
-DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, "lnbclka1", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, "lnbclka2", 2);
-DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a2, "lnbclka1", 2);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a2, "lnbclka2", 2);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _a2, "lnbclka3", 2);
 
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, "lnbclka1", 4);
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, "lnbclka2", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk1, _a4, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _a4, "lnbclka2", 4);
 
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, "lnbclkg2", 4);
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, "lnbclkg3", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk2, _g4, "lnbclkg2", 4);
+DEFINE_CLK_RPMH_VRM(ln_bb_clk3, _g4, "lnbclkg3", 4);
 
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, "rfclka1", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, "rfclka2", 1);
-DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, "rfclka3", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, "rfclka4", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, "rfclka5", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk1, _a, "rfclka1", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk2, _a, "rfclka2", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk3, _a, "rfclka3", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _a, "rfclka4", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk5, _a, "rfclka5", 1);
 
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, "rfclkd2", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, "rfclkd3", 1);
-DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, "rfclkd4", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk1, _d, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk2, _d, "rfclkd2", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk3, _d, "rfclkd3", 1);
+DEFINE_CLK_RPMH_VRM(rf_clk4, _d, "rfclkd4", 1);
 
-DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, "divclka1", 2);
+DEFINE_CLK_RPMH_VRM(div_clk1, _div2, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(ce, "CE0");
@@ -377,16 +377,16 @@ DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
 static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
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
@@ -399,14 +399,14 @@ static const struct clk_rpmh_desc clk_rpmh_sdm845 = {
 static struct clk_hw *sdm670_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
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
@@ -419,10 +419,10 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 static struct clk_hw *sdx55_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
-	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
+	[RPMH_RF_CLK1]		= &clk_rpmh_rf_clk1_d.hw,
+	[RPMH_RF_CLK1_A]	= &clk_rpmh_rf_clk1_d_ao.hw,
+	[RPMH_RF_CLK2]		= &clk_rpmh_rf_clk2_d.hw,
+	[RPMH_RF_CLK2_A]	= &clk_rpmh_rf_clk2_d_ao.hw,
 	[RPMH_QPIC_CLK]		= &clk_rpmh_qpic_clk.hw,
 	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
@@ -435,16 +435,16 @@ static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
 static struct clk_hw *sm8150_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
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
@@ -455,14 +455,14 @@ static const struct clk_rpmh_desc clk_rpmh_sm8150 = {
 static struct clk_hw *sc7180_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sdm845_ln_bb_clk3_ao.hw,
-	[RPMH_RF_CLK1]		= &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdm845_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdm845_rf_clk2_ao.hw,
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
 
@@ -474,16 +474,16 @@ static const struct clk_rpmh_desc clk_rpmh_sc7180 = {
 static struct clk_hw *sc8180x_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
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
@@ -494,16 +494,16 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
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
@@ -514,20 +514,20 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 static struct clk_hw *sm8350_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
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
@@ -541,8 +541,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div2.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div2_ao.hw,
-	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
+	[RPMH_LN_BB_CLK3]       = &clk_rpmh_ln_bb_clk3_a2.hw,
+	[RPMH_LN_BB_CLK3_A]     = &clk_rpmh_ln_bb_clk3_a2_ao.hw,
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
@@ -556,18 +556,18 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
 static struct clk_hw *sm8450_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
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
 
@@ -579,14 +579,14 @@ static const struct clk_rpmh_desc clk_rpmh_sm8450 = {
 static struct clk_hw *sc7280_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]      = &clk_rpmh_bi_tcxo_div4.hw,
 	[RPMH_CXO_CLK_A]    = &clk_rpmh_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK2]   = &sdm845_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A] = &sdm845_ln_bb_clk2_ao.hw,
-	[RPMH_RF_CLK1]      = &sdm845_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]    = &sdm845_rf_clk1_ao.hw,
-	[RPMH_RF_CLK3]      = &sdm845_rf_clk3.hw,
-	[RPMH_RF_CLK3_A]    = &sdm845_rf_clk3_ao.hw,
-	[RPMH_RF_CLK4]      = &sm8350_rf_clk4.hw,
-	[RPMH_RF_CLK4_A]    = &sm8350_rf_clk4_ao.hw,
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
@@ -600,10 +600,10 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 static struct clk_hw *sm6350_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div4.hw,
 	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div4_ao.hw,
-	[RPMH_LN_BB_CLK2]	= &sm6350_ln_bb_clk2.hw,
-	[RPMH_LN_BB_CLK2_A]	= &sm6350_ln_bb_clk2_ao.hw,
-	[RPMH_LN_BB_CLK3]	= &sm6350_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]	= &sm6350_ln_bb_clk3_ao.hw,
+	[RPMH_LN_BB_CLK2]	= &clk_rpmh_ln_bb_clk2_g4.hw,
+	[RPMH_LN_BB_CLK2_A]	= &clk_rpmh_ln_bb_clk2_g4_ao.hw,
+	[RPMH_LN_BB_CLK3]	= &clk_rpmh_ln_bb_clk3_g4.hw,
+	[RPMH_LN_BB_CLK3_A]	= &clk_rpmh_ln_bb_clk3_g4_ao.hw,
 	[RPMH_QLINK_CLK]	= &clk_rpmh_qlink_div4.hw,
 	[RPMH_QLINK_CLK_A]	= &clk_rpmh_qlink_div4_ao.hw,
 };
@@ -616,16 +616,16 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 static struct clk_hw *sdx65_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &clk_rpmh_bi_tcxo_div4.hw,
 	[RPMH_CXO_CLK_A]        = &clk_rpmh_bi_tcxo_div4_ao.hw,
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
-- 
2.35.1

