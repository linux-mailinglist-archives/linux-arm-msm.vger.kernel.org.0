Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BF6C40F02D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 05:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243732AbhIQDGd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 16 Sep 2021 23:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243596AbhIQDGZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 16 Sep 2021 23:06:25 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA96DC0613E1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:05:00 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id y8so7784665pfa.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Sep 2021 20:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=DZDUsMljZO0ntC1FxaFERGklbdPaiu4ieAaqL5TQKnw=;
        b=yywAtefpd1NGSfYFvYO8+g7qs1Bz6/rJLtWzMWbzKJMc73W4/+e4dCbSaI686vOxoL
         wP2I8VF52ff7ONJr9dY9lgdb51XkcD/vHsyMnMRPwxPZ3mxO4xLbTsC9nKtRXS7kcjWS
         NZk70uVr2O2KOvMMk5pwhFn4LkA85Z9Lw+BplueUcUo2yx4nC+4Z2FdFFizsKybYSDaT
         z19Wg8oDf08nERuIqKXnu87iIyFO/aIzlJu1qROy4ihyBKQiJoAVT/aLYe3cgQ3L8sJY
         kBzRGR4myluv9QLSO80eKMdmaA7KAHg1/pGA3ewnOrLvrbEC4Q2tKXDZ4fuJCuwMAwxc
         hckA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=DZDUsMljZO0ntC1FxaFERGklbdPaiu4ieAaqL5TQKnw=;
        b=HnKBLb93bUUdx6fudR9QUbTtRvm+3PYTA43b9PlDLfdSvlZRuEdGP+lzIcnI2VkUv+
         zcv1h+b7N2oiRMvlbgjIPh2UKi2SZqS5Z4PsD9ruTCIsPQphRATCXX87ieyF+dW8kd7C
         97U+0OoEZ5dOF3pJ6KcOhiP9euV9Sy7Rsnhuz95hUyidYXY4CUvfixyzvrtthm1eH04T
         3qta1k/LCEMTTtfi6k7I4LiKaSuBgEQWq+4R3PzrPb+OiVicpOCMBK3/C+4WpsB/PUmd
         c4niNH3uv/sj9zf2ZVYun1h1CU5mSKnpTDTrfpCcZDUKzlb30TLH2F63J+v7m97rqIck
         gjGA==
X-Gm-Message-State: AOAM533rjrBkawBILgPftCYSTcu9Gdkc9HlEdbnNd6VTEjPVxQvTbla8
        /kMogVIK0zVqzp4vYVteqrXdPA==
X-Google-Smtp-Source: ABdhPJwcOxHfuFx2UqgMxpoowJIuCES3dEeDcKOfx1cXFMkkyzHO3NRxtEpb5iXsx0uJr4Z5v5WIxw==
X-Received: by 2002:a05:6a00:2184:b0:3f4:cac4:cf41 with SMTP id h4-20020a056a00218400b003f4cac4cf41mr8240481pfi.6.1631847900370;
        Thu, 16 Sep 2021 20:05:00 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id q2sm9133930pjo.27.2021.09.16.20.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 20:05:00 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 3/3] clk: qcom: smd-rpm: Add QCM2290 RPM clock support
Date:   Fri, 17 Sep 2021 11:04:34 +0800
Message-Id: <20210917030434.19859-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917030434.19859-1-shawn.guo@linaro.org>
References: <20210917030434.19859-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for RPM-managed clocks on the QCM2290 platform.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/clk/qcom/clk-smd-rpm.c         | 59 ++++++++++++++++++++++++++
 include/dt-bindings/clock/qcom,rpmcc.h |  6 +++
 include/linux/soc/qcom/smd-rpm.h       |  2 +
 3 files changed, 67 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index 8e16e4836424..0f896c7d4cfa 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1077,6 +1077,64 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 	.num_clks = ARRAY_SIZE(sm6115_clks),
 };
 
+/* QCM2290 */
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2, 19200000);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6, 38400000);
+
+DEFINE_CLK_SMD_RPM(qcm2290, qpic_clk, qpic_a_clk, QCOM_SMD_RPM_QPIC_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcm2290, hwkm_clk, hwkm_a_clk, QCOM_SMD_RPM_HWKM_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcm2290, pka_clk, pka_a_clk, QCOM_SMD_RPM_PKA_CLK, 0);
+DEFINE_CLK_SMD_RPM(qcm2290, cpuss_gnoc_clk, cpuss_gnoc_a_clk,
+		   QCOM_SMD_RPM_MEM_CLK, 1);
+DEFINE_CLK_SMD_RPM(qcm2290, bimc_gpu_clk, bimc_gpu_a_clk,
+		   QCOM_SMD_RPM_MEM_CLK, 2);
+
+static struct clk_smd_rpm *qcm2290_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &sm6125_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sm6125_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6125_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6125_qdss_a_clk,
+	[RPM_SMD_LN_BB_CLK2] = &qcm2290_ln_bb_clk2,
+	[RPM_SMD_LN_BB_CLK2_A] = &qcm2290_ln_bb_clk2_a,
+	[RPM_SMD_RF_CLK3] = &qcm2290_rf_clk3,
+	[RPM_SMD_RF_CLK3_A] = &qcm2290_rf_clk3_a,
+	[RPM_SMD_CNOC_CLK] = &sm6125_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sm6125_cnoc_a_clk,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
+	[RPM_SMD_QUP_CLK] = &sm6125_qup_clk,
+	[RPM_SMD_QUP_A_CLK] = &sm6125_qup_a_clk,
+	[RPM_SMD_MMRT_CLK] = &sm6125_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &sm6125_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &sm6125_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &sm6125_mmnrt_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6125_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6125_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &sm6125_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6125_snoc_lpass_a_clk,
+	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
+	[RPM_SMD_QPIC_CLK] = &qcm2290_qpic_clk,
+	[RPM_SMD_QPIC_CLK_A] = &qcm2290_qpic_a_clk,
+	[RPM_SMD_HWKM_CLK] = &qcm2290_hwkm_clk,
+	[RPM_SMD_HWKM_A_CLK] = &qcm2290_hwkm_a_clk,
+	[RPM_SMD_PKA_CLK] = &qcm2290_pka_clk,
+	[RPM_SMD_PKA_A_CLK] = &qcm2290_pka_a_clk,
+	[RPM_SMD_BIMC_GPU_CLK] = &qcm2290_bimc_gpu_clk,
+	[RPM_SMD_BIMC_GPU_A_CLK] = &qcm2290_bimc_gpu_a_clk,
+	[RPM_SMD_CPUSS_GNOC_CLK] = &qcm2290_cpuss_gnoc_clk,
+	[RPM_SMD_CPUSS_GNOC_A_CLK] = &qcm2290_cpuss_gnoc_a_clk,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_qcm2290 = {
+	.clks = qcm2290_clks,
+	.num_clks = ARRAY_SIZE(qcm2290_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-mdm9607", .data = &rpm_clk_mdm9607 },
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
@@ -1089,6 +1147,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8994", .data = &rpm_clk_msm8994 },
 	{ .compatible = "qcom,rpmcc-msm8996", .data = &rpm_clk_msm8996 },
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
+	{ .compatible = "qcom,rpmcc-qcm2290", .data = &rpm_clk_qcm2290 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
 	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
diff --git a/include/dt-bindings/clock/qcom,rpmcc.h b/include/dt-bindings/clock/qcom,rpmcc.h
index aa834d516234..fb624ff39273 100644
--- a/include/dt-bindings/clock/qcom,rpmcc.h
+++ b/include/dt-bindings/clock/qcom,rpmcc.h
@@ -159,5 +159,11 @@
 #define RPM_SMD_SNOC_PERIPH_A_CLK		113
 #define RPM_SMD_SNOC_LPASS_CLK			114
 #define RPM_SMD_SNOC_LPASS_A_CLK		115
+#define RPM_SMD_HWKM_CLK			116
+#define RPM_SMD_HWKM_A_CLK			117
+#define RPM_SMD_PKA_CLK				118
+#define RPM_SMD_PKA_A_CLK			119
+#define RPM_SMD_CPUSS_GNOC_CLK			120
+#define RPM_SMD_CPUSS_GNOC_A_CLK		121
 
 #endif
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 60e66fc9b6bf..860dd8cdf9f3 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -38,6 +38,8 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_IPA_CLK	0x617069
 #define QCOM_SMD_RPM_CE_CLK	0x6563
 #define QCOM_SMD_RPM_AGGR_CLK	0x72676761
+#define QCOM_SMD_RPM_HWKM_CLK	0x6d6b7768
+#define QCOM_SMD_RPM_PKA_CLK	0x616b70
 
 int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		       int state,
-- 
2.17.1

