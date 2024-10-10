Return-Path: <linux-arm-msm+bounces-33922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 824289991C8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 21:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B482283751
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 19:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADB21EABBE;
	Thu, 10 Oct 2024 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jwY2mOE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4EA1EABA1;
	Thu, 10 Oct 2024 18:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586756; cv=none; b=Z+C8ZB2BeVenNujjvaP9jpMUUzoRQC8OMqJmKB/5950kl0lICJrPt9elNSY1vCvaRlXySL0DMhuPjWBXwhsSlO8z5Zi38mtNT5YRGqQztxmcUhJFszBOAobx69PONslbimLf9Ig3PrH6hF3/Lc33MRIQ+uYULA0IQk7HVZqIH7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586756; c=relaxed/simple;
	bh=gFa9PUyW3jqGnqpk1u6ds1NfQkRFdhUa/7Wcq3NS7aE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QnOO5Ql8KAKdwzvt5Kkf99x0+AaecPDK80xzeUCSzfg+xLekQ7aC4SCnpzHRJt2ZpnpKKGVQZHwvQO6PT1xEyfXKgYtP3xyGuUfQO6MTNcnFXx6mWlIcwgSGNStKAAfzN1usXGvTiqHLY9iuKyqv2fqmVFfdT56cpH29pfT969A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jwY2mOE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49ACnKuT022452;
	Thu, 10 Oct 2024 18:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2tlWCpKUWjmEmu2hgABznxQTQq409rfQYUaBn6ZvaWM=; b=jwY2mOE/FQ6uSut7
	bub7c2yflrT6lHD7wbqaUVdoKikFK7RXi9Ail6CNE07j0libtD0pArGF0cyCIJYi
	55dHru/QFSNXfGf0TZmCp1/pIiStgT8nZXVv4i+ZFdiSLVg0AsRgi1lWWgu9e38N
	24RvQG/NXjohW/9IS9xZtPTOHDajLYlk3wAnvTOxEJ1zZMJVN0Qz5Ik3G77bnjAf
	gie2ULa4NFfNa+FwAmvbfU/rDzGNTxGbateboYSYRJXfwQMQH7+88LhT+kWkNmZQ
	ybDf83H+zYm1NH+vstihXmFcM8Fwmzr0uLfymIW9DiRhMA561poiL4vN0r+NrpOA
	rAuG3Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xptug9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AIx9fq019584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:09 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 11:59:04 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 11 Oct 2024 00:28:33 +0530
Subject: [PATCH v5 3/8] dt-bindings: clock: qcom: Add SA8775P camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241011-sa8775p-mm-v4-resend-patches-v5-3-4a9f17dc683a@quicinc.com>
References: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
In-Reply-To: <20241011-sa8775p-mm-v4-resend-patches-v5-0-4a9f17dc683a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <quic_imrashai@quicinc.com>,
        <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4-l_PQyuEUW2e-2EPQ_fYxMX2XQg5E6T
X-Proofpoint-GUID: 4-l_PQyuEUW2e-2EPQ_fYxMX2XQg5E6T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100125

Add device tree bindings for the camera clock controller
on Qualcomm SA8775P platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |  62 ++++++++++++
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     | 108 +++++++++++++++++++++
 2 files changed, 170 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..36a60d8f5ae3a5e0d86219d03291403f8029772d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
@@ -0,0 +1,62 @@
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
+  See also: include/dt-bindings/clock/qcom,sa8775p-camcc.h
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
+    description: MMCX power domain
+
+required:
+  - compatible
+  - clocks
+  - power-domains
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
index 0000000000000000000000000000000000000000..38531acd699fe82a3384451c509cf8f79d3a8d80
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sa8775p-camcc.h
@@ -0,0 +1,108 @@
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
+#define CAM_CC_QDSS_DEBUG_XO_CLK				85
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
2.45.2


