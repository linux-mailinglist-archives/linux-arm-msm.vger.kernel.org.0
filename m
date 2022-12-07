Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FD9864501E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:15:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbiLGAPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:15:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229728AbiLGAPK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:15:10 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12D64B990
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:15:08 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id f20so5919878lja.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83kG0jem/GFCi8sc/x0OqHU2E6B9xurjcMPcz8cdK+8=;
        b=O/OG2d2/ZOKcFk5Ypxg+oODFbp8nh7YP205kkzajCXpm+xfpOLoZcRf3MDNwM6Ga21
         dd7l0g5Y7fjheFXesE3P47jD23O8bRsruocTqXESi9qF/Fz7XNO1FVho9Abq6T3DzdW8
         OLrrueGUpbi3iPXz3hZrVQsaHff9Q22bIMrlK8WLcxJ1juDsNaKNsjg8E3CusH47OsyG
         0z1mRLCCKxfdSPGOWQ5GUN0zDMqGH1x8z3I712Spv6zSjCnqco3ON0LyHXKfd64bhc6R
         R5aRpX3VSIy2rNjpEOgpprCraBmJYwGVQ1R2lv5q7TaWyFjjKa7i5YwWBI/heiRiRjKL
         oeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83kG0jem/GFCi8sc/x0OqHU2E6B9xurjcMPcz8cdK+8=;
        b=jCdkY7xQfB8cFwhhITaSDkRkwueYcsxyaaISCZnHps5zs9WAVLFLxmYRA1628Mm7IZ
         GQtx/rtKesU50FZrvqgmmUz+kgUu5G9Iy5V0V7GZ2iHBQ4HpXhw67LpEXQc6aqSCc6DF
         oItPbBPbgCZMCO9xUaIJkK0c96UDu/ZcqCVJ+BWkZm9Y8wvhsjps/G5NwfQvsbJNLzzJ
         korj6WzxTTM6Y1U0DLdDfK7fB2JW4HQRSfsit/cHcJs9DhRFtgGM8ambkVq1GlTYCKza
         lB5jcb+P5nA85M2e0Bwx5tzrE6u+gCQQt3BquvR0aKZljD6p4wOGGnkKPRQUVRouKoJ0
         7Nzw==
X-Gm-Message-State: ANoB5pm0Jy18ZYO0NkcT93OA26uXQmDuYB1t2HsWczRSQx0duh4fWijs
        mqJZVOE6yTKrAgLPnU4e/ZhC7g==
X-Google-Smtp-Source: AA0mqf5n9B1weATYE4Gw6jHgpv7bLPVNmXdzpwf4mHKkt7N+Gg1flvSpjKgVFIHQ5tZm28P3gRZFjQ==
X-Received: by 2002:a2e:5cc:0:b0:279:f969:8b1 with SMTP id 195-20020a2e05cc000000b00279f96908b1mr3804520ljf.43.1670372107157;
        Tue, 06 Dec 2022 16:15:07 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 16:15:06 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 04/18] clk: qcom: smd-rpm: add missing ln_bb_clkN clocks
Date:   Wed,  7 Dec 2022 02:14:49 +0200
Message-Id: <20221207001503.93790-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
References: <20221207001503.93790-1-dmitry.baryshkov@linaro.org>
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

Newer platforms (msm8998, sdm660, sm6125) have low noise LN_BB_CLKn
clocks. The driver already uses proper clock indices
(RPM_SMD_LN_BB_CLKn). Fix clock names used by these platforms.

Fixes: a0384ecfe2aa ("clk: qcom: smd-rpm: De-duplicate identical entries")
Fixes: edeb2ca74716 ("clk: qcom: smd: Add support for SM6125 rpm clocks")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 44 ++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 31ef6345ff01..a0bf58785921 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -852,6 +852,10 @@ static const struct rpm_smd_clk_desc rpm_clk_qcs404 = {
 	.num_clks = ARRAY_SIZE(qcs404_clks),
 };
 
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk1, ln_bb_clk1_a, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk1_pin, ln_bb_clk1_a_pin, 1, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk2, ln_bb_clk2_a, 2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk2_pin, ln_bb_clk2_a_pin, 2, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(msm8998, ln_bb_clk3, ln_bb_clk3_a, 3, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(msm8998, ln_bb_clk3_pin, ln_bb_clk3_a_pin, 3, 19200000);
 DEFINE_CLK_SMD_RPM(msm8998, aggre1_noc_clk, aggre1_noc_a_clk,
@@ -882,16 +886,16 @@ static struct clk_smd_rpm *msm8998_clks[] = {
 	[RPM_SMD_DIV_A_CLK3] = &msm8992_div_clk3_a,
 	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
-	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
-	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
+	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
 	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
-	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
-	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
-	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
+	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
+	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
+	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
 	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
 	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
 	[RPM_SMD_MMAXI_CLK] = &msm8996_mmssnoc_axi_rpm_clk,
@@ -946,18 +950,18 @@ static struct clk_smd_rpm *sdm660_clks[] = {
 	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
 	[RPM_SMD_DIV_CLK1] = &msm8974_div_clk1,
 	[RPM_SMD_DIV_A_CLK1] = &msm8974_div_a_clk1,
-	[RPM_SMD_LN_BB_CLK] = &msm8916_bb_clk1,
-	[RPM_SMD_LN_BB_A_CLK] = &msm8916_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK] = &msm8998_ln_bb_clk1,
+	[RPM_SMD_LN_BB_A_CLK] = &msm8998_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
 	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
 	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
 	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8916_bb_clk1_pin,
-	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8916_bb_clk1_a_pin,
-	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8916_bb_clk2_pin,
-	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8916_bb_clk2_a_pin,
+	[RPM_SMD_LN_BB_CLK1_PIN] = &msm8998_ln_bb_clk1_pin,
+	[RPM_SMD_LN_BB_CLK1_A_PIN] = &msm8998_ln_bb_clk1_a_pin,
+	[RPM_SMD_LN_BB_CLK2_PIN] = &msm8998_ln_bb_clk2_pin,
+	[RPM_SMD_LN_BB_CLK2_A_PIN] = &msm8998_ln_bb_clk2_a_pin,
 	[RPM_SMD_LN_BB_CLK3_PIN] = &msm8998_ln_bb_clk3_pin,
 	[RPM_SMD_LN_BB_CLK3_A_PIN] = &msm8998_ln_bb_clk3_a_pin,
 };
@@ -1057,10 +1061,10 @@ static struct clk_smd_rpm *sm6125_clks[] = {
 	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_LN_BB_CLK1] = &msm8916_bb_clk1,
-	[RPM_SMD_LN_BB_CLK1_A] = &msm8916_bb_clk1_a,
-	[RPM_SMD_LN_BB_CLK2] = &msm8916_bb_clk2,
-	[RPM_SMD_LN_BB_CLK2_A] = &msm8916_bb_clk2_a,
+	[RPM_SMD_LN_BB_CLK1] = &msm8998_ln_bb_clk1,
+	[RPM_SMD_LN_BB_CLK1_A] = &msm8998_ln_bb_clk1_a,
+	[RPM_SMD_LN_BB_CLK2] = &msm8998_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &msm8998_ln_bb_clk2_a,
 	[RPM_SMD_LN_BB_CLK3] = &msm8998_ln_bb_clk3,
 	[RPM_SMD_LN_BB_CLK3_A] = &msm8998_ln_bb_clk3_a,
 	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
-- 
2.35.1

