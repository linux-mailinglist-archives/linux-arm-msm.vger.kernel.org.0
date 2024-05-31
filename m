Return-Path: <linux-arm-msm+bounces-21253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 866E48D5F9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 12:23:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39585286163
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 10:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9B1156253;
	Fri, 31 May 2024 10:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mosd9YST"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9BDF1422C4;
	Fri, 31 May 2024 10:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717151006; cv=none; b=V4dpxzxerYgugJMYfIEFoYIzZc/N0XLgRdInocNb9lWg0VB5ktMmfizDPZAM2doXSiLqKuYTP4pTxdLDgkFtyJciAkJNeZyXamTh5UfildZADJ0PrrTfGvrhK6fuBgirge02Ty+lqmMSRwIRP4xvI8bEmU4IoLb4ms+nuSpH0KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717151006; c=relaxed/simple;
	bh=C04A070beB+TgMmqa4TlrqEGMuu3GB0eweCEPYauxnI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fwCmjZrKTJf9zuo7o1VGI4GAVcijUNsdweZJAQCgETxfR1C/PHo971EekRTNhrBOFxsmyyiJnfOxDkasGwFXGyqMmIfs9KsmBEemxSFs4vKXJ7w5RyBmU9eZAa8Et2bJMu7QSTyIJEyTHUhhbKxeg8B2YmeCufC9LkVyVnGVaVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mosd9YST; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9t8EN017112;
	Fri, 31 May 2024 10:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EXD1bjniojvp9s34EcZxDHOy
	G+USYSGJiC/xKP3fuvo=; b=mosd9YSTAQIQ0XHu2jId3RI/vl17+4iP6BMF1xtc
	5+jF+eL2JF5n/R/RWsVtq293FC2jlZFuH0wYRYpPLxJbY0OvC0KFKlIFPF1EeJKn
	yA2x42HEk865tNcNoTEoNELee+YqWZ07AjhhIXuNfdwRVcU9rNytePgEHUsk3at7
	ouIhKsTu/fqXrd26mMXsQ++YnH2QuTW3MOJbtfRrrbTmwJH0fNQRdLQQFeN0QHek
	LtiopFXjcjUH9Z3MKe8Fw/VucvcToNZUUWmn8iCAsD0ExxF0SDc7fHPqkiOQ0CmQ
	oZjlA75Qmj/CrmxOZJfuXBYtblRZV0n/bKL806x4ftDEGQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yf23ssd5c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:23:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44VANKHf012706
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 10:23:20 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 03:23:16 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>,
        <devicetree@vger.kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for LPASS resets for QCM6490
Date: Fri, 31 May 2024 15:52:50 +0530
Message-ID: <20240531102252.26061-3-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531102252.26061-1-quic_tdas@quicinc.com>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OpVsdgO0MJqmKXL_Eo2_-vlqK3vJEqyr
X-Proofpoint-GUID: OpVsdgO0MJqmKXL_Eo2_-vlqK3vJEqyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_06,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310077

On the QCM6490 boards the LPASS firmware controls the complete clock
controller functionalities. But the LPASS resets are required to be
controlled from the high level OS. The Audio SW driver should be able to
assert/deassert the audio resets as required. Thus in clock driver add
support for the same.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index c43d0b1af7f7..7fdfd07c111c 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #include <linux/clk-provider.h>
@@ -869,10 +870,36 @@ static struct platform_driver lpass_aon_cc_sc7280_driver = {
 	},
 };
 
+static const struct of_device_id lpass_audio_cc_qcm6490_match_table[] = {
+	{ .compatible = "qcom,qcm6490-lpassaudiocc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lpass_audio_cc_qcm6490_match_table);
+
+static int lpass_audio_cc_qcm6490_probe(struct platform_device *pdev)
+{
+	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
+	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
+
+	return qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
+}
+
+static struct platform_driver lpass_audio_cc_qcm6490_driver = {
+	.probe = lpass_audio_cc_qcm6490_probe,
+	.driver = {
+		.name = "lpass_audio_cc-qcm6490",
+		.of_match_table = lpass_audio_cc_qcm6490_match_table,
+	},
+};
+
 static int __init lpass_audio_cc_sc7280_init(void)
 {
 	int ret;
 
+	ret = platform_driver_register(&lpass_audio_cc_qcm6490_driver);
+	if (ret)
+		return ret;
+
 	ret = platform_driver_register(&lpass_aon_cc_sc7280_driver);
 	if (ret)
 		return ret;
@@ -885,6 +912,7 @@ static void __exit lpass_audio_cc_sc7280_exit(void)
 {
 	platform_driver_unregister(&lpass_audio_cc_sc7280_driver);
 	platform_driver_unregister(&lpass_aon_cc_sc7280_driver);
+	platform_driver_unregister(&lpass_audio_cc_qcm6490_driver);
 }
 module_exit(lpass_audio_cc_sc7280_exit);
 
-- 
2.17.1


