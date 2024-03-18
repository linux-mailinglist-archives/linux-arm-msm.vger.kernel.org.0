Return-Path: <linux-arm-msm+bounces-14322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 351BF87E334
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 06:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8ED01F215C4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Mar 2024 05:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92A1D210FF;
	Mon, 18 Mar 2024 05:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="it42j8va"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245BA1E4AE;
	Mon, 18 Mar 2024 05:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710740223; cv=none; b=U+IbnNUQ4CiJ8JMlBDNPd7xIw0uX7nK9dkGzFl5YdMDXJ3F4bgIisvsjM9Gso+oGubQetHSJ1jkz8pQhCMX1WMlKoJWkgG3ykIAbEmd39i9ut4VQv+OqazBjgtPQWYxMlUWFycY2bhxaacOSByKYkzlh11EJq6UpqbiiXSLFkUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710740223; c=relaxed/simple;
	bh=WnRLQOFkJoxtlx91VhfafXJl62UtK8qy/bQ7HAwhYsM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pqo0nKHsifXlDgWJBjHjK72gbGjjb0zfJ4UFNQVCAzw3bWmQk6AhPaSiJtXXtnjdSxLFG1+P/sdN506ER5FZhkOWZpNScCLZ7yBSiPALYbLxmoBbpR5EoM9OR6xRbhqxVWas6XjnKBwuZ0btOSrLys6pei1PT+9zXF14wpAKSZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=it42j8va; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42I4Fq3j022791;
	Mon, 18 Mar 2024 05:36:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=jLZ2xW895TFntCjcGoJA
	BKzDhKSzU6Pmjgic9qPwDUs=; b=it42j8vaHVnLx2wd08wIyMpnwtfiDl77py8U
	c8i1AsIybFhPtbeYNvMTG0J6V9PYLM1ileZINVpWby8E097acW3Vexr60eTWFeIn
	aIaHebDGftfCYpRQHjIh7h0bh2R+W1Sj0qrEDyRXytXhoJoBa46wANiYDG5j0svc
	jZWzrOUU2iI6lIypF3FWNrI/fJeccq3IdhwgdlJdokv6MinQlVIrk4Q/qAxUwSKK
	GC9soXhDspFCtzPnKq3c0aZ/zyYQW2679k/nBghhfAUf3ik37oCNpau2meOTOHZD
	TNxwFMK15oURl1pbY+UGwQHryHEQHGc4BLVny3oIyZvGyB7ajQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wwxtb94m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:36:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42I5avTA014417
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Mar 2024 05:36:57 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Sun, 17 Mar 2024 22:36:53 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?=
	<mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 3/8] clk: qcom: lpassaudiocc-sc7280: Fix the regmap conflict warning
Date: Mon, 18 Mar 2024 11:05:50 +0530
Message-ID: <20240318053555.20405-4-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240318053555.20405-1-quic_tdas@quicinc.com>
References: <20240318053555.20405-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: k7Y7qXU6sAqssb9cNmlVwUbPQWtkNnCF
X-Proofpoint-ORIG-GUID: k7Y7qXU6sAqssb9cNmlVwUbPQWtkNnCF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-17_12,2024-03-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=995 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403140001 definitions=main-2403180040

Update the lpassaudio_cc_reset regmap name and max register details
to handle the regmap conflict warning between lpassaudio_cc_reset
and lpassaudio_cc.

Fixes: a9dd26639d05 ("clk: qcom: lpass: Add support for LPASS clock controller for SC7280")
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 drivers/clk/qcom/lpassaudiocc-sc7280.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/qcom/lpassaudiocc-sc7280.c b/drivers/clk/qcom/lpassaudiocc-sc7280.c
index d68139762a80..3f1e756a6e71 100644
--- a/drivers/clk/qcom/lpassaudiocc-sc7280.c
+++ b/drivers/clk/qcom/lpassaudiocc-sc7280.c
@@ -755,6 +755,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 	int ret;

 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcm6490-lpassaudiocc")) {
+		lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
+		lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
+
 		ret = qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
 		if (ret)
 			dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC Resets\n");
@@ -787,6 +790,9 @@ static int lpass_audio_cc_sc7280_probe(struct platform_device *pdev)
 		goto exit;
 	}

+	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
+	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
+
 	ret = qcom_cc_probe_by_index(pdev, 1, &lpass_audio_cc_reset_sc7280_desc);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register LPASS AUDIO CC Resets\n");
--
2.17.1


