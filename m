Return-Path: <linux-arm-msm+bounces-21216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D4F8D5D9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13E011C22CCA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8132158203;
	Fri, 31 May 2024 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EZNU/uS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA7615623D;
	Fri, 31 May 2024 09:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146254; cv=none; b=eIyozE+HG/XhyBhdSHRoiUUPDq4ys57l96Y7UzTYUq9LC0URSVD9p5Oa9Dz5C06KrVLwMxU5DZfOinT3etwLTRdHEUSEwqc9lId8z5bKRadae1g5Dcz7B0qSEZKsGTa/t9O9uTYLay2dql1vkRCzCGfj5EL2sJ9wQrzvyfMbgzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146254; c=relaxed/simple;
	bh=IhkfqV5bpYNJ8wkY+bjXq1YnNIK1mzXxYQ+rBT0thTA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s7wL9pLByIDHmwsFyfVpA4pkrYtLDTUc6XhKW/n539VZ6vsmN121m7YsIWqpK8lAKQNKIn2EIYzjnp5AT4u3Mkrbt5MwSALQdJJVsxScqPZUpCkcf+cau6COubL5GhUnzHHOMSFtFPQakIzKm3ME5B/0KSRj+aHjlWVz8ce/b10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EZNU/uS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V6hMkH005158;
	Fri, 31 May 2024 09:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=I5z7c/wt4M5CT8ELB0FZ45w1
	k+aHrWjfqDEuDQxwnns=; b=EZNU/uS0mjT/CBfNiUvJOUJ2wpJGNa9sj407iJHI
	3ye8tcUe/5GjVUhqeA0vmxQlhzUX2ULLtsScIFWG2Y0L1ypHleO+m6C7ARAwS01q
	97PI8pS10yXvB05bhdqH5p10UDokOPCjXO7CxyUAG+6AXvCIiYVcE27p2DGkulNm
	ngZdPy3rFCjGD3PgFRYDNIvrLYzAuM+t8qxipvTgIibqgFlFb9gQnHbVDNvcwkQx
	YakgXFZf/BymHKwrV7KVYH8UWiK611nLnFaB2vgd3kfGepFVVtUqisB+UyrTxh6C
	JQd84waTaTa8i4cOZWOc54LyFUYrPLBFCauTtvYjVELOWg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yjegxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V947BQ007026
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:04:07 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:04:02 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 09/13] dt-bindings: clock: qcom: Add SA8775P camera controller
Date: Fri, 31 May 2024 14:32:45 +0530
Message-ID: <20240531090249.10293-10-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531090249.10293-1-quic_tdas@quicinc.com>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
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
X-Proofpoint-GUID: j8b8NVcyKi1F-B92wa1Z9dFkOhxFLpSw
X-Proofpoint-ORIG-GUID: j8b8NVcyKi1F-B92wa1Z9dFkOhxFLpSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310066

Add device tree bindings for the camera clock controller
on Qualcomm SA8775P platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sa8775p-camcc.yaml    |  76 +++++++++++++
 .../dt-bindings/clock/qcom,sa8775p-camcc.h    | 107 ++++++++++++++++++
 2 files changed, 183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-camcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
new file mode 100644
index 000000000000..0f8e4ee5e386
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sa8775p-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on SA8775P
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and power
+  domains on SA8775p.
+
+  See also::
+    include/dt-bindings/clock/qcom,sa8775p-camcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8775p-camcc
+
+  clocks:
+    items:
+      - description: Camera AHB clock from GCC
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep clock source
+
+  power-domains:
+    maxItems: 1
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
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
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    clock-controller@ade0000 {
+      compatible = "qcom,sa8775p-camcc";
+      reg = <0x0ade0000 0x20000>;
+      clocks = <&gcc GCC_CAMERA_AHB_CLK>,
+               <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd SA8775P_MMCX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sa8775p-camcc.h b/include/dt-bindings/clock/qcom,sa8775p-camcc.h
new file mode 100644
index 000000000000..5accf3bc02ca
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sa8775p-camcc.h
@@ -0,0 +1,107 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_SA8775P_CAM_CC_H
+#define _DT_BINDINGS_CLK_QCOM_SA8775P_CAM_CC_H
+
+/* CAM_CC clocks */
+#define CAM_CC_CAMNOC_AXI_CLK					0
+#define CAM_CC_CAMNOC_AXI_CLK_SRC				1
+#define CAM_CC_CAMNOC_DCD_XO_CLK				2
+#define CAM_CC_CAMNOC_XO_CLK					3
+#define CAM_CC_CCI_0_CLK					4
+#define CAM_CC_CCI_0_CLK_SRC					5
+#define CAM_CC_CCI_1_CLK					6
+#define CAM_CC_CCI_1_CLK_SRC					7
+#define CAM_CC_CCI_2_CLK					8
+#define CAM_CC_CCI_2_CLK_SRC					9
+#define CAM_CC_CCI_3_CLK					10
+#define CAM_CC_CCI_3_CLK_SRC					11
+#define CAM_CC_CORE_AHB_CLK					12
+#define CAM_CC_CPAS_AHB_CLK					13
+#define CAM_CC_CPAS_FAST_AHB_CLK				14
+#define CAM_CC_CPAS_IFE_0_CLK					15
+#define CAM_CC_CPAS_IFE_1_CLK					16
+#define CAM_CC_CPAS_IFE_LITE_CLK				17
+#define CAM_CC_CPAS_IPE_CLK					18
+#define CAM_CC_CPAS_SFE_LITE_0_CLK				19
+#define CAM_CC_CPAS_SFE_LITE_1_CLK				20
+#define CAM_CC_CPHY_RX_CLK_SRC					21
+#define CAM_CC_CSI0PHYTIMER_CLK					22
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC				23
+#define CAM_CC_CSI1PHYTIMER_CLK					24
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC				25
+#define CAM_CC_CSI2PHYTIMER_CLK					26
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC				27
+#define CAM_CC_CSI3PHYTIMER_CLK					28
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC				29
+#define CAM_CC_CSID_CLK						30
+#define CAM_CC_CSID_CLK_SRC					31
+#define CAM_CC_CSID_CSIPHY_RX_CLK				32
+#define CAM_CC_CSIPHY0_CLK					33
+#define CAM_CC_CSIPHY1_CLK					34
+#define CAM_CC_CSIPHY2_CLK					35
+#define CAM_CC_CSIPHY3_CLK					36
+#define CAM_CC_FAST_AHB_CLK_SRC					37
+#define CAM_CC_GDSC_CLK						38
+#define CAM_CC_ICP_AHB_CLK					39
+#define CAM_CC_ICP_CLK						40
+#define CAM_CC_ICP_CLK_SRC					41
+#define CAM_CC_IFE_0_CLK					42
+#define CAM_CC_IFE_0_CLK_SRC					43
+#define CAM_CC_IFE_0_FAST_AHB_CLK				44
+#define CAM_CC_IFE_1_CLK					45
+#define CAM_CC_IFE_1_CLK_SRC					46
+#define CAM_CC_IFE_1_FAST_AHB_CLK				47
+#define CAM_CC_IFE_LITE_AHB_CLK					48
+#define CAM_CC_IFE_LITE_CLK					49
+#define CAM_CC_IFE_LITE_CLK_SRC					50
+#define CAM_CC_IFE_LITE_CPHY_RX_CLK				51
+#define CAM_CC_IFE_LITE_CSID_CLK				52
+#define CAM_CC_IFE_LITE_CSID_CLK_SRC				53
+#define CAM_CC_IPE_AHB_CLK					54
+#define CAM_CC_IPE_CLK						55
+#define CAM_CC_IPE_CLK_SRC					56
+#define CAM_CC_IPE_FAST_AHB_CLK					57
+#define CAM_CC_MCLK0_CLK					58
+#define CAM_CC_MCLK0_CLK_SRC					59
+#define CAM_CC_MCLK1_CLK					60
+#define CAM_CC_MCLK1_CLK_SRC					61
+#define CAM_CC_MCLK2_CLK					62
+#define CAM_CC_MCLK2_CLK_SRC					63
+#define CAM_CC_MCLK3_CLK					64
+#define CAM_CC_MCLK3_CLK_SRC					65
+#define CAM_CC_PLL0						66
+#define CAM_CC_PLL0_OUT_EVEN					67
+#define CAM_CC_PLL0_OUT_ODD					68
+#define CAM_CC_PLL2						69
+#define CAM_CC_PLL3						70
+#define CAM_CC_PLL3_OUT_EVEN					71
+#define CAM_CC_PLL4						72
+#define CAM_CC_PLL4_OUT_EVEN					73
+#define CAM_CC_PLL5						74
+#define CAM_CC_PLL5_OUT_EVEN					75
+#define CAM_CC_SFE_LITE_0_CLK					76
+#define CAM_CC_SFE_LITE_0_FAST_AHB_CLK				77
+#define CAM_CC_SFE_LITE_1_CLK					78
+#define CAM_CC_SFE_LITE_1_FAST_AHB_CLK				79
+#define CAM_CC_SLEEP_CLK					80
+#define CAM_CC_SLEEP_CLK_SRC					81
+#define CAM_CC_SLOW_AHB_CLK_SRC					82
+#define CAM_CC_SM_OBS_CLK					83
+#define CAM_CC_XO_CLK_SRC					84
+
+/* CAM_CC power domains */
+#define CAM_CC_TITAN_TOP_GDSC					0
+
+/* CAM_CC resets */
+#define CAM_CC_ICP_BCR						0
+#define CAM_CC_IFE_0_BCR					1
+#define CAM_CC_IFE_1_BCR					2
+#define CAM_CC_IPE_0_BCR					3
+#define CAM_CC_SFE_LITE_0_BCR					4
+#define CAM_CC_SFE_LITE_1_BCR					5
+
+#endif
-- 
2.17.1


