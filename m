Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F2C94B9D35
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2019 11:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405562AbfIUJv1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Sep 2019 05:51:27 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44601 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405436AbfIUJv1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Sep 2019 05:51:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id i18so9056787wru.11
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Sep 2019 02:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NX5OSIPn5P4G+m7Kvbj+EXa/e5zf+0aUXiYf+I4+xpg=;
        b=iN44MZGhre8O2zbPZkc89lIMx7nJR4peTcJDwIxVLMu4Es7O5Z4qc9dBVu4mbFaEAD
         7Fovsg6Fr7awR7c50vduzk8Xjbw8TxvtyVYiOfsBwl8+aQ3NRr8ojMYwHxDyITgvm0Iz
         PG3PyL79hJO8vPV61mmJqZHtg3nyjbJhvnRr39KfdNAeh40o7EKuPc6juErz0n8m57/H
         kqwZEaDtF//79xXQNY/gynrcqfe8sTUf1fUjelW0CgYsi5MfXYjs5XT3n7jd6wU+twvz
         nFyDhOH4L+Cze32iRgpT4tepf8ITzW2itOMQEFR8kGNAhKqnX0CN8MgQhNGXYWPfJeh9
         tcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NX5OSIPn5P4G+m7Kvbj+EXa/e5zf+0aUXiYf+I4+xpg=;
        b=b3D6km4w9aNcDPuUxAXC/0VqhFsd4DNepKiofTthX6yyIvxR7y2vepVfL5oiu23aUd
         O7Bz18I1hSk7R4WPYt0PHChQnXGZUuMpKPwMRklV3r10ZImiig7Xjkks9sEC+MP3GTI+
         nUPQ2gfLFvHBkmMDWsY7K3WD5whdCgYZGWl5iOZVj51rN5BiKO9OXjU4ccBtKAyk4DSC
         cmZaZH0AEkRJ4YXaiFyvZIvKP6NDOvjfHvSn0CgJPOSdokd49rAry3iO/VEfRx8MO6gE
         H+XhRueVnwwlMAu6mngodnt+0p5ce8t3O/+fsiWl8sMNV2/gkSSiosJkGSvtQ9iPF8Wk
         fXiw==
X-Gm-Message-State: APjAAAXZ1DQ0GhFMA1JcTz74BUU+ATUg/wCR4ECJNmAt6Scb0dg1XHGP
        kVWIbW4UIW3VO45j5Fhz77NeW6247Wc=
X-Google-Smtp-Source: APXvYqw8aSkPgi4t5JZsZWR1GPSMfZQ68hj3jG/9YJsuL4F3657INL0Tiaxn+Al0B04mgmtdWXd5vQ==
X-Received: by 2002:adf:e84c:: with SMTP id d12mr2405526wrn.373.1569059483423;
        Sat, 21 Sep 2019 02:51:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
        by smtp.gmail.com with ESMTPSA id c8sm4947094wrr.49.2019.09.21.02.51.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 21 Sep 2019 02:51:22 -0700 (PDT)
From:   kholk11@gmail.com
To:     linux-arm-msm@vger.kernel.org
Cc:     kholk11@gmail.com, marijns95@gmail.com, broonie@kernel.org,
        lgirdwood@gmail.com, mark.rutland@arm.com, robh+dt@kernel.org,
        lee.jones@linaro.org, agross@kernel.org
Subject: [PATCH 3/5] regulator: qcom_smd: Add PM8950 regulators
Date:   Sat, 21 Sep 2019 11:50:41 +0200
Message-Id: <20190921095043.62593-4-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190921095043.62593-1-kholk11@gmail.com>
References: <20190921095043.62593-1-kholk11@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: "Angelo G. Del Regno" <kholk11@gmail.com>

The PM8950 provides 6 SMPS regulators, of which 5 HFSMPS
and one FTSMPS2.5 (s5), and 23 LDOs.
Add these to the RPM regulator driver.

Signed-off-by: Angelo G. Del Regno <kholk11@gmail.com>
---
 .../regulator/qcom,smd-rpm-regulator.txt      | 21 +++++
 drivers/regulator/qcom_smd-regulator.c        | 92 +++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
index 45025b5b67f6..d126df043403 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
@@ -22,6 +22,7 @@ Regulator nodes are identified by their compatible:
 		    "qcom,rpm-pm8841-regulators"
 		    "qcom,rpm-pm8916-regulators"
 		    "qcom,rpm-pm8941-regulators"
+		    "qcom,rpm-pm8950-regulators"
 		    "qcom,rpm-pm8994-regulators"
 		    "qcom,rpm-pm8998-regulators"
 		    "qcom,rpm-pma8084-regulators"
@@ -54,6 +55,26 @@ Regulator nodes are identified by their compatible:
 	Definition: reference to regulator supplying the input pin, as
 		    described in the data sheet
 
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_s4-supply:
+- vdd_s4-supply:
+- vdd_s5-supply:
+- vdd_s6-supply:
+- vdd_l1_l19-supply:
+- vdd_l2_l23-supply:
+- vdd_l3-supply:
+- vdd_l4_l5_l6_l7_l16-supply:
+- vdd_l8_l11_l12_l17_l22-supply:
+- vdd_l9_l10_l13_l14_l15_l18-supply:
+- vdd_l20-supply:
+- vdd_l21-supply:
+	Usage: optional (pm8950 only)
+	Value type: <phandle>
+	Definition: reference to regulator supplying the input pin, as
+		    described in the data sheet
+
 - vdd_s1-supply:
 - vdd_s2-supply:
 - vdd_s3-supply:
diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 3b0828c79e2b..fff8d5fdef6a 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -338,6 +338,63 @@ static const struct regulator_desc pm8916_buck_hvo_smps = {
 	.ops = &rpm_smps_ldo_ops,
 };
 
+static const struct regulator_desc pm8950_hfsmps = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(375000, 0, 95, 12500),
+		REGULATOR_LINEAR_RANGE(1550000, 96, 127, 25000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 128,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8950_ftsmps2p5 = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(80000, 0, 255, 5000),
+		REGULATOR_LINEAR_RANGE(160000, 256, 460, 10000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 461,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8950_ult_nldo = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(375000, 0, 202, 12500),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 203,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8950_ult_pldo = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1750000, 0, 127, 12500),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 128,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8950_pldo_lv = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1500000, 0, 16, 25000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 17,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pm8950_pldo = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(975000, 0, 164, 12500),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 165,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+
 static const struct regulator_desc pm8994_hfsmps = {
 	.linear_ranges = (struct regulator_linear_range[]) {
 		REGULATOR_LINEAR_RANGE( 375000,  0,  95, 12500),
@@ -638,6 +695,40 @@ static const struct rpm_regulator_data rpm_pma8084_regulators[] = {
 	{}
 };
 
+static const struct rpm_regulator_data rpm_pm8950_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8950_hfsmps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8950_hfsmps, "vdd_s2" },
+	{ "s3", QCOM_SMD_RPM_SMPA, 3, &pm8950_hfsmps, "vdd_s3" },
+	{ "s4", QCOM_SMD_RPM_SMPA, 4, &pm8950_hfsmps, "vdd_s4" },
+	{ "s5", QCOM_SMD_RPM_SMPA, 5, &pm8950_ftsmps2p5, "vdd_s5" },
+	{ "s6", QCOM_SMD_RPM_SMPA, 6, &pm8950_hfsmps, "vdd_s6" },
+
+	{ "l1", QCOM_SMD_RPM_LDOA, 1, &pm8950_ult_nldo, "vdd_l1_l19" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &pm8950_ult_nldo, "vdd_l2_l23" },
+	{ "l3", QCOM_SMD_RPM_LDOA, 3, &pm8950_ult_nldo, "vdd_l3" },
+	{ "l4", QCOM_SMD_RPM_LDOA, 4, &pm8950_ult_pldo, "vdd_l4_l5_l6_l7_l16" },
+	{ "l5", QCOM_SMD_RPM_LDOA, 5, &pm8950_pldo_lv, "vdd_l4_l5_l6_l7_l16" },
+	{ "l6", QCOM_SMD_RPM_LDOA, 6, &pm8950_pldo_lv, "vdd_l4_l5_l6_l7_l16" },
+	{ "l7", QCOM_SMD_RPM_LDOA, 7, &pm8950_pldo_lv, "vdd_l4_l5_l6_l7_l16" },
+	{ "l8", QCOM_SMD_RPM_LDOA, 8, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22" },
+	{ "l9", QCOM_SMD_RPM_LDOA, 9, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18" },
+	{ "l10", QCOM_SMD_RPM_LDOA, 10, &pm8950_ult_nldo, "vdd_l9_l10_l13_l14_l15_l18"},
+	{ "l11", QCOM_SMD_RPM_LDOA, 11, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22"},
+	{ "l12", QCOM_SMD_RPM_LDOA, 12, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22"},
+	{ "l13", QCOM_SMD_RPM_LDOA, 13, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18"},
+	{ "l14", QCOM_SMD_RPM_LDOA, 14, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18"},
+	{ "l15", QCOM_SMD_RPM_LDOA, 15, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18"},
+	{ "l16", QCOM_SMD_RPM_LDOA, 16, &pm8950_ult_pldo, "vdd_l4_l5_l6_l7_l16"},
+	{ "l17", QCOM_SMD_RPM_LDOA, 17, &pm8950_ult_pldo, "vdd_l8_l11_l12_l17_l22"},
+	{ "l18", QCOM_SMD_RPM_LDOA, 18, &pm8950_ult_pldo, "vdd_l9_l10_l13_l14_l15_l18"},
+	{ "l19", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l1_l19"},
+	{ "l20", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l20"},
+	{ "l21", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l21"},
+	{ "l22", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l8_l11_l12_l17_l22"},
+	{ "l23", QCOM_SMD_RPM_LDOA, 18, &pm8950_pldo, "vdd_l2_l23"},
+	{}
+};
+
 static const struct rpm_regulator_data rpm_pm8994_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8994_ftsmps, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8994_ftsmps, "vdd_s2" },
@@ -767,6 +858,7 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm8841-regulators", .data = &rpm_pm8841_regulators },
 	{ .compatible = "qcom,rpm-pm8916-regulators", .data = &rpm_pm8916_regulators },
 	{ .compatible = "qcom,rpm-pm8941-regulators", .data = &rpm_pm8941_regulators },
+	{ .compatible = "qcom,rpm-pm8950-regulators", .data = &rpm_pm8950_regulators },
 	{ .compatible = "qcom,rpm-pm8994-regulators", .data = &rpm_pm8994_regulators },
 	{ .compatible = "qcom,rpm-pm8998-regulators", .data = &rpm_pm8998_regulators },
 	{ .compatible = "qcom,rpm-pma8084-regulators", .data = &rpm_pma8084_regulators },
-- 
2.21.0

