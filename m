Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A458A87A21
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 14:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406992AbfHIMcE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 08:32:04 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:59274 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406970AbfHIMcC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 08:32:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
        Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
        List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
        List-Archive; bh=yjI9BHjJiM6QPyHI374iDRWW1Y55n+A5l+wSxkkmzSQ=; b=gjZ/ALnhSceO
        kEv0GZ22UZvBLYLfFHjAXGCEDcYFlEmmBaoIPZUKCNspWuIuytzah7sZM1VFy2NE29ZwScteW3Xi0
        DcfE7NBN1advJfNqn44Sj/s6QaasLpBxcuRa3B7qbpaQADBv4ckQFm9YIp7fMb+9qqtEM0GVs4jEH
        XtbAw=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1hw43q-000623-F0; Fri, 09 Aug 2019 12:31:58 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id D16DD274303D; Fri,  9 Aug 2019 13:31:57 +0100 (BST)
From:   Mark Brown <broonie@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Applied "regulator: qcom-rpmh: Update PMIC modes for PMIC5" to the regulator tree
In-Reply-To: <20190809073616.1235-4-vkoul@kernel.org>
X-Patchwork-Hint: ignore
Message-Id: <20190809123157.D16DD274303D@ypsilon.sirena.org.uk>
Date:   Fri,  9 Aug 2019 13:31:57 +0100 (BST)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The patch

   regulator: qcom-rpmh: Update PMIC modes for PMIC5

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

From 610f29e5cc0e8d5864dd049b0b3576d9437ae7b4 Mon Sep 17 00:00:00 2001
From: Vinod Koul <vkoul@kernel.org>
Date: Fri, 9 Aug 2019 13:06:16 +0530
Subject: [PATCH] regulator: qcom-rpmh: Update PMIC modes for PMIC5

Add the PMIC5 modes and use them pmic5 ldo and smps

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Link: https://lore.kernel.org/r/20190809073616.1235-4-vkoul@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 52 +++++++++++++++++++++----
 1 file changed, 45 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 391ed844a251..db6c085da65e 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -50,6 +50,20 @@ enum rpmh_regulator_type {
 #define PMIC4_BOB_MODE_AUTO			2
 #define PMIC4_BOB_MODE_PWM			3
 
+#define PMIC5_LDO_MODE_RETENTION		3
+#define PMIC5_LDO_MODE_LPM			4
+#define PMIC5_LDO_MODE_HPM			7
+
+#define PMIC5_SMPS_MODE_RETENTION		3
+#define PMIC5_SMPS_MODE_PFM			4
+#define PMIC5_SMPS_MODE_AUTO			6
+#define PMIC5_SMPS_MODE_PWM			7
+
+#define PMIC5_BOB_MODE_PASS			2
+#define PMIC5_BOB_MODE_PFM			4
+#define PMIC5_BOB_MODE_AUTO			6
+#define PMIC5_BOB_MODE_PWM			7
+
 /**
  * struct rpmh_vreg_hw_data - RPMh regulator hardware configurations
  * @regulator_type:		RPMh accelerator type used to manage this
@@ -488,6 +502,14 @@ static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_FAST]    = -EINVAL,
 };
 
+static const int pmic_mode_map_pmic5_ldo[REGULATOR_MODE_STANDBY + 1] = {
+	[REGULATOR_MODE_INVALID] = -EINVAL,
+	[REGULATOR_MODE_STANDBY] = PMIC5_LDO_MODE_RETENTION,
+	[REGULATOR_MODE_IDLE]    = PMIC5_LDO_MODE_LPM,
+	[REGULATOR_MODE_NORMAL]  = PMIC5_LDO_MODE_HPM,
+	[REGULATOR_MODE_FAST]    = -EINVAL,
+};
+
 static unsigned int rpmh_regulator_pmic4_ldo_of_map_mode(unsigned int rpmh_mode)
 {
 	unsigned int mode;
@@ -518,6 +540,14 @@ static const int pmic_mode_map_pmic4_smps[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_FAST]    = PMIC4_SMPS_MODE_PWM,
 };
 
+static const int pmic_mode_map_pmic5_smps[REGULATOR_MODE_STANDBY + 1] = {
+	[REGULATOR_MODE_INVALID] = -EINVAL,
+	[REGULATOR_MODE_STANDBY] = PMIC5_SMPS_MODE_RETENTION,
+	[REGULATOR_MODE_IDLE]    = PMIC5_SMPS_MODE_PFM,
+	[REGULATOR_MODE_NORMAL]  = PMIC5_SMPS_MODE_AUTO,
+	[REGULATOR_MODE_FAST]    = PMIC5_SMPS_MODE_PWM,
+};
+
 static unsigned int
 rpmh_regulator_pmic4_smps_of_map_mode(unsigned int rpmh_mode)
 {
@@ -552,6 +582,14 @@ static const int pmic_mode_map_pmic4_bob[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_FAST]    = PMIC4_BOB_MODE_PWM,
 };
 
+static const int pmic_mode_map_pmic5_bob[REGULATOR_MODE_STANDBY + 1] = {
+	[REGULATOR_MODE_INVALID] = -EINVAL,
+	[REGULATOR_MODE_STANDBY] = -EINVAL,
+	[REGULATOR_MODE_IDLE]    = PMIC5_BOB_MODE_PFM,
+	[REGULATOR_MODE_NORMAL]  = PMIC5_BOB_MODE_AUTO,
+	[REGULATOR_MODE_FAST]    = PMIC5_BOB_MODE_PWM,
+};
+
 static unsigned int rpmh_regulator_pmic4_bob_of_map_mode(unsigned int rpmh_mode)
 {
 	unsigned int mode;
@@ -643,7 +681,7 @@ static const struct rpmh_vreg_hw_data pmic5_pldo = {
 	.voltage_range = REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
 	.n_voltages = 256,
 	.hpm_min_load_uA = 10000,
-	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
+	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
 	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
 };
 
@@ -653,7 +691,7 @@ static const struct rpmh_vreg_hw_data pmic5_pldo_lv = {
 	.voltage_range = REGULATOR_LINEAR_RANGE(1504000, 0, 62, 8000),
 	.n_voltages = 63,
 	.hpm_min_load_uA = 10000,
-	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
+	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
 	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
 };
 
@@ -663,7 +701,7 @@ static const struct rpmh_vreg_hw_data pmic5_nldo = {
 	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 123, 8000),
 	.n_voltages = 124,
 	.hpm_min_load_uA = 30000,
-	.pmic_mode_map = pmic_mode_map_pmic4_ldo,
+	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
 	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
 };
 
@@ -672,7 +710,7 @@ static const struct rpmh_vreg_hw_data pmic5_hfsmps510 = {
 	.ops = &rpmh_regulator_vrm_ops,
 	.voltage_range = REGULATOR_LINEAR_RANGE(320000, 0, 215, 8000),
 	.n_voltages = 216,
-	.pmic_mode_map = pmic_mode_map_pmic4_smps,
+	.pmic_mode_map = pmic_mode_map_pmic5_smps,
 	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
 };
 
@@ -681,7 +719,7 @@ static const struct rpmh_vreg_hw_data pmic5_ftsmps510 = {
 	.ops = &rpmh_regulator_vrm_ops,
 	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 263, 4000),
 	.n_voltages = 264,
-	.pmic_mode_map = pmic_mode_map_pmic4_smps,
+	.pmic_mode_map = pmic_mode_map_pmic5_smps,
 	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
 };
 
@@ -690,7 +728,7 @@ static const struct rpmh_vreg_hw_data pmic5_hfsmps515 = {
 	.ops = &rpmh_regulator_vrm_ops,
 	.voltage_range = REGULATOR_LINEAR_RANGE(2800000, 0, 4, 1600),
 	.n_voltages = 5,
-	.pmic_mode_map = pmic_mode_map_pmic4_smps,
+	.pmic_mode_map = pmic_mode_map_pmic5_smps,
 	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
 };
 
@@ -699,7 +737,7 @@ static const struct rpmh_vreg_hw_data pmic5_bob = {
 	.ops = &rpmh_regulator_vrm_bypass_ops,
 	.voltage_range = REGULATOR_LINEAR_RANGE(300000, 0, 135, 32000),
 	.n_voltages = 136,
-	.pmic_mode_map = pmic_mode_map_pmic4_bob,
+	.pmic_mode_map = pmic_mode_map_pmic5_bob,
 	.of_map_mode = rpmh_regulator_pmic4_bob_of_map_mode,
 };
 
-- 
2.20.1

