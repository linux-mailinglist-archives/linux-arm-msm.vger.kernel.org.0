Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A3A64501B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 01:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbiLGAPK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 19:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiLGAPI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 19:15:08 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E7714AF11
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 16:15:08 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id bp15so26171314lfb.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 16:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xVwPaQWXDnANQ48vXa4DWtI+NXMXKWbnMhAHV1xHXeo=;
        b=Yei/59De/qKL8IocMhOskbLNJlIvb0Ll8NC/hH13n6zu2cgtUCLuxA5ZVQKzuB6Hy6
         HA2/YMVB0V3LZeHJeXrQl7iwbWahm0FEeUbhgpWSsQbMAGYnhPnNSq8zVTXLte4D73sD
         pQYkWY5be1wk4hi7TQB9t0XhSvzLCI6PHAFVBRdwOjylZlMKpHErRja97ukwOPielS8W
         sNhfSEX1HN1VMlV9F0hozICoD82mSTP+B0BpSnsbQ6IWqrb735F1fy0WOhHdMT0y7RKI
         58A/Lg5ei+2xkKSZ4gxKMocOxes/c6BA6EEYKh8mXb+OBwYX5zCYZwKSJFWcFNO6cHF7
         rGDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xVwPaQWXDnANQ48vXa4DWtI+NXMXKWbnMhAHV1xHXeo=;
        b=IWlTc0b8YFgtjJpVeyiCI9j2e35ZWml1px2Y97VuALw6Dk98wqzJxJwuK1Ntk72SXo
         aoPPmGEESYkLI73EFdT/iQIs2kJvAcXMlTzsAMtzpFByPRKhj5pZ+3wz8lI/isZgvtG7
         WBdc3sSzLFvMGYB+4frt67KCdkLKAHJLcRteZFf9PgNZXAm12znKeQRG9aKEdzAOuD8E
         XhL0WC9RjUu2BWSPoPA5SR/v+HGXDO18RXHhl1Pisd5a5MgiDTZ3fuisdF04ZL5/eMk5
         eEYC8Ia51a6UBAx36vo5sC6tLY+ws2Pxnms5ksCuohdcFOxlKOZPhnCON2pO0gk25X6d
         ECtg==
X-Gm-Message-State: ANoB5pmeaPzTlMHh152esZcD07zC8yy/ZITMliIlGCpDSY1WD+IKGpON
        2Fm4S7XqKQ65BYS9HVzFTljoxg==
X-Google-Smtp-Source: AA0mqf4PFPjrJJTV2hXBHAl8CCrzlXyEgG2lm3ksBfOZqki5/Qs/18NDQH5Yoj3nvpmhtOJpQrXeTA==
X-Received: by 2002:ac2:5f57:0:b0:4b5:8f72:d0f5 with SMTP id 23-20020ac25f57000000b004b58f72d0f5mr776473lfz.590.1670372106478;
        Tue, 06 Dec 2022 16:15:06 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 16-20020ac25f50000000b004b53eb60e3csm2308555lfz.256.2022.12.06.16.15.05
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
Subject: [PATCH v2 03/18] clk: qcom: smd-rpm: remove duplication between qcs404 and qcm2290 clocks
Date:   Wed,  7 Dec 2022 02:14:48 +0200
Message-Id: <20221207001503.93790-4-dmitry.baryshkov@linaro.org>
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

Reuse qcs404's QPIC and BIMC_GPU clock for qcm2290.

Fixes: 78b727d02815 ("clk: qcom: smd-rpm: Add QCM2290 RPM clock support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index ccc54913eca5..31ef6345ff01 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1168,11 +1168,8 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6375 = {
 DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
 DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
 
-DEFINE_CLK_SMD_RPM(qcm2290, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
 DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
 		   QCOM_SMD_RPM_MEM_CLK, 1);
-DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
-		   QCOM_SMD_RPM_MEM_CLK, 2);
 
 static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
@@ -1203,14 +1200,14 @@ static struct clk_smd_rpm *qcm2290_clks[] = {
 	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
 	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
 	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
-	[RPM_SMD_QPIC_CLK] = &qcm2290_qpic_clk,
-	[RPM_SMD_QPIC_CLK_A] = &qcm2290_qpic_a_clk,
+	[RPM_SMD_QPIC_CLK] = &qcs404_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &qcs404_qpic_a_clk,
 	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
 	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
 	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
 	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
-	[RPM_SMD_BIMC_GPU_CLK] = &qcm2290_bimc_gpu_clk,
-	[RPM_SMD_BIMC_GPU_A_CLK] = &qcm2290_bimc_gpu_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &qcs404_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &qcs404_bimc_gpu_a_clk,
 	[RPM_SMD_CPUSS_GNOC_CLK] = &qcm2290_cpuss_gnoc_clk,
 	[RPM_SMD_CPUSS_GNOC_A_CLK] = &qcm2290_cpuss_gnoc_a_clk,
 };
-- 
2.35.1

