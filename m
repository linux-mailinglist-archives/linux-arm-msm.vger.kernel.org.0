Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4F88733C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Aug 2019 09:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405939AbfHIHiG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Aug 2019 03:38:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:36002 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725980AbfHIHiF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Aug 2019 03:38:05 -0400
Received: from localhost.localdomain (unknown [122.167.65.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DD3872173E;
        Fri,  9 Aug 2019 07:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565336285;
        bh=O7WQ1zBAJzEuaFnALgFxwTwuUZjx7Kjinzu8wn2fR2U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tQtyusUqYs3H27n+cSP6KJnTH7/204WF+EfBeR87/9hMXkRLUzXVaPUmHltzakOzZ
         6etglwvvDqJ1AbqcTlpP7C9V2gAuybgl27VVStRdMG19LxbTuJp1yjSW8TXxZcbkKP
         TWGt6ceWMNNGs3BH/LNUuIpVq2coyd4SXLkt35Gs=
From:   Vinod Koul <vkoul@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/4] regulator: qcom-rpmh: Update PMIC modes for PMIC5
Date:   Fri,  9 Aug 2019 13:06:16 +0530
Message-Id: <20190809073616.1235-4-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809073616.1235-1-vkoul@kernel.org>
References: <20190809073616.1235-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add the PMIC5 modes and use them pmic5 ldo and smps

Signed-off-by: Vinod Koul <vkoul@kernel.org>
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

