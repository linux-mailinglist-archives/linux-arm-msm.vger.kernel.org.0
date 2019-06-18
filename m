Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 180DA4A9F3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2019 20:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730323AbfFRSdj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Jun 2019 14:33:39 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:47492 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730319AbfFRSdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Jun 2019 14:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=jchK1eqqKYh8Bjx0TnPgh46APF4oPOopdcWibp3BJgY=; b=JuMJJ7zQoAMN
        f2gt9y0a8sLgN+67b/yDrDW0NNsqUlyIvynIYDShzlzZcQWpKfYDOnSA4kCUEg1Xnej+f7v/FiIAS
        M19E8+e9p8dJF64eSnoWWNeQ0+fIwhOJ8Y93me9Vu7Udt6SkT7ctrrQpDx8lAzkEmAlee2EaUJsGH
        lesBE=;
Received: from [2001:470:1f1d:6b5:7e7a:91ff:fede:4a45] (helo=finisterre.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <broonie@sirena.org.uk>)
        id 1hdIv1-0005Kf-FN; Tue, 18 Jun 2019 18:33:19 +0000
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
        id F06D6440046; Tue, 18 Jun 2019 19:33:18 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, broonie@kernel.org,
        devicetree@vger.kernel.org,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
        lgirdwood@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        mark.rutland@arm.com, robh+dt@kernel.org
Subject: Applied "regulator: qcom_spmi: add PMS405 SPMI regulator" to the regulator tree
In-Reply-To: <20190617183827.13710-1-jeffrey.l.hugo@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190618183318.F06D6440046@finisterre.sirena.org.uk>
Date:   Tue, 18 Jun 2019 19:33:18 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom_spmi: add PMS405 SPMI regulator

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.3

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

From 0211f68e626fb02d33c1e4302d907a45366a2d93 Mon Sep 17 00:00:00 2001
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Date: Mon, 17 Jun 2019 11:38:27 -0700
Subject: [PATCH] regulator: qcom_spmi: add PMS405 SPMI regulator

The PMS405 has 5 HFSMPS and 13 LDO regulators,

This commit adds support for one of the 5 HFSMPS regulators (s3) to
the spmi regulator driver.

The PMIC HFSMPS 430 regulators have 8 mV step size and a voltage
control scheme consisting of two  8-bit registers defining a 16-bit
voltage set point in units of millivolts

S3 controls the cpu voltages (s3 is a buck regulator of type HFS430);
it is therefore required so we can enable voltage scaling for safely
running cpufreq.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Signed-off-by: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom_spmi-regulator.c | 43 +++++++++++++++++++++++--
 1 file changed, 40 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom_spmi-regulator.c b/drivers/regulator/qcom_spmi-regulator.c
index ee38b1b63a3b..13f83be50076 100644
--- a/drivers/regulator/qcom_spmi-regulator.c
+++ b/drivers/regulator/qcom_spmi-regulator.c
@@ -97,6 +97,7 @@ enum spmi_regulator_logical_type {
 	SPMI_REGULATOR_LOGICAL_TYPE_ULT_HO_SMPS,
 	SPMI_REGULATOR_LOGICAL_TYPE_ULT_LDO,
 	SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426,
+	SPMI_REGULATOR_LOGICAL_TYPE_HFS430,
 };
 
 enum spmi_regulator_type {
@@ -149,6 +150,7 @@ enum spmi_regulator_subtype {
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL2	= 0x0e,
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL3	= 0x0f,
 	SPMI_REGULATOR_SUBTYPE_ULT_HF_CTL4	= 0x10,
+	SPMI_REGULATOR_SUBTYPE_HFS430		= 0x0a,
 };
 
 enum spmi_common_regulator_registers {
@@ -294,6 +296,8 @@ enum spmi_common_control_register_index {
 /* Clock rate in kHz of the FTSMPS426 regulator reference clock. */
 #define SPMI_FTSMPS426_CLOCK_RATE		4800
 
+#define SPMI_HFS430_CLOCK_RATE			1600
+
 /* Minimum voltage stepper delay for each step. */
 #define SPMI_FTSMPS426_STEP_DELAY		2
 
@@ -507,6 +511,10 @@ static struct spmi_voltage_range ult_pldo_ranges[] = {
 	SPMI_VOLTAGE_RANGE(0, 1750000, 1750000, 3337500, 3337500, 12500),
 };
 
+static struct spmi_voltage_range hfs430_ranges[] = {
+	SPMI_VOLTAGE_RANGE(0, 320000, 320000, 2040000, 2040000, 8000),
+};
+
 static DEFINE_SPMI_SET_POINTS(pldo);
 static DEFINE_SPMI_SET_POINTS(nldo1);
 static DEFINE_SPMI_SET_POINTS(nldo2);
@@ -522,6 +530,7 @@ static DEFINE_SPMI_SET_POINTS(ult_lo_smps);
 static DEFINE_SPMI_SET_POINTS(ult_ho_smps);
 static DEFINE_SPMI_SET_POINTS(ult_nldo);
 static DEFINE_SPMI_SET_POINTS(ult_pldo);
+static DEFINE_SPMI_SET_POINTS(hfs430);
 
 static inline int spmi_vreg_read(struct spmi_regulator *vreg, u16 addr, u8 *buf,
 				 int len)
@@ -1398,12 +1407,26 @@ static struct regulator_ops spmi_ftsmps426_ops = {
 	.set_pull_down		= spmi_regulator_common_set_pull_down,
 };
 
+static struct regulator_ops spmi_hfs430_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_voltage_sel	= spmi_regulator_ftsmps426_set_voltage,
+	.set_voltage_time_sel	= spmi_regulator_set_voltage_time_sel,
+	.get_voltage_sel	= spmi_regulator_ftsmps426_get_voltage,
+	.map_voltage		= spmi_regulator_single_map_voltage,
+	.list_voltage		= spmi_regulator_common_list_voltage,
+	.set_mode		= spmi_regulator_ftsmps426_set_mode,
+	.get_mode		= spmi_regulator_ftsmps426_get_mode,
+};
+
 /* Maximum possible digital major revision value */
 #define INF 0xFF
 
 static const struct spmi_regulator_mapping supported_regulators[] = {
 	/*           type subtype dig_min dig_max ltype ops setpoints hpm_min */
 	SPMI_VREG(BUCK,  GP_CTL,   0, INF, SMPS,   smps,   smps,   100000),
+	SPMI_VREG(BUCK,  HFS430,   0, INF, HFS430, hfs430, hfs430,  10000),
 	SPMI_VREG(LDO,   N300,     0, INF, LDO,    ldo,    nldo1,   10000),
 	SPMI_VREG(LDO,   N600,     0,   0, LDO,    ldo,    nldo2,   10000),
 	SPMI_VREG(LDO,   N1200,    0,   0, LDO,    ldo,    nldo2,   10000),
@@ -1571,7 +1594,8 @@ static int spmi_regulator_init_slew_rate(struct spmi_regulator *vreg)
 	return ret;
 }
 
-static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
+static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg,
+						   int clock_rate)
 {
 	int ret;
 	u8 reg = 0;
@@ -1588,7 +1612,7 @@ static int spmi_regulator_init_slew_rate_ftsmps426(struct spmi_regulator *vreg)
 	delay >>= SPMI_FTSMPS426_STEP_CTRL_DELAY_SHIFT;
 
 	/* slew_rate has units of uV/us */
-	slew_rate = SPMI_FTSMPS426_CLOCK_RATE * range->step_uV;
+	slew_rate = clock_rate * range->step_uV;
 	slew_rate /= 1000 * (SPMI_FTSMPS426_STEP_DELAY << delay);
 	slew_rate *= SPMI_FTSMPS426_STEP_MARGIN_NUM;
 	slew_rate /= SPMI_FTSMPS426_STEP_MARGIN_DEN;
@@ -1740,7 +1764,14 @@ static int spmi_regulator_of_parse(struct device_node *node,
 			return ret;
 		break;
 	case SPMI_REGULATOR_LOGICAL_TYPE_FTSMPS426:
-		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg);
+		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg,
+						SPMI_FTSMPS426_CLOCK_RATE);
+		if (ret)
+			return ret;
+		break;
+	case SPMI_REGULATOR_LOGICAL_TYPE_HFS430:
+		ret = spmi_regulator_init_slew_rate_ftsmps426(vreg,
+							SPMI_HFS430_CLOCK_RATE);
 		if (ret)
 			return ret;
 		break;
@@ -1908,6 +1939,11 @@ static const struct spmi_regulator_data pm8005_regulators[] = {
 	{ }
 };
 
+static const struct spmi_regulator_data pms405_regulators[] = {
+	{ "s3", 0x1a00, "vdd_s3"},
+	{ }
+};
+
 static const struct of_device_id qcom_spmi_regulator_match[] = {
 	{ .compatible = "qcom,pm8005-regulators", .data = &pm8005_regulators },
 	{ .compatible = "qcom,pm8841-regulators", .data = &pm8841_regulators },
@@ -1915,6 +1951,7 @@ static const struct of_device_id qcom_spmi_regulator_match[] = {
 	{ .compatible = "qcom,pm8941-regulators", .data = &pm8941_regulators },
 	{ .compatible = "qcom,pm8994-regulators", .data = &pm8994_regulators },
 	{ .compatible = "qcom,pmi8994-regulators", .data = &pmi8994_regulators },
+	{ .compatible = "qcom,pms405-regulators", .data = &pms405_regulators },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_spmi_regulator_match);
-- 
2.20.1

