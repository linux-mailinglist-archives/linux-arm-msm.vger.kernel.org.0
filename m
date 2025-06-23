Return-Path: <linux-arm-msm+bounces-62109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F47AE4B63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 18:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CE0E4188BCD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 16:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02E882BCF5B;
	Mon, 23 Jun 2025 16:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0b8AB0Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 349F5274FE3
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750697041; cv=none; b=iaSCvn4/BOBBtMnF6gDKXUD6tFqPv9qQPhf6N/fzNoHUn0IP2Qzi0w4beMEo8wvSvdexWQWeBqB+OSGmPDyrbRb728G8kLnbQNrcc4bh9p5xSXvvQMFzmXJzIn63ClwNMiUaE0pdBthGRH7biRFsnXjtbEFecKKQJHYhxIREnWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750697041; c=relaxed/simple;
	bh=sn1KF/6Ht8dkS8+c6d0VPrkLlRi1uh3h1hk4Rb9e8aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J6kI94JIYu20zrWIc0IgeCuC5NObbNIoyk1bsq1lgByGe9jAbW7QYu1jo7UkjjCFLa1f9Y/7FqvVjPRgZCPLI8Juy6MLtZpYkNXcHu5cdEXdEyOh7Qxo7K3kLwSN2CbjWn2R6+TXAoxlpmaDOd6arJ3Y4t9mpDr9DsXbHHpk9zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0b8AB0Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9h6FN015282
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:43:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWNqZMKTL0RTyb8f45ntbHnU/u8jjeMVsb9+e79xe8I=; b=Y0b8AB0Qs2iqnAPB
	daDNou9tezI1vzPFipSgtNpZdc6XN5f7wogT+SgGE7hcsK+beaGhlYL77Q8pwcha
	A6ffV+82Qtwq+VGlify2nA3e+kUuNfFt84ygY3UE34c1frSMffqbAIO6SWn2KUMv
	IK8KQQIPMb6Uo5yx1Mhbxwsx5Z6Ty9GTm+0RcH64N0VjusMn8d2/ifEbk4AjvqMf
	K6QcsLNQm/+/QXtBbQ5+/w67cx8VbZsUEbimxQ/b6f54VgC3YIXMwwW5lJtWpxnR
	CJ/T+VIjeSEmDVmoGlX/voKBbtO4sMBsU959x7M9DXdu4g88NVDiJfKm0gh6AT+A
	4LgqOw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4jncy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 16:43:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-313d6d671ffso4123135a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 09:43:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750697038; x=1751301838;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWNqZMKTL0RTyb8f45ntbHnU/u8jjeMVsb9+e79xe8I=;
        b=Mji/q20soTh0ppRM/7TQaEs8ucH9pyUD/k3zrLsyBFqBmVbd44niiXx8eKkabw7j8z
         yW8em00M3iiBZjx7mhn9V7SBBCWisBdrgze/VN1wavKKlzm263N5pQH7rU5paYu9J55g
         gz/si8Db1bL4nhDKSrVvNuato69FLE3iZebpmNAzlcqAvVnvevbo30PVQlUlZqhlGpxI
         I9mHDEwIzNKP2On/ojaMTnsdMzd6lCk3e26f2aOcqKqN0i9SjhYeNBNnK4EVh9qwdA0D
         HWmFovxhoFNc6brQLuvmCyPoGtGJtm4wNDQjOk0eiriZE/dpFE1173F8XucUfbS7u8HA
         ZgSw==
X-Gm-Message-State: AOJu0YyBSu3wGWbnH0mZHY1OY3PuOKI3ogNqOnjGL4ILxt19m+EAL970
	jWo5GPDGIsn/ktGDIQQGXgFdynBgr7skgKDSt+M5MzvdNWXK1vtn9qrn6EoLCgkZpHTFtAWEduW
	h34NBo6gbUXV+R3p4Hv/Kl4HU7p5rZOwp2NKT6C6Zj8fb5cdbVRoFeVeU8yXj6ZWTafeC8uhFmc
	M0
X-Gm-Gg: ASbGncsFSTrPKWysbAxdpAglOxjRkuxRENOHRJ2IkPy68Sa11pIqIetCcjW1pIviTd/
	b2f8eB0LFRpHX7au4TA5t6AbweqExKW3zm/M23xf+9xSYjIftIrcV6AoGV6hiyLSuRrsq+plGrQ
	Qmli3jkpip5AY+82DHcPo9dS0CsJQ/q5RGxqAdMGa6iwnMwyrDGjg7W7dDfu/GRxUBImzqdbO5U
	keaYxuBuWkAS/Yum49VCWcikivx+Ia34HBei2ZCoCnliPYlPqEXdeGFbcCW9Rk6yJwrAYOdN5hZ
	viV4Ean2FTOIJNSd73SaKRXT/yE67G7ObejZrjrnW7AV47HhfpyV
X-Received: by 2002:a17:90b:5826:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-3159d64432cmr20159126a91.8.1750697038077;
        Mon, 23 Jun 2025 09:43:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEc6+DPGexoqt9iFZAUHgGKTSWRV9mQ6Fl4MWUU0bfxuffMek6pig/mwkiOYyr/RXSKgvyvnA==
X-Received: by 2002:a17:90b:5826:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-3159d64432cmr20159094a91.8.1750697037645;
        Mon, 23 Jun 2025 09:43:57 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e048346sm9271254a91.26.2025.06.23.09.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:43:57 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 22:13:41 +0530
Subject: [PATCH 2/2] regulator: qcom-rpmh: Add support to read regulator
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-add-rpmh-read-support-v1-2-ae583d260195@oss.qualcomm.com>
References: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
In-Reply-To: <20250623-add-rpmh-read-support-v1-0-ae583d260195@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750697028; l=5166;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=sn1KF/6Ht8dkS8+c6d0VPrkLlRi1uh3h1hk4Rb9e8aw=;
 b=EOeQmrffC193kGihEndFlAgPdXhvvTnjn+yaE0LDszh2PJZd0RPEd6NXWQbpmtm38atm5WTCg
 gSkNudxW7jFB3NNqaMBhBuYhALq/nNtQEkfbSZPm9k4fUxq5oqYG9Jo
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=6859844f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=oayDomAjHHfHustaWQ8A:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: VLCOUZftl3Ei19cpjzrERW2HoUwnYR8Y
X-Proofpoint-ORIG-GUID: VLCOUZftl3Ei19cpjzrERW2HoUwnYR8Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDEwMSBTYWx0ZWRfX2VYUCYO+GDzX
 1WDx+fS5VpvpiUxYCYmRfPU6sGnUs5IiI5FtWWmATMh3jcvfLzbymv5fxdgWguwz5m9yi9Mg5X1
 CKgbBbQ8uxTWplx0/Evc7uXvnyr11DGvIMGotbQj6o//Xxp0oJh/YOcdlsrckkVT5AJoVKWGeiP
 XXmOFTVi0Ge5Qw2XKYyVim1SVUCd8R1CIrK0YUZ+MuYdxniqMAU1nA2pnldxrkAiT5qZBxRUuiY
 3pJzYj+sV3W8gWnjvYLtyFUOOF2oqMvu92ni1sTPK5CXXV7FN6ERKpxWNqP8/ma+GgsXwWbWyyg
 AmyEeTn2BGATRaodoFxm2OFOrqaKEZ7gKkPMqEcqdIk/p5/fGbpUCpOnXwcnH4DqkNoWRE6uOcy
 55l4t5/imRykovahQZNxSZGAMh6hp6dkyriVabzr+FijhOq7cscgN2Cq7zQBaZqkttLIgxdr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230101

Currently, the RPMH regulator's `get_voltage_sel()` function only
returns cached values from the last `set_voltage_sel()` operation.
This limitation prevents the regulator framework from accurately
reflecting the regulator configurations set during the bootloader
stage. As a result, the regulator framework may trigger an
unnecessary `set_voltage_sel()` call with the `min_uV` value
specified in the regulator's device tree settings, which can
cause issues for consumers like the display and UFS that require
a consistent voltage setting from the bootloader state until
their drivers are probed.

To address this issue, enhance the `get_voltage_sel()`,
`get_mode()`, and `is_enabled()` callbacks to read the regulator
settings directly from the RPMH hardware using the `rpmh_read()`
function. This change ensures that the regulator framework
accurately reflects the actual state of the regulators, avoiding
unnecessary voltage adjustments and maintaining consistent power
settings across the transition from bootloader to kernel.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
---
 drivers/regulator/qcom-rpmh-regulator.c | 71 +++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 7870722b6ee21ce487c2cf911760fb4a385fc44b..ba5bd4ecec7429a1ada008c237cf7444a37a9cc6 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-2021, The Linux Foundation. All rights reserved.
 // Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+// Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
 
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
@@ -33,8 +34,13 @@ enum rpmh_regulator_type {
 };
 
 #define RPMH_REGULATOR_REG_VRM_VOLTAGE		0x0
+#define RPMH_REGULATOR_VOLTAGE_MASK		0x1FFF
+
 #define RPMH_REGULATOR_REG_ENABLE		0x4
+#define RPMH_REGULATOR_ENABLE_MASK		0x1
+
 #define RPMH_REGULATOR_REG_VRM_MODE		0x8
+#define RPMH_REGULATOR_MODE_MASK		0x7
 
 #define PMIC4_LDO_MODE_RETENTION		4
 #define PMIC4_LDO_MODE_LPM			5
@@ -174,6 +180,28 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
 	return ret;
 }
 
+static int rpmh_regulator_read_data(struct rpmh_vreg *vreg, struct tcs_cmd *cmd)
+{
+	return rpmh_read(vreg->dev, RPMH_ACTIVE_ONLY_STATE, cmd, 1);
+}
+
+static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
+	};
+	int ret;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret)
+		*uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
+	else
+		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
+
+	return ret;
+}
+
 static int _rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 				unsigned int selector, bool wait_for_ack)
 {
@@ -215,6 +243,14 @@ static int rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	int ret, uV = 0;
+
+	if (vreg->voltage_selector < 0) {
+		ret = _rpmh_regulator_vrm_get_voltage(rdev, &uV);
+		if (!ret && uV != 0)
+			vreg->voltage_selector = regulator_map_voltage_linear_range(rdev,
+							uV, INT_MAX);
+	}
 
 	return vreg->voltage_selector;
 }
@@ -222,6 +258,18 @@ static int rpmh_regulator_vrm_get_voltage_sel(struct regulator_dev *rdev)
 static int rpmh_regulator_is_enabled(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
+	};
+	int ret;
+
+	if (vreg->enabled < 0) {
+		ret = rpmh_regulator_read_data(vreg, &cmd);
+		if (!ret)
+			vreg->enabled = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
+		else
+			dev_err(vreg->dev, "failed to read ENABLE status ret = %d\n", ret);
+	}
 
 	return vreg->enabled;
 }
@@ -303,6 +351,29 @@ static int rpmh_regulator_vrm_set_mode(struct regulator_dev *rdev,
 static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_MODE,
+	};
+	int ret, pmic_mode, mode;
+
+	if (vreg->mode > REGULATOR_MODE_INVALID && vreg->mode <= REGULATOR_MODE_STANDBY)
+		return vreg->mode;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret) {
+		pmic_mode = cmd.data & RPMH_REGULATOR_MODE_MASK;
+		if (pmic_mode == 0)
+			return vreg->mode;
+
+		for (mode = 0; mode <= REGULATOR_MODE_STANDBY; mode++) {
+			if (pmic_mode == vreg->hw_data->pmic_mode_map[mode]) {
+				vreg->mode = mode;
+				break;
+			}
+		}
+	} else {
+		dev_err(vreg->dev, "failed to read MODE ret = %d\n", ret);
+	}
 
 	return vreg->mode;
 }

-- 
2.25.1


