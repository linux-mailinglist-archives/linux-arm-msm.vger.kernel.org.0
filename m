Return-Path: <linux-arm-msm+bounces-78218-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5484EBF8E7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 23:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2832A5649AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 21:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424C8287257;
	Tue, 21 Oct 2025 21:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q0vvAETc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058D3285C8C
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761080955; cv=none; b=KUA96uRHvocIJFr3Zt9JrPpyHDGxhm3wa9iZWpr/3kzElUK6uIKLg/1ARFuc61oFQds68xGfZnvR+4WOFs0H/aiqy6bEoMoxpNDO0nEVJuoqLNelXxnC8PJAmQ9sRY/Ra/RdVVhlz+gLGmVUKuctvmBcFTyVe/AYh45RYld62XA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761080955; c=relaxed/simple;
	bh=Ni9qSXT2cz8dlN1oChGVBn8LzfG1KAHlQ4Xgl3R07pE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=efc4LCZBE3CP5uQpiBJoiEnJI/fqBTxSWBgqVfqRllCDyFFBQuilGf5m9+n6uk4/E56WMSF1cosPpeuc7hwsB09l0YB1W9bnXCUPblzFdVEn2Ne9f8kzHWHnoy+J72UAuTNzcv1RT89MeAsshzjBj5dzmWGKzndFyN8FrxmnZzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q0vvAETc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59LEmi6b032407
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0XR3pTkPELDg+1G0fDtyKBkyK2LsQiE/QZsLPylC07Q=; b=Q0vvAETcehhax5jX
	yab09dOvq+7OMv6ek87Z9nKCa7fqQvT/qWAIjkzM31dTL6QH/G6xnE9YPvKEcYME
	YSqkl0baQ/ifLsvRfIyuMjrc4SF0N8qGoNmV10De7qVZPrUrMnAI1uhCi97QtDc7
	Iiun/+thzeCKWEj5WgyyYBT+IY+vO/R7B6bMRglqy1YZ0RebvFRiVX92tjyNh6IX
	UZ0UleDUYAUvlYSNG4b2Av3rWpoCb0oMuyd4DyY1hl8cPnF4zZOjOca1JIPjB0Ha
	JSHWL9mQF9fvPFb13oT0pHrnvskfxP95Obx2WySOh0EmKof9fo5ArPokxtpW60ql
	XypJBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v42ka2su-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 21:09:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77f64c5cf62so4504666b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 14:09:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761080950; x=1761685750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XR3pTkPELDg+1G0fDtyKBkyK2LsQiE/QZsLPylC07Q=;
        b=CkpohJdtcwHde2ygkSFvGQ772dR6c1Edo0GDMSMG1m4yicnU/1TuRDwuco8n7+tO7E
         IzbEfRwJoCp/ZTLiKcrPMFvwDevRmC031DBuAU8tCoplD5+lNQlm+TmvQymAfXF4dU2W
         1HqO3A7XyzIDdrBmlkS6/jXdJZPvYGWHbc1QT/bp06tGinpNB2cbMUuxnSIZA8FyRuI1
         Qn/nza2OkYUBd78Be5HzsdbAKwonEwvflHoJwKN5SP5zar73kAofl5lMZdWbzM0RblHS
         yJ5PonMzXzelY8h3tLQLa2+MoUmq17N/9kOSOFcGo7Qr8W2lUZ5ziUKGcIBIu4JUWun0
         5NRg==
X-Gm-Message-State: AOJu0YywWocKp8aR2Ue1wvzV7jYP1VAlvCIAkbV8QCTpCuHlt7/OJnLQ
	wHDuGDWKpsFll1Llb/6/+Hp5tLG5hcoN1p2vv6bkA6iJ8zuAfXUJEeTfrYM3eWHCWyXJtKnz36v
	wcmC1FKDkW/Uho1byaC+HD4i/h1cylCJ00NkIn4CpHPXy9XU3hCI7zrsLFNlELkXpgh4T
X-Gm-Gg: ASbGncuWG4cqzPPn7XxBT3leboocK6ZDMYIMC1S0YN9Sm/93Ola76SX/VUug91UJ5qz
	rRwBYWFQ1fV/+dXtnLOqXWgLc2UAM5AROVBSkTFBOA/kNWOQqLScydZQegsjxmkSbpQ7M3mKgpe
	fVCAILSZlxuf0/IRA5Ei7oawRDU/DxMtzTJJow7qPVVmmIjEj16X3g02wJCbQQDphjnPiTpfaeb
	QmfUjiw3D5DrH2ALxQcxJOT7aC+qhm8RpdcGMAQYOzSQbNb+9ykZixu2q95ck0TtW0jZl+WhB2t
	VXlngZg/G/1ooaMa/X+kXHAoxbBdpAWn9oNV65x9Hs9TjrBvBwPvtlqrJ3zsFtBHfgS5Lv8asOD
	NHPlhNeSK0g7XbIV2tR7U8DTnlW9TR91sklysZVHKr+lmweJxn1iUSd3fj9fz
X-Received: by 2002:a05:6a20:4322:b0:334:a322:f31f with SMTP id adf61e73a8af0-334a86292f4mr24920844637.42.1761080949989;
        Tue, 21 Oct 2025 14:09:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECpKZ2qfH9o2G05nBzZs8RUrzWCSXOS4iNOphhPw28ZlSzA9UcIpeBeGx/Lt60EXTdSAm3Kw==
X-Received: by 2002:a05:6a20:4322:b0:334:a322:f31f with SMTP id adf61e73a8af0-334a86292f4mr24920814637.42.1761080949529;
        Tue, 21 Oct 2025 14:09:09 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223c813fsm489833a91.4.2025.10.21.14.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 14:09:08 -0700 (PDT)
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 02:38:55 +0530
Subject: [PATCH v2 3/4] regulator: qcom-rpmh: Add support to read regulator
 settings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-add-rpmh-read-support-v2-3-5c7a8e4df601@oss.qualcomm.com>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
In-Reply-To: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761080935; l=9661;
 i=kamal.wadhwa@oss.qualcomm.com; s=20241018; h=from:subject:message-id;
 bh=Ni9qSXT2cz8dlN1oChGVBn8LzfG1KAHlQ4Xgl3R07pE=;
 b=rGshG/7+nuv3U9fugsY7EcAfGk07yjpMWJgy1ciYm7aZAJLOR8VcYSTvWgx4I5MeFCpWFZCC/
 pxbtZLTvb1ZDL8as76PXPPLYx3PfDq8ktmQedwD8ytDNhHsavJcgkI6
X-Developer-Key: i=kamal.wadhwa@oss.qualcomm.com; a=ed25519;
 pk=XbPE6DM5/mJi2tsiYwMCJCZ4O5XPMqColJRlGVcM7Hs=
X-Proofpoint-GUID: fPA-jG_xONHUBJBqc6yr_MFCLYukJlhZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMSBTYWx0ZWRfX9J4950HoFp4A
 fzO55AeEhZ9wVhfWwbn/4Ibs0YsSBarEgdtta8FfbDnlU1yv15xMHoBJxrx98Trj8lslXdVpIHU
 Uel8HRGuXzZF0LPC89OAugIN/m+OjoL0XvW3/R/6iv3awYovwTV+QEWIWv+qfT65l+PsKEXfwhr
 bdx/sozEGqRcShmx6w7KnjCVjMvOtASeZlCUqirT82COWegQ5w2+UL9Xca94zRlcvYphkHbWKpK
 HBRUkmmzXTj8znUr6b3x+NZtAKhENwJRzUC/60B7WZKfkoOXvq4rEfHIOUUcRlVtjLb18qhC4CC
 uc8/tVKqcjjBmDl2YelIkrItLD9KSAVOCoSq4F7c5fTum2YB8fjxITB2OVbnI2iTs17vG2BVcuc
 bxvJVBp3Fe0LFiu8OEsUOvBZhcmiyA==
X-Authority-Analysis: v=2.4 cv=QYNrf8bv c=1 sm=1 tr=0 ts=68f7f677 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KMC9D6KHGo71LM7F26sA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: fPA-jG_xONHUBJBqc6yr_MFCLYukJlhZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180031

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

To address this issue, enhance the `get_voltage_sel()`, and also
add new `get_status()` callbacks to read the regulator settings
directly from the RPMH hardware using the `rpmh_read()`function.
This change ensures that the regulator framework accurately
reflects the actual state of the regulators, avoiding unnecessary
voltage adjustments and maintaining consistent power settings
across the transition from bootloader to kernel.

Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-2-ae583d260195@oss.qualcomm.com
---
 drivers/regulator/qcom-rpmh-regulator.c | 164 ++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/drivers/regulator/qcom-rpmh-regulator.c b/drivers/regulator/qcom-rpmh-regulator.c
index 947fb5241233c92eaeda974b1b64d227d5946a59..9f693043cb87aa77a7a529b5b973323450db80be 100644
--- a/drivers/regulator/qcom-rpmh-regulator.c
+++ b/drivers/regulator/qcom-rpmh-regulator.c
@@ -61,8 +61,13 @@ static const struct resource_name_formats vreg_rsc_name_lookup[NUM_REGULATOR_TYP
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
@@ -169,6 +174,7 @@ struct rpmh_vreg {
 	bool				bypassed;
 	int				voltage_selector;
 	unsigned int			mode;
+	unsigned int			status;
 };
 
 /**
@@ -213,6 +219,36 @@ static int rpmh_regulator_send_request(struct rpmh_vreg *vreg,
 	return ret;
 }
 
+static int rpmh_regulator_read_data(struct rpmh_vreg *vreg, struct tcs_cmd *cmd)
+{
+	return rpmh_read(vreg->dev, cmd);
+}
+
+static int _rpmh_regulator_vrm_get_voltage(struct regulator_dev *rdev, int *uV)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_VOLTAGE,
+	};
+	int min_uV = rdev->constraints->min_uV;
+	int max_uV = rdev->constraints->max_uV;
+	int ret, _uV = 0;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret)
+		_uV = (cmd.data & RPMH_REGULATOR_VOLTAGE_MASK) * 1000;
+	else
+		dev_err(vreg->dev, "failed to read VOLTAGE ret = %d\n", ret);
+
+	if (!_uV || (_uV >= min_uV && _uV <= max_uV))
+		*uV = _uV;
+	else
+		dev_dbg(vreg->dev, "read voltage %d is out-of-range[%d:%d]\n",
+						_uV, min_uV, max_uV);
+
+	return ret;
+}
+
 static int _rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
 				unsigned int selector, bool wait_for_ack)
 {
@@ -254,10 +290,36 @@ static int rpmh_regulator_vrm_set_voltage_sel(struct regulator_dev *rdev,
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
 
+static enum regulator_status convert_mode_to_status(int mode)
+{
+	switch (mode) {
+	case REGULATOR_MODE_FAST:
+		return REGULATOR_STATUS_FAST;
+	case REGULATOR_MODE_NORMAL:
+		return REGULATOR_STATUS_NORMAL;
+	case REGULATOR_MODE_IDLE:
+		return REGULATOR_STATUS_IDLE;
+	case REGULATOR_MODE_STANDBY:
+		return REGULATOR_STATUS_STANDBY;
+	case REGULATOR_MODE_INVALID:
+		return REGULATOR_STATUS_ERROR;
+	default:
+		return REGULATOR_STATUS_UNDEFINED;
+	};
+}
+
 static int rpmh_regulator_is_enabled(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
@@ -287,6 +349,15 @@ static int rpmh_regulator_set_enable_state(struct regulator_dev *rdev,
 	if (!ret)
 		vreg->enabled = enable;
 
+	if (vreg->enabled) {
+		if (vreg->bypassed)
+			vreg->status = REGULATOR_STATUS_BYPASS;
+		else
+			vreg->status = convert_mode_to_status(vreg->mode);
+	} else {
+		vreg->status = REGULATOR_STATUS_OFF;
+	}
+
 	return ret;
 }
 
@@ -323,6 +394,15 @@ static int rpmh_regulator_vrm_set_mode_bypass(struct rpmh_vreg *vreg,
 		cmd.data = pmic_mode;
 	}
 
+	if (vreg->enabled) {
+		if (bypassed)
+			vreg->status = REGULATOR_STATUS_BYPASS;
+		else
+			vreg->status = convert_mode_to_status(mode);
+	} else {
+		vreg->status = REGULATOR_STATUS_OFF;
+	}
+
 	return rpmh_regulator_send_request(vreg, &cmd, true);
 }
 
@@ -342,6 +422,22 @@ static int rpmh_regulator_vrm_set_mode(struct regulator_dev *rdev,
 	return ret;
 }
 
+static int rpmh_regulator_vrm_get_pmic_mode(struct rpmh_vreg *vreg, int *pmic_mode)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_VRM_MODE,
+	};
+	int ret;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (!ret)
+		*pmic_mode = cmd.data & RPMH_REGULATOR_MODE_MASK;
+	else
+		return -EINVAL;
+
+	return 0;
+}
+
 static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 {
 	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
@@ -349,6 +445,13 @@ static unsigned int rpmh_regulator_vrm_get_mode(struct regulator_dev *rdev)
 	return vreg->mode;
 }
 
+static int rpmh_regulator_vrm_get_status(struct regulator_dev *rdev)
+{
+	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
+
+	return vreg->status;
+}
+
 /**
  * rpmh_regulator_vrm_get_optimum_mode() - get the mode based on the  load
  * @rdev:		Regulator device pointer for the rpmh-regulator
@@ -407,6 +510,7 @@ static const struct regulator_ops rpmh_regulator_vrm_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 };
 
 static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
@@ -418,6 +522,7 @@ static const struct regulator_ops rpmh_regulator_vrm_drms_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 	.get_optimum_mode	= rpmh_regulator_vrm_get_optimum_mode,
 };
 
@@ -430,6 +535,7 @@ static const struct regulator_ops rpmh_regulator_vrm_bypass_ops = {
 	.list_voltage		= regulator_list_voltage_linear_range,
 	.set_mode		= rpmh_regulator_vrm_set_mode,
 	.get_mode		= rpmh_regulator_vrm_get_mode,
+	.get_status		= rpmh_regulator_vrm_get_status,
 	.set_bypass		= rpmh_regulator_vrm_set_bypass,
 	.get_bypass		= rpmh_regulator_vrm_get_bypass,
 };
@@ -438,6 +544,7 @@ static const struct regulator_ops rpmh_regulator_xob_ops = {
 	.enable			= rpmh_regulator_enable,
 	.disable		= rpmh_regulator_disable,
 	.is_enabled		= rpmh_regulator_is_enabled,
+	.get_status		= rpmh_regulator_vrm_get_status,
 };
 
 /**
@@ -546,6 +653,58 @@ static int rpmh_regulator_init_vreg(struct rpmh_vreg *vreg, struct device *dev,
 	return 0;
 }
 
+static int rpmh_regulator_determine_initial_status(struct rpmh_vreg *vreg)
+{
+	struct tcs_cmd cmd = {
+		.addr = vreg->addr + RPMH_REGULATOR_REG_ENABLE,
+	};
+	int ret, pmic_mode, mode;
+	int sts = 0;
+
+	ret = rpmh_regulator_read_data(vreg, &cmd);
+	if (ret) {
+		dev_dbg(vreg->dev, "failed to read ENABLE status ret = %d\n", ret);
+		vreg->status = REGULATOR_STATUS_UNDEFINED;
+		return ret;
+	}
+
+	sts = cmd.data & RPMH_REGULATOR_ENABLE_MASK;
+	if (!sts) {
+		vreg->status = REGULATOR_STATUS_OFF;
+		return 0;
+	}
+
+	if (vreg->hw_data->regulator_type == XOB) {
+		vreg->status = sts ? REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;
+		return 0;
+	}
+
+	ret = rpmh_regulator_vrm_get_pmic_mode(vreg, &pmic_mode);
+	if (ret < 0) {
+		dev_dbg(vreg->dev, "failed to read pmic_mode ret = %d\n", ret);
+		vreg->mode = REGULATOR_MODE_INVALID;
+		vreg->status = REGULATOR_STATUS_UNDEFINED;
+		return ret;
+	}
+
+	if (vreg->hw_data->bypass_supported &&
+			vreg->hw_data->pmic_bypass_mode == pmic_mode) {
+		vreg->bypassed = true;
+		vreg->status = REGULATOR_STATUS_BYPASS;
+		return 0;
+	}
+
+	for (mode = 0; mode <= REGULATOR_MODE_STANDBY; mode++) {
+		if (pmic_mode == vreg->hw_data->pmic_mode_map[mode]) {
+			vreg->mode = mode;
+			break;
+		}
+	}
+
+	vreg->status = convert_mode_to_status(vreg->mode);
+	return 0;
+}
+
 static const int pmic_mode_map_pmic4_ldo[REGULATOR_MODE_STANDBY + 1] = {
 	[REGULATOR_MODE_INVALID] = -EINVAL,
 	[REGULATOR_MODE_STANDBY] = PMIC4_LDO_MODE_RETENTION,
@@ -1820,6 +1979,11 @@ static int rpmh_regulator_probe(struct platform_device *pdev)
 						vreg_data);
 		if (ret < 0)
 			return ret;
+
+		ret = rpmh_regulator_determine_initial_status(vreg);
+		if (ret < 0)
+			dev_err(dev, "failed to read initial status for %s\n",
+					vreg->rdesc.name);
 	}
 
 	return 0;

-- 
2.25.1


