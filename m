Return-Path: <linux-arm-msm+bounces-40422-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3780D9E4903
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 00:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7A17281078
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 23:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E9920E6E7;
	Wed,  4 Dec 2024 23:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbwQXztN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2954D20E6E4;
	Wed,  4 Dec 2024 23:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733354821; cv=none; b=DGlz/qJALnXWYlRpnv5JObE3T3tpDnlAKEjJsmOOp1RoyiyaTU5nozAtq1npAFk2Q/KMUd8H6S4KcV1FN68GlI8irChtzcYSIX7EgfvKW2EEhVdrseAfAQQ+mDk+DLhT/2e2VDKyLVXIv7ubHq5njXuXAH6DxXcRKsxsP1ptGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733354821; c=relaxed/simple;
	bh=OfX0VCRFKCJwPJLI2Er/a/RLQ2MNZ24Q8i7MTYwVaYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DY944X5Usq1m8pShEMq9yvBQlWmfIVLOXbyzLB5EOzZ2BP6nM7Eg///IRBT2d/3UCOM/hjuhCMyy3QBOsUe9/qzpPBDsdZgY/BK4v6mJ27O5GLwW4WqN+3MR4y4SRDsdrYr1VZ8v43ByQRSblqaN3rOxca08Q/qzJTtI1FyXZ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbwQXztN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6B7C4CEE1;
	Wed,  4 Dec 2024 23:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733354821;
	bh=OfX0VCRFKCJwPJLI2Er/a/RLQ2MNZ24Q8i7MTYwVaYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kbwQXztNm9CtYvazp/wz+4S5owcVwvy7KqRtn8OPnlIVAe2zAwm26oU1H1RHESOyJ
	 UNBJc9ae2lQLchrZeraA+5tKxiS94Jxb2u3o4VkYTCxcvpXvK2fSgmJSK5/zyQXvoR
	 +CoKYjAoqgwAjjC4QJcChxM8ppMKuvePRgR/UUTwleM7/0llvGBXuc2u7CVED9qrJL
	 lxlC3xdtAB4idnJaiK1sM8p/X00UsGpK6HUnp7PpFtmSVopqqTdcXMGD1o+/DzhpAd
	 +eIm5/yfe+CWZW2TjscHSwpBy0IgkTbqEUX/JIR99bDopy0JEyXyVt5KVLuYDmbtYr
	 Dyi1rYxCtP2IA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Melody Olvera <quic_molvera@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	lgirdwood@gmail.com,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH AUTOSEL 6.11 2/2] regulator: qcom-rpmh: Update ranges for FTSMPS525
Date: Wed,  4 Dec 2024 17:15:39 -0500
Message-ID: <20241204221539.2247447-2-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241204221539.2247447-1-sashal@kernel.org>
References: <20241204221539.2247447-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
Content-Transfer-Encoding: 8bit

From: Melody Olvera <quic_molvera@quicinc.com>

[ Upstream commit eeecf953d697cb7f0d916f9908a2b9f451bb2667 ]

All FTSMPS525 regulators support LV and MV ranges; however,
the boot loader firmware will determine which range to use as
the device boots.

Nonetheless, the driver cannot determine which range was selected,
so hardcoding the ranges as either LV or MV will not cover all cases
as it's possible for the firmware to select a range not supported by
the driver's current hardcoded values.

To this end, combine the ranges for the FTSMPS525s into one struct
and point all regulators to the updated combined struct. This should
work on all boards regardless of which range is selected by the firmware
and more accurately caputres the capability of this regulator on a
hardware level.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Link: https://patch.msgid.link/20241112002645.2803506-1-quic_molvera@quicinc.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/regulator/qcom-rpmh-regulator.c | 83 +++++++++++--------------
 1 file changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 80e304711345b..acd69443056c2 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -843,26 +843,15 @@ static const struct rpmh_vreg_hw_data pmic5_ftsmps520 = {
 	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
 };
 
-static const struct rpmh_vreg_hw_data pmic5_ftsmps525_lv = {
+static const struct rpmh_vreg_hw_data pmic5_ftsmps525 = {
 	.regulator_type = VRM,
 	.ops = &rpmh_regulator_vrm_ops,
 	.voltage_ranges = (struct linear_range[]) {
 		REGULATOR_LINEAR_RANGE(300000, 0, 267, 4000),
+		REGULATOR_LINEAR_RANGE(1376000, 268, 438, 8000),
 	},
-	.n_linear_ranges = 1,
-	.n_voltages = 268,
-	.pmic_mode_map = pmic_mode_map_pmic5_smps,
-	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
-};
-
-static const struct rpmh_vreg_hw_data pmic5_ftsmps525_mv = {
-	.regulator_type = VRM,
-	.ops = &rpmh_regulator_vrm_ops,
-	.voltage_ranges = (struct linear_range[]) {
-		REGULATOR_LINEAR_RANGE(600000, 0, 267, 8000),
-	},
-	.n_linear_ranges = 1,
-	.n_voltages = 268,
+	.n_linear_ranges = 2,
+	.n_voltages = 439,
 	.pmic_mode_map = pmic_mode_map_pmic5_smps,
 	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
 };
@@ -1190,12 +1179,12 @@ static const struct rpmh_vreg_init_data pm8550_vreg_data[] = {
 };
 
 static const struct rpmh_vreg_init_data pm8550vs_vreg_data[] = {
-	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps525_lv, "vdd-s1"),
-	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps525_lv, "vdd-s2"),
-	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps525_lv, "vdd-s3"),
-	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps525_lv, "vdd-s4"),
-	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps525_lv, "vdd-s5"),
-	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps525_mv, "vdd-s6"),
+	RPMH_VREG("smps1",  "smp%s1",  &pmic5_ftsmps525, "vdd-s1"),
+	RPMH_VREG("smps2",  "smp%s2",  &pmic5_ftsmps525, "vdd-s2"),
+	RPMH_VREG("smps3",  "smp%s3",  &pmic5_ftsmps525, "vdd-s3"),
+	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps525, "vdd-s4"),
+	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps525, "vdd-s5"),
+	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps525, "vdd-s6"),
 	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo515,   "vdd-l1"),
 	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo515,   "vdd-l2"),
 	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo515,   "vdd-l3"),
@@ -1203,14 +1192,14 @@ static const struct rpmh_vreg_init_data pm8550vs_vreg_data[] = {
 };
 
 static const struct rpmh_vreg_init_data pm8550ve_vreg_data[] = {
-	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525_lv, "vdd-s1"),
-	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525_lv, "vdd-s2"),
-	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525_lv, "vdd-s3"),
-	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525_mv, "vdd-s4"),
-	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525_lv, "vdd-s5"),
-	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525_lv, "vdd-s6"),
-	RPMH_VREG("smps7", "smp%s7", &pmic5_ftsmps525_lv, "vdd-s7"),
-	RPMH_VREG("smps8", "smp%s8", &pmic5_ftsmps525_lv, "vdd-s8"),
+	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525, "vdd-s1"),
+	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525, "vdd-s2"),
+	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525, "vdd-s3"),
+	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525, "vdd-s4"),
+	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525, "vdd-s5"),
+	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525, "vdd-s6"),
+	RPMH_VREG("smps7", "smp%s7", &pmic5_ftsmps525, "vdd-s7"),
+	RPMH_VREG("smps8", "smp%s8", &pmic5_ftsmps525, "vdd-s8"),
 	RPMH_VREG("ldo1",  "ldo%s1", &pmic5_nldo515,   "vdd-l1"),
 	RPMH_VREG("ldo2",  "ldo%s2", &pmic5_nldo515,   "vdd-l2"),
 	RPMH_VREG("ldo3",  "ldo%s3", &pmic5_nldo515,   "vdd-l3"),
@@ -1218,14 +1207,14 @@ static const struct rpmh_vreg_init_data pm8550ve_vreg_data[] = {
 };
 
 static const struct rpmh_vreg_init_data pmc8380_vreg_data[] = {
-	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525_lv, "vdd-s1"),
-	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525_lv, "vdd-s2"),
-	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525_lv, "vdd-s3"),
-	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525_mv, "vdd-s4"),
-	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525_lv, "vdd-s5"),
-	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525_lv, "vdd-s6"),
-	RPMH_VREG("smps7", "smp%s7", &pmic5_ftsmps525_lv, "vdd-s7"),
-	RPMH_VREG("smps8", "smp%s8", &pmic5_ftsmps525_lv, "vdd-s8"),
+	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525, "vdd-s1"),
+	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525, "vdd-s2"),
+	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525, "vdd-s3"),
+	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525, "vdd-s4"),
+	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525, "vdd-s5"),
+	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525, "vdd-s6"),
+	RPMH_VREG("smps7", "smp%s7", &pmic5_ftsmps525, "vdd-s7"),
+	RPMH_VREG("smps8", "smp%s8", &pmic5_ftsmps525, "vdd-s8"),
 	RPMH_VREG("ldo1",  "ldo%s1", &pmic5_nldo515,   "vdd-l1"),
 	RPMH_VREG("ldo2",  "ldo%s2", &pmic5_nldo515,   "vdd-l2"),
 	RPMH_VREG("ldo3",  "ldo%s3", &pmic5_nldo515,   "vdd-l3"),
@@ -1409,16 +1398,16 @@ static const struct rpmh_vreg_init_data pmx65_vreg_data[] = {
 };
 
 static const struct rpmh_vreg_init_data pmx75_vreg_data[] = {
-	RPMH_VREG("smps1",   "smp%s1",    &pmic5_ftsmps525_lv, "vdd-s1"),
-	RPMH_VREG("smps2",   "smp%s2",    &pmic5_ftsmps525_lv, "vdd-s2"),
-	RPMH_VREG("smps3",   "smp%s3",    &pmic5_ftsmps525_lv, "vdd-s3"),
-	RPMH_VREG("smps4",   "smp%s4",    &pmic5_ftsmps525_mv, "vdd-s4"),
-	RPMH_VREG("smps5",   "smp%s5",    &pmic5_ftsmps525_lv, "vdd-s5"),
-	RPMH_VREG("smps6",   "smp%s6",    &pmic5_ftsmps525_lv, "vdd-s6"),
-	RPMH_VREG("smps7",   "smp%s7",    &pmic5_ftsmps525_lv, "vdd-s7"),
-	RPMH_VREG("smps8",   "smp%s8",    &pmic5_ftsmps525_lv, "vdd-s8"),
-	RPMH_VREG("smps9",   "smp%s9",    &pmic5_ftsmps525_lv, "vdd-s9"),
-	RPMH_VREG("smps10",  "smp%s10",   &pmic5_ftsmps525_lv, "vdd-s10"),
+	RPMH_VREG("smps1",   "smp%s1",    &pmic5_ftsmps525, "vdd-s1"),
+	RPMH_VREG("smps2",   "smp%s2",    &pmic5_ftsmps525, "vdd-s2"),
+	RPMH_VREG("smps3",   "smp%s3",    &pmic5_ftsmps525, "vdd-s3"),
+	RPMH_VREG("smps4",   "smp%s4",    &pmic5_ftsmps525, "vdd-s4"),
+	RPMH_VREG("smps5",   "smp%s5",    &pmic5_ftsmps525, "vdd-s5"),
+	RPMH_VREG("smps6",   "smp%s6",    &pmic5_ftsmps525, "vdd-s6"),
+	RPMH_VREG("smps7",   "smp%s7",    &pmic5_ftsmps525, "vdd-s7"),
+	RPMH_VREG("smps8",   "smp%s8",    &pmic5_ftsmps525, "vdd-s8"),
+	RPMH_VREG("smps9",   "smp%s9",    &pmic5_ftsmps525, "vdd-s9"),
+	RPMH_VREG("smps10",  "smp%s10",   &pmic5_ftsmps525, "vdd-s10"),
 	RPMH_VREG("ldo1",    "ldo%s1",    &pmic5_nldo515,   "vdd-l1"),
 	RPMH_VREG("ldo2",    "ldo%s2",    &pmic5_nldo515,   "vdd-l2-18"),
 	RPMH_VREG("ldo3",    "ldo%s3",    &pmic5_nldo515,   "vdd-l3"),
-- 
2.43.0


