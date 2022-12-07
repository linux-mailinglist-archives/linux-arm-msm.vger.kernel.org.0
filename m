Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EACF645023
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:15:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbiLGAPX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:15:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229821AbiLGAPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:15:20 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E634B9A4
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:15:10 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id y25so4014712lfa.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxHaJIeXQQoSGc51uH5qJc+u0gp2HhUHkG2li9+efwg=;
        b=yO4MSr1QT+5RgDmAHZLi7e37K4YnKME6s25JuBbbkiFmnQvTiMBoSh6fG7eHf+LJnY
         Dfqh3lHTQK7SU4BL+bgpJNmn3hPY3G8m0d8pIXwdwXHQUgADBRQJKm5fOAXsotdHQGjP
         9Pqd+6M3O2bELq6F03u0Nh7jevziyV3CGdpNg/W3rheNdEjDabb+4vTY7vBno0SXMu4f
         dDEYgOQ2KRjatijDQ4/wbYNHiA7622+cjdZlTru++ZGZzEgsAc0pFid7YfF1r8R6gh24
         Y74zI9ld0NDq5LBo0Q+Ul0437rour5AnD2qgaGla91Y4nxL5U23teuq8LDH2FG8CIEvE
         tB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxHaJIeXQQoSGc51uH5qJc+u0gp2HhUHkG2li9+efwg=;
        b=YkjnGSz38e/SC6i2a8RmYFBKwUEXub9Zu/BFIcqlzF7Ukya9WAV0kDxYSunfRcIFlk
         DLFJ8ykBpitFS7ZnVNaN48Yo21d37HFKstUooTl7pQD9a35zmZZmqFdN6l7BihAxL0wJ
         gE/Zma4jP3Ve7j+f1fRfpefu3qsWZ2SLNewgkzN37uckiurETsKR6k2oRKzBb5op8yQN
         YUipriDZ7hhn01E8C16x8R7Cjp3bZ3mRUm2PJMOzTUzfAeRMDXQaMt8W05pTyE2FuQef
         vzx/oJOGCE+L5KanUTuIv4EtHzoIBfoijBRW0pztT4AlvmsfpvtrHIeNVzcwP8Hhqlcv
         IqZA==
X-Gm-Message-State: ANoB5pk9Xpd1JWRQgAhqgaQWnv1Q7JAsk8SclhN+bOMXBHGQtg7KszDH
        AK4mxjcBdbtNddtCvQCmhxNLjw==
X-Google-Smtp-Source: AA0mqf4XQrWMVvVl7tzoYVCLGZb2dl0mNPCIHD9NXrmLHzQLCQqP3pbFapO+L+k/nsVdwvgQXITARQ==
X-Received: by 2002:a05:6512:3b13:b0:4b0:efed:e3a5 with SMTP id f19-20020a0565123b1300b004b0efede3a5mr32449636lfv.75.1670372108657;
        Tue, 06 Dec 2022 16:15:08 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:08 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 06/18] clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
Date:   Wed,  7 Dec 2022 02:14:51 +0200
Message-Id: <20221207001503.93790-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
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

For each of XO_BUFFER_PINCTRL clocks there is a corresponding XO_BUFFER clock
with the similar name (e.g. msm8998_ln_bb_clk3_pin vs
msm8998_ln_bb_clk3). For qcs404_ln_bb_clk_pin there is no
qcs404_ln_bb_clk, since the msm8992_ln_bb_clk was used instead (even for
qcs404 platform).

Follow the usual practice and rename msm8992_ln_bb_clk clocks to
qcs404_ln_bb_clk (and rename active-only clock in a similar way).

This is a preparation step for the next patch, which will merge
XO_BUFFER and XO_BUFFER_PINCTRL definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 7dffc30ddb61..add92ecd513d 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -635,7 +635,8 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8976 = {
 };
 
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, div_clk3, div_clk3_a, 13, 19200000);
-DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8992, ln_bb_clk, ln_bb_a_clk, 8, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcs404, ln_bb_clk, ln_bb_clk_a, 8, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8, 19200000);
 
 DEFINE_CLK_SMD_RPM(msm8992, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
 DEFINE_CLK_SMD_RPM(msm8992, ce2_clk, ce2_a_clk, QCOM_SMD_RPM_CE_CLK, 1);
@@ -673,8 +674,8 @@ static struct clk_smd_rpm *msm8992_clks[] = {
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
 	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
@@ -733,8 +734,8 @@ static struct clk_smd_rpm *msm8994_clks[] = {
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_MMSSNOC_AHB_CLK] = &msm8974_mmssnoc_ahb_clk,
 	[RPM_SMD_MMSSNOC_AHB_A_CLK] = &msm8974_mmssnoc_ahb_a_clk,
 	[RPM_SMD_MSS_CFG_AHB_CLK] = &msm8992_mss_cfg_ahb_clk,
@@ -798,8 +799,8 @@ static struct clk_smd_rpm *msm8996_clks[] = {
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
 	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
-	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
 	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
 	[RPM_SMD_DIV_CLK2] = &msm8974_div_clk2,
@@ -822,7 +823,6 @@ static const struct rpm_smd_clk_desc rpm_clk_msm8996 = {
 };
 
 DEFINE_CLK_SMD_RPM(qcs404, bimc_gpu_clk, bimc_gpu_a_clk, QCOM_SMD_RPM_MEM_CLK, 2);
-DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(qcs404, ln_bb_clk_pin, ln_bb_clk_a_pin, 8, 19200000);
 
 static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_QDSS_CLK] = &msm8916_qdss_clk,
@@ -841,8 +841,8 @@ static struct clk_smd_rpm *qcs404_clks[] = {
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
 	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
-	[RPM_SMD_LN_BB_CLK] = &msm8992_ln_bb_clk,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8992_ln_bb_a_clk,
+	[RPM_SMD_LN_BB_CLK] = &qcs404_ln_bb_clk,
+	[RPM_SMD_LN_BB_A_CLK] = &qcs404_ln_bb_clk_a,
 	[RPM_SMD_LN_BB_CLK_PIN] = &qcs404_ln_bb_clk_pin,
 	[RPM_SMD_LN_BB_A_CLK_PIN] = &qcs404_ln_bb_clk_a_pin,
 };
@@ -1014,8 +1014,8 @@ static struct clk_smd_rpm *msm8953_clks[] = {
 	[RPM_SMD_BB_CLK2_A]		= &msm8916_bb_clk2_a,
 	[RPM_SMD_RF_CLK2]		= &msm8916_rf_clk2,
 	[RPM_SMD_RF_CLK2_A]		= &msm8916_rf_clk2_a,
-	[RPM_SMD_RF_CLK3]		= &msm8992_ln_bb_clk,
-	[RPM_SMD_RF_CLK3_A]		= &msm8992_ln_bb_a_clk,
+	[RPM_SMD_RF_CLK3]		= &qcs404_ln_bb_clk,
+	[RPM_SMD_RF_CLK3_A]		= &qcs404_ln_bb_clk_a,
 	[RPM_SMD_DIV_CLK2]		= &msm8974_div_clk2,
 	[RPM_SMD_DIV_A_CLK2]		= &msm8974_div_a_clk2,
 	[RPM_SMD_BB_CLK1_PIN]		= &msm8916_bb_clk1_pin,
-- 
2.35.1

