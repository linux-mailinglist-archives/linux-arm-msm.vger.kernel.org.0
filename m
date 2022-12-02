Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 490BE640E16
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Dec 2022 19:59:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234569AbiLBS70 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Dec 2022 13:59:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234729AbiLBS6s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Dec 2022 13:58:48 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 874F29D2F3
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Dec 2022 10:58:47 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id h10so6361286ljk.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Dec 2022 10:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+gzH+UjDtpSN2TBOm25RZHMYv/xwDs6O2i9cPC2mgCU=;
        b=UhHmd96tczjLHSDpP03ro8yOBQFf2t/GGvNogIXm9D78maEX8cO7ZgGu83JMGLDhrO
         BIryoV2oODh5vGFSnClfcobE366e0E357PLbh5CqDX5BeB4bkcauaOZ4q7+azk+y/bqg
         gYWOloVTpeV25+D4DUu8nbCziWKasXZmzX5BY6lIAiqYra+Dx5R+JO0Bj3UsJ1Kac3yH
         NFxajNP0tLdGSrd71gV0KUHVrjvvqBPNTYwe3Y7KlifbXy89c/XxPsIXyoEICdQ/39ac
         GNibe6TzTm9F/Z1owaB6aX04N8rxuB4R1d7F0C/JurI9IPQ5yhH/Vj8PhtJa8IqX35MT
         eQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+gzH+UjDtpSN2TBOm25RZHMYv/xwDs6O2i9cPC2mgCU=;
        b=YPRVsS6W9f6De8pUT2Y43NlN5z0JLwmuURrftacL3mbNIGt+jt8DanndwvYFCtPsZ3
         5/2gCcn6BoeqSxQHz5ClJkVkRFPOhJRcUgLNAiA9tb9JUz5XTaiqanDzU/MxGlZcLIX/
         K3U60uWn0CMS3yiUyLs8+pxDzK+hu77IzrJFk31H2hbqKZoXQs+y14qrs9DGJLsxmcu1
         g5fjnpUYsBe3tlHIV+Nq+pb/xyBB19DfKXTPw9Sf4p5np8sprB2hSpRb7GzrVJ/iBw44
         wk7d6yI8z5DdEXtFJqLwSTyK+6YjaKL5RAXbV5Bx1E+ArUTW0Jb7HU+nFbCsv97IAjre
         6Zww==
X-Gm-Message-State: ANoB5pmQl6I94aXTzugQGKe8bZkTcUy/9zREEvDwVx9C3uLKsuJLBex0
        giUUEi1SpInLcQ3UOpCcLM6Sag==
X-Google-Smtp-Source: AA0mqf6AjeGBFnIwSXCcJVT5XORC8F2hVlKUpZWAUZMYU2db5H+EsYR/fzT10n56RmPgVqg2Ho451g==
X-Received: by 2002:a2e:bcc1:0:b0:26d:cebe:3570 with SMTP id z1-20020a2ebcc1000000b0026dcebe3570mr18234892ljp.456.1670007525866;
        Fri, 02 Dec 2022 10:58:45 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q7-20020a056512210700b004b4a0482a53sm546529lfr.231.2022.12.02.10.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 10:58:45 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH v3 2/8] clk: qcom: rpmh: reuse common duplicate clocks
Date:   Fri,  2 Dec 2022 20:58:37 +0200
Message-Id: <20221202185843.721673-3-dmitry.baryshkov@linaro.org>
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

After the grouping it is obvious that some of the clock definitions are
pure duplicates. Rename them to use a single common name for the clock.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index f13c9bd610d0..c4852bbd00bf 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -350,9 +350,7 @@ DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
 DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
 DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
 DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
-DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
 
-DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
 DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
 DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
 
@@ -362,7 +360,6 @@ DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
-DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
 DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
 DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
 
@@ -370,14 +367,11 @@ DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
-DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
 
 DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
 
 DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
-DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
 DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
 DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
@@ -427,12 +421,12 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 static struct clk_hw *sdx55_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
-	[RPMH_RF_CLK1]		= &sdx55_rf_clk1.hw,
-	[RPMH_RF_CLK1_A]	= &sdx55_rf_clk1_ao.hw,
-	[RPMH_RF_CLK2]		= &sdx55_rf_clk2.hw,
-	[RPMH_RF_CLK2_A]	= &sdx55_rf_clk2_ao.hw,
+	[RPMH_RF_CLK1]		= &sc8180x_rf_clk1.hw,
+	[RPMH_RF_CLK1_A]	= &sc8180x_rf_clk1_ao.hw,
+	[RPMH_RF_CLK2]		= &sc8180x_rf_clk2.hw,
+	[RPMH_RF_CLK2_A]	= &sc8180x_rf_clk2_ao.hw,
 	[RPMH_QPIC_CLK]		= &sdx55_qpic_clk.hw,
-	[RPMH_IPA_CLK]		= &sdx55_ipa.hw,
+	[RPMH_IPA_CLK]		= &sdm845_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sdx55 = {
@@ -549,8 +543,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
-	[RPMH_LN_BB_CLK3]       = &sc8280xp_ln_bb_clk3.hw,
-	[RPMH_LN_BB_CLK3_A]     = &sc8280xp_ln_bb_clk3_ao.hw,
+	[RPMH_LN_BB_CLK3]       = &sdm845_ln_bb_clk3.hw,
+	[RPMH_LN_BB_CLK3_A]     = &sdm845_ln_bb_clk3_ao.hw,
 	[RPMH_IPA_CLK]          = &sdm845_ipa.hw,
 	[RPMH_PKA_CLK]          = &sm8350_pka.hw,
 	[RPMH_HWKM_CLK]         = &sm8350_hwkm.hw,
@@ -624,8 +618,8 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 static struct clk_hw *sdx65_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
-	[RPMH_LN_BB_CLK1]       = &sdx65_ln_bb_clk1.hw,
-	[RPMH_LN_BB_CLK1_A]     = &sdx65_ln_bb_clk1_ao.hw,
+	[RPMH_LN_BB_CLK1]       = &sm8450_ln_bb_clk1.hw,
+	[RPMH_LN_BB_CLK1_A]     = &sm8450_ln_bb_clk1_ao.hw,
 	[RPMH_RF_CLK1]          = &sdm845_rf_clk1.hw,
 	[RPMH_RF_CLK1_A]        = &sdm845_rf_clk1_ao.hw,
 	[RPMH_RF_CLK2]          = &sdm845_rf_clk2.hw,
-- 
2.35.1

