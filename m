Return-Path: <linux-arm-msm+bounces-62425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53546AE7FF2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 12:46:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7A717B3E84
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Jun 2025 10:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63FE62D23B7;
	Wed, 25 Jun 2025 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kgsqPaMq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2BC285CB9;
	Wed, 25 Jun 2025 10:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750848310; cv=none; b=Wv9IBmcHOpWgy8n2MtDGedsk8S55qmX2IvZbXM86InePxHyFa6d5iDZtyCm/TgL//WN3FFcZVZjtTXWe7od6TxFrqFy1g8ViDn95vB3huKFaQ4doH4Be8m95ygRk5rO7SeP/PEtNuLDe9Od81YALkrZaDkgWlETTu7tJuPNLi3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750848310; c=relaxed/simple;
	bh=wt1P6BX7/IHdiOF798npRd18KaUvupKQYiv0sH2T2to=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=C/Dwn6w8mv4cjmqD4aH0MZWwwthlRiKPmlTWwp5PrOmSa1+yNk2clb6NcwDoUs6YqHSCwv1VNc+A97mIyT5Um1xosx9KKJsKKE8rc1aoSoVg8H8uqcG5prr9jI6oLIIKLDlx3syOxLSmvSnalp0EkWqKoOUtFI1vUjqDY7K4cRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=kgsqPaMq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P53TZj017607;
	Wed, 25 Jun 2025 10:45:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XnOzQi08jAEiwY9awZL79NKkRrHw27xmzgDmDid1kBE=; b=kgsqPaMql0fPWkCu
	m0sHiyAnzVmz96TxG+M+V7KApW0xFbP7toL9QngSD5S+sHBMFl4cgVIbJSDdrz4i
	cuDierYjwRDBDJxBvsZHYMO96AkE/y6Bbdui/sxHNHQoC89VfdA/SJKeXalj4H+c
	eTbMtuyWgiwxApWI0ufCUiC5jnb/CqpF6YycbvexVl/FiDZPAXLRVIweOQLvnas8
	K/ElLNIoJ3MVpf4jinA9bgAnaWkADqgSeqazA8SUaowJfKQ3nQ18HFwmo/KGPTg6
	SWT3Vam33D9YENPzqNRyziKzp5tEYuFFqZmCT9/QXKVvxqN3F/Swo8/Yvt3jk3NO
	YOqRFw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5rmma-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:44:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55PAixS2013671
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 10:44:59 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Jun 2025 03:44:53 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 25 Jun 2025 16:13:31 +0530
Subject: [PATCH v10 06/10] dt-bindings: clock: Add Qualcomm QCS615 Graphics
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250625-qcs615-mm-v10-clock-controllers-v10-6-ec48255f90d8@quicinc.com>
References: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
In-Reply-To: <20250625-qcs615-mm-v10-clock-controllers-v10-0-ec48255f90d8@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: udFWN-HmJ4iJy9tKamyy137h6gnP6g1W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4MCBTYWx0ZWRfX1pDH/m8O3s+l
 TltzrNbK4QV1iUJvUprhVkUqbAgMpHh4IZw9RMibckMNYZjnwaq7PimGr+V20vPwbM4exKf7yeg
 Q+8Qpy/LCANLQOl7VBxOkwKUbBDqg24ErH44UrMjjMIXOcuIMocvDXSZs5sYRSL2Kwx1fQSDXtN
 LSQBTywLrrBrNbWyL51tMzmwtblh/iZ5UFp08FRL3fqD5TpBTqAblb7Odb4jJXUxyIABrDCjidk
 IRy7Yli3HVVCak+tg6Gifi+4v+DWfLIior3ikmyU6cjuuG80BhOKImn7zrJ2OGaCW8x1bFdq5rF
 PjPCOCL5PtEtJm664/LLi08ahm+dpMg/60gZurdn/83SbnCyktSJqe75MRXuGNzZ+9bPYrhdbE9
 h9iSb/YcpOLlTxgWGzcW046cix4Nt2bVNYmBjMuHhz6XgO9uSjiHZ1SfNy8n5YtrGAn8cbF5
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685bd32b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Fd_aqQ4HFp4EpFgKmb0A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: udFWN-HmJ4iJy9tKamyy137h6gnP6g1W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250080

Add DT bindings for the Graphics clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-gpucc.yaml          | 49 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-gpucc.h      | 39 +++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5f7d83d1a7be301dd38709f69167d7cb9319f076
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-gpucc.yaml
@@ -0,0 +1,49 @@
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
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 GPUCC div branch source
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
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
+               <&gcc GPLL0>,
+               <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
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
2.34.1


