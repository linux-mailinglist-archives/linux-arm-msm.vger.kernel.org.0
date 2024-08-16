Return-Path: <linux-arm-msm+bounces-28743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 591269541CF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 08:34:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA1511F21738
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 06:34:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A643F85270;
	Fri, 16 Aug 2024 06:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CEwFiCKX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFEF3F9D5;
	Fri, 16 Aug 2024 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723790028; cv=none; b=mr+VzSl/7bKlbYN+2YA8HyQ890nuRVGC+mEoPfzFLZtMYQdfWOG3TxW4GEao+G3k34Tg/dDNfa6AJ98091IRjqQZjP7n5vWUY2PTN5CSQEIUVNbw7JnNmCC5VQnXowDTqq4/hwCljjjL44krxp+9E4WveI51fEWeh21ht7QOtKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723790028; c=relaxed/simple;
	bh=F8cV5ukwHwmeuMnfknajxoz7x99kHIVmmXHkXeauU88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iHS4oIBJQk5zeY7tI4JCyVeg79UPPeZ6/7J1DIjnppCCJx+Nasow/v2xHLbQjK141NLJxnZAati3J6GT+xq9c4aY2XYt+539MW/dZmc06OivrYrkPmRHAFnIFyOU9g+jWV01CjBnuND+7qdBe3zLfnmQVLSXHdkQwxbs2ylMmkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CEwFiCKX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FEc4JK028638;
	Fri, 16 Aug 2024 06:33:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3VnNC4wumha14AWxS1EJn0wxqNFoWzaqRVY0tBoyXQ=; b=CEwFiCKX+qeeNpAk
	EXIkrvuciRxIGwgZgbV+DPezOqsCezSzIVzjW1rwdsYGxKGACa/tVOti4b0Aqkiy
	YpPB349zZS5bFRGjn79Dxe/gJLMiaP5Zy7zXe+1fKRnbpkiFB8IJO+jPvI2SLd6z
	secMUb13gMqAiK+rCwRvkiJZlLjMSxKyr5BUzDaeLrrYbA277S83kLntOQt5zlqv
	a/S1SnQk3hDE1EE0LSzxF1EOqtpSt/+MYlG5BzkT6OVvYeFle5ZuC6x5EmTvMXD1
	zkHKUfIYCy6xSFY9mPF18QQU57XDE5RPVFnwnEaMSZ9p2uloH2JhE6rULC1RPBZc
	GubzKQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4116h5ueaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 06:33:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G6Xfwg011037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 06:33:41 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 15 Aug 2024 23:33:36 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 16 Aug 2024 12:01:47 +0530
Subject: [PATCH v4 5/8] dt-bindings: clock: qcom: Add SA8775P display clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240816-sa8775p-mm-v3-v1-5-77d53c3c0cef@quicinc.com>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
In-Reply-To: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Taniya Das
	<quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CCtcbapvKxNCd12YlM7cR0Oxy102rllE
X-Proofpoint-ORIG-GUID: CCtcbapvKxNCd12YlM7cR0Oxy102rllE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 impostorscore=0 clxscore=1015 malwarescore=0 phishscore=0
 mlxscore=0 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160045

Add device tree bindings for the display clock controllers
on Qualcomm SA8775P platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sa8775p-dispcc.yaml        | 79 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,sa8775p-dispcc.h    | 87 ++++++++++++++++++++++
 2 files changed, 166 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
new file mode 100644
index 000000000000..ce61755e62d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sa8775p-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on SA8775P
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on SA8775P.
+
+  See also: include/dt-bindings/clock/qcom,sa8775p-dispcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8775p-dispcc0
+      - qcom,sa8775p-dispcc1
+
+  clocks:
+    items:
+      - description: GCC AHB clock source
+      - description: Board XO source
+      - description: Board XO_AO source
+      - description: Sleep clock source
+      - description: Link clock from DP0 PHY
+      - description: VCO DIV clock from DP0 PHY
+      - description: Link clock from DP1 PHY
+      - description: VCO DIV clock from DP1 PHY
+      - description: Byte clock from DSI0 PHY
+      - description: Pixel clock from DSI0 PHY
+      - description: Byte clock from DSI1 PHY
+      - description: Pixel clock from DSI1 PHY
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
+    clock-controller@af00000 {
+      compatible = "qcom,sa8775p-dispcc0";
+      reg = <0x0af00000 0x20000>;
+      clocks = <&gcc GCC_DISP_AHB_CLK>,
+               <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>,
+               <&dp_phy0 0>,
+               <&dp_phy0 1>,
+               <&dp_phy1 2>,
+               <&dp_phy1 3>,
+               <&dsi_phy0 0>,
+               <&dsi_phy0 1>,
+               <&dsi_phy1 2>,
+               <&dsi_phy1 3>;
+      power-domains = <&rpmhpd SA8775P_MMCX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sa8775p-dispcc.h b/include/dt-bindings/clock/qcom,sa8775p-dispcc.h
new file mode 100644
index 000000000000..e2049e510658
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sa8775p-dispcc.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_SA8775P_DISP_CC_H
+#define _DT_BINDINGS_CLK_QCOM_SA8775P_DISP_CC_H
+
+/* DISP_CC_0/1 clocks */
+#define MDSS_DISP_CC_MDSS_AHB1_CLK				0
+#define MDSS_DISP_CC_MDSS_AHB_CLK				1
+#define MDSS_DISP_CC_MDSS_AHB_CLK_SRC				2
+#define MDSS_DISP_CC_MDSS_BYTE0_CLK				3
+#define MDSS_DISP_CC_MDSS_BYTE0_CLK_SRC				4
+#define MDSS_DISP_CC_MDSS_BYTE0_DIV_CLK_SRC			5
+#define MDSS_DISP_CC_MDSS_BYTE0_INTF_CLK			6
+#define MDSS_DISP_CC_MDSS_BYTE1_CLK				7
+#define MDSS_DISP_CC_MDSS_BYTE1_CLK_SRC				8
+#define MDSS_DISP_CC_MDSS_BYTE1_DIV_CLK_SRC			9
+#define MDSS_DISP_CC_MDSS_BYTE1_INTF_CLK			10
+#define MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK				11
+#define MDSS_DISP_CC_MDSS_DPTX0_AUX_CLK_SRC			12
+#define MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK			13
+#define MDSS_DISP_CC_MDSS_DPTX0_CRYPTO_CLK_SRC			14
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK			15
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_CLK_SRC			16
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC		17
+#define MDSS_DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			18
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK			19
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			20
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK			21
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			22
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK			23
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL2_CLK_SRC			24
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK			25
+#define MDSS_DISP_CC_MDSS_DPTX0_PIXEL3_CLK_SRC			26
+#define MDSS_DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK	27
+#define MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK				28
+#define MDSS_DISP_CC_MDSS_DPTX1_AUX_CLK_SRC			29
+#define MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK			30
+#define MDSS_DISP_CC_MDSS_DPTX1_CRYPTO_CLK_SRC			31
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK			32
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_CLK_SRC			33
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC		34
+#define MDSS_DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			35
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK			36
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			37
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK			38
+#define MDSS_DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			39
+#define MDSS_DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK	40
+#define MDSS_DISP_CC_MDSS_ESC0_CLK				41
+#define MDSS_DISP_CC_MDSS_ESC0_CLK_SRC				42
+#define MDSS_DISP_CC_MDSS_ESC1_CLK				43
+#define MDSS_DISP_CC_MDSS_ESC1_CLK_SRC				44
+#define MDSS_DISP_CC_MDSS_MDP1_CLK				45
+#define MDSS_DISP_CC_MDSS_MDP_CLK				46
+#define MDSS_DISP_CC_MDSS_MDP_CLK_SRC				47
+#define MDSS_DISP_CC_MDSS_MDP_LUT1_CLK				48
+#define MDSS_DISP_CC_MDSS_MDP_LUT_CLK				49
+#define MDSS_DISP_CC_MDSS_NON_GDSC_AHB_CLK			50
+#define MDSS_DISP_CC_MDSS_PCLK0_CLK				51
+#define MDSS_DISP_CC_MDSS_PCLK0_CLK_SRC				52
+#define MDSS_DISP_CC_MDSS_PCLK1_CLK				53
+#define MDSS_DISP_CC_MDSS_PCLK1_CLK_SRC				54
+#define MDSS_DISP_CC_MDSS_PLL_LOCK_MONITOR_CLK			55
+#define MDSS_DISP_CC_MDSS_RSCC_AHB_CLK				56
+#define MDSS_DISP_CC_MDSS_RSCC_VSYNC_CLK			57
+#define MDSS_DISP_CC_MDSS_VSYNC1_CLK				58
+#define MDSS_DISP_CC_MDSS_VSYNC_CLK				59
+#define MDSS_DISP_CC_MDSS_VSYNC_CLK_SRC				60
+#define MDSS_DISP_CC_PLL0					61
+#define MDSS_DISP_CC_PLL1					62
+#define MDSS_DISP_CC_SLEEP_CLK					63
+#define MDSS_DISP_CC_SLEEP_CLK_SRC				64
+#define MDSS_DISP_CC_SM_OBS_CLK					65
+#define MDSS_DISP_CC_XO_CLK					66
+#define MDSS_DISP_CC_XO_CLK_SRC					67
+
+/* DISP_CC_0/1 power domains */
+#define MDSS_DISP_CC_MDSS_CORE_GDSC				0
+#define MDSS_DISP_CC_MDSS_CORE_INT2_GDSC			1
+
+/* DISP_CC_0/1 resets */
+#define MDSS_DISP_CC_MDSS_CORE_BCR				0
+#define MDSS_DISP_CC_MDSS_RSCC_BCR				1
+
+#endif

-- 
2.45.2


