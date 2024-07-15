Return-Path: <linux-arm-msm+bounces-26122-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AAA930F8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:24:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EF68928167A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 08:24:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E7371850AA;
	Mon, 15 Jul 2024 08:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="P7M6xfAe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92829185099;
	Mon, 15 Jul 2024 08:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721031833; cv=none; b=tpzgM+P73XOK/yx2sye4e/OY8lr7DpglcbbXDPq8wM5LQ7gvOENcs1c1T+hPrbDj5W3S8t+Bt/83zU8ek2IUBhObJU354BrnYVq1bqxSh8lPIV23LSc1ClBRiJaYzY8GNP/zMgy5nFQ8sBTzxcALTniJEmBVAxCXaVsm+fQZ+NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721031833; c=relaxed/simple;
	bh=QtZb6WW+AEYu5Q07bkxb4RGsZBiHQpkaBZIz4bbxeUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=D6L7MyeoU5vqYoHgCzyPil9+cVLZDlWbjT4tQ9CrAOzbpt0iXh6cDQ8kcU/cI+Ee/6+caSIrg8BMtgLbxVy9no8HsiGiUmLQ2zp/WWu3AAj+mk8kimBNJmKdu/A6jmOVnzo3mFqWDYc2qEha7VyFS2b9HoXJLsfRuTXtthO10Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=P7M6xfAe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F2dLIe003919;
	Mon, 15 Jul 2024 08:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2o8cZG3RvoAWAFJTrk4Jy690BL87r9oWv+Hpb09nZ/o=; b=P7M6xfAe1zPgfOW3
	LGOd3bJzczeZ/NVpHm+682qM2zdVSegilSeP2CFLG0hRxQ09LK7K3l8KlejX+fqd
	/Aa+auQlfd5bjNBF0vzWbyjUUw375lGpG+HPo0ftvQiQ05ZpEQkki7gP5kOxJbrL
	mIy6qc8OQfvV9IzJF8uQKg9SczIcJC0eCd7IqGThvc5ekMwFDPZbqfi88v9bq+3y
	R8hWZxZOivSZ+eX0erHtpEuGAEDglf7VLMIo5JIAdyXFG2qWbV2Zfhw81UkHyIMt
	++fWxzOJDhoitA+MqnkiGEQkD/4FitojXY0HYQy33mbXKb+X1pi4JSdyphkC+aX1
	Svx8Uw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bhy6u69x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 08:23:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46F8Nic6030934
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 08:23:44 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Jul 2024 01:23:40 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Mon, 15 Jul 2024 13:53:18 +0530
Subject: [PATCH v3 3/8] dt-bindings: clock: qcom: Add SA8775P camera clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240715-sa8775p-mm-v3-v1-3-badaf35ed670@quicinc.com>
References: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
In-Reply-To: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
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
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        <quic_tdas@quicinc.com>
X-Mailer: b4 0.14-dev-f7c49
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j0KYN7ZbLwIXAcHTV25_tQKINXUEpnt2
X-Proofpoint-ORIG-GUID: j0KYN7ZbLwIXAcHTV25_tQKINXUEpnt2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_03,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150065

Add device tree bindings for the camera clock controller
on Qualcomm SA8775P platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sa8775p-camcc.yaml         |  62 ++++++++++++
 include/dt-bindings/clock/qcom,sa8775p-camcc.h     | 107 +++++++++++++++++++++
 2 files changed, 169 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-camcc.yaml
new file mode 100644
index 000000000000..36a60d8f5ae3
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
2.45.2


