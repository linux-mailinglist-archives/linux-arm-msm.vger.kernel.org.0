Return-Path: <linux-arm-msm+bounces-27497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02DDE9426EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 08:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D573B23B38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jul 2024 06:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFC016D4C9;
	Wed, 31 Jul 2024 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Be8VAGtM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53D816D4C0;
	Wed, 31 Jul 2024 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722407480; cv=none; b=vA82aAmtj2VbnTj+AYg4ByHWtEHu51oH7vImP7FycSycU+mPvzvubetSXzHiKswb3ZMRkbIXIbnbnyldJMhf3hc6zhvvCOM+awZlWvgW/XHTla9z96RhCnYMxS+xl7TVVQ5VHZd33AXJj3FvPfI9my5VBe87/iFxjtSEhWHR0QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722407480; c=relaxed/simple;
	bh=d56N12z8U+Dbf/Z+qMlnUds0L7rlUUWb8FW9jeh7KBg=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G2TxGxoRcQihFJof1oz6TbcFIXrLTRiKCOL68V4UNIhJYmxbsziW34miPY057MjAiTR1SmIoDqFKuJVtu0bNj/Bzpl+rto08afvtfVS+VqiQo8ZsYRdu3QBu5ZqVRbZBx6K3BVcy551KfpfDe3Kmtc6mqPMqitoJv0ALvLZJy6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Be8VAGtM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V1SJCc028727;
	Wed, 31 Jul 2024 06:30:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DsuYiZ6AkwGxfyrSkYYGIUvO8MWr2WSyPJKiQZcS8lY=; b=Be8VAGtMe41Yjo/N
	MPZtUeVot6vqJ4BUoNndousBJC4aO+elxZDCtSSBvM3PG7cc+tqINQ9jLeF9SUAb
	GAJoBAfjJOX313a7CEcUr4WkxIYPNjwMrY34vGlnSePu0BxKqWeGNG8ZHSzZFW6E
	PARrC3Oh2SMwZSChzFjADtuuGdHeAbklRIO2IjwPfH3s57GfCbDowQdq/kxPBZKX
	RLHbE+ZSFAH8wU1wbGk06YOiI0Y/UPbybXxfFtQelP2OWpV1r7BKsN6yqxHlDsPY
	iSJ7wxV/gnrE6Ea/bvcbMlQeltpu1IqBFs/ksgUQXIQ5f9c9f/PSxkn77md6ZENW
	BivX8g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40q232tb56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:44 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46V6Uhhn001387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 06:30:43 GMT
Received: from hu-skakitap-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Jul 2024 23:30:37 -0700
From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>,
        "Imran
 Shaik" <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, <stable@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue
	<bryan.odonoghue@linaro.org>,
        Satya Priya Kakitapalli
	<quic_skakitap@quicinc.com>
Subject: [PATCH V3 6/8] dt-bindings: clock: qcom: Add SM8150 camera clock controller
Date: Wed, 31 Jul 2024 11:59:14 +0530
Message-ID: <20240731062916.2680823-7-quic_skakitap@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
References: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: kpq4QUmK6RXfCpD6czV0YFpngNXM2U1D
X-Proofpoint-ORIG-GUID: kpq4QUmK6RXfCpD6czV0YFpngNXM2U1D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_03,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407310047

Add device tree bindings for the camera clock controller on
Qualcomm SM8150 platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
---
 .../bindings/clock/qcom,sm8150-camcc.yaml     |  77 ++++++++++
 include/dt-bindings/clock/qcom,sm8150-camcc.h | 135 ++++++++++++++++++
 2 files changed, 212 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8150-camcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
new file mode 100644
index 000000000000..5e9f62d7866c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8150-camcc.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8150-camcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Camera Clock & Reset Controller on SM8150
+
+maintainers:
+  - Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
+
+description: |
+  Qualcomm camera clock control module provides the clocks, resets and
+  power domains on SM8150.
+
+  See also:: include/dt-bindings/clock/qcom,sm8150-camcc.h
+
+properties:
+  compatible:
+    const: qcom,sm8150-camcc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Camera AHB clock from GCC
+
+  power-domains:
+    maxItems: 1
+    description:
+      A phandle and PM domain specifier for the MMCX power domain.
+
+  required-opps:
+    maxItems: 1
+    description:
+      A phandle to an OPP node describing required MMCX performance point.
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
+  - power-domains
+  - required-opps
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sm8150.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+    clock-controller@ad00000 {
+      compatible = "qcom,sm8150-camcc";
+      reg = <0x0ad00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&gcc GCC_CAMERA_AHB_CLK>;
+      power-domains = <&rpmhpd SM8150_MMCX>;
+      required-opps = <&rpmhpd_opp_low_svs>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sm8150-camcc.h b/include/dt-bindings/clock/qcom,sm8150-camcc.h
new file mode 100644
index 000000000000..5444035efa93
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8150-camcc.h
@@ -0,0 +1,135 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8150_H
+#define _DT_BINDINGS_CLK_QCOM_CAM_CC_SM8150_H
+
+/* CAM_CC clocks */
+#define CAM_CC_PLL0					0
+#define CAM_CC_PLL0_OUT_EVEN				1
+#define CAM_CC_PLL0_OUT_ODD				2
+#define CAM_CC_PLL1					3
+#define CAM_CC_PLL1_OUT_EVEN				4
+#define CAM_CC_PLL2					5
+#define CAM_CC_PLL2_OUT_MAIN				6
+#define CAM_CC_PLL3					7
+#define CAM_CC_PLL3_OUT_EVEN				8
+#define CAM_CC_PLL4					9
+#define CAM_CC_PLL4_OUT_EVEN				10
+#define CAM_CC_BPS_AHB_CLK				11
+#define CAM_CC_BPS_AREG_CLK				12
+#define CAM_CC_BPS_AXI_CLK				13
+#define CAM_CC_BPS_CLK					14
+#define CAM_CC_BPS_CLK_SRC				15
+#define CAM_CC_CAMNOC_AXI_CLK				16
+#define CAM_CC_CAMNOC_AXI_CLK_SRC			17
+#define CAM_CC_CAMNOC_DCD_XO_CLK			18
+#define CAM_CC_CCI_0_CLK				19
+#define CAM_CC_CCI_0_CLK_SRC				20
+#define CAM_CC_CCI_1_CLK				21
+#define CAM_CC_CCI_1_CLK_SRC				22
+#define CAM_CC_CORE_AHB_CLK				23
+#define CAM_CC_CPAS_AHB_CLK				24
+#define CAM_CC_CPHY_RX_CLK_SRC				25
+#define CAM_CC_CSI0PHYTIMER_CLK				26
+#define CAM_CC_CSI0PHYTIMER_CLK_SRC			27
+#define CAM_CC_CSI1PHYTIMER_CLK				28
+#define CAM_CC_CSI1PHYTIMER_CLK_SRC			29
+#define CAM_CC_CSI2PHYTIMER_CLK				30
+#define CAM_CC_CSI2PHYTIMER_CLK_SRC			31
+#define CAM_CC_CSI3PHYTIMER_CLK				32
+#define CAM_CC_CSI3PHYTIMER_CLK_SRC			33
+#define CAM_CC_CSIPHY0_CLK				34
+#define CAM_CC_CSIPHY1_CLK				35
+#define CAM_CC_CSIPHY2_CLK				36
+#define CAM_CC_CSIPHY3_CLK				37
+#define CAM_CC_FAST_AHB_CLK_SRC				38
+#define CAM_CC_FD_CORE_CLK				39
+#define CAM_CC_FD_CORE_CLK_SRC				40
+#define CAM_CC_FD_CORE_UAR_CLK				41
+#define CAM_CC_GDSC_CLK					42
+#define CAM_CC_ICP_AHB_CLK				43
+#define CAM_CC_ICP_CLK					44
+#define CAM_CC_ICP_CLK_SRC				45
+#define CAM_CC_IFE_0_AXI_CLK				46
+#define CAM_CC_IFE_0_CLK				47
+#define CAM_CC_IFE_0_CLK_SRC				48
+#define CAM_CC_IFE_0_CPHY_RX_CLK			49
+#define CAM_CC_IFE_0_CSID_CLK				50
+#define CAM_CC_IFE_0_CSID_CLK_SRC			51
+#define CAM_CC_IFE_0_DSP_CLK				52
+#define CAM_CC_IFE_1_AXI_CLK				53
+#define CAM_CC_IFE_1_CLK				54
+#define CAM_CC_IFE_1_CLK_SRC				55
+#define CAM_CC_IFE_1_CPHY_RX_CLK			56
+#define CAM_CC_IFE_1_CSID_CLK				57
+#define CAM_CC_IFE_1_CSID_CLK_SRC			58
+#define CAM_CC_IFE_1_DSP_CLK				59
+#define CAM_CC_IFE_LITE_0_CLK				60
+#define CAM_CC_IFE_LITE_0_CLK_SRC			61
+#define CAM_CC_IFE_LITE_0_CPHY_RX_CLK			62
+#define CAM_CC_IFE_LITE_0_CSID_CLK			63
+#define CAM_CC_IFE_LITE_0_CSID_CLK_SRC			64
+#define CAM_CC_IFE_LITE_1_CLK				65
+#define CAM_CC_IFE_LITE_1_CLK_SRC			66
+#define CAM_CC_IFE_LITE_1_CPHY_RX_CLK			67
+#define CAM_CC_IFE_LITE_1_CSID_CLK			68
+#define CAM_CC_IFE_LITE_1_CSID_CLK_SRC			69
+#define CAM_CC_IPE_0_AHB_CLK				70
+#define CAM_CC_IPE_0_AREG_CLK				71
+#define CAM_CC_IPE_0_AXI_CLK				72
+#define CAM_CC_IPE_0_CLK				73
+#define CAM_CC_IPE_0_CLK_SRC				74
+#define CAM_CC_IPE_1_AHB_CLK				75
+#define CAM_CC_IPE_1_AREG_CLK				76
+#define CAM_CC_IPE_1_AXI_CLK				77
+#define CAM_CC_IPE_1_CLK				78
+#define CAM_CC_JPEG_CLK					79
+#define CAM_CC_JPEG_CLK_SRC				80
+#define CAM_CC_LRME_CLK					81
+#define CAM_CC_LRME_CLK_SRC				82
+#define CAM_CC_MCLK0_CLK				83
+#define CAM_CC_MCLK0_CLK_SRC				84
+#define CAM_CC_MCLK1_CLK				85
+#define CAM_CC_MCLK1_CLK_SRC				86
+#define CAM_CC_MCLK2_CLK				87
+#define CAM_CC_MCLK2_CLK_SRC				88
+#define CAM_CC_MCLK3_CLK				89
+#define CAM_CC_MCLK3_CLK_SRC				90
+#define CAM_CC_SLOW_AHB_CLK_SRC				91
+
+/* CAM_CC power domains */
+#define TITAN_TOP_GDSC					0
+#define BPS_GDSC					1
+#define IFE_0_GDSC					2
+#define IFE_1_GDSC					3
+#define IPE_0_GDSC					4
+#define IPE_1_GDSC					5
+
+/* CAM_CC resets */
+#define CAM_CC_BPS_BCR					0
+#define CAM_CC_CAMNOC_BCR				1
+#define CAM_CC_CCI_BCR					2
+#define CAM_CC_CPAS_BCR					3
+#define CAM_CC_CSI0PHY_BCR				4
+#define CAM_CC_CSI1PHY_BCR				5
+#define CAM_CC_CSI2PHY_BCR				6
+#define CAM_CC_CSI3PHY_BCR				7
+#define CAM_CC_FD_BCR					8
+#define CAM_CC_ICP_BCR					9
+#define CAM_CC_IFE_0_BCR				10
+#define CAM_CC_IFE_1_BCR				11
+#define CAM_CC_IFE_LITE_0_BCR				12
+#define CAM_CC_IFE_LITE_1_BCR				13
+#define CAM_CC_IPE_0_BCR				14
+#define CAM_CC_IPE_1_BCR				15
+#define CAM_CC_JPEG_BCR					16
+#define CAM_CC_LRME_BCR					17
+#define CAM_CC_MCLK0_BCR				18
+#define CAM_CC_MCLK1_BCR				19
+#define CAM_CC_MCLK2_BCR				20
+#define CAM_CC_MCLK3_BCR				21
+
+#endif
-- 
2.25.1


