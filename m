Return-Path: <linux-arm-msm+bounces-63341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC91AF0ED4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:06:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 813307A8FBB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1202D241CB7;
	Wed,  2 Jul 2025 09:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="e2tQ3Krj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CDB2405FD;
	Wed,  2 Jul 2025 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447138; cv=none; b=SwtH+7mPN7CYYwC/jVWGwAwAAoFDt6tFgxhtIwdjfLVFLXXiEmZ2APRHYEBVj39vB+cuUSDJ2dastYpig4eBqknIrZyWX1qwrcAQmQPTe8H0JggOd8bxe4eeCBg4GjatJpfcw/S+gIlmTcbzjWCTaF/X7eyYnuqZir0s+Bht1Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447138; c=relaxed/simple;
	bh=hw/wS/6QsqCdRUwfJK98Tn5XasiG0RrPE80BT0wYGN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=n1X0v7LpyPuvbOqH+cApZbR6Irmr9IjUm4An3SjN2NeMsq4NLfk+yxOJmJzPePQSlxxb6LpvUD6CylUoupQduSBgq+55f7Nqn1RdSnK4QXcM8xxgiZXIPhu5rarxext1E7Tq9J1+T/ivNSmJQQ8YRaQC8tJSk+9IDMkFUxqyWsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=e2tQ3Krj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5626xBrq000314;
	Wed, 2 Jul 2025 09:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgLkjvf9V4UaQk57G2LFmTAhWbYNhcGIHao3VSclzOc=; b=e2tQ3KrjMOQX9s+h
	cXFGYGfb6CSJ/BVGopps1UQYjHXKjHUovr38V6j+0WCT/6ItkF6eV8maKPoytivx
	p/JASPamTb+diesUem9mAzn3hz218hyTrJCzYlnnC/YrvA/jfYynzxgUL9vL1eYp
	JLEGvKm+UOqjfbx96T938jc9KlpcHEVNEJmug5dYxDvkNWGuhkKiiuLkcPFYIbIp
	pKVh2sBnm0jIkNR/Pp8xh+UdVZ+xkz1zmFhXdlQ2X3NQyXZl92MJe9r91p7Oowqz
	q7EAyNSpXogf17bUaBWaB2JFD91DTU2U6hoatFcpjbbyBZQBpxDZjH7kwFUOY1d2
	g+HCdg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qmbvdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:05:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56295J9N006169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:05:19 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 02:05:14 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 2 Jul 2025 14:34:24 +0530
Subject: [PATCH v11 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-qcs615-mm-v10-clock-controllers-v11-4-9c216e1615ab@quicinc.com>
References: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
In-Reply-To: <20250702-qcs615-mm-v10-clock-controllers-v11-0-9c216e1615ab@quicinc.com>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=6864f657 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=vHYOu0EEr4IEsFCh_qoA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EcWd_mDCkqQtfbbBBLO232O3yfElvX0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MyBTYWx0ZWRfXzD2vBAEg0JDy
 tqZgJuHpVdY6FdZbcWzWiidinIZFzETY4HrJkQBxLTNAmvDkeS4XoFvnJuG3CQ2DWRk6LaziyjU
 dERkztaO53yHG7FtdGc4oPz85sQKd2EUFYpezjCDsqgPEd9/cIdY1jP72Fbf2680ONdNnQpNtOo
 rGZk/2wAkrWLLKQNQw86yk+iYYlfpG/UUuM4/PpchXPjdcvXkDQ3o4c9DuhmjF9J1oMzzBvO7Vz
 gxR+5YuSQ5Xw3yBGN2WhZANaaG6BnZ8CljtBQkN0USf3e+Q7XSvQO3nifBM39uXXgNiuv0RCHOW
 C1SYeOVh7Kk5VRbfZ7ZbpydDfT8oKKyhXteJ3tzPBOOmgrmL/wg0aP7AlyXIzsEBRVu1rUygy2X
 MRaXjbTvgtMRTCOhAtp0yokdVES2PpN6z7PCEY4BhusB7MVRST9hNTOomiRhBPvt44UTJ0ma
X-Proofpoint-GUID: EcWd_mDCkqQtfbbBBLO232O3yfElvX0M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020073

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


