Return-Path: <linux-arm-msm+bounces-37123-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB8B9BE31C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 10:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C6F6283F64
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 09:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C57E91DC1B2;
	Wed,  6 Nov 2024 09:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hnnPHZHu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D7C1DB951;
	Wed,  6 Nov 2024 09:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886749; cv=none; b=cMbzbWvnZz1Xz9O7xRHb702deg0/GFIDxkyWK/NXB8o5BlnRZldEDtE9wtEYczW2msff95Pb4HJh3fLA15EQu9O2FGr2tqPlNbsc2cqw/3TlorxLg7CrfmYeSPvihDAywIBBnQrLaEnHnOH+MRGEML/4fi57yQEUXlCNLDMo0d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886749; c=relaxed/simple;
	bh=ILfwMGsHSlC585RUQsAG4O4rwgM5CE7F4Q/rUESvmOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cnCgCpIquG0DJoUeRfMhmGK4EqbuJChRZqhlshNDgDBXNDhBUuCTnPx1upqct7u1fTlPN4++3AfQxD1bFbuTNJfXt3c3PX6dMl8icV6NnK5AdYy+sy1QDBOb1mHTYVrFFv+CS3BNcAZCy5fbCIZSmNmQlxW196aAYBqF1xqz5W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hnnPHZHu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5MnEjA004406;
	Wed, 6 Nov 2024 09:52:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RoxyXebYC3wkxUomdMbC5oYsLRFNrRAXvzMlj+Q9VvM=; b=hnnPHZHuO1uxAsOX
	ySbX/xSoPwglB5eCKmq4F6a4ZZxW2xdUnoOnmUx4Zibe8K2HSYN0a0Kl1vLucKQG
	wVOmhcA/Ft7wq2D4qOYEKo4NJrCmU8fJdSVqspjrq6YOydGtbinKiYo4uu+dmxzd
	NMLjh6SFivKeMEHt1jIko8krE2wgXT/+U1abfrvk5ysL9q6Flh48pxBXFcNF4qJ2
	irGR3v+/gmI1VaJ+x4YJWvWH+0fPetbGM+JdY+rwyBkxTCxxptgQ3n9YHWl7T6hF
	lPyUpByeCaCF8OyWs5z5Mk0mnHw+3STuUOBa7wbxULXCq0YCi6ITxK2eH8km8NIp
	ZBvByw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42qvg3sebh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Nov 2024 09:52:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A69qNeB014056
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Nov 2024 09:52:23 GMT
Received: from hu-imrashai-hyd.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 6 Nov 2024 01:52:19 -0800
From: Imran Shaik <quic_imrashai@quicinc.com>
Date: Wed, 6 Nov 2024 15:21:56 +0530
Subject: [PATCH v3 1/6] dt-bindings: clock: qcom: Add GPU clocks for
 QCS8300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241106-qcs8300-mm-patches-v3-1-f611a8f87f15@quicinc.com>
References: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
In-Reply-To: <20241106-qcs8300-mm-patches-v3-0-f611a8f87f15@quicinc.com>
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
        Imran Shaik <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14.1
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nvLDwj0UjQqnB1L2DLBame2zWibVjBTb
X-Proofpoint-GUID: nvLDwj0UjQqnB1L2DLBame2zWibVjBTb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=923
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411060080

The QCS8300 GPU clock controller is mostly identical to SA8775P, but
QCS8300 has few additional clocks and minor differences. Hence, reuse
SA8775P gpucc bindings and add additional clocks required for QCS8300.

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


