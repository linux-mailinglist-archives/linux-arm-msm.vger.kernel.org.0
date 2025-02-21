Return-Path: <linux-arm-msm+bounces-48843-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B553A3F06E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 749A617FC8C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:35:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C2DF2040AE;
	Fri, 21 Feb 2025 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JjXcOPQD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE39A204098;
	Fri, 21 Feb 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740130531; cv=none; b=XtbSjkiO2vbEXKeXjt2xlkxtrnzUXJQ4fEjGr++7oxXIyTF1CE4tJI77+IhkNuyQMCBapT3K/vqgRcPLbuRlklVGJBKYVw5NXyv+sfHx19iXkrB/wWWGwki/EZzd6IEE7IepnJrmycjLkkdr7o/DSYHA4USkgvP78XXrrU4iDDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740130531; c=relaxed/simple;
	bh=l7aZ1+MSWpP572OIQy0iFpXOMlHb+BNa5dBGsJtUgIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ByVT8HN2QhJo3/ZKMPQjiSzkqqBQhA29vjT0hqyfd06yzaOwtTwJlS7bSVsbAmFXTZR9SH/tP6mTB9/pLls48Qe9AYJoLazD6Vl1Wi8gFjOqesOS4ijDyZrDBmdAT5tsed5YJW+mGaKDAUX9BIpN9KDqa9VVBAE6uDgZQqHXxh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JjXcOPQD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L62Sg9012548;
	Fri, 21 Feb 2025 09:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lTJi/hM8g88Eg34/6/L4YwApfqduPKfEJfBXRx17lw=; b=JjXcOPQDHBmUkLxT
	GHVMDBYEYj81g/y6zHMwkiIs0n0EFQWq7DrrcF3YhUiFh00Nxt/z34uQlrRqOBD2
	vYKIF0VEsh57953N9yMyfX1n/Qpe+Jvvy/LUVxbj7Jh9f5W9YEiUFNXeQMQiY228
	F+QB0aijTtpnEOtVC1CI6ndGt7RPI3Ruxhimf5MdaFafSnENErPzVAmrd2JKXvip
	qhsrXdEuquAx3UEDFEI0rdG7IBp0WzgBqyXRz+wfIQo54aLPJA6Jf5ssOW28Yb/8
	DmUFzOSaVDw6PfySZcsg877BOfX2xsK4UOJGwTfmUcNRNe1ok5xSkxT5hrNnaH4C
	qK3Wxw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1shb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:35:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L9ZPjx025752
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:35:25 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 01:35:21 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 21 Feb 2025 15:04:55 +0530
Subject: [PATCH v5 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-lpass_qcm6490_resets-v5-2-6be0c0949a83@quicinc.com>
References: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
In-Reply-To: <20250221-lpass_qcm6490_resets-v5-0-6be0c0949a83@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FEVUrSPB0eT7MRz3gr2Dl_Bq8zFCtmSt
X-Proofpoint-ORIG-GUID: FEVUrSPB0eT7MRz3gr2Dl_Bq8zFCtmSt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210073

On the QCM6490 boards, the LPASS firmware controls the complete clock
controller functionalities and associated power domains. However, only
the LPASS resets required to be controlled by the high level OS. Thus,
add support for the resets in the clock driver to enable the Audio SW
driver to assert/deassert the audio resets as needed.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index 45e7264770866f929a3f4663c477330f0bf7aa84..22169da08a51a01b8cd924c4844672c7cadc7d1a 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk-provider.h>
@@ -713,14 +714,24 @@ static const struct qcom_reset_map lpass_audio_cc_sc7280_resets[] = {
 	[LPASS_AUDIO_SWR_WSA_CGCR] = { 0xb0, 1 },
 };
 
+static const struct regmap_config lpass_audio_cc_sc7280_reset_regmap_config = {
+	.name = "lpassaudio_cc_reset",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0xc8,
+};
+
 static const struct qcom_cc_desc lpass_audio_cc_reset_sc7280_desc = {
-	.config = &lpass_audio_cc_sc7280_regmap_config,
+	.config = &lpass_audio_cc_sc7280_reset_regmap_config,
 	.resets = lpass_audio_cc_sc7280_resets,
 	.num_resets = ARRAY_SIZE(lpass_audio_cc_sc7280_resets),
 };
 
 static const struct of_device_id lpass_audio_cc_sc7280_match_table[] = {
-	{ .compatible = "qcom,sc7280-lpassaudiocc" },
+	{ .compatible = "qcom,qcm6490-lpassaudiocc", .data = &lpass_audio_cc_reset_sc7280_desc },
+	{ .compatible = "qcom,sc7280-lpassaudiocc", .data = &lpass_audio_cc_sc7280_desc },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, lpass_audio_cc_sc7280_match_table);
@@ -752,13 +763,17 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	int ret;
 
+	desc = device_get_match_data(&pdev->dev);
+
+	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcm6490-lpassaudiocc"))
+		return qcom_cc_probe_by_index(pdev, 1, desc);
+
 	ret = lpass_audio_setup_runtime_pm(pdev);
 	if (ret)
 		return ret;
 
 	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc";
 	lpass_audio_cc_sc7280_regmap_config.max_register = 0x2f000;
-	desc = &lpass_audio_cc_sc7280_desc;
 
 	regmap = qcom_cc_map(pdev, desc);
 	if (IS_ERR(regmap)) {
@@ -772,7 +787,7 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 	regmap_write(regmap, 0x4, 0x3b);
 	regmap_write(regmap, 0x8, 0xff05);
 
-	ret = qcom_cc_really_probe(&pdev->dev, &lpass_audio_cc_sc7280_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC clocks\n");
 		goto exit;

-- 
2.48.1


