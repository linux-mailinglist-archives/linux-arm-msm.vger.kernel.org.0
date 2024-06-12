Return-Path: <linux-arm-msm+bounces-22414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 878EA9050C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 12:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 070E01F2469E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 10:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4FDD16F273;
	Wed, 12 Jun 2024 10:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k5rLS3UZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3020016E888;
	Wed, 12 Jun 2024 10:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189324; cv=none; b=L5sAvPyXHhYjeWnO/LI/UYlcaym28sunmdDt3wQFLuU6fTpa6frirqk9aitzw/b0yShoDt9rugzTESKxQjZsLkZnzQqk1OF2XFmbrjhzbBy0gyjo0VGpjvAZaHmO3S8NHjAGmDfJvgBXSXY4LwU/a4Tw5VO6TcQadQpkvPcnoA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189324; c=relaxed/simple;
	bh=F8cV5ukwHwmeuMnfknajxoz7x99kHIVmmXHkXeauU88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=K0C2IVB4OspUmrDC0ggxL7BPBz2qMp5C2X3mQaS/iUI3jJwqJ3Z/mwEirOWLtzZnqcaVuGkNYRLl9KAsp307oX2vpzam5GQfyIpYSZ3oAXKYQNd0pkHXcy0MH/ch9I5hyx9z8GcX044d1fvhkoAxbhh2t2SnTjDwbtP3y5C6/0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k5rLS3UZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45C4Z2tn018660;
	Wed, 12 Jun 2024 10:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3VnNC4wumha14AWxS1EJn0wxqNFoWzaqRVY0tBoyXQ=; b=k5rLS3UZnLpkVGRc
	rEAktgmdOEADmPtGFCj95V1L2dJSZac1K1IroXNbkGx8vFYva20+IKqBqjBTMwvh
	k1vsz8DCqqEPw+QhQMncZwyxPos0tOuKk4MRYBXXZqoZ4ilrj6PPjivaVkU8RGq7
	NJehqh4LA18uYt/WLxZXpvQVZbmWgoLkB4aZ6QjHOiwzT5sed16QOcsVsWbgDiy9
	/yGiP9JwOJyueU84t3olrb+W30FY8j5NGzoYxp6DnxKdTSobrc1mhFF/jDFjuhSX
	AuTFjWsR5JsekS5wM3CUkuvtds+BTIvqmeb53NSvNwurBxx49OQAMIOimJPuprWD
	2K2glQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq4s8gv5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:48:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CAmcWF011615
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 10:48:38 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 03:48:33 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 12 Jun 2024 16:17:46 +0530
Subject: [PATCH 5/8] dt-bindings: clock: qcom: Add SA8775P display clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240612-sa8775p-mm-clock-controllers-v1-5-db295a846ee7@quicinc.com>
References: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
In-Reply-To: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_jkona@quicinc.com>, <quic_imrashai@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oBC_ZVZP_SkMKBnVzRJ_ZpGoXXnPjgvD
X-Proofpoint-ORIG-GUID: oBC_ZVZP_SkMKBnVzRJ_ZpGoXXnPjgvD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_06,2024-06-12_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 spamscore=0 mlxscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120078

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


