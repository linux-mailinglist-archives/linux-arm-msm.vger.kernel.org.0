Return-Path: <linux-arm-msm+bounces-4140-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A7E80BFCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 04:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79B701C2094E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 03:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5D216430;
	Mon, 11 Dec 2023 03:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S8i7hKcS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7289B15E8B;
	Mon, 11 Dec 2023 03:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8139C433CB;
	Mon, 11 Dec 2023 03:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702264627;
	bh=MGwXCzH2RHGPxDED7tHuvHkaVfH+MHC3vQcwY53cAf4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S8i7hKcSL6r0sMDnwmVeGJJt3cBQ0x/q+SSRE75ZkJ6IQNWffxVTXYhifvPaZSjha
	 OkLu2doCfmnt0Y69CckTRQlRuf+zhZbd33cLP59qVUJcA64e+uiyRCK5FHONuNMe5I
	 YMUOOk3GpjiZMIWMDPMKo1nXoSOaQSxr6LpE/J/g3HFTkSQw7ksjuCyAFNBYd8W1uE
	 W+K/RCN8tEpU0HPh+eNHPtTMKRK8pk8kPMC3PA2Tud6w/qDbuEXcW7XFnIARcE/fke
	 X0CYMJjAWYMJReATL4caUCf8lJxTXeKUwU2dWNRALFE1K5rNcOBeeVdxywDU1eVqD6
	 0eQ6+7ntFxaAg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF99AC10F14;
	Mon, 11 Dec 2023 03:17:06 +0000 (UTC)
From: Fenglin Wu via B4 Relay <devnull+quic_fenglinw.quicinc.com@kernel.org>
Date: Mon, 11 Dec 2023 11:17:01 +0800
Subject: [PATCH 3/4] regulator: qcom-rpmh: add support for pm8010
 regulators
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231211-pm8010-regulator-v1-3-571e05fb4ecc@quicinc.com>
References: <20231211-pm8010-regulator-v1-0-571e05fb4ecc@quicinc.com>
In-Reply-To: <20231211-pm8010-regulator-v1-0-571e05fb4ecc@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@quicinc.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, quic_collinsd@quicinc.com, 
 quic_subbaram@quicinc.com, quic_jprakash@quicinc.com, 
 Fenglin Wu <quic_fenglinw@quicinc.com>
X-Mailer: b4 0.13-dev-83828
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702264625; l=4356;
 i=quic_fenglinw@quicinc.com; s=20230725; h=from:subject:message-id;
 bh=CIBQUcV2PQFotayl85S+sWp0kC0MvoYRJhVIDSpSmgM=;
 b=ukDGYL2p6+wll0Soq4NY6TwRgy2+qI721wuoeZ2L2BWeqa+7JnwJxt8oYeFmbHAyENITw4Mxp
 WHOZzydtg0OCFm3F/mFX4WDKq8RzIy6ko8SxbyVCqLnoCMd5PmDQnSx
X-Developer-Key: i=quic_fenglinw@quicinc.com; a=ed25519;
 pk=hleIDz3Unk1zeiwwOnZUjoQVMMelRancDFXg927lNjI=
X-Endpoint-Received:
 by B4 Relay for quic_fenglinw@quicinc.com/20230725 with auth_id=68
X-Original-From: Fenglin Wu <quic_fenglinw@quicinc.com>
Reply-To: <quic_fenglinw@quicinc.com>

From: Fenglin Wu <quic_fenglinw@quicinc.com>

Add RPMH regulators exposed by Qualcomm Technologies, Inc. PM8010
PMIC. It has 7 LDOs with 3 different types, LDO1 - LDO2 are L502
NMOS LDOs, LDO5 and LDO7 are L502 PMOS LDOs, LDO3/LDO4/LDO6 are
L502 PMOS LDO for low noise applications. Also, LDO3 - LDO7 don't
support LPM.

Suggested-by: David Collins <quic_collinsd@quicinc.com>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 62 +++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 43b45feb02e6..80e304711345 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -511,6 +511,14 @@ static const int pmic_mode_map_pmic5_ldo[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_FAST]    = -EINVAL,
 };
 
+static const int pmic_mode_map_pmic5_ldo_hpm[REGULATOR_MODE_STANDBY + 1] = {
+	[REGULATOR_MODE_INVALID] = -EINVAL,
+	[REGULATOR_MODE_STANDBY] = -EINVAL,
+	[REGULATOR_MODE_IDLE]    = -EINVAL,
+	[REGULATOR_MODE_NORMAL]  = PMIC5_LDO_MODE_HPM,
+	[REGULATOR_MODE_FAST]    = -EINVAL,
+};
+
 static unsigned int rpmh_regulator_pmic4_ldo_of_map_mode(unsigned int rpmh_mode)
 {
 	unsigned int mode;
@@ -733,6 +741,33 @@ static const struct rpmh_vreg_hw_data pmic5_pldo515_mv = {
 	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
 };
 
+static const struct rpmh_vreg_hw_data pmic5_pldo502 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_ops,
+	.voltage_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1504000, 0, 255, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 256,
+	.pmic_mode_map = pmic_mode_map_pmic5_ldo_hpm,
+	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
+};
+
+static const struct rpmh_vreg_hw_data pmic5_pldo502ln = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_ops,
+	.voltage_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
+		REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
+		REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
+		REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
+	},
+	.n_linear_ranges = 4,
+	.n_voltages = 32,
+	.pmic_mode_map = pmic_mode_map_pmic5_ldo_hpm,
+	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
+};
+
 static const struct rpmh_vreg_hw_data pmic5_nldo = {
 	.regulator_type = VRM,
 	.ops = &rpmh_regulator_vrm_drms_ops,
@@ -759,6 +794,19 @@ static const struct rpmh_vreg_hw_data pmic5_nldo515 = {
 	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
 };
 
+static const struct rpmh_vreg_hw_data pmic5_nldo502 = {
+	.regulator_type = VRM,
+	.ops = &rpmh_regulator_vrm_drms_ops,
+	.voltage_ranges = (struct linear_range[]) {
+		REGULATOR_LINEAR_RANGE(528000, 0, 127, 8000),
+	},
+	.n_linear_ranges = 1,
+	.n_voltages = 128,
+	.hpm_min_load_uA = 30000,
+	.pmic_mode_map = pmic_mode_map_pmic5_ldo,
+	.of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
+};
+
 static const struct rpmh_vreg_hw_data pmic5_hfsmps510 = {
 	.regulator_type = VRM,
 	.ops = &rpmh_regulator_vrm_ops,
@@ -1210,6 +1258,16 @@ static const struct rpmh_vreg_init_data pm8009_1_vreg_data[] = {
 	{}
 };
 
+static const struct rpmh_vreg_init_data pm8010_vreg_data[] = {
+	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo502,   "vdd-l1-l2"),
+	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo502,   "vdd-l1-l2"),
+	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_pldo502ln, "vdd-l3-l4"),
+	RPMH_VREG("ldo4",   "ldo%s4",  &pmic5_pldo502ln, "vdd-l3-l4"),
+	RPMH_VREG("ldo5",   "ldo%s5",  &pmic5_pldo502,   "vdd-l5"),
+	RPMH_VREG("ldo6",   "ldo%s6",  &pmic5_pldo502ln, "vdd-l6"),
+	RPMH_VREG("ldo7",   "ldo%s7",  &pmic5_pldo502,   "vdd-l7"),
+};
+
 static const struct rpmh_vreg_init_data pm6150_vreg_data[] = {
 	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps510, "vdd-s1"),
 	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps510, "vdd-s2"),
@@ -1525,6 +1583,10 @@ static const struct of_device_id __maybe_unused rpmh_regulator_match_table[] = {
 		.compatible = "qcom,pm8009-1-rpmh-regulators",
 		.data = pm8009_1_vreg_data,
 	},
+	{
+		.compatible = "qcom,pm8010-rpmh-regulators",
+		.data = pm8010_vreg_data,
+	},
 	{
 		.compatible = "qcom,pm8150-rpmh-regulators",
 		.data = pm8150_vreg_data,

-- 
2.25.1


