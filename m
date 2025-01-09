Return-Path: <linux-arm-msm+bounces-44525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F18EA0707D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 10:00:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21961162526
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 08:59:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 179A0215180;
	Thu,  9 Jan 2025 08:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="lE6A2fxR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DBD215076;
	Thu,  9 Jan 2025 08:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413185; cv=none; b=V5mA16dp+oocDRN+TvyWEAF0W09ntYGuO6r6VhmkEXApMrcl6ZbDpULe+Uz122WoqUwdIrqRljkEnTa6x1128NUdzArXWnAhEy/kkV5Zr/Z6qmgHqBAkOR2emvpiZSBj+K6CrGs44vCwWkQpwrtk/Zb86wid5b00VCGllYg5CIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413185; c=relaxed/simple;
	bh=ic/vadXetced0kb1yOl/hRZbeV2OxVbIBg1yiwYbUwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sqcWlVMrD9kRU5bkbXvUyQInzGhkhGnOf+q/0IKzej5bt8QaLZ8MKpaXbAAhj5bxU1a+mpzhOftK4t7izgDLDLmdZ77YDrOafZDX5xxJvrlyfiZcxh6Z5WxsCBCqyqfdEA8L8AO6tbiY21pLzE1f9TshVMTG4QkntqXmQ2RcuCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=lE6A2fxR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50940Z1k029399;
	Thu, 9 Jan 2025 08:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUEVN+msGicXAMUrihDvCCSi8rKDli0CMvff1DKfq8M=; b=lE6A2fxRbEnHwfvQ
	fY4yQI3DaZfuQ37kfo2T1Gbn5xJ8CY1SfMPiInZclbC7THH4fdLqdDDgKSvbTXpd
	RzwZ82zw8BAp1Kqv1kVLbZXq4R/bUdGPzvqAdMx59Qdte/ZzVnlwYlZBm92W4P6q
	bjkzTioinf5ELe+lwXo/MfNMvqVD2hUy9iY4m/haWEv5F/5oQUGC3Pe1uAIo6cdg
	ebVCWtFuwK/nBOFeGdPJhzOc3OwrYAxrKrPcX/8mE6BvanEt0r+cOXVKQBZCBqUE
	dOUwOtR+is7DdJ6VTVdK1YTIGPMMMWXTaHkZY3ecdkW/FDXefCk1HUyA5VauYmTK
	fvfiFg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442727rmu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 08:59:38 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5098xbJp005340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Jan 2025 08:59:37 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 Jan 2025 00:59:32 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Thu, 9 Jan 2025 14:27:44 +0530
Subject: [PATCH v4 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250109-qcs8300-mm-patches-new-v4-1-63e8ac268b02@quicinc.com>
References: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
In-Reply-To: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e3r78bBDU6C-mwn2yYWBojJNqoR3qpCK
X-Proofpoint-ORIG-GUID: e3r78bBDU6C-mwn2yYWBojJNqoR3qpCK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 impostorscore=0 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090073

The QCS8300 GPU clock controller is a derivative of SA8775P, but has few
additional clocks and minor differences. Hence, reuse gpucc bindings of
SA8775P and add additional clocks required for QCS8300.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
---
 Documentation/devicetree/bindings/clock/qcom,gpucc.yaml |  3 +++
 include/dt-bindings/clock/qcom,qcs8300-gpucc.h          | 17 +++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 0858fd635282..4cdff6161bf0 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -8,6 +8,7 @@ title: Qualcomm Graphics Clock & Reset Controller
 
 maintainers:
   - Taniya Das <quic_tdas@quicinc.com>
+  - Imran Shaik <quic_imrashai@quicinc.com>
 
 description: |
   Qualcomm graphics clock control module provides the clocks, resets and power
@@ -23,10 +24,12 @@ description: |
     include/dt-bindings/clock/qcom,gpucc-sm8150.h
     include/dt-bindings/clock/qcom,gpucc-sm8250.h
     include/dt-bindings/clock/qcom,gpucc-sm8350.h
+    include/dt-bindings/clock/qcom,qcs8300-gpucc.h
 
 properties:
   compatible:
     enum:
+      - qcom,qcs8300-gpucc
       - qcom,sdm845-gpucc
       - qcom,sa8775p-gpucc
       - qcom,sc7180-gpucc
diff --git a/include/dt-bindings/clock/qcom,qcs8300-gpucc.h b/include/dt-bindings/clock/qcom,qcs8300-gpucc.h
new file mode 100644
index 000000000000..afa187467b4c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs8300-gpucc.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPUCC_QCS8300_H
+#define _DT_BINDINGS_CLK_QCOM_GPUCC_QCS8300_H
+
+#include "qcom,sa8775p-gpucc.h"
+
+/* QCS8300 introduces below new clocks compared to SA8775P */
+
+/* GPU_CC clocks */
+#define GPU_CC_CX_ACCU_SHIFT_CLK		23
+#define GPU_CC_GX_ACCU_SHIFT_CLK		24
+
+#endif

-- 
2.25.1


