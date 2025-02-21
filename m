Return-Path: <linux-arm-msm+bounces-48830-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB846A3EFF2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 10:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 948C317E1F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 09:21:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71C662045B0;
	Fri, 21 Feb 2025 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IDW8PGim"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6946201017;
	Fri, 21 Feb 2025 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740129655; cv=none; b=uE5VqyJW1zhWCJF08uANL4bwLcAIq16iDLnd6/CcW6POVtbkdvc/2yRo3I0SgakQ585xnGjEHxOFyE1VmOC8TFXobDcug0l8B+s1uW+4z4nBOM0UzsAPELisyVXfhx8Dh0taxTSuCm/D024yu8mekMSu/OHAsxaXWTAoFDOPVf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740129655; c=relaxed/simple;
	bh=E26mHYFSOvSw3yaAdwrgr4OYizzNZf6Tl4dIMSjCM8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=qFg+8htPDBsxAOOsD4k00hWKzBJK2IkAiNhwTgLd0T5UuEvRJK3BchhNTLMFToZyxMhDrsG3WKl1XFqV08dQThbvchKA302/btSGKXk88aZJ7YT8JSRrTv9OBuk4KcjgdGH3cP7iRMEpdCisUplxofO4SV59QZ3OXz7fzmJVQc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IDW8PGim; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5EiWu001971;
	Fri, 21 Feb 2025 09:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PfLdV1PDdE2e7cDEzbl7k6wu8RZisYXndG426fHjfQM=; b=IDW8PGimYU+IfYzx
	5iZktM2Z4Yfyhz0kO1fAruSHLCRnbvSH8rdvP3+x8ZyOzVB61euW9UL429GEEvWx
	5Dfb/nwM2j7VOKZDfdH3a8yc9Q4JtXSIXqwcbdqmAFP1kAQXwNaDrz43KPm9jHOs
	U5JFAQjEo0x8ak/V+IxNwg8VzUciKnRnxGiV0Ya4F9p50fmBuSmHgiOEmnPORnp7
	t8QIlquLCdvQDCyVv9pQtHojm1OwV0fkY2iWv8a8lPXWf5Ux95pc694FAavfVdNX
	MNOhTJEqGmwPym2euWI7Z5twURtrzQkzHwB1SYk6cSGUvpVa0XMruIVzL53ZW8Aa
	vKK0yw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2hdw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:20:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L9Kh8l016628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:20:44 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 01:20:38 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 21 Feb 2025 14:50:13 +0530
Subject: [PATCH v5 02/10] dt-bindings: clock: Add Qualcomm QCS615 Camera
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-qcs615-v5-mm-cc-v5-2-b6d9ddf2f28d@quicinc.com>
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
In-Reply-To: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
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
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: YZeEJeSa070UTLgz8pC02Jw3ueVkxR1P
X-Proofpoint-GUID: YZeEJeSa070UTLgz8pC02Jw3ueVkxR1P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210071

Add DT bindings for the Camera clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-camcc.yaml          |  54 ++++++++++
 include/dt-bindings/clock/qcom,qcs615-camcc.h      | 110 +++++++++++++++++++++
 2 files changed, 164 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ee13c4e97dd4b8c238549b6bc939c4476f8d33b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-camcc.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on QCS615
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and power
+  domains on QCS615
+
+  See also: include/dt-bindings/clock/qcom,qcs615-camcc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-camcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Board XO source
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@ad00000 {
+      compatible = "qcom,qcs615-camcc";
+      reg = <0xad00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs615-camcc.h b/include/dt-bindings/clock/qcom,qcs615-camcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..aec57dddc06735a5c6c48a1e93a8c498bdb8726a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-camcc.h
@@ -0,0 +1,110 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_QCS615_H
+
+/* CAM_CC clocks */
+#define CAM_CC_BPS_AHB_CLK					0
+#define CAM_CC_BPS_AREG_CLK					1
+#define CAM_CC_BPS_AXI_CLK					2
+#define CAM_CC_BPS_CLK						3
+#define CAM_CC_BPS_CLK_SRC					4
+#define CAM_CC_CAMNOC_ATB_CLK					5
+#define CAM_CC_CAMNOC_AXI_CLK					6
+#define CAM_CC_CCI_CLK						7
+#define CAM_CC_CCI_CLK_SRC					8
+#define CAM_CC_CORE_AHB_CLK					9
+#define CAM_CC_CPAS_AHB_CLK					10
+#define CAM_CC_CPHY_RX_CLK_SRC					11
+#define CAM_CC_CSI0PHYTIMER_CLK					12
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				13
+#define CAM_CC_CSI1PHYTIMER_CLK					14
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				15
+#define CAM_CC_CSI2PHYTIMER_CLK					16
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				17
+#define CAM_CC_CSIPHY0_CLK					18
+#define CAM_CC_CSIPHY1_CLK					19
+#define CAM_CC_CSIPHY2_CLK					20
+#define CAM_CC_FAST_AHB_CLK_SRC					21
+#define CAM_CC_ICP_ATB_CLK					22
+#define CAM_CC_ICP_CLK						23
+#define CAM_CC_ICP_CLK_SRC					24
+#define CAM_CC_ICP_CTI_CLK					25
+#define CAM_CC_ICP_TS_CLK					26
+#define CAM_CC_IFE_0_AXI_CLK					27
+#define CAM_CC_IFE_0_CLK					28
+#define CAM_CC_IFE_0_CLK_SRC					29
+#define CAM_CC_IFE_0_CPHY_RX_CLK				30
+#define CAM_CC_IFE_0_CSID_CLK					31
+#define CAM_CC_IFE_0_CSID_CLK_SRC				32
+#define CAM_CC_IFE_0_DSP_CLK					33
+#define CAM_CC_IFE_1_AXI_CLK					34
+#define CAM_CC_IFE_1_CLK					35
+#define CAM_CC_IFE_1_CLK_SRC					36
+#define CAM_CC_IFE_1_CPHY_RX_CLK				37
+#define CAM_CC_IFE_1_CSID_CLK					38
+#define CAM_CC_IFE_1_CSID_CLK_SRC				39
+#define CAM_CC_IFE_1_DSP_CLK					40
+#define CAM_CC_IFE_LITE_CLK					41
+#define CAM_CC_IFE_LITE_CLK_SRC					42
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				43
+#define CAM_CC_IFE_LITE_CSID_CLK				44
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				45
+#define CAM_CC_IPE_0_AHB_CLK					46
+#define CAM_CC_IPE_0_AREG_CLK					47
+#define CAM_CC_IPE_0_AXI_CLK					48
+#define CAM_CC_IPE_0_CLK					49
+#define CAM_CC_IPE_0_CLK_SRC					50
+#define CAM_CC_JPEG_CLK						51
+#define CAM_CC_JPEG_CLK_SRC					52
+#define CAM_CC_LRME_CLK						53
+#define CAM_CC_LRME_CLK_SRC					54
+#define CAM_CC_MCLK0_CLK					55
+#define CAM_CC_MCLK0_CLK_SRC					56
+#define CAM_CC_MCLK1_CLK					57
+#define CAM_CC_MCLK1_CLK_SRC					58
+#define CAM_CC_MCLK2_CLK					59
+#define CAM_CC_MCLK2_CLK_SRC					60
+#define CAM_CC_MCLK3_CLK					61
+#define CAM_CC_MCLK3_CLK_SRC					62
+#define CAM_CC_PLL0						63
+#define CAM_CC_PLL1						64
+#define CAM_CC_PLL2						65
+#define CAM_CC_PLL2_OUT_AUX2					66
+#define CAM_CC_PLL3						67
+#define CAM_CC_SLOW_AHB_CLK_SRC					68
+#define CAM_CC_SOC_AHB_CLK					69
+#define CAM_CC_SYS_TMR_CLK					70
+
+/* CAM_CC power domains */
+#define BPS_GDSC						0
+#define IFE_0_GDSC						1
+#define IFE_1_GDSC						2
+#define IPE_0_GDSC						3
+#define TITAN_TOP_GDSC						4
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR						0
+#define CAM_CC_CAMNOC_BCR					1
+#define CAM_CC_CCI_BCR						2
+#define CAM_CC_CPAS_BCR						3
+#define CAM_CC_CSI0PHY_BCR					4
+#define CAM_CC_CSI1PHY_BCR					5
+#define CAM_CC_CSI2PHY_BCR					6
+#define CAM_CC_ICP_BCR						7
+#define CAM_CC_IFE_0_BCR					8
+#define CAM_CC_IFE_1_BCR					9
+#define CAM_CC_IFE_LITE_BCR					10
+#define CAM_CC_IPE_0_BCR					11
+#define CAM_CC_JPEG_BCR						12
+#define CAM_CC_LRME_BCR						13
+#define CAM_CC_MCLK0_BCR					14
+#define CAM_CC_MCLK1_BCR					15
+#define CAM_CC_MCLK2_BCR					16
+#define CAM_CC_MCLK3_BCR					17
+#define CAM_CC_TITAN_TOP_BCR					18
+
+#endif

-- 
2.48.1


