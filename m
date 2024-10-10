Return-Path: <linux-arm-msm+bounces-33924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 718AF999206
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 21:16:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C705DB2EC82
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 19:07:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B4841EBA09;
	Thu, 10 Oct 2024 18:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RVL1JgEB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4891EB9F6;
	Thu, 10 Oct 2024 18:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586765; cv=none; b=VnKvp8EQQR9WbLpS1q2g5d4C87TsNsR9lt4kpS2ChmMYb3TGbWLVsFitPw87pPvwD4p+MEulklhfWHyntiuOQlq6GSSPab/YsaaREfLfwPi+vfkKjj+2/8g3bTTcMoDgZPrDZYWagy0JSekTiJYuq1ePqfO1rbc46Y1SBwIuHos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586765; c=relaxed/simple;
	bh=fAiVYaKIq4acu/J+oKfsZJHZhL2M2CFXqlDtjMBSo5Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=sJzvn6v7ZWN5Loj14vXA8CNJ8shKQcNZ2P6fSaAObrXblV/HhC9PTYC2OlWwxg6CXmXNJsySv3sNL7p2Qgas26A6tD7p2HKTC84yggG8LzTToh3IevWObMB1CwlUMjgKPzPrdOuxYQf847dflYlmLLGKUsdL7/sH4thrFaMNjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RVL1JgEB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AAbVZ7020018;
	Thu, 10 Oct 2024 18:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Fqj1Y4l5SoPPApPmT4WN9VG2k5JkF4ZFlVTCY7KspE=; b=RVL1JgEBtrh+FJd0
	yKZUI7O6W4Asqz3My8B9p5woae9cCLoe9h/uQFDD4wtZE0hpCmB9KgX4w7s+Mt2o
	TWFgP8lNtYS6cFFJ41pcZKH9bbCkgpURc+uYNfbnCRF+HqNcQ02rAPDGpPTneQRK
	esAiGt7Ar49QM5vG/MerTNRAIbtXQ02fC9Fd+Wb2hUlwefDjHknV5qDQ6qO7sCfe
	jMBjtl/WIZnpRNusy4MITzDX3xr0T1OQQOR5p35hjScYqOH5WyBzXapEde/q9vjG
	9P9tYozWyAnowyNg1TXkg7iT+MMl6DLTZwxg4H7NlzgsuaQQhvnaOwy6GixJzWff
	O824qw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426db7hb5d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AIxI9K029391
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:18 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 11:59:13 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 11 Oct 2024 00:28:35 +0530
Subject: [PATCH v5 5/8] dt-bindings: clock: qcom: Add SA8775P display clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241011-sa8775p-mm-v4-resend-patches-v5-5-4a9f17dc683a@quicinc.com>
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
X-Proofpoint-ORIG-GUID: nKJdWpDgr8O2jol5UuszR9Bi2Qip0WiX
X-Proofpoint-GUID: nKJdWpDgr8O2jol5UuszR9Bi2Qip0WiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100125

Add device tree bindings for the display clock controllers
on Qualcomm SA8775P platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sa8775p-dispcc.yaml        | 79 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,sa8775p-dispcc.h    | 87 ++++++++++++++++++++++
 2 files changed, 166 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-dispcc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..ce61755e62d40b8615899b6ead11d00df96b7754
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
index 0000000000000000000000000000000000000000..e2049e5106587f55526fba02d0616c9d41649dc7
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


