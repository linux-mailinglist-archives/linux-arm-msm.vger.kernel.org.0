Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 01BC263BDAD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Nov 2022 11:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230026AbiK2KMA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Nov 2022 05:12:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbiK2KLo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Nov 2022 05:11:44 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B57560EBD
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:10:28 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j16so21663959lfe.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Nov 2022 02:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Df4azlMoxK0hL9mQz9ccBsBEsIE5rHBzW9/Il0gb7J0=;
        b=TDHu2i7MPWX5cy6Qf7mbTVsf8eZYo9jG3oE/ED7u7Oxf9g1Yqyko5L1m1AB3RbLyrG
         /tyjPwrohr8bGwHYJULvixcUPKhRrugOzTmPVd3naj31UwpIwr/rHx0DDYneSujNFRPe
         tY57kSX6FXdnhZrIz/NZ09I/GOQ0knr3r43BqTqelm1+uMxoiMeWO98hiHF4YjzWtx5S
         8Yv5SeshoO8KcUNfPeU+v6e4mf/AkGSty19WGevuiZVfAQoufhaNpmZ31IC/X2S45+NJ
         PZx1O+E51tO0W1y+nl2/9Cq4jRuPB4qqfeo1gA3fOrZzUoVQxkmFkilx5H8OB062MfdL
         V0pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Df4azlMoxK0hL9mQz9ccBsBEsIE5rHBzW9/Il0gb7J0=;
        b=OcPwR6AG1Oo57h6TVwNsQpYCHMFNf6ecQCQb+fIhpGLuIj2Kb0qFQPhP3u2uycv3OD
         +akNbwF1ZNMC4y6Aw0glPTGG0eZOjTqAEo95S7HixXWo4kuMfVhFTOaZV0UPQUwFsSM2
         yyPfQoMAd512Oackg41QcsWvXF5WlXrk0o1HfkKfocG3C3ZbzW/eNhosMgzXE9wxVq0J
         JiC61ERUDLt0vl5fCqPw/i9cesHdJdOgtvnW9moaRRxwqxsLnkpQNbLf2BufOgd9IBps
         oD40bowjg+pTeMOxF2iPvH+e2tL8FCVj6qy9EpFectR7yBOSUGHdX0iejyXfCCQ6XuRS
         9E6Q==
X-Gm-Message-State: ANoB5plxQWkZWPeZdORS6NJhVUrhqLTGb/imRdKkrb+Jrz8/9AbF620I
        XtvrwI1gmvX9bNjUmLwn7aKAQg==
X-Google-Smtp-Source: AA0mqf4fnVylFQaDpD3D0UAZSCB7CPY5KLtN6lqbN9d/6ZUOBxoGvN2qI+mLdtZawv7Q97ObVZNdrw==
X-Received: by 2002:ac2:5f49:0:b0:4a4:7db1:b853 with SMTP id 9-20020ac25f49000000b004a47db1b853mr17933119lfz.562.1669716627337;
        Tue, 29 Nov 2022 02:10:27 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a12-20020ac25e6c000000b004b0a1e77cb2sm2146642lfr.137.2022.11.29.02.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 02:10:26 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Alex Elder <elder@linaro.org>
Subject: [PATCH 1/4] clk: qcom: rpmh: group clock definitions together
Date:   Tue, 29 Nov 2022 12:10:22 +0200
Message-Id: <20221129101025.960110-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
References: <20221129101025.960110-1-dmitry.baryshkov@linaro.org>
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

In preparations to the further changes, group all RPMH clock definitions
to ease review.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 55 ++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 1da45a6e2f29..f13c9bd610d0 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -342,19 +342,45 @@ static const struct clk_ops clk_rpmh_bcm_ops = {
 };
 
 /* Resource name must match resource id present in cmd-db */
+DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
 DEFINE_CLK_RPMH_ARC(sdm845, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 2);
+DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
+DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
+
+DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
 DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 2);
 DEFINE_CLK_RPMH_VRM(sdm845, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
+DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
+
+DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
+DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
+
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
+DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
+
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk1, rf_clk1_ao, "rfclka1", 1);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk2, rf_clk2_ao, "rfclka2", 1);
 DEFINE_CLK_RPMH_VRM(sdm845, rf_clk3, rf_clk3_ao, "rfclka3", 1);
 DEFINE_CLK_RPMH_VRM(sm8150, rf_clk3, rf_clk3_ao, "rfclka3", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
+DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
+
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk3, rf_clk3_ao, "rfclkd3", 1);
 DEFINE_CLK_RPMH_VRM(sc8180x, rf_clk4, rf_clk4_ao, "rfclkd4", 1);
+DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
+DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
+
+DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
+
 DEFINE_CLK_RPMH_BCM(sdm845, ipa, "IP0");
 DEFINE_CLK_RPMH_BCM(sdm845, ce, "CE0");
+DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
+DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
+DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
+DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
 
 static struct clk_hw *sdm845_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
@@ -398,11 +424,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdm670 = {
 	.num_clks = ARRAY_SIZE(sdm670_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sdx55, rf_clk1, rf_clk1_ao, "rfclkd1", 1);
-DEFINE_CLK_RPMH_VRM(sdx55, rf_clk2, rf_clk2_ao, "rfclkd2", 1);
-DEFINE_CLK_RPMH_BCM(sdx55, qpic_clk, "QP0");
-DEFINE_CLK_RPMH_BCM(sdx55, ipa, "IP0");
-
 static struct clk_hw *sdx55_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
@@ -478,8 +499,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8180x = {
 	.num_clks = ARRAY_SIZE(sc8180x_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sm8250, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 2);
-
 static struct clk_hw *sm8250_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
@@ -500,12 +519,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8250 = {
 	.num_clks = ARRAY_SIZE(sm8250_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sm8350, div_clk1, div_clk1_ao, "divclka1", 2);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk4, rf_clk4_ao, "rfclka4", 1);
-DEFINE_CLK_RPMH_VRM(sm8350, rf_clk5, rf_clk5_ao, "rfclka5", 1);
-DEFINE_CLK_RPMH_BCM(sm8350, pka, "PKA0");
-DEFINE_CLK_RPMH_BCM(sm8350, hwkm, "HK0");
-
 static struct clk_hw *sm8350_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
@@ -533,8 +546,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm8350 = {
 	.num_clks = ARRAY_SIZE(sm8350_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sc8280xp, ln_bb_clk3, ln_bb_clk3_ao, "lnbclka3", 2);
-
 static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sdm845_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sdm845_bi_tcxo_ao.hw,
@@ -550,12 +561,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
 	.num_clks = ARRAY_SIZE(sc8280xp_rpmh_clocks),
 };
 
-/* Resource name must match resource id present in cmd-db */
-DEFINE_CLK_RPMH_ARC(sc7280, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 4);
-
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
-DEFINE_CLK_RPMH_VRM(sm8450, ln_bb_clk2, ln_bb_clk2_ao, "lnbclka2", 4);
-
 static struct clk_hw *sm8450_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
@@ -600,10 +605,6 @@ static const struct clk_rpmh_desc clk_rpmh_sc7280 = {
 	.num_clks = ARRAY_SIZE(sc7280_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk2, ln_bb_clk2_ao, "lnbclkg2", 4);
-DEFINE_CLK_RPMH_VRM(sm6350, ln_bb_clk3, ln_bb_clk3_ao, "lnbclkg3", 4);
-DEFINE_CLK_RPMH_ARC(sm6350, qlink, qlink_ao, "qphy.lvl", 0x1, 4);
-
 static struct clk_hw *sm6350_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]		= &sc7280_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]	= &sc7280_bi_tcxo_ao.hw,
@@ -620,8 +621,6 @@ static const struct clk_rpmh_desc clk_rpmh_sm6350 = {
 	.num_clks = ARRAY_SIZE(sm6350_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_VRM(sdx65, ln_bb_clk1, ln_bb_clk1_ao, "lnbclka1", 4);
-
 static struct clk_hw *sdx65_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]          = &sc7280_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]        = &sc7280_bi_tcxo_ao.hw,
@@ -644,8 +643,6 @@ static const struct clk_rpmh_desc clk_rpmh_sdx65 = {
 	.num_clks = ARRAY_SIZE(sdx65_rpmh_clocks),
 };
 
-DEFINE_CLK_RPMH_ARC(qdu1000, bi_tcxo, bi_tcxo_ao, "xo.lvl", 0x3, 1);
-
 static struct clk_hw *qdu1000_rpmh_clocks[] = {
 	[RPMH_CXO_CLK]      = &qdu1000_bi_tcxo.hw,
 	[RPMH_CXO_CLK_A]    = &qdu1000_bi_tcxo_ao.hw,
-- 
2.35.1

