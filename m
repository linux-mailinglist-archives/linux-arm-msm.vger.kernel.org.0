Return-Path: <linux-arm-msm+bounces-40362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7F9E44D0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 20:38:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B89416606B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2024 19:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87C4202C3C;
	Wed,  4 Dec 2024 19:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JcPz/vYA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 279501F540A;
	Wed,  4 Dec 2024 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733341068; cv=none; b=RAq177Kyco/Sg/Ab956PLduR4R5cTpTzzOMeGDGk9w0eykySRDa9YUipn01zKeEItRzklfuMPDY4u+qSqvkhsnixj/sAEZ/34uiEUL/MCZaZXWZYcf5yZDt0q4GcZ0oxdL90DSxAs9MyV9J+wgwP4Bid7mAQOl8aEdR5wPHhFb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733341068; c=relaxed/simple;
	bh=gZ07YdL8YR89AQ1pkLtEVxOY0cvmmLaP8+IsEdybwsU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=FTR2prvWdZxGXjLH6VP5jr3IqdgwCg7+8KNmtK94Vg9Bd7WiJPrqD7SAFTffaPu/UX9sLbXvRam767u+uIZaLAlWZw7d81zWh7Nty7fWjZla9URqzyUdcPVAkA3wOV0rYg5cgLfX7/LIasfYUZtyqvSvnHUjc8iJpE6UjMidwRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JcPz/vYA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4G7bNg030963;
	Wed, 4 Dec 2024 19:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zPCXmqMiSiAftVrIeuSeVwSPk5JNmkYmP1w+3VC+J88=; b=JcPz/vYAsKr9RpBB
	Sx6TMCO5ZaRAgKxoeKp5MtApoe7blKLasDHoiu+svz6xT2YahQh/mZ9vYUp/8gqj
	IUarNNref93a2Z1CZuIBUtlyGKKvOVPdFo5BR4mMjztB9SgBgqRbYBIZ97PFoC+m
	t7a9H7XMTG6vV88iANHA/lTntmaROAbVXRDfqnYT/81tg+mCMIN29ejVISEB2oCc
	jW0e/qeJB0cbNhZ9TzySwFr/OQoPbYBfnfnEgCDue+8BzdH8xC5xcojxw9ISl6AI
	LZ6LmDyeOhpHUr/q25+Xl8CDOYCEA+hsnREvVB/gwPDz2Eh62ArEY5qq/ZOH/TMu
	t01DYA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439w90wav2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 19:37:42 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4Jbf5u004439
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 19:37:41 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 11:37:40 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 11:37:19 -0800
Subject: [PATCH v3 7/8] dt-bindings: clock: qcom: Document the SM8750 TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_clks-v3-7-1a8f31a53a86@quicinc.com>
References: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
In-Reply-To: <20241204-sm8750_master_clks-v3-0-1a8f31a53a86@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733341058; l=2005;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=ySYPgeVBwlX6fAJgBZVf8FK/j8AMPcK1DVz9NNfgaSs=;
 b=zmSQIF7H9jW7r4O5gFvjtVG/PPhD1q2X7mmG2/FEK5Hwt1Oi3Y+pUIA4pSgApwKKlFuR+qiLS
 ymZC0mJ5i9vDFIOCfK8xaAe0PmsNqWCBMZF6gDPmhWFr0eKGf7BAbWO
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: aaXGufzUCgnbHnsa9Aauj5PFSEWIcuAP
X-Proofpoint-GUID: aaXGufzUCgnbHnsa9Aauj5PFSEWIcuAP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412040150

From: Taniya Das <quic_tdas@quicinc.com>

Add bindings documentation for the SM8750 Clock Controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../devicetree/bindings/clock/qcom,sm8550-tcsr.yaml       |  2 ++
 include/dt-bindings/clock/qcom,sm8750-tcsr.h              | 15 +++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 3b546deb514af2ffe35d80337335509e8f6a559d..f3afbb25e8682de83fb16acaa35448545f77ce77 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -16,6 +16,7 @@ description: |
   See also:
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
   - include/dt-bindings/clock/qcom,sm8650-tcsr.h
+  - include/dt-bindings/clock/qcom,sm8750-tcsr.h
 
 properties:
   compatible:
@@ -24,6 +25,7 @@ properties:
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr
           - qcom,sm8650-tcsr
+          - qcom,sm8750-tcsr
           - qcom,x1e80100-tcsr
       - const: syscon
 
diff --git a/include/dt-bindings/clock/qcom,sm8750-tcsr.h b/include/dt-bindings/clock/qcom,sm8750-tcsr.h
new file mode 100644
index 0000000000000000000000000000000000000000..1c502ac7c7f40807f930583301e9b7b73ebea477
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8750-tcsr.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8750_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8750_H
+
+/* TCSR_CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN				0
+#define TCSR_UFS_CLKREF_EN				1
+#define TCSR_USB2_CLKREF_EN				2
+#define TCSR_USB3_CLKREF_EN				3
+
+#endif

-- 
2.46.1


