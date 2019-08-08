Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 395F986B8E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 22:33:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390340AbfHHUdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 16:33:55 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59020 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390231AbfHHUdy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 16:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=OeiRc1kGALvNFIyeefBM2if1E6m/n9cKkvI3yZsO3XA=; b=aj2YuDrqWmyA
        U00wx1++zWubcnV3zX1jYxXLoKXydwaVcqSeBdYihZHgzY1+PohHtsbDnffg2uBlRR7Kk8Kpnbxwd
        kZ+yQf2o6pljcLtrWXQHMf8/t+Xg3pp8SPM8dMF0CWICapoe/xde5+hXkK6xmq2PqANLn9lM+tLtL
        U/hpI=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hvp6b-00042h-M4; Thu, 08 Aug 2019 20:33:49 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 20AB02742BDD; Thu,  8 Aug 2019 21:33:49 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "regulator: qcom-rpmh: Add support for SM8150" to the regulator tree
In-Reply-To: <20190808093343.5600-2-vkoul@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20190808203349.20AB02742BDD@ypsilon.sirena.org.uk>
Date:   Thu,  8 Aug 2019 21:33:49 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom-rpmh: Add support for SM8150

has been applied to the regulator tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-5.4

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

From 06369bcc15a1620930a17fb35e26477504cd2255 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Thu, 8 Aug 2019 15:03:43 +0530
Subject: [PATCH] regulator: qcom-rpmh: Add support for SM8150

Add support from RPMH regulators found in SM8150 platform

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20190808093343.5600-2-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 147 ++++++++++++++++++++++++
 1 file changed, 147 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index b2c2d01d1637..693ffec62f3e 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -637,6 +637,72 @@ static const struct rpmh_vreg_hw_data pmic4_lvs = {
 	/* LVS hardware does not support voltage or mode configuration. */
 };
 
+static const struct rpmh_vreg_hw_data pmic5_pldo = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_drms_ops,
+	.voltage_range = REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+	.n_voltages = 256,
+	.hpm_min_load_uA = 10000,
+	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
+	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_pldo_lv = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_drms_ops,
+	.voltage_range = REGULATOR_LINEAR_RANGE(1504000, 0, 62, 8000),
+	.n_voltages = 63,
+	.hpm_min_load_uA = 10000,
+	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
+	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_nldo = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_drms_ops,
+	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 123, 8000),
+	.n_voltages = 124,
+	.hpm_min_load_uA = 30000,
+	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
+	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_hfsmps510 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_ops,
+	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 215, 8000),
+	.n_voltages = 216,
+	.pmic_mode_map = pmic_mode_map_pmic4_smps,
+	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_ftsmps510 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_ops,
+	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 263, 4000),
+	.n_voltages = 264,
+	.pmic_mode_map = pmic_mode_map_pmic4_smps,
+	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_ops,
+	.voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 1600),
+	.n_voltages = 5,
+	.pmic_mode_map = pmic_mode_map_pmic4_smps,
+	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_bob = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_bypass_ops,
+	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
+	.n_voltages = 135,
+	.pmic_mode_map = pmic_mode_map_pmic4_bob,
+	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
+};
+
 #define RPMH_VREG(_name, _resource_name, _hw_data, _supply_name) \
 { \
 	.name		= _name, \
@@ -705,6 +771,75 @@ static const struct rpmh_vreg_init_data pm8005_vreg_data[] = {
 	{},
 };
 
+static const struct rpmh_vreg_init_data pm8150_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_hfsmps510,   "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_hfsmps510,   "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps510, "vdd-s8"),
+	RPMH_VREG("smps9",  "smp%s9",  &pmic5_ftsmps510, "vdd-s9"),
+	RPMH_VREG("smps10", "smp%s10", &pmic5_ftsmps510, "vdd-s10"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_nldo,      "vdd-l6-l9"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l2-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_nldo,      "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo12",  "ldo%s12", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo13",  "ldo%s13", &pmic5_pldo,      "vdd-l13-l6-l17"),
+	RPMH_VREG("ldo14",  "ldo%s14", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo15",  "ldo%s15", &pmic5_pldo_lv,   "vdd-l7-l12-l14-l15"),
+	RPMH_VREG("ldo16",  "ldo%s16", &pmic5_pldo,      "vdd-l13-l6-l17"),
+	RPMH_VREG("ldo17",  "ldo%s17", &pmic5_pldo,      "vdd-l13-l6-l17"),
+	RPMH_VREG("ldo18",  "ldo%s18", &pmic5_nldo,      "vdd-l3-l4-l5-l18"),
+	{},
+};
+
+static const struct rpmh_vreg_init_data pm8150l_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps510, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps510, "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps510, "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps510, "vdd-s6"),
+	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps510, "vdd-s7"),
+	RPMH_VREG("smps8",  "smp%s8",  &pmic5_hfsmps510, "vdd-s8"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_pldo_lv,   "vdd-l1-l8"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l2-l3"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l4-l5-l6"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo,      "vdd-l7-l11"),
+	RPMH_VREG("ldo8",   "ldo%s8",  &pmic5_pldo_lv,   "vdd-l1-l8-l11"),
+	RPMH_VREG("ldo9",   "ldo%s9",  &pmic5_pldo,      "vdd-l9-l10"),
+	RPMH_VREG("ldo10",  "ldo%s10", &pmic5_pldo,      "vdd-l9-l10"),
+	RPMH_VREG("ldo11",  "ldo%s11", &pmic5_pldo,      "vdd-l7-l11"),
+	RPMH_VREG("bob",    "bob%s1",  &pmic5_bob,       "vdd-bob"),
+	{},
+};
+
+static const struct rpmh_vreg_init_data pm8009_vreg_data[] = {
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_hfsmps510, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_hfsmps515, "vdd-s2"),
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo,      "vdd-l1"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo,      "vdd-l2"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo,      "vdd-l3"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_nldo,      "vdd-l4"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo,      "vdd-l5-l6"),
+	RPMH_VREG("ldo7",   "ldo%s6",  &pmic5_pldo_lv,   "vdd-l7"),
+	{},
+};
+
 static int rpmh_regulator_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -755,6 +890,18 @@ static const struct of_device_id rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm8005-rpmh-regulators",
 		.data = pm8005_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm8150-rpmh-regulators",
+		.data = pm8150_vreg_data,
+	},
+	{
+		.compatible = "qcom,pm8150l-rpmh-regulators",
+		.data = pm8150l_vreg_data,
+	},
+	{
+		.compatible = "qcom,pm8009-rpmh-regulators",
+		.data = pm8009_vreg_data,
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, rpmh_regulator_match_table);
-- 
2.20.1

