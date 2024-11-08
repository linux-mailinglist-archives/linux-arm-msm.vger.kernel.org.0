Return-Path: <linux-arm-msm+bounces-37316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D65219C152D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 05:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05B8C1C21D34
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 04:11:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F372A1C7B85;
	Fri,  8 Nov 2024 04:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gyfLpgQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5360612C544;
	Fri,  8 Nov 2024 04:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731039040; cv=none; b=F70lZ98wy+TUIeDridJ2f6kB3im2aK6Oo2QbSw/QZms/oAZnsS3A//ZR85O+3CykiQWPHIpjT27O9Ux4/kqIbKAFNSrZo77/xmpADJP2UNnXqKcXylWjQT5xFoS42ki4PSIDh9LgBtnWpmllr7Sxql+Ats6KNfQu9rwGsI9+YLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731039040; c=relaxed/simple;
	bh=thKqWoCBgDOebG4M2yhTeOzHhDBYz3ChrWIrTcCkZxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=V9U8zhQH8zvJ9X8Api3NXW2GD1/Bftgo3mqAB1L6IiJh4V/MzMVG2N0Ng2XcPVgfuuA6imfmTftT5iGTE0lu+G1J5nphcalnJZTS87QkG3aNK4WTFrHYFlKwzi70bMU16lJOx8vtcBJ/2w7HnhL93J5b7SHLRe647nyyYlW36T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gyfLpgQY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Mb49w000714;
	Fri, 8 Nov 2024 04:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McqW9h1wHCvezW+fNwgixUoznF00M2YN36oj9gyjg5k=; b=gyfLpgQYMnhMp7hR
	h2P56pBEd26k35kW+IYjfR8UU8i89QQ5ZaVsGC5ajGzK1rUeatWgF83wEJLh1M0G
	K41pUL92TcI49yrF/QU7wbcjcuSYZGTuoZQg3biKdk4WoWvqeGM1ItIaZCS8mXtn
	ygtHMT1E0U/bX6ZoyTuNc9im129//znlD5IqIoMeVTpYQisfYVVgrCBOTNZe9Ijz
	drEBWBdbYOyEwg2nU0ZkG5nx8U9owoRTR4BcUXAh4WnTAZQR4KoVML1KDfv7DUq4
	36mA8Dsuzhz5TrgvXGNXK+NnEqb3KPr7Lr/vhflF9pyUzsOn+20q41cthrg6B7EY
	uy8E+Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gk8kak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 04:10:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A84A8Mh012204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 04:10:08 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 20:10:03 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 8 Nov 2024 09:39:22 +0530
Subject: [PATCH v3 05/11] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241108-qcs615-mm-clockcontroller-v3-5-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5NtyW-iTr7iuDZTLMZ4KtlfUPAIc97Ll
X-Proofpoint-ORIG-GUID: 5NtyW-iTr7iuDZTLMZ4KtlfUPAIc97Ll
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080033

Add DT bindings for the Display clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
 2 files changed, 125 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..43346ae7e56ef88bc57e450f6f6fe428c649215e
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on QCS615
+
+maintainers:
+  - Ajit Pandey <quic_ajipan@quicinc.com>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on QCS615
+
+  See also: include/dt-bindings/clock/qcom,qcs615-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-dispcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 clock source from GCC
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Pixel clock from DSI PHY1
+      - description: Display port PLL link clock
+      - description: Display port PLL VCO DIV clock
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
+    clock-controller@af00000 {
+      compatible = "qcom,qcs615-dispcc";
+      reg = <0x0af00000 0x20000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+               <&mdss_dsi0_phy 0>,
+               <&mdss_dsi0_phy 1>,
+               <&mdss_dsi1_phy 0>,
+               <&mdss_dp_phy   0>,
+               <&mdss_dp_vco   0>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs615-dispcc.h b/include/dt-bindings/clock/qcom,qcs615-dispcc.h
new file mode 100644
index 0000000000000000000000000000000000000000..9a29945c5762ce06285a2f4e6a55c13bfaadc5c2
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-dispcc.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_QCS615_H
+
+/* DISP_CC clocks */
+#define DISP_CC_MDSS_AHB_CLK					0
+#define DISP_CC_MDSS_AHB_CLK_SRC				1
+#define DISP_CC_MDSS_BYTE0_CLK					2
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				3
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				4
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				5
+#define DISP_CC_MDSS_DP_AUX_CLK					6
+#define DISP_CC_MDSS_DP_AUX_CLK_SRC				7
+#define DISP_CC_MDSS_DP_CRYPTO_CLK				8
+#define DISP_CC_MDSS_DP_CRYPTO_CLK_SRC				9
+#define DISP_CC_MDSS_DP_LINK_CLK				10
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC				11
+#define DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC			12
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK				13
+#define DISP_CC_MDSS_DP_PIXEL1_CLK				14
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC				15
+#define DISP_CC_MDSS_DP_PIXEL_CLK				16
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC				17
+#define DISP_CC_MDSS_ESC0_CLK					18
+#define DISP_CC_MDSS_ESC0_CLK_SRC				19
+#define DISP_CC_MDSS_MDP_CLK					20
+#define DISP_CC_MDSS_MDP_CLK_SRC				21
+#define DISP_CC_MDSS_MDP_LUT_CLK				22
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				23
+#define DISP_CC_MDSS_PCLK0_CLK					24
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				25
+#define DISP_CC_MDSS_ROT_CLK					26
+#define DISP_CC_MDSS_ROT_CLK_SRC				27
+#define DISP_CC_MDSS_RSCC_AHB_CLK				28
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				29
+#define DISP_CC_MDSS_VSYNC_CLK					30
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				31
+#define DISP_CC_PLL0						32
+#define DISP_CC_XO_CLK						33
+
+/* DISP_CC power domains */
+#define MDSS_CORE_GDSC						0
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_RSCC_BCR					1
+
+#endif

-- 
2.45.2


