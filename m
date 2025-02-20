Return-Path: <linux-arm-msm+bounces-48594-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C128FA3D06B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 05:23:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14AB03BB0D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 04:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DB41DFE3A;
	Thu, 20 Feb 2025 04:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iSu3UCB7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75A51E3DC4;
	Thu, 20 Feb 2025 04:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740025404; cv=none; b=ULykc5y/gcK8jfevAJ/US8xFZKLjb1JtGgzwQ8FmgUhlo2Un5jsFidpsOYwJlICbPoRdhugB0h0GCV6UYFeWvfV32a89dP3TB32XD37xsvmnXjFQTt0jFXza0Z6rJG7bKsrqgii4gDL5t0oO5dFSjl3kqcgpSg1Jl8aNgOJCZ9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740025404; c=relaxed/simple;
	bh=3tgyyd8lezTNS3l/l9gW6csXDs9uJkFmPfYybXgCWFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=POOVMaBP6QyguHzU/rxU/cHJxEt2v0ylpr8M8+s+Fv3HUhUxfSz1ctymytTf9+SsxjKOGMtSzwpsGiRu7YsWFze3xYVZsfgq929ZG1U5sXvyBdME6EndKtutYvproMd6J2xra45IkdHidGGjzvFad/pJiLKV5mhgPg1HdUv1NqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iSu3UCB7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGWv1d025572;
	Thu, 20 Feb 2025 04:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yfYDT9NI/moVk68wf7wp+29GtN3pN/JFbs5SZZMGYlg=; b=iSu3UCB7+gKVpS1F
	+ejAYbf/JQ3GpOkpBdITPx1KLPqoprujWMEx9cfx/tcOZu2UCLiL9goNwTh4KaUi
	huDfSe8WMtBTZ5lDelv5oeNgeGmz7Ozsmy2zgML0rc9HNIJTK1jD3wdisIsqsZcB
	R/c97QjZkfqEHJ8y7pqE8/a9slpjU5jWIg27Bmj7Ov/oGqyZ7lgS3CJqjWAqadb2
	jwzkVjYcyN2Qgk7VePqqVBeXH6RVAqjtOFFmaUdfVpZITZ+9by3WqJLyTqXAgzsc
	jehaLpRy2EO9g/xVgUGvwVhotm7Qlz6LLlDVcDvJ1nH3c1xYF1bR+/ESaDCEGPFX
	DMociQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0muqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51K4NJAM017196
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 04:23:19 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Feb 2025 20:23:14 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 20 Feb 2025 09:52:51 +0530
Subject: [PATCH v4 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250220-lpass_qcm6490_resets-v4-2-68dbed85c485@quicinc.com>
References: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
In-Reply-To: <20250220-lpass_qcm6490_resets-v4-0-68dbed85c485@quicinc.com>
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
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _Dd4Su498v3cUwMfeT4llO-teEJVhkML
X-Proofpoint-ORIG-GUID: _Dd4Su498v3cUwMfeT4llO-teEJVhkML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_11,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=997 spamscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200027

On the QCM6490 boards, the LPASS firmware controls the complete clock
controller functionalities and associated power domains. However, only
the LPASS resets required to be controlled by the high level OS. Thus,
add support for the resets in the clock driver to enable the Audio SW
driver to assert/deassert the audio resets as needed.

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


