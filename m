Return-Path: <linux-arm-msm+bounces-61099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C46A4AD6CBF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 11:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7A42217DB7E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Jun 2025 09:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67CBF231A4D;
	Thu, 12 Jun 2025 09:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CWhHPbmP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA7D22DF84;
	Thu, 12 Jun 2025 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722215; cv=none; b=kahpik6KpFNUf3eclo9009VIZeLRLcvZcOsTQl64og23kSlwb8y2x/HkyczN0ph6ViMnLoAfGxIiSzQhKrmKsDnivvKd4dJzU+FM5d50v6Sj4guIvZsLTxTSiDlNXAYhdupeLlK0OOfmaXRNOOQvdxDXE/ZXb2sGUNwZ1EQvVS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722215; c=relaxed/simple;
	bh=hw/wS/6QsqCdRUwfJK98Tn5XasiG0RrPE80BT0wYGN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=bpxv5nCOllNyosWm2aLD1D9geq8c8MFI+SFWihQl/nyrc4/auFHV080AdCIFFB62SnsDvHpYrzStsASQxxWQpIbLgij1qeU1mkm+/TqfzMJ99nlV6wvYUFs7+eHHGlhO2ZW5rwlLSM4wS51DkeJb/dUKLqcD6KkRzwZSN2MHFXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CWhHPbmP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C7h78V011018;
	Thu, 12 Jun 2025 09:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgLkjvf9V4UaQk57G2LFmTAhWbYNhcGIHao3VSclzOc=; b=CWhHPbmPqHmfYOYw
	+fYoDDkiFi9rVy+Yqw6vjUs7yYUp0pHixK0B9bOXIOwhhwgvEd8/X4fX0lhsd0fA
	IHBzeT4bJMauiQKqsXTG57UmZL7CPwAwk71UM3sPum9fZaPvbLM348oQOHwN5E6G
	I79faw2zysbSG0X3t5qzpF3hj0ooyzGpsHJX2zjLdZ+HPP4AZh7ipcMOgVJej1M3
	4QeV3n7hcKqI/+S2pnC8hk6YkHut2TcZvQFxuq5LuecLhWf1APj4eytDuYSU3eZX
	XzEcaN2FJQ51UjBXDTBLUgVU9eJjk/O/Cxy9SfJ/F6Is95egKf5PG2bf7hrtyeH8
	FJcSwg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpyrdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:56:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55C9uiq0023360
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 09:56:44 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Jun 2025 02:56:39 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 12 Jun 2025 15:25:08 +0530
Subject: [PATCH v9 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250612-qcs615-mm-v9-clock-controllers-v9-4-b34dc78d6e1b@quicinc.com>
References: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
In-Reply-To: <20250612-qcs615-mm-v9-clock-controllers-v9-0-b34dc78d6e1b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon
	<will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684aa45d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=vHYOu0EEr4IEsFCh_qoA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX6MZuC/zN9xGv
 II0/6bzE3fCB+/frjoh/udSOKhn7fZyUOK3SNZlP4F1C6Dile9weygXkg1qkT/l+xiFVoMu4YRC
 LKGxhk1EmPnSe/1vMw1mQxb+2BHDyh4vN/pmFfdRorKP2e7zXTaquGQJGZDxSiq6gE90q5288mi
 d/2YFGDhZcZkZA+uw8GbZ+XXnATuOCl0h/YABM0/uiZsKYzwM9fwmSfSZlN8SvS1wtWvXtJJOay
 ZBfKr7ob8u0PgYNwep+jilFViFZxfRfoKRIRqfSpP+h+KFLGCQC0pFL8Q2w0s0IwKeTO1EcDe5O
 Gfqm74susp9nmb+1e/LoS1IlABQMt86WuDr1CrYvLPjs7ay06mBIXgpFgpWC3kdoUWqqQIZlJJp
 8+YI5qgJnuCj3G4XtZkmVHK4X8T3sOweKzrzNRsVSVzc5u6cw5XFT5hVkLQl6I5T3Zihe7QB
X-Proofpoint-GUID: i3zsDLMpY68XZ_qYpI0-KlrRur39pF4e
X-Proofpoint-ORIG-GUID: i3zsDLMpY68XZ_qYpI0-KlrRur39pF4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120076

Add DT bindings for the Display clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-dispcc.yaml         | 55 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 ++++++++++++++++++++
 2 files changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d566f19beb0d76369ebfa8272224d01e7ecee63c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-dispcc.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display Clock & Reset Controller on QCS615
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm display clock control module provides the clocks, resets and power
+  domains on QCS615.
+
+  See also: include/dt-bindings/clock/qcom,qcs615-dispcc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-dispcc
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
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
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
+               <&mdss_dp_phy 0>,
+               <&mdss_dp_vco 0>;
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
2.34.1


