Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8B23B54EF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Jun 2021 20:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231678AbhF0TCE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Jun 2021 15:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231552AbhF0TCD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Jun 2021 15:02:03 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1E3C061574;
        Sun, 27 Jun 2021 11:59:37 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id g7so13293202wri.7;
        Sun, 27 Jun 2021 11:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yphiGsu/i0Tk9/PsGARAd5K0Qa9YrzmO9DI1dmt0gWY=;
        b=vU7uxxLoBZ/gFPXDm1qEqaWpaNymYDuX1nh2rGaF4caJlyjiZmjnLYiuvxHQmSGDQL
         w7TI3OKjDbrtQwdr+CD1VqjsJC0fiaPhhNVx6CJ8O/zf84jbxgxKbT5huXRuPXQIgJ0u
         JdlT/2x/D30AdpI7LNaCMF6ISufHjXcgBC6OiKZLo52xG45MrJj9yuURgWiqlOR7g1fS
         4bR5QX6T8BcC2wwkI7iWolm/5kc64JavdPHv2TG2qF2KZ2eQ2pBeoxMdoL7VH/XmCQU6
         tK3MEoX7JxU/gRaQpaV+Qxkfef2ahTrfHkgbJwgn9brb1BpiZmveySvtdyg0eRPpCtZw
         Cwww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yphiGsu/i0Tk9/PsGARAd5K0Qa9YrzmO9DI1dmt0gWY=;
        b=OUAJFu+088kXhpUzmXtBqcfMyRkEEYYdv/2KuARHo9Jv/FMAzMLNckxAJsY06nPd13
         NDSMPk7x5i0KS16SINz3V9TMFi4WV5QS4pm/q/PbWOvah+hKtCGbDNxD992n0ZV8pKvc
         RgPDJlETPzcJpR7lwscGKkItGwPtpbfi2JoxQ+UAQAZgz8moSsPjEBFJQMn8GnIn/xYM
         WNnVe01eI3h+w1vFaDyKdFlggmal0m5miAU50Yh+YTN7hmqvNvKHvQXDZW/aiybXY3Lt
         fqgu8DfThBDbdlvIGIhoTanS5fdRScGLEHILtJwLSwM3PCcdoqap7RpM3WKzzxIwJnvV
         g+TA==
X-Gm-Message-State: AOAM5339Drk/SGnh67Cp/Z7bUnpWodktbp6L/DyVr2AHHaHGorRHK+eq
        ljo83dRG5TRyvLOnatD+Sek=
X-Google-Smtp-Source: ABdhPJxn4Yi8Szqfo7IzZ8rD/LUGgi5wwtOUl0/eqzRX8eDFQM5ceHT7WXpB2V7FHaKYc4FE9VqDLg==
X-Received: by 2002:adf:b64b:: with SMTP id i11mr23219459wre.393.1624820376598;
        Sun, 27 Jun 2021 11:59:36 -0700 (PDT)
Received: from localhost (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id m67sm17215179wmm.17.2021.06.27.11.59.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Jun 2021 11:59:36 -0700 (PDT)
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
Subject: [PATCH v2 3/5] clk: qcom: smd: Add support for SM6115 rpm clocks
Date:   Sun, 27 Jun 2021 21:59:25 +0300
Message-Id: <20210627185927.695411-4-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210627185927.695411-1-iskren.chernev@gmail.com>
References: <20210627185927.695411-1-iskren.chernev@gmail.com>
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
 drivers/soc/qcom/smd-rpm.c       |  1 +
 include/linux/soc/qcom/smd-rpm.h |  1 +
 3 files changed, 56 insertions(+)

diff --git a/drivers/clk/qcom/clk-smd-rpm.c b/drivers/clk/qcom/clk-smd-rpm.c
index daf09dd61055..ae9f999cf342 100644
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
 	{ .compatible = "qcom,rpmcc-msm8916", .data = &rpm_clk_msm8916 },
 	{ .compatible = "qcom,rpmcc-msm8936", .data = &rpm_clk_msm8936 },
@@ -924,6 +977,7 @@ static const struct of_device_id rpm_smd_clk_match_table[] = {
 	{ .compatible = "qcom,rpmcc-msm8998", .data = &rpm_clk_msm8998 },
 	{ .compatible = "qcom,rpmcc-qcs404",  .data = &rpm_clk_qcs404  },
 	{ .compatible = "qcom,rpmcc-sdm660",  .data = &rpm_clk_sdm660  },
+	{ .compatible = "qcom,rpmcc-sm6115",  .data = &rpm_clk_sm6115  },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpm_smd_clk_match_table);
diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index bc0be1d4be5f..dfdd4f20f5fd 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -242,6 +242,7 @@ static const struct of_device_id qcom_smd_rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-msm8996" },
 	{ .compatible = "qcom,rpm-msm8998" },
 	{ .compatible = "qcom,rpm-sdm660" },
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
2.32.0

