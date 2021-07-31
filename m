Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C0383DC702
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jul 2021 18:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230196AbhGaQso (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Jul 2021 12:48:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbhGaQso (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Jul 2021 12:48:44 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08DCC0613CF;
        Sat, 31 Jul 2021 09:48:36 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id cf5so6533557edb.2;
        Sat, 31 Jul 2021 09:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q1MFcH6c+DonPzMNLJdNEMfmKur79QTm3SNLsc/PRaI=;
        b=WkLBYONFXai5ytZ5uRXwIlGQ/daacBXAd5teEbuOLWClT8+uVoVb5cGZpMFmPfxkBf
         ySh2QTvjLwG3+n9PwKjUO15fdtrqwmAY8ns6quRgrpsTOdxj6W0lABOnkI+Cj/egDdM1
         Gzp1cmeEESudNZsXHAZoxYyzXxc1hF+7IJ33dguzGEQS1kB/tT6EU9Cju1nDp1Nkyt3Z
         tZCgMC05/FKjjn69LhVT/FR0ijqxAHYMsWQt4JUx9XGi7m7a6bb9KVm0/JxXKNcZDM43
         8HpJhK+BAAiDnT72EkX8tZgfqxhVvLFGQiYiDXh6jIHOBPcY57pCnpYdy3LLeXnMj83K
         r1YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q1MFcH6c+DonPzMNLJdNEMfmKur79QTm3SNLsc/PRaI=;
        b=qtsVOdFzJPC2gSc8dv1B3cgKobqjCAjTvwkgg92j2w8AG5yZp8G7eGXfAtUGWOzMH5
         sIQXJ4t5F8Oe1iVUDh/grh9USMIrL8nPy+79330cuGwYOOIKEy3YWQBFWiRlbHCxV/f3
         ALatLrieTFPFD5UI55enNWSfV87dqhrrDHPRZ9yPGAf/QQdQ9ZTRv71MQELCszFKFnBk
         oWfiHhNc4j3WFTyj3qYPQUJOQ0URyJI0JtnVd5HxnSGZJnmwnIQ7VaujObkzMNDiHMDn
         BWQ9JrRrcbCWkNP630adYhhykKVvwsDrvKkmHeabQBZ+79RsYDYGjloHEbxyzr+MsF1b
         erGQ==
X-Gm-Message-State: AOAM533AiL2UMFmgEG+PYoVdOx9QCujnG0sXalh/JZrE+OWV2zzIGNTo
        LPYrYXSAtWIzeYEXG8PWuIQ=
X-Google-Smtp-Source: ABdhPJzGiCYp+tBhAi5VojM2RDNUX5nNtOJjHvnrXSOZQ7k7UJuVqmnX5WXy3RXyyHzg7aG2LXY3ww==
X-Received: by 2002:a50:a6d7:: with SMTP id f23mr9947650edc.164.1627750115482;
        Sat, 31 Jul 2021 09:48:35 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id br3sm1912871ejb.103.2021.07.31.09.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 09:48:35 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v3 1/2] clk: qcom: smd: Add support for SM6115 rpm clocks
Date:   Sat, 31 Jul 2021 19:48:26 +0300
Message-Id: <20210731164827.2756798-2-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210731164827.2756798-1-iskren.chernev@gmail.com>
References: <20210731164827.2756798-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add rpm smd clocks, PMIC and bus clocks which are required on
SM4250/6115 for clients to vote on.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 drivers/clk/qcom/clk-smd-rpm.c   | 54 ++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/smd-rpm.h |  1 +
 2 files changed, 55 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index b2c142f3a649..074bda407edf 100644
--- a/drivers/clk/qcom/clk-smd-rpm.c
+++ b/drivers/clk/qcom/clk-smd-rpm.c
@@ -913,6 +913,59 @@ static const struct rpm_smd_clk_desc rpm_clk_sdm660 = {
 	.num_clks = ARRAY_SIZE(sdm660_clks),
 };
 
+/* sm6115 */
+DEFINE_CLK_SMD_RPM(sm6115, cnoc_clk, cnoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6115, snoc_clk, snoc_a_clk, QCOM_SMD_RPM_BUS_CLK, 2);
+DEFINE_CLK_SMD_RPM_BRANCH(sm6115, qdss_clk, qdss_a_clk,
+					QCOM_SMD_RPM_MISC_CLK, 1, 19200000);
+DEFINE_CLK_SMD_RPM(sm6115, qup_clk, qup_a_clk, QCOM_SMD_RPM_QUP_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6115, mmnrt_clk, mmnrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6115, mmrt_clk, mmrt_a_clk, QCOM_SMD_RPM_MMAXI_CLK, 1);
+DEFINE_CLK_SMD_RPM(sm6115, snoc_periph_clk, snoc_periph_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 0);
+DEFINE_CLK_SMD_RPM(sm6115, snoc_lpass_clk, snoc_lpass_a_clk,
+						QCOM_SMD_RPM_BUS_CLK, 5);
+
+static struct clk_smd_rpm *sm6115_clks[] = {
+	[RPM_SMD_XO_CLK_SRC] = &sdm660_bi_tcxo,
+	[RPM_SMD_XO_A_CLK_SRC] = &sdm660_bi_tcxo_a,
+	[RPM_SMD_SNOC_CLK] = &sm6115_snoc_clk,
+	[RPM_SMD_SNOC_A_CLK] = &sm6115_snoc_a_clk,
+	[RPM_SMD_BIMC_CLK] = &msm8916_bimc_clk,
+	[RPM_SMD_BIMC_A_CLK] = &msm8916_bimc_a_clk,
+	[RPM_SMD_QDSS_CLK] = &sm6115_qdss_clk,
+	[RPM_SMD_QDSS_A_CLK] = &sm6115_qdss_a_clk,
+	[RPM_SMD_RF_CLK1] = &msm8916_rf_clk1,
+	[RPM_SMD_RF_CLK1_A] = &msm8916_rf_clk1_a,
+	[RPM_SMD_RF_CLK2] = &msm8916_rf_clk2,
+	[RPM_SMD_RF_CLK2_A] = &msm8916_rf_clk2_a,
+	[RPM_SMD_CNOC_CLK] = &sm6115_cnoc_clk,
+	[RPM_SMD_CNOC_A_CLK] = &sm6115_cnoc_a_clk,
+	[RPM_SMD_IPA_CLK] = &msm8976_ipa_clk,
+	[RPM_SMD_IPA_A_CLK] = &msm8976_ipa_a_clk,
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
+	[RPM_SMD_CE1_CLK] = &msm8992_ce1_clk,
+	[RPM_SMD_CE1_A_CLK] = &msm8992_ce1_a_clk,
+	[RPM_SMD_RF_CLK1_PIN] = &msm8916_rf_clk1_pin,
+	[RPM_SMD_RF_CLK1_A_PIN] = &msm8916_rf_clk1_a_pin,
+	[RPM_SMD_RF_CLK2_PIN] = &msm8916_rf_clk2_pin,
+	[RPM_SMD_RF_CLK2_A_PIN] = &msm8916_rf_clk2_a_pin,
+};
+
+static const struct rpm_smd_clk_desc rpm_clk_sm6115 = {
+	.clks = sm6115_clks,
+	.num_clks = ARRAY_SIZE(sm6115_clks),
+};
+
 static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8226", .data = &rpm_clk_msm8974 },
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
@@ -925,6 +978,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
+	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
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
2.32.0

