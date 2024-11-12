Return-Path: <linux-arm-msm+bounces-37503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 459279C4AB0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 01:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F36FD284E9B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 00:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9CF1E048A;
	Tue, 12 Nov 2024 00:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="FS40009j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA01D0B8B;
	Tue, 12 Nov 2024 00:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731371223; cv=none; b=SHeQa/dueXDCLp+sqAdWOIf5wC5SfZzFlDfmBxZGzhvRLy5Ju1dyRK3TPCTxXzIJhXVfevMMP2fdZOp0doi0zRuGlzsU6L+qT4qPFeowl71oWLohA/t8vZnH8YJTcCXJAT1L95TX2i/TvgMoO/YhTe0dJYA7Z0XbmGvfnmygLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731371223; c=relaxed/simple;
	bh=+z4NYPTX5sdAfnFceaCyFO1AGFmM9mKcUlQxlHqrM+g=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=akkiX0bLmNNEc32AfwZFvm+67ErmcLGY16fNiB7RYwX+U2VguFHBDruEqCU65AYPQ3iNzneqPohDMrlf351ppyurhKE6npWCV5ygjcilXeKRRQefD/zatUp7fdd6tf/afOL1SE5TLyof1C2kRO4bLIjEFwu1EBGvi7qjlbbpNdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=FS40009j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABCkoaH027759;
	Tue, 12 Nov 2024 00:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=p6Npo85zcquONpzP9bqka0
	AfUQIdZQGxbfjf8C0fNrE=; b=FS40009jKJRsulSVWq2+dL1X73bF4yDItlaDA8
	Y6ZcUisFyqGllzTtrwOqQTZlAjDmDbTKlWMoHsDeDmAMN6q4DqgjONNiO95HsdKv
	CYf03Ac0xl+nv3xhc6RWlI0irXPKGKVBK2gUoDbF9eMS94DrsMy6/KqA4DmTsIIq
	q++efHswGkLz/AMOkUWCDlDjkwjTAxTBaUxw5cYBVdh9D/AhYXrGOLfv3D+10Z7r
	c5JlXCjFkD0+w6i31n5l9h1yuZDBNbRRLIVV5pd/O8nMgF9/qrCE88xlp3X3VY9k
	Z9QcWwCzqpPsT2NtgKzfxZu3Vp56phdMsEyiXwkYbzWJgC7Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxr5wpd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:26:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0QuKG002322
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:26:56 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:26:55 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>
Subject: [PATCH v2] regulator: qcom-rpmh: Update ranges for FTSMPS525
Date: Mon, 11 Nov 2024 16:26:45 -0800
Message-ID: <20241112002645.2803506-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: SobT7Ko_PQjhNfyOOLGaUExzn0CReRgA
X-Proofpoint-GUID: SobT7Ko_PQjhNfyOOLGaUExzn0CReRgA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411120002

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
---
Changes in V2:
- merged FTSMPS525 lv and mv into one
- updated all regulator structs
---
 drivers/regulator/qcom-rpmh-regulator.c | 83 +++++++++++--------------
 1 file changed, 36 insertions(+), 47 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6c343b4b9d15..7870722b6ee2 100644
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

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.46.1


