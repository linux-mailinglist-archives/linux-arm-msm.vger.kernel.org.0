Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C41E1917B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2020 18:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgCXRcp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 24 Mar 2020 13:32:45 -0400
Received: from foss.arm.com ([217.140.110.172]:38756 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727487AbgCXRco (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 24 Mar 2020 13:32:44 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0727B1FB;
        Tue, 24 Mar 2020 10:32:44 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 749413F71F;
        Tue, 24 Mar 2020 10:32:43 -0700 (PDT)
Date:   Tue, 24 Mar 2020 17:32:41 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "regulator: qcom_smd: Add pmi8994 regulator support" to the regulator tree
In-Reply-To:  <20200324041424.518160-1-bjorn.andersson@linaro.org>
Message-Id:  <applied-20200324041424.518160-1-bjorn.andersson@linaro.org>
X-Patchwork-Hint: ignore
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom_smd: Add pmi8994 regulator support

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 86332c343491c6d2228a1e0c80b1ea98a2653d20 Mon Sep 17 00:00:00 2001
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Date: Mon, 23 Mar 2020 21:14:24 -0700
Subject: [PATCH] regulator: qcom_smd: Add pmi8994 regulator support

The pmi8994 is commonly found on MSM8996 based devices, such as the
Dragonboard 820c, where it supplies power to a number of LDOs on the
primary PMIC.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Link: https://lore.kernel.org/r/20200324041424.518160-1-bjorn.andersson@linaro.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 .../regulator/qcom,smd-rpm-regulator.txt      | 13 +++++
 drivers/regulator/qcom_smd-regulator.c        | 47 +++++++++++++++++++
 include/linux/soc/qcom/smd-rpm.h              |  1 +
 3 files changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
index d126df043403..dea4384f4c03 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/qcom,smd-rpm-regulator.txt
@@ -26,6 +26,7 @@ Regulator nodes are identified by their compatible:
 		    "qcom,rpm-pm8994-regulators"
 		    "qcom,rpm-pm8998-regulators"
 		    "qcom,rpm-pma8084-regulators"
+		    "qcom,rpm-pmi8994-regulators"
 		    "qcom,rpm-pmi8998-regulators"
 		    "qcom,rpm-pms405-regulators"
 
@@ -143,6 +144,15 @@ Regulator nodes are identified by their compatible:
 	Definition: reference to regulator supplying the input pin, as
 		    described in the data sheet
 
+- vdd_s1-supply:
+- vdd_s2-supply:
+- vdd_s3-supply:
+- vdd_bst_byp-supply:
+	Usage: optional (pmi8994 only)
+	Value type: <phandle>
+	Definition: reference to regulator supplying the input pin, as
+		    described in the data sheet
+
 - vdd_s1-supply:
 - vdd_s2-supply:
 - vdd_s3-supply:
@@ -259,6 +269,9 @@ pma8084:
 	l6, l7, l8, l9, l10, l11, l12, l13, l14, l15, l16, l17, l18, l19, l20,
 	l21, l22, l23, l24, l25, l26, l27, lvs1, lvs2, lvs3, lvs4, 5vs1
 
+pmi8994:
+	s1, s2, s3, boost-bypass
+
 pmi8998:
 	bob
 
diff --git a/drivers/regulator/qcom_smd-regulator.c b/drivers/regulator/qcom_smd-regulator.c
index fff8d5fdef6a..fdde4195cefb 100644
--- a/drivers/regulator/qcom_smd-regulator.c
+++ b/drivers/regulator/qcom_smd-regulator.c
@@ -445,6 +445,44 @@ static const struct regulator_desc pm8994_lnldo = {
 	.ops = &rpm_smps_ldo_ops_fixed,
 };
 
+static const struct regulator_desc pmi8994_ftsmps = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(350000,  0, 199, 5000),
+		REGULATOR_LINEAR_RANGE(700000, 200, 349, 10000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 350,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pmi8994_hfsmps = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(350000,  0,  80, 12500),
+		REGULATOR_LINEAR_RANGE(700000, 81, 141, 25000),
+	},
+	.n_linear_ranges = 2,
+	.n_voltages = 142,
+	.ops = &rpm_smps_ldo_ops,
+};
+
+static const struct regulator_desc pmi8994_bby = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(3000000, 0, 44, 50000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 45,
+	.ops = &rpm_bob_ops,
+};
+
+static const struct regulator_desc pmi8994_boost = {
+	.linear_ranges = (struct regulator_linear_range[]) {
+		REGULATOR_LINEAR_RANGE(4000000, 0, 30, 50000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 31,
+	.ops = &rpm_smps_ldo_ops,
+};
+
 static const struct regulator_desc pm8998_ftsmps = {
 	.linear_ranges = (struct regulator_linear_range[]) {
 		REGULATOR_LINEAR_RANGE(320000, 0, 258, 4000),
@@ -780,6 +818,14 @@ static const struct rpm_regulator_data rpm_pm8994_regulators[] = {
 	{}
 };
 
+static const struct rpm_regulator_data rpm_pmi8994_regulators[] = {
+	{ "s1", QCOM_SMD_RPM_SMPB, 1, &pmi8994_ftsmps, "vdd_s1" },
+	{ "s2", QCOM_SMD_RPM_SMPB, 2, &pmi8994_hfsmps, "vdd_s2" },
+	{ "s2", QCOM_SMD_RPM_SMPB, 3, &pmi8994_hfsmps, "vdd_s3" },
+	{ "boost-bypass", QCOM_SMD_RPM_BBYB, 1, &pmi8994_bby, "vdd_bst_byp" },
+	{}
+};
+
 static const struct rpm_regulator_data rpm_pm8998_regulators[] = {
 	{ "s1", QCOM_SMD_RPM_SMPA, 1, &pm8998_ftsmps, "vdd_s1" },
 	{ "s2", QCOM_SMD_RPM_SMPA, 2, &pm8998_ftsmps, "vdd_s2" },
@@ -862,6 +908,7 @@ static const struct of_device_id rpm_of_match[] = {
 	{ .compatible = "qcom,rpm-pm8994-regulators", .data = &rpm_pm8994_regulators },
 	{ .compatible = "qcom,rpm-pm8998-regulators", .data = &rpm_pm8998_regulators },
 	{ .compatible = "qcom,rpm-pma8084-regulators", .data = &rpm_pma8084_regulators },
+	{ .compatible = "qcom,rpm-pmi8994-regulators", .data = &rpm_pmi8994_regulators },
 	{ .compatible = "qcom,rpm-pmi8998-regulators", .data = &rpm_pmi8998_regulators },
 	{ .compatible = "qcom,rpm-pms405-regulators", .data = &rpm_pms405_regulators },
 	{}
diff --git a/include/linux/soc/qcom/smd-rpm.h b/include/linux/soc/qcom/smd-rpm.h
index 9e4fdd861a51..da304ce8c8f7 100644
--- a/include/linux/soc/qcom/smd-rpm.h
+++ b/include/linux/soc/qcom/smd-rpm.h
@@ -10,6 +10,7 @@ struct qcom_smd_rpm;
 /*
  * Constants used for addressing resources in the RPM.
  */
+#define QCOM_SMD_RPM_BBYB	0x62796262
 #define QCOM_SMD_RPM_BOBB	0x62626f62
 #define QCOM_SMD_RPM_BOOST	0x61747362
 #define QCOM_SMD_RPM_BUS_CLK	0x316b6c63
-- 
2.20.1

