Return-Path: <linux-arm-msm+bounces-51238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B86E9A5EC1F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FCBE3B5CA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 07:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ECAE1FDE29;
	Thu, 13 Mar 2025 07:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tn8ugWpV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89541FDE14;
	Thu, 13 Mar 2025 07:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741849234; cv=none; b=kDYksX0bv8AfQsHLb+symT3kCdA87DeZCsu5goC4T0azAQLzwyWyGmugoWPSml7CsKBEQZ3iRaVte3S+ke3DWAu/c3dG9lloV/xyiNv3NoisPcg1JhOxkWRCEdZ+LLbt6UCGkkVRRcA1CeWKQENPoCG1XhwAU+Fk8t6IoYivfcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741849234; c=relaxed/simple;
	bh=JfSYwPdBh703rkBfCawjjx9hmfrU8vTlpARLanVO41k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=S4DHhhC9nAy2jvWFue57P+ptqF6nTdwb1XUK+mI1h7kJn8aFo6eclmi6Ozk4LgT4vEXu64E0H5Lz+gxIA+NQD84CTgTZIdmaX+QvlfW6vl92Ibz0AUzaASdN+ZApR7VV5dI07xNbknkwgOiXDMScSHZ9NLV0BtwGDtpBbh9qwdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tn8ugWpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CKdvHE015193;
	Thu, 13 Mar 2025 07:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxFb5GJbc4Bw0PQ/qdO1WXTFFo8Us9lD8Jw0zjmJaFI=; b=Tn8ugWpVO94tBrJU
	hTi3tb6ns20Ypq3XehwJKvX5dgtrhOC4cF1p5Li/wjO//C3ylXc8+JO6L0sZJZOc
	KtA50a/eEJBAgEdQcA3GpYFN09KqOnuzRYH0oejTfyfqTN7FKOoUBP3j7spA7htf
	08iHtj/+VIqei+VdcLk9I5lRna8UYYuTyqZPj4EIbPd7xSpZYuyR4739c9VRTmbE
	SKWrMeP45uQ35nrTIRF6cp6ksYswuJWDOCZkt9bNZQULX+PxZk1BoSoErSQ80OiS
	oBCI2xg1gYcyy4sCdRWcrrC1UQD5pOeFXNMv33/DhLs/IAiv4RnpC7RSUvYYXPZi
	qWxiAw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2nvwqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 07:00:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52D70OW6011413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 07:00:24 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 00:00:19 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 13 Mar 2025 12:29:43 +0530
Subject: [PATCH v6 06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250313-qcs615-v5-mm-cc-v6-6-ebf4b9a5e916@quicinc.com>
References: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
In-Reply-To: <20250313-qcs615-v5-mm-cc-v6-0-ebf4b9a5e916@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
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
X-Proofpoint-GUID: RQd3x8mndSEkdoJgpsPY85GKGTMh4vxC
X-Authority-Analysis: v=2.4 cv=ZObXmW7b c=1 sm=1 tr=0 ts=67d28288 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=Fd_aqQ4HFp4EpFgKmb0A:9
 a=QEXdDO2ut3YA:10 a=RVmHIydaz68A:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RQd3x8mndSEkdoJgpsPY85GKGTMh4vxC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_03,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130054

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
2.48.1


