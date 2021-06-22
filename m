Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB3CB3B0E97
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jun 2021 22:22:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhFVUY1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Jun 2021 16:24:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbhFVUYY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Jun 2021 16:24:24 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72DECC06175F;
        Tue, 22 Jun 2021 13:22:08 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id df12so493150edb.2;
        Tue, 22 Jun 2021 13:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IGxOTVhDeR7+VSK2BQTAkRHYfwpPBcI7fkcoGqIiLgQ=;
        b=YDN5u7cZPX8RNFIEiktPsd8SBpbGVy8BnWKD5e50kmFIZ7WMIN7JNK9m3tfKchEyYB
         pHGLg3faclltAr43ovZXew1217X3PdJhEM66U2LNWx9JPWsda8h2WpVbebUlGZMMgJtT
         A976YW8An4r5RW+mYIu2LNc1guH3sDvd4qjW7lU2580nP3C3g1aidXqt8gMzmI5dvmHO
         kQgrUlRLbrVXMiLwoZ6GnBRWvft2zAEzfxo/fSxP2drP0Yc0zCm3XYmsXtaTotUJJwx3
         oyTEum7ULk1ahq3CeLHlfFKmqXa2NkacimT8OAXL22KnzbZeRzjYzaulAd5lT1Ib6szh
         GI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGxOTVhDeR7+VSK2BQTAkRHYfwpPBcI7fkcoGqIiLgQ=;
        b=DH9A9PR1IjVNKCVXMlAJR704wSLdU7scBIRe5LOQgSlBjv18VxNARgTHHXdB8BVZz9
         kwcv73u2861c/Tt28P5qL2lpeSgoG2KBue/B5XU9zrmFoN17PUxVuswEOFU0+MqE84E9
         jJp5qjp7mrPfiEIRhSV2A3zfJCOqOg6tJRwMYXaum6mu+lwnsvZ8rUesTZCANj7Dv1cM
         b41qHMlwgOWcT6ezXn6uS7L59p4nE3ZgjjtdOH7x9p0Y++1h96MJFYllzanQ9kfK86Ox
         mZwKIZp4diiWc0+CSh0saen5B9Ww+ifDwY/g4TsoBPgrFgp+vq+QVQ0ldu5OyhP3z97s
         H6cw==
X-Gm-Message-State: AOAM530NR+ZC/7rXU61i9JqcTIu+1ILcouDOhrZ0jsJiNwwEAshartNm
        feaZ6WlPdWefydpGlVHq+7E=
X-Google-Smtp-Source: ABdhPJxCBnF5Gv4eUi2dnWB8zI03CNTt5ZN9+YJj9XqfuPlAHZ0/F5WqoIlB54zLs4mtCdbKr5oGsA==
X-Received: by 2002:a05:6402:3507:: with SMTP id b7mr7623583edd.66.1624393327092;
        Tue, 22 Jun 2021 13:22:07 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id dj24sm2431659edb.21.2021.06.22.13.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jun 2021 13:22:06 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v1 3/5] clk: qcom: smd: Add support for SM6115 rpm clocks
Date:   Tue, 22 Jun 2021 23:21:54 +0300
Message-Id: <20210622202156.546718-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622202156.546718-1-iskren.chernev@gmail.com>
References: <20210622202156.546718-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add rpm smd clocks, PMIC and bus clocks which are required on
SM4250/SM6115 for clients to vote on.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/clk/qcom/clk-smd-rpm.c   | 64 ++++++++++++++++++++++++++++++++
 drivers/soc/qcom/smd-rpm.c       |  2 +
 include/linux/soc/qcom/smd-rpm.h |  1 +
 3 files changed, 67 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index daf09dd61055..2c9de650bb63 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -913,6 +913,68 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 	.num_clks = ARRAY_SIZE(sdm660_clks),
 };
 
+/* sm6115 */
+DEFINE_CLK_SMD_RPM_BRANCH(sm6115, bi_tcxo, bi_tcxo_ao,
+					QCOM_SMD_RPM_MISC_CLK, 0, 19200000);
+DEFINE_CLK_SMD_RPM(sm6115, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6115, bimc_clk, bimc_a_clk, QCOM_SMD_RPM_MEM_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6115, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM_BRANCH(sm6115, qdss_clk, qdss_a_clk,
+					QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
+DEFINE_CLK_SMD_RPM(sm6115, ce1_clk, ce1_a_clk, QCOM_SMD_RPM_CE_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6115, ipa_clk, ipa_a_clk, QCOM_SMD_RPM_IPA_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6115, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6115, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6115, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6115, snoc_periph_clk, snoc_periph_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6115, snoc_lpass_clk, snoc_lpass_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6115, rf_clk1, rf_clk1_a, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER(sm6115, rf_clk2, rf_clk2_a, 5);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sm6115, rf_clk1_pin, rf_clk1_a_pin, 4);
+DEFINE_CLK_SMD_RPM_XO_BUFFER_PINCTRL(sm6115, rf_clk2_pin, rf_clk2_a_pin, 5);
+
+static struct clk_smd_rpm *sm6115_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &sm6115_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sm6115_bi_tcxo_ao,
+	[RPM_SMD_SNOC_CLK] = &sm6115_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sm6115_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &sm6115_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &sm6115_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6115_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6115_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &sm6115_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &sm6115_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &sm6115_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &sm6115_rf_clk2_a,
+	[RPM_SMD_CNOC_CLK] = &sm6115_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sm6115_cnoc_a_clk,
+	[RPM_SMD_IPA_CLK] = &sm6115_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &sm6115_ipa_a_clk,
+	[RPM_SMD_QUP_CLK] = &sm6115_qup_clk,
+	[RPM_SMD_QUP_A_CLK] = &sm6115_qup_a_clk,
+	[RPM_SMD_MMRT_CLK] = &sm6115_mmrt_clk,
+	[RPM_SMD_MMRT_A_CLK] = &sm6115_mmrt_a_clk,
+	[RPM_SMD_MMNRT_CLK] = &sm6115_mmnrt_clk,
+	[RPM_SMD_MMNRT_A_CLK] = &sm6115_mmnrt_a_clk,
+	[RPM_SMD_SNOC_PERIPH_CLK] = &sm6115_snoc_periph_clk,
+	[RPM_SMD_SNOC_PERIPH_A_CLK] = &sm6115_snoc_periph_a_clk,
+	[RPM_SMD_SNOC_LPASS_CLK] = &sm6115_snoc_lpass_clk,
+	[RPM_SMD_SNOC_LPASS_A_CLK] = &sm6115_snoc_lpass_a_clk,
+	[RPM_SMD_CE1_CLK] = &sm6115_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &sm6115_ce1_a_clk,
+	[RPM_SMD_RF_CLK1_PIN] = &sm6115_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &sm6115_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &sm6115_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &sm6115_rf_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
+	.clks = sm6115_clks,
+	.num_clks = ARRAY_SIZE(sm6115_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
@@ -924,6 +986,8 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
+	{ .compatible = "qcom,rpmcc-sm4250",  .data = &rpm_clk_sm6115  },
+	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index bc0be1d4be5f..83c844892643 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -242,6 +242,8 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-msm8996" },
 	{ .compatible = "qcom,rpm-msm8998" },
 	{ .compatible = "qcom,rpm-sdm660" },
+	{ .compatible = "qcom,rpm-sm4250" },
+	{ .compatible = "qcom,rpm-sm6115" },
 	{ .compatible = "qcom,rpm-sm6125" },
 	{ .compatible = "qcom,rpm-qcs404" },
 	{}
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index f2645ec52520..d350685039ad 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -37,6 +37,7 @@ struct qcom_smd_rpm;
 #define QCOM_SMD_RPM_IPA_CLK	0x617069
 #define QCOM_SMD_RPM_CE_CLK	0x6563
 #define QCOM_SMD_RPM_AGGR_CLK	0x72676761
+#define QCOM_SMD_RPM_QUP_CLK    0x00707571
 
 int qcom_rpm_smd_write(struct qcom_smd_rpm *rpm,
 		       int state,
-- 
2.31.1

