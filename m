Return-Path: <linux-arm-msm+bounces-25694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4930C92BE03
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 17:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D58821F2555C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 15:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC4619CD0C;
	Tue,  9 Jul 2024 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ETlM8L6p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A553A15AD90;
	Tue,  9 Jul 2024 15:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720538172; cv=none; b=LLlVJtpXFE7F5sQ9eHi+AI0qT0c1yVpjeIxRVkjm/r+8N9R6D/QafeGWSTeiz55oeqY+ErMX3wX7+qX1qS/CxC/SaCpgdQwYsRkTYS6UTtPmXsF3G4mdYtKcErQT6dqQB5r5lL35Sob63kazuRxE2oERAYJJiLXjFzjuu7YDr7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720538172; c=relaxed/simple;
	bh=K637eK91IOSfvOEYp0r4K3v0l8yGWjWgeCjvYsJv2/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=MpkgU+C2FhGuCqGTa5Q9sptQ8UPnC2DRtS00LB6qlssag6iqJ2pf9pzXCz4ZlfONbqPeiYs8jeQE1hMrbDqs9qd/7TmPyPWBVh4a3eDnMgsED188CNZVc8yZ6tJuuJtRDrUuvfycW5BUO3xo2truTfB7mJ1ZSzzTDX5BbVziVXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ETlM8L6p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BmCOV012059;
	Tue, 9 Jul 2024 15:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4UOpf1fb8xAy2igHtt2Rjax++7Bydmt+rHWG1+D/ZM=; b=ETlM8L6pVoGe8c2I
	u6mP1WFWbvC4c096+vjfG75HWggYO1dl5DyzWKHJqAThAojX+FbEgVeQH8qffYml
	RzRqDMXTriU/mUDzzU1rUJGP7ecbSL1PKzyOn6MCeKKYHmJDKe55yYqn6QftYP9n
	G/Fla2tF9Aye9IJSEeL4llX7V7TgtrnL4e2EZruLUhkc/jvXq5vxoDykfKzbJyII
	10a/MT+rduaAq9DBopdIO6Ch/7+zG661H+gac87Qe3MFswWrSlmVRPMoYBBvGaCd
	QeUXZR5wL7ekUkNaFdv26ijJMll7ABzEQyNt03t6XRVoGGpPuc4BcVpmlgQsGF4U
	U8+QPA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8xqeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:16:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469FFwq1017655
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:15:58 GMT
Received: from tengfan-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 08:15:53 -0700
From: Tengfei Fan <quic_tengfan@quicinc.com>
Date: Tue, 9 Jul 2024 23:15:37 +0800
Subject: [PATCH v2 2/2] phy: qcom: add the SGMII SerDes PHY driver support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-2-5ffeb16252db@quicinc.com>
References: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-0-5ffeb16252db@quicinc.com>
In-Reply-To: <20240709-add_qcs9100_dwmac_sgmii_hpy_compatible-v2-0-5ffeb16252db@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Tengfei Fan <quic_tengfan@quicinc.com>
X-Mailer: b4 0.15-dev-a66ce
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720538147; l=1076;
 i=quic_tengfan@quicinc.com; s=20240709; h=from:subject:message-id;
 bh=K637eK91IOSfvOEYp0r4K3v0l8yGWjWgeCjvYsJv2/M=;
 b=+v9tbB8BnwCW3wf8t1MvjD23K/rVGZBfmpzgAnoSntq4RuG9FH/up2L8S6VAvgsEe0eB+UATS
 aw9z2v0jZT0CudAbWBHYCCXQyEfDblIs7m0t+Cozpj0LFJ67/qhfA1K
X-Developer-Key: i=quic_tengfan@quicinc.com; a=ed25519;
 pk=4VjoTogHXJhZUM9XlxbCAcZ4zmrLeuep4dfOeKqQD0c=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: E7O7AIWQlxmKdG6rKVFXmbAwGMku-2BM
X-Proofpoint-GUID: E7O7AIWQlxmKdG6rKVFXmbAwGMku-2BM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=884 malwarescore=0 mlxscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090100

Add the SGMII SerDes PHY driver support for QCS9100 platform.
QCS9100 is drived from SA8775p. Currently, both the QCS9100 and SA8775p
platform use non-SCMI resource. In the future, the SA8775p platform will
move to use SCMI resources and it will have new sa8775p-related device
tree. Consequently, introduce "qcom,qcs9100-dwmac-sgmii-phy" to the
SGMII SerDes PHY device match table.

Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
---
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
index 5b1c82459c12..0ea7140564a9 100644
--- a/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
+++ b/drivers/phy/qualcomm/phy-qcom-sgmii-eth.c
@@ -353,6 +353,7 @@ static int qcom_dwmac_sgmii_phy_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_dwmac_sgmii_phy_of_match[] = {
+	{ .compatible = "qcom,qcs9100-dwmac-sgmii-phy" },
 	{ .compatible = "qcom,sa8775p-dwmac-sgmii-phy" },
 	{ },
 };

-- 
2.25.1


