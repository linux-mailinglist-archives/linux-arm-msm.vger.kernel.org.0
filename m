Return-Path: <linux-arm-msm+bounces-35297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 051C89A93B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 01:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 337681C213C6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8354E1FEFD6;
	Mon, 21 Oct 2024 23:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B1dKCYBC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79951FEFC1;
	Mon, 21 Oct 2024 23:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729551846; cv=none; b=HYyicU8e07nRj3F2fy1kIFwyUjVXgOMFd3kf1gNB/x84Do9f6sScMHLI1YzbAm/q7y4UnxuGzHTP3fOz+3MlAYvuYHikg4aEMwC2hAQtb1zy84X/5ROeP93BLxyxv1MK4iCcgTyWkLJQS+4qeTkdqB670Bgg4QA8qUwnmjAKy0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729551846; c=relaxed/simple;
	bh=RaPLkuWVFvaftCTJ5a25SFlPFXYSreEOMWFWgxTfImc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TfH9CiBzQKMh4J0swHY/9LzdDuUW2YR9HptZXnS3sn7D/BS04VbYjtai2x1FrK0pcqcv9e1fEIuJOdMtpHT8loTcHDLXKFx5YvARdnnwuYgbcedzq6RxOXFRaC92xSmrDGnMHFDdqgn+CtoJ/6oUVrDFYpVIhVP5lGqrkK4eIRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B1dKCYBC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LFtvEu014284;
	Mon, 21 Oct 2024 23:04:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wALBC3nHnJnHXczlJvOdCY
	DVMtQwyHzySxJpm2WOcoI=; b=B1dKCYBCHIREYeb52xy/6Go2G5Gjc/CkYruD58
	I0AtdkM6+1ATEiagO8DMePK74WKYexpSg7I6TCFySScun9LPD6XHE0pfg25083xA
	QvtQLW4Yw1Sulcp0LJKE9vTbZWMndneB6gC9889j3JayZ4QDxIYVv/3U0eBN4Oxi
	5mKctkHnV/I4xi8Wc9gAmPTs4hUi890ERx5gy3knloHW9dfSq2g59huVF/P1h94O
	QMrD7HgIswrm1oBuTglWR2trwC79TrPf4UZv0E1fwkwF7XeYg2rfeRCbScjkPGPR
	1m7y1TmPBk5XH/bjrWGqpybH/BwrHIpp6OFcYHzpuwC7WeTw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dkhd2djp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:04:00 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LN3xeO009473
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 23:03:59 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 16:03:59 -0700
From: Melody Olvera <quic_molvera@quicinc.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>
Subject: [PATCH] regulator: qcom-rpmh: Update ranges for FTSMPS525
Date: Mon, 21 Oct 2024 16:03:48 -0700
Message-ID: <20241021230348.2632381-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DytI8oWvQlLBXWBLHMP5ouu7vE8hdvMw
X-Proofpoint-GUID: DytI8oWvQlLBXWBLHMP5ouu7vE8hdvMw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410210163

The FTSMPS525 regulator has several potential ranges,
so update the ranges accordingly for SM8750.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 6c343b4b9d15..272de7bc9c88 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -848,9 +848,10 @@ static const struct rpmh_vreg_hw_data pmic5_ftsmps525_lv = {
 	.ops = &rpmh_regulator_vrm_ops,
 	.voltage_ranges = (struct linear_range[]) {
 		REGULATOR_LINEAR_RANGE(300000, 0, 267, 4000),
+		REGULATOR_LINEAR_RANGE(1376000, 268, 438, 8000),
 	},
-	.n_linear_ranges = 1,
-	.n_voltages = 268,
+	.n_linear_ranges = 2,
+	.n_voltages = 439,
 	.pmic_mode_map = pmic_mode_map_pmic5_smps,
 	.of_map_mode = rpmh_regulator_pmic4_smps_of_map_mode,
 };
@@ -1196,6 +1197,8 @@ static const struct rpmh_vreg_init_data pm8550vs_vreg_data[] = {
 	RPMH_VREG("smps4",  "smp%s4",  &pmic5_ftsmps525_lv, "vdd-s4"),
 	RPMH_VREG("smps5",  "smp%s5",  &pmic5_ftsmps525_lv, "vdd-s5"),
 	RPMH_VREG("smps6",  "smp%s6",  &pmic5_ftsmps525_mv, "vdd-s6"),
+	RPMH_VREG("smps7",  "smp%s7",  &pmic5_ftsmps525_lv, "vdd-s7"),
+	RPMH_VREG("smps8",  "smp%s8",  &pmic5_ftsmps525_lv, "vdd-s8"),
 	RPMH_VREG("ldo1",   "ldo%s1",  &pmic5_nldo515,   "vdd-l1"),
 	RPMH_VREG("ldo2",   "ldo%s2",  &pmic5_nldo515,   "vdd-l2"),
 	RPMH_VREG("ldo3",   "ldo%s3",  &pmic5_nldo515,   "vdd-l3"),
@@ -1205,7 +1208,7 @@ static const struct rpmh_vreg_init_data pm8550vs_vreg_data[] = {
 static const struct rpmh_vreg_init_data pm8550ve_vreg_data[] = {
 	RPMH_VREG("smps1", "smp%s1", &pmic5_ftsmps525_lv, "vdd-s1"),
 	RPMH_VREG("smps2", "smp%s2", &pmic5_ftsmps525_lv, "vdd-s2"),
-	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525_lv, "vdd-s3"),
+	RPMH_VREG("smps3", "smp%s3", &pmic5_ftsmps525_mv, "vdd-s3"),
 	RPMH_VREG("smps4", "smp%s4", &pmic5_ftsmps525_mv, "vdd-s4"),
 	RPMH_VREG("smps5", "smp%s5", &pmic5_ftsmps525_lv, "vdd-s5"),
 	RPMH_VREG("smps6", "smp%s6", &pmic5_ftsmps525_lv, "vdd-s6"),

base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
-- 
2.46.1


