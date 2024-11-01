Return-Path: <linux-arm-msm+bounces-36719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B39B8F8B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 11:43:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ED9A283A52
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 10:43:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB2B01A263F;
	Fri,  1 Nov 2024 10:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="E5dX0x71"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4C11A0AFB;
	Fri,  1 Nov 2024 10:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730457584; cv=none; b=QcyP4pXPz8aeQthnF+WwYL2jrz5RCHG8Q8SltUQemO1/2gOoFAhf3QrA0OI2DQIfU0zFwu+13QaRtM0oGPciLwsJp3P9NbbtAnp2YP2aC68tKiW6+rz9O/2y0xxCGLPr/uoOXliTt2et5VKh6NEE2qAKezMnttpaJ+1KpEpr1zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730457584; c=relaxed/simple;
	bh=PrCriKNM2kr0GoBEAI/9uyzs9dgAaqAH9n4WER0ixPU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=luK/kiNULYfyH2pvFtxZsoFwm5G/iqmxelLSw4aULtBrajYSlgpU1uEdy1bk6fu9gL2el0mRyy71fDRxC7SMqZJWs+2JLtUR+tmuBYGt0ER0aNZ6O5EiWW7akIr8uGCZEW+Ml98/17D/yJ2hVhkifYo5tIhk2KQ/3pQqT12z9k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=E5dX0x71; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A1AUt4I004918;
	Fri, 1 Nov 2024 10:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZVLOAzjxRZwUXCsItM95x3WmPFdFc1xjJrdpduKgtk=; b=E5dX0x71Dsm87dyQ
	9BOn+u46vMubuqsYLl002/biffTVWcYIWJ2kq3+LvR6jleO1uG0XEH48dIxbUgwn
	ACleCTrFPoiMMy36g5LWEEIh3zdZopOBMNes8XQAPVRqVCUHTR4JZ7/NNOei8ZmV
	J50XCgCPeZs7tu2MR/Jo7kB3uxxdSlf891DFP0+V8yxnkB9Vd5B3Qwab7vjqHU7V
	lL7ooWeLSrZBTlHRtbls91VLc5RqKbOtC0uvqjXglp/p9vVtdfQuhyyxut6i73/f
	kJyiRHFY2n0kXVTTo852U5t9XMrJRiwKUAhONOA5mki5KRqgt2x+BLBHPlhv78Uy
	FUr5Cg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ku65dnx0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 10:39:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A1Ad9au027004
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 10:39:09 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 1 Nov 2024 03:39:04 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 1 Nov 2024 16:08:19 +0530
Subject: [PATCH v2 07/11] dt-bindings: clock: Add Qualcomm QCS615 Graphics
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241101-qcs615-mm-clockcontroller-v2-7-d1a4870a4aed@quicinc.com>
References: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
In-Reply-To: <20241101-qcs615-mm-clockcontroller-v2-0-d1a4870a4aed@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2LIvkRtWL0L9Pb45dnhcxe0NhFtQ1aCu
X-Proofpoint-ORIG-GUID: 2LIvkRtWL0L9Pb45dnhcxe0NhFtQ1aCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411010076

Add DT bindings for the Graphics clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-gpucc.yaml          | 66 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      | 39 +++++++++++++
 2 files changed, 105 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b798d2dd0f9cc0f0e742066c5da9a48cdc519243
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on QCS615
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm graphics clock control module provides clocks, resets and power
+  domains on QCS615 Qualcomm SoCs.
+
+  See also: include/dt-bindings/clock/qcom,qcs615-gpucc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-gpucc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 GPUCC div branch source
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,qcs615-gcc.h>
+
+    clock-controller@5090000 {
+      compatible = "qcom,qcs615-gpucc";
+      reg = <0x5090000 0x9000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc    GPLL0>,
+               <&gcc    GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs615-gpucc.h b/include/dt-bindings/clock/qcom,qcs615-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..6d8394b90d59074b93a26a9c027407a14b050b27
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-gpucc.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_QCS615_H
+
+/* GPU_CC clocks */
+#define CRC_DIV_PLL0						0
+#define CRC_DIV_PLL1						1
+#define GPU_CC_PLL0						2
+#define GPU_CC_PLL1						3
+#define GPU_CC_CRC_AHB_CLK					4
+#define GPU_CC_CX_GFX3D_CLK					5
+#define GPU_CC_CX_GFX3D_SLV_CLK					6
+#define GPU_CC_CX_GMU_CLK					7
+#define GPU_CC_CX_SNOC_DVM_CLK					8
+#define GPU_CC_CXO_AON_CLK					9
+#define GPU_CC_CXO_CLK						10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_GX_GFX3D_CLK					12
+#define GPU_CC_GX_GFX3D_CLK_SRC					13
+#define GPU_CC_GX_GMU_CLK					14
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				15
+#define GPU_CC_SLEEP_CLK					16
+
+/* GPU_CC power domains */
+#define CX_GDSC							0
+#define GX_GDSC							1
+
+/* GPU_CC resets */
+#define GPU_CC_CX_BCR						0
+#define GPU_CC_GFX3D_AON_BCR					1
+#define GPU_CC_GMU_BCR						2
+#define GPU_CC_GX_BCR						3
+#define GPU_CC_XO_BCR						4
+
+#endif

-- 
2.45.2


