Return-Path: <linux-arm-msm+bounces-28771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF58954469
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 10:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 542CF1F27CED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16E313DDC7;
	Fri, 16 Aug 2024 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="DjQvwhwS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3A913D28C;
	Fri, 16 Aug 2024 08:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723797174; cv=none; b=HJGp+y9AStiVOrYDqtfsYcC/j5q7GlsI+Abv7UcCBQG98PrjTihpYcIA5eUTGn9x8N7c3T/LT+hAu/JdIUHBlMFQkhNU8RdJIKSd02Nw+KRW/bDRfU+mZuBK29YDV9jRxrqAUZmtxRaXN4GWBfLcEJrjg4e8XnYcMhcpjbPVeqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723797174; c=relaxed/simple;
	bh=0ZMkUASGnpGGq/h2PebuHB9IAfWoWgOhFwprZqC5WNc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=EvyIKhSe0C3cWasPf/WBYpengp8z7Q8hOdvqv8FWSLFzQAmA2NCiky/EBZXZC8Gytrlt35UPPlk+5r4rwZcGy4HwDNoSwXHu5P8gFGNPSc/ezzcNJbYQGsRgeH3y4A6RPlf6zptbOTzWB89DrIJEqSp/OYauFdwyTCkYHIsr1x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=DjQvwhwS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47G54FAv003159;
	Fri, 16 Aug 2024 08:32:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uNV21MZHtkYk2L3ftKwzTrt7Gh5NJkbrHp7VTKDyHH0=; b=DjQvwhwS17U/EVYp
	bdEjUlhSREABcFM8YKP+Nh5JyXCjRtgVTwqNx7aB+0iLa+VQdB2Yd2RtA8nhvBW7
	OPdQPS6VmU9ZdfsM9HuPTVYuv8LJpoKLnASvY3T3iTWTewULzs03CKWJTSqUXI0M
	LkeSBN7kTgGThXfyQjt4Jfn2lq7Fsx3aQrZ/SJ2L2T2F2axToP0XU4vBqVQ9m7Pp
	iEi0FXoj3trL6hk1vMAC1f7txfwXX5DUbZwbw5TCT578Pt11lK5IxXQEeXM9iQJ4
	9Qvf/kE6nkFUKUr1tWp9omZ+Tc54aCL85Ry4rIMpEA+/Bh2vysTjQjwQXMnCKFSD
	wDvbJA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4112r3v6kv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:32:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G8Wl1V019237
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 08:32:47 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 16 Aug 2024 01:32:43 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 16 Aug 2024 14:02:11 +0530
Subject: [PATCH v2 2/5] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240816-qcm6490-lpass-reset-v1-2-a11f33cad3c5@quicinc.com>
References: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
In-Reply-To: <20240816-qcm6490-lpass-reset-v1-0-a11f33cad3c5@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: yx7qliW6f3v5oOByOVZXPjbWiiLdH8vy
X-Proofpoint-ORIG-GUID: yx7qliW6f3v5oOByOVZXPjbWiiLdH8vy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 mlxscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxlogscore=914 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408160061

On the QCM6490 boards the LPASS firmware controls the complete clock
controller functionalities. But the LPASS resets are required to be
controlled from the high level OS. The Audio SW driver should be able to
assert/deassert the audio resets as required. Thus in clock driver add
support for the resets.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index 45e726477086..b64393089263 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
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
+	if (desc->num_resets)
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
2.45.2


