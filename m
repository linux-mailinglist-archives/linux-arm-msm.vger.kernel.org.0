Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD78341878A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 10:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229998AbhIZIri (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 04:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229951AbhIZIri (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 04:47:38 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866A0C061604
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 01:46:02 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x4so2118297pln.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 01:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=ad+SGXOr75O4oi8AW9D35FvdvCg+d9KXZUgQG27xE7g=;
        b=Bjge5gm67WqADWQkGpgueTkutmwJdorUZ7HVPtzUFd8+zA95cFGf6cM/jXZLRQ/HCs
         8Ld3gqSIsw6d3z6LCUjrL3rbaYCn9Sj7m7ZG0XXCKcjO9lzdWrJ9tfIfA5/tnLOrhZVc
         6yRmdqnDwI8mdoBckQVIjNcd+nO9mMa1rsL+5QdpSkogaiL6bO2ejTGPSWtmn8/9vX9h
         +LfyTJNlyCFeLKVrtTg8PcfBkckX3XcGqjhaUYld0QnuTxC4pHmkhNmFvVGnmzcbPQRX
         do7pt/gW/mOWAeFOUiZL3nACKF89jzhHau9PWfWW6s4sZ+vAQKZzEjyZcsIuWh1WUgLS
         P95A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=ad+SGXOr75O4oi8AW9D35FvdvCg+d9KXZUgQG27xE7g=;
        b=PW9hxzgNJO0WpSNF9CVTgoLfvzWMdmeVGA53ZFaMHOtLmjN5qNFlbjXFgFlmqjGEsW
         kBCAtjKb6vWlOy7PkOdvUUfLMagAMQQOVZXOLcfjREQ5fZdNXloKPt3fQQiSfurp0WBg
         VgEjAh+EMdnnZu6u8vwOku3FAdTiUC9dl+7NC/+T1YukOoqF4jKrAiEaFyQxsXwEjUTB
         /nXZt4e3559ag44OGx7LDR5mcLuNZbIxo8W2OB2Tjn/RMp9QrMEg1um8BdM9589T/C+0
         JCwg4HnGb2dYVYmm7VA+U2IasWvyC6R3iQFNnzTO+ZYx160mlki+MNz0otOfo0joa3ho
         yt3w==
X-Gm-Message-State: AOAM531wiyVTICJnZdew69n628ADQncLP2Fy1q51u1s/zRPELhgpUTHs
        Qohdbd8h1FxmhVypTsRVWAMnFg==
X-Google-Smtp-Source: ABdhPJypYGuB0ypNrY7ewkowmmyTnaj/YBcgt0lcMSlNga+Pbx5C6PYw6nrsJfl4tnSZqwMpTSRF4Q==
X-Received: by 2002:a17:90a:1a4c:: with SMTP id 12mr12594574pjl.89.1632645962102;
        Sun, 26 Sep 2021 01:46:02 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id c7sm8940402pfc.104.2021.09.26.01.45.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 01:46:01 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 2/2] regulator: qcom_smd: Add PM2250 regulators
Date:   Sun, 26 Sep 2021 16:45:49 +0800
Message-Id: <20210926084549.29880-3-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210926084549.29880-1-shawn.guo@linaro.org>
References: <20210926084549.29880-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

PM2250 is commonly used with QCM2290/QCS2290 SoCs, and provides 4 SMPS
and 22 LDO regulators.  The LDO regulators are the same types found on
PM660.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/regulator/qcom_smd-regulator.c | 49 ++++++++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 198fcc6551f6..8bac024dde8b 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -738,6 +738,24 @@ static const struct regulator_desc mp5496_ldoa2 = {
 	.ops = &rpm_mp5496_ops,
 };
 
+static const struct regulator_desc pm2250_lvftsmps = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(320000, 0, 269, 4000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 270,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm2250_ftsmps = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(640000, 0, 269, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 270,
+	.ops = &rpm_smps_ldo_ops,
+};
+
 struct rpm_regulator_data {
 	const char *name;
 	u32 type;
@@ -1170,6 +1188,36 @@ static const struct rpm_regulator_data rpm_pms405_regulators[] = {
 	{}
 };
 
+static const struct rpm_regulator_data rpm_pm2250_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm2250_lvftsmps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm2250_lvftsmps, "vdd_s2" },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm2250_lvftsmps, "vdd_s3" },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm2250_ftsmps, "vdd_s4" },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm660_nldo660, "vdd_l1_l2_l3_l5_l6_l7_l8_l9_l10_l11_l12" },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm660_ht_lvpldo, "vdd_l13_l14_l15_l16" },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
+	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
+	{ "l20", QCOM_SMD_RPM_LDOA, 20, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
+	{ "l21", QCOM_SMD_RPM_LDOA, 21, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
+	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm660_pldo660, "vdd_l4_l17_l18_l19_l20_l21_l22" },
+	{}
+};
+
 static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-mp5496-regulators", .data = &rpm_mp5496_regulators },
 	{ .compatible = "qcom,rpm-pm8841-regulators", .data = &rpm_pm8841_regulators },
@@ -1186,6 +1234,7 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pmi8994-regulators", .data = &rpm_pmi8994_regulators },
 	{ .compatible = "qcom,rpm-pmi8998-regulators", .data = &rpm_pmi8998_regulators },
 	{ .compatible = "qcom,rpm-pms405-regulators", .data = &rpm_pms405_regulators },
+	{ .compatible = "qcom,rpm-pm2250-regulators", .data = &rpm_pm2250_regulators },
 	{}
 };
 MODULE_DEVICE_TABLE(of, rpm_of_match);
-- 
2.17.1

