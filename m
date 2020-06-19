Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D116820027B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jun 2020 09:06:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgFSHGK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 19 Jun 2020 03:06:10 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:27596 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730254AbgFSHFr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 19 Jun 2020 03:05:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592550347; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=3IGSqQn8wPmBUvFPUqXdomMb9/avgVjdyjhP5K9XSGg=; b=HkfcmExMVTbbsVO9eiqXYKPL3OvrJCs+21zGUmk5YJmZYFINwLWjgGCBD41Qv4NdUP5vqpu2
 WcJsW+aREaE9lEg9LwOW9MDIge2FmEcRtYHjV3M0rU5gM/1+ev9XXy0jSYV+gdAfCuFOLCFu
 rKw7qNJkAXx6ZNfVwqnQxNC+eOA=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n14.prod.us-west-2.postgun.com with SMTP id
 5eec63ca6bebe35deb5418b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Jun 2020 07:05:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AF227C433A0; Fri, 19 Jun 2020 07:05:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C7154C43395;
        Fri, 19 Jun 2020 07:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C7154C43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, kathirav@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     sivaprak@codeaurora.org
Subject: [PATCH 6/6] regulator: qcom_smd: Add MP5496 regulators
Date:   Fri, 19 Jun 2020 12:35:07 +0530
Message-Id: <1592550307-11040-7-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592550307-11040-1-git-send-email-kathirav@codeaurora.org>
References: <1592550307-11040-1-git-send-email-kathirav@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

IPQ6018 SoC uses the PMIC MP5496. SMPA2 and LDOA2 regulator controls the
APSS and SDCC voltage scaling respectively. Add support for the same.

Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 drivers/regulator/qcom_smd-regulator.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index 53a64d8..e6d137a 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -198,6 +198,15 @@ static const struct regulator_ops rpm_bob_ops = {
 	.set_voltage = rpm_reg_set_voltage,
 };
 
+static const struct regulator_ops rpm_mp5496_ops = {
+	.enable = rpm_reg_enable,
+	.disable = rpm_reg_disable,
+	.is_enabled = rpm_reg_is_enabled,
+	.list_voltage = regulator_list_voltage_linear_range,
+
+	.set_voltage = rpm_reg_set_voltage,
+};
+
 static const struct regulator_desc pma8084_hfsmps = {
 	.linear_ranges = (struct linear_range[]) {
 		REGULATOR_LINEAR_RANGE(375000,  0,  95, 12500),
@@ -595,6 +604,24 @@ static const struct regulator_desc pms405_pldo600 = {
 	.ops = &rpm_smps_ldo_ops,
 };
 
+static const struct regulator_desc mp5496_smpa2 = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(725000, 0, 27, 12500),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 28,
+	.ops = &rpm_mp5496_ops,
+};
+
+static const struct regulator_desc mp5496_ldoa2 = {
+	.linear_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1800000, 0, 60, 25000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 61,
+	.ops = &rpm_mp5496_ops,
+};
+
 struct rpm_regulator_data {
 	const char *name;
 	u32 type;
@@ -603,6 +630,12 @@ struct rpm_regulator_data {
 	const char *supply;
 };
 
+static const struct rpm_regulator_data rpm_mp5496_regulators[] = {
+	{ "s2", QCOM_SMD_RPM_SMPA, 2, &mp5496_smpa2, "s2" },
+	{ "l2", QCOM_SMD_RPM_LDOA, 2, &mp5496_ldoa2, "l2" },
+	{}
+};
+
 static const struct rpm_regulator_data rpm_pm8841_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPB, 1, &pm8x41_hfsmps, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPB, 2, &pm8841_ftsmps, "vdd_s2" },
@@ -901,6 +934,7 @@ static const struct rpm_regulator_data rpm_pms405_regulators[] = {
 };
 
 static const struct of_device_id rpm_of_match[] = {
+	{ .compatible = "qcom,rpm-mp5496-regulators", .data = &rpm_mp5496_regulators },
 	{ .compatible = "qcom,rpm-pm8841-regulators", .data = &rpm_pm8841_regulators },
 	{ .compatible = "qcom,rpm-pm8916-regulators", .data = &rpm_pm8916_regulators },
 	{ .compatible = "qcom,rpm-pm8941-regulators", .data = &rpm_pm8941_regulators },
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

