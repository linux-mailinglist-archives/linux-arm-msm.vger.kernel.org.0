Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54E0D6486D4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Dec 2022 17:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiLIQtH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Dec 2022 11:49:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229804AbiLIQtE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Dec 2022 11:49:04 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43F5093A68
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Dec 2022 08:49:02 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id s10so5521402ljg.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Dec 2022 08:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8q0JRQ1obld3O/OMViNyWwOGVgTlvOUPQJ1Jtx+36A=;
        b=dl4wRkH7wkdSBF0FzRtmSxDU7H1Zub3YqVbQEG4LzSGq1Zjy5QomSbsIWQ+wV3eN9o
         JGTrTKrmG6/sd3P2drlC6cprrvqXueJ7b3P1cBrMJa6QoqNsvWhFhqQDD48OMOW/YRhE
         4I0U8VY1UCG4zS41ws1/DqJMESTKzj/Uqdnl/ZGBhEfc/6tkDqsAN14TmViIL2xqr6XQ
         1mCA4YSP28yE6nW8HaKYF642+Zbb404IyKzo5eX/fozjdaF94M+aQpko6Smm5VYVRgmD
         A9hThD/+qqfH47V4qKSQXJItK9jTxxht0iMV2H74MjWVtCPve4AB1yGz/8e8PWRu7pv2
         PeCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8q0JRQ1obld3O/OMViNyWwOGVgTlvOUPQJ1Jtx+36A=;
        b=cyLP8E6Ly6CaYR8CHY2SVEPketQRhMyr7dbjXM4cFiFdsivy4RzMrX4bXxHF8c+b4c
         L0IQKwPXPpRJBc6VePoub19mFzHXzN6MCiaMTCKpB9e/Ur/Yh6RIiTi2gt1KzKSNuuuz
         gzW7ZO52YvVWXo+ZL8Xp8pzqtUZhlsxqarnICVhek+NC3jSQqlHqEza0F1wKK3JLDuGt
         MLsHTTXUvwWf/M6y0Bqn37Ym4d0kEpOFf7QjRUL/dD50uqTK8Ngp8QaR1niq8LQxRYvr
         1taqzXxR0oYGgU5eCMfhLZrhjajZI3YiFLHpRjUUJiD+Y+cgAuv3YmK53VGU+0hJKPVd
         V6gw==
X-Gm-Message-State: ANoB5ply4u1GYJNTAuhKu89Eg0YfMT0NAtdE9eg62neFHc5m+KNu5DhU
        e9t7lWXsO5eAB2kcnn9P4Wz5fw==
X-Google-Smtp-Source: AA0mqf67fpFiJbVVaWbSj2SQRdfTcl5540prvWN+S4/2vzdSp/wWykVHsYpja2K6V6lDTHktIymnAw==
X-Received: by 2002:a05:651c:1994:b0:277:37f1:260f with SMTP id bx20-20020a05651c199400b0027737f1260fmr2253344ljb.34.1670604541847;
        Fri, 09 Dec 2022 08:49:01 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y2-20020a05651c106200b002770fb5722fsm275242ljm.123.2022.12.09.08.49.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 08:49:01 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [PATCH v3 07/19] clk: qcom: smd-rpm: rename msm8992_ln_bb_* clocks to qcs404_ln_bb_*
Date:   Fri,  9 Dec 2022 18:48:43 +0200
Message-Id: <20221209164855.128798-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
References: <20221209164855.128798-1-dmitry.baryshkov@linaro.org>
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
Reviewed-by: Alex Elder <elder@linaro.org>
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

