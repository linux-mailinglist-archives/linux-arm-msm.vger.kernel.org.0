Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE8040A3FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Sep 2021 04:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238148AbhINC5g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Sep 2021 22:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238274AbhINC53 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Sep 2021 22:57:29 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C286C061767
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 19:56:10 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id g14so10782099pfm.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Sep 2021 19:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6z4EVDIxvmSYs4cCpIBDRML2cVV3ycANQaXgrnvaHVA=;
        b=n8Mu9j7bCyeMTYGI9pIjxvy3odYQeclkpbaZrvt1JTSq5xfTLG3GC7LmDlu8Zk0X6N
         2ldtcBmjJzh4MgEHX6IVA1IIrLkNT9uULW0uC4K6rdSocHsmdVWJj+9jxGqZt8iQ90H2
         3MKF/Tk5NVIN44zkuntaSbrwEGBdzUHjS8vu8SofW/a8I8ctAwBHiLCSzj5JCF7SCoDm
         DH2s5ASdoiaYM7+/A95a+D1XFP5dfKXw5RSWAtdsKce7Bjfj6S4Eevtka3OGH5hP5Otb
         3WvMJUH+noKd+kFXyjxm6szqFVM4u5XQRcnYZqp9eSOuDwihYUGXXDYT3yvVOiJeglLw
         xRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6z4EVDIxvmSYs4cCpIBDRML2cVV3ycANQaXgrnvaHVA=;
        b=p3EMSWdK1+3uwc/XZy4mUzQlYD5W6RD1efc5YoqzS+XpWhTUs//b8mP7ZzKRQZNzqZ
         Y3vhxBiv/cSn4o9DoB66gr/DNvGyDTC0JHeG7lBs+YeIcGAqrtKAmslqcq9iVZmkmVNm
         cKqFB51/RgIWNPN4p9D23z9UR1k24Owt5SUe6fDIF2q6j/aL4wSOtXkL5QkUOFI246pS
         kEd/i2qNhvW/Sf0/mPp/7zhFex7+3aYmCAJu7pWWhvETjvG233VhFzaUULl455eNqVUM
         htd/812Qown6HDDp3VG9J2BIYut71dGrOwI4msWw24GDZtpC8UnyAYP3kiuS18S0X/QJ
         zsGg==
X-Gm-Message-State: AOAM532hthCa3FqZzE5IurRbFvGguEqFKhJX1z2abqjJX3x+wCwKgea8
        QZHRI4d5cBU+RE5iJwwhUx5zVw==
X-Google-Smtp-Source: ABdhPJzC3x+I0MEv0MGE/RAvJa/uIw5x37Owv5ZIgE6dUGPKxVP9w7cNqh2CPbQ7lES7DKTzv4a1Fw==
X-Received: by 2002:a05:6a00:1396:b0:40d:bb7c:92d0 with SMTP id t22-20020a056a00139600b0040dbb7c92d0mr2620143pfg.38.1631588169776;
        Mon, 13 Sep 2021 19:56:09 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id r13sm9622654pgl.90.2021.09.13.19.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Sep 2021 19:56:09 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 3/3] clk: qcom: smd-rpm: Add QCM2290 RPM clock support
Date:   Tue, 14 Sep 2021 10:55:54 +0800
Message-Id: <20210914025554.5686-4-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210914025554.5686-1-shawn.guo@linaro.org>
References: <20210914025554.5686-1-shawn.guo@linaro.org>
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
index 2380e45b6247..428830d800f6 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -1070,6 +1070,64 @@ static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
 	.num_clks = ARRAY_SIZE(sm6115_clks),
 };
 
+/* QCM2290 */
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, ln_bb_clk2, ln_bb_clk2_a, 0x2);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(qcm2290, rf_clk3, rf_clk3_a, 6);
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
@@ -1082,6 +1140,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
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

