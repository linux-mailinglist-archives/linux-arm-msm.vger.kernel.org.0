Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB798370B64
	for <lists+linux-arm-msm@lfdr.de>; Sun,  2 May 2021 13:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232176AbhEBLyi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 2 May 2021 07:54:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232166AbhEBLyi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 2 May 2021 07:54:38 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CDDFC06174A
        for <linux-arm-msm@vger.kernel.org>; Sun,  2 May 2021 04:53:47 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id f24so3755826ejc.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 May 2021 04:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kLZRS6xLdXCHFPyFw/CKeSsIUfpwtnMkQJdLEnE9b74=;
        b=cCyPSrS9YnMEUL5SKK3suBuQidAfeHspCw+UGMMogzqbbxbZVJowe/mO2A5dRGf9Xb
         wDnGaRmiJPXdrcKsjdDEe4vUXnWOs/mgaZ7x5zVMRBUBZ7lXcOilADhJSMFg5kmdwVfI
         yiDJXeTQ8ZT3y/YNvxaTBWa8PnsXd/menZop84OnEGKwVKkWq9sr6P9UufAVvrYlKLq+
         ARBTNx79YKTpMBYkPhU/xW6t5SFX4ONHnT+NQbaToAW50ok7bwkRzaXThWD6qSDlBBsb
         YRXvVe2AW83T7psGLp0YXxfZAITZzW2GJ49uyFcE8AqbzRzkNPPZ+qoyhUcIL1IV7lq+
         eg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kLZRS6xLdXCHFPyFw/CKeSsIUfpwtnMkQJdLEnE9b74=;
        b=CrVW2N2+qO5nasSZg9YFjrxc0hBsWFOZ4B4xr/D8B8W9nKmm66Sq1TyQ3OjWvKNQxS
         jclxoXSW8nGdOJa7PjwU36QyVSgOdfm4QkFVyRNYWvxKZIMSXf3y3frqM4tvg9wx5BY0
         WOUkxtsNg7hVfbwo5zTUed7k64wGAq4+Zm1n+8tuzvlbiQINrEagYiAtBSuif33vOVon
         JjKWkbXMfqWJ7jPWWS46buHA/7QmPBzhVzgI+iTSFmf+Xsmwn6kHZ8ey22WxqZog/H5S
         2xqCsivGBxzyx+FWLvgc94Bbpw7fLZ8/nmpbxOwOIv8lyCsg7JbTKPH1kBjDH24JJClN
         SS9Q==
X-Gm-Message-State: AOAM531xkOc+z4SRI4HiavDoZFaXYmh/if6gpXLOcsE5GJyEk7EbEh+s
        OaXTDkVgr1s7MWIYwUHqIYIycHk2in4XSDw6
X-Google-Smtp-Source: ABdhPJwz8WwZw7eR5odne/FFBMzwoYovGBHTroekuaaDosdJwq5gNXsLi9WJ2+ETKVyNockpDdqTIA==
X-Received: by 2002:a17:907:6289:: with SMTP id nd9mr12128307ejc.384.1619956425759;
        Sun, 02 May 2021 04:53:45 -0700 (PDT)
Received: from PackardBell (192038133011.mbb.telenor.dk. [192.38.133.11])
        by smtp.googlemail.com with ESMTPSA id mp36sm8598075ejc.48.2021.05.02.04.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 May 2021 04:53:45 -0700 (PDT)
Received: from localhost (PackardBell [local])
        by PackardBell (OpenSMTPD) with ESMTPA id 0c0b6556;
        Sun, 2 May 2021 11:53:35 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kathiravan T <kathirav@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH 2/2] regulator: qcom_smd: Add PM8226 regulator support
Date:   Sun,  2 May 2021 13:53:04 +0200
Message-Id: <20210502115304.8570-2-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502115304.8570-1-bartosz.dudziak@snejp.pl>
References: <20210502115304.8570-1-bartosz.dudziak@snejp.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for PM8226 regulator which is commonly used with MSM8226 SoCs.

Signed-off-by: Bartosz Dudziak <bartosz.dudziak@snejp.pl>
---
 drivers/regulator/qcom_smd-regulator.c | 83 ++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index bb944ee5fe..05df7b00e3 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -251,6 +251,50 @@ static const struct regulator_desc pma8084_switch = {
 	.ops = &rpm_switch_ops,
 };
 
+static const struct regulator_desc pm8226_hfsmps = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(375000,   0,  95, 12500),
+		REGULATOR_LINEAR_RANGE(1575000, 96, 158, 25000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 159,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8226_ftsmps = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(350000,    0, 184,  5000),
+		REGULATOR_LINEAR_RANGE(1280000, 185, 261, 10000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 262,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8226_pldo = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(750000,    0,  63, 12500),
+		REGULATOR_LINEAR_RANGE(1550000,  64, 126, 25000),
+		REGULATOR_LINEAR_RANGE(3100000, 127, 163, 50000),
+	},
+	.n_linear_ranges = 3,
+	.n_voltages = 164,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8226_nldo = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(750000, 0, 63, 12500),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 64,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8226_switch = {
+	.ops = &rpm_switch_ops,
+};
+
 static const struct regulator_desc pm8x41_hfsmps = {
 	.linear_ranges = (struct linear_range[]) {
 		REGULATOR_LINEAR_RANGE( 375000,  0,  95, 12500),
@@ -746,6 +790,44 @@ static const struct rpm_regulator_data rpm_pm8916_regulators[] = {
 	{}
 };
 
+static const struct rpm_regulator_data rpm_pm8226_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8226_hfsmps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8226_ftsmps, "vdd_s2" },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm8226_hfsmps, "vdd_s3" },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm8226_hfsmps, "vdd_s4" },
+	{ "s5", QCOM_SMD_RPM_SMPA, 5, &pm8226_hfsmps, "vdd_s5" },
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm8226_nldo, "vdd_l1_l2_l4_l5" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm8226_nldo, "vdd_l1_l2_l4_l5" },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm8226_nldo, "vdd_l3_l24_l26" },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm8226_nldo, "vdd_l1_l2_l4_l5" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm8226_nldo, "vdd_l1_l2_l4_l5" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm8226_pldo, "vdd_l6_l7_l8_l9_l27" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm8226_pldo, "vdd_l6_l7_l8_l9_l27" },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm8226_pldo, "vdd_l6_l7_l8_l9_l27" },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm8226_pldo, "vdd_l6_l7_l8_l9_l27" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm8226_pldo, "vdd_l10_l11_l13" },
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm8226_pldo, "vdd_l10_l11_l13" },
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm8226_pldo, "vdd_l12_l14" },
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm8226_pldo, "vdd_l10_l11_l13" },
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm8226_pldo, "vdd_l12_l14" },
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm8226_pldo, "vdd_l15_l16_l17_l18" },
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm8226_pldo, "vdd_l15_l16_l17_l18" },
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm8226_pldo, "vdd_l15_l16_l17_l18" },
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm8226_pldo, "vdd_l15_l16_l17_l18" },
+	{ "l19", QCOM_SMD_RPM_LDOA, 19, &pm8226_pldo, "vdd_l19_l20_l21_l22_l23_l28" },
+	{ "l20", QCOM_SMD_RPM_LDOA, 20, &pm8226_pldo, "vdd_l19_l20_l21_l22_l23_l28" },
+	{ "l21", QCOM_SMD_RPM_LDOA, 21, &pm8226_pldo, "vdd_l19_l20_l21_l22_l23_l28" },
+	{ "l22", QCOM_SMD_RPM_LDOA, 22, &pm8226_pldo, "vdd_l19_l20_l21_l22_l23_l28" },
+	{ "l23", QCOM_SMD_RPM_LDOA, 23, &pm8226_pldo, "vdd_l19_l20_l21_l22_l23_l28" },
+	{ "l24", QCOM_SMD_RPM_LDOA, 24, &pm8226_nldo, "vdd_l3_l24_l26" },
+	{ "l25", QCOM_SMD_RPM_LDOA, 25, &pm8226_pldo, "vdd_l25" },
+	{ "l26", QCOM_SMD_RPM_LDOA, 26, &pm8226_nldo, "vdd_l3_l24_l26" },
+	{ "l27", QCOM_SMD_RPM_LDOA, 27, &pm8226_pldo, "vdd_l6_l7_l8_l9_l27" },
+	{ "l28", QCOM_SMD_RPM_LDOA, 28, &pm8226_pldo, "vdd_l19_l20_l21_l22_l23_l28" },
+	{ "lvs1", QCOM_SMD_RPM_VSA, 1, &pm8226_switch, "vdd_lvs1" },
+	{}
+};
+
 static const struct rpm_regulator_data rpm_pm8941_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8x41_hfsmps, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8x41_hfsmps, "vdd_s2" },
@@ -1092,6 +1174,7 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-mp5496-regulators", .data = &rpm_mp5496_regulators },
 	{ .compatible = "qcom,rpm-pm8841-regulators", .data = &rpm_pm8841_regulators },
 	{ .compatible = "qcom,rpm-pm8916-regulators", .data = &rpm_pm8916_regulators },
+	{ .compatible = "qcom,rpm-pm8226-regulators", .data = &rpm_pm8226_regulators },
 	{ .compatible = "qcom,rpm-pm8941-regulators", .data = &rpm_pm8941_regulators },
 	{ .compatible = "qcom,rpm-pm8950-regulators", .data = &rpm_pm8950_regulators },
 	{ .compatible = "qcom,rpm-pm8953-regulators", .data = &rpm_pm8953_regulators },
-- 
2.25.1

