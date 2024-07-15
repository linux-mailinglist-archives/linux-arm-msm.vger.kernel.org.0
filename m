Return-Path: <linux-arm-msm+bounces-26120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C711C930F84
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 10:24:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26001B212E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 08:24:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C23F1849EA;
	Mon, 15 Jul 2024 08:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="jdwwVQMf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F9E1849EC;
	Mon, 15 Jul 2024 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721031823; cv=none; b=DKV1qAr0isZO2cTIcTfdDwnXIeRTdW3SyHunkYBBF3JCfKsOaTi0vwW7Rqiun2gJmumnzjIHgMx6PQK7fX8rYc30jc31lTDbTCLtNS0UcGC2d4PbC63/jDTVciGAVAwH679kQ8NZdAYo6KCjkEMQp7wZJniCIMcfqPE21RXdqKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721031823; c=relaxed/simple;
	bh=e+Kge7fIFFIZmiWXzw6J23q+TkLii8PU7TuhfX40vmo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TUzbpWEQtX6HdMmO6HTmO8nAjRQq6CyUL77Nqfxdw7G4Zljqn2Oyg3op7qbRpDLVCCE0ZHhKeyw2mqLkxSuAH/XSDgRbSiUAtvU4pun52dwJomJanJ7mjlWX8qCiuRepmKkEH0u/E8TKN693zoLwRFpB6dG8jRCPdC6C+QAavM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=jdwwVQMf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46F2dGm7020313;
	Mon, 15 Jul 2024 08:23:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KA1dyCiIpJ294Kg+y1jkeU2TDrjui+nT2p4JkGSriv8=; b=jdwwVQMfFyO1K7Xk
	hqK7QbBf96GRQJPtxF5A3isuWNGbb22lDTff7gg5puOl91e8oQCMF4D0q6xI7aRd
	JUn6qn6TsmtufpajX5gVX1XQ2i6Fcx/Sx4ue7va/EbekUT6LPvtkMwyeJP7gjiPk
	Q52kxRZo7PBRK3k8DVGgxqo6dYdhpsrSLDQGPdxNWKWWy6OjmNy/PH9EVcNQzccm
	gXd+LgNpysBV6cjn/JhF+63d20XX/C2uwwui+wmFap/AfIHEEl594jOgGhrTSDji
	Kew1T26gE2TQOGcEG0Y3C+WusHorQRgjH5wQB5Rk+xFXnxhJalEKjaGB2Y4UT3SE
	v3gXzQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40bhnuk513-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 08:23:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46F8NZ27013033
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 15 Jul 2024 08:23:35 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 15 Jul 2024 01:23:31 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Mon, 15 Jul 2024 13:53:16 +0530
Subject: [PATCH v3 1/8] dt-bindings: clock: qcom: Add SA8775P video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240715-sa8775p-mm-v3-v1-1-badaf35ed670@quicinc.com>
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
X-Proofpoint-ORIG-GUID: sPcLq95ti8ySd25fWtIZ8JNaIZLLKcIu
X-Proofpoint-GUID: sPcLq95ti8ySd25fWtIZ8JNaIZLLKcIu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_03,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407150065

Add device tree bindings for the video clock controller on Qualcomm
SA8775P platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sa8775p-videocc.yaml       | 62 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sa8775p-videocc.h   | 47 ++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
new file mode 100644
index 000000000000..928131bff4c1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sa8775p-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on SA8775P
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on SA8775P.
+
+  See also: include/dt-bindings/clock/qcom,sa8775p-videocc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8775p-videocc
+
+  clocks:
+    items:
+      - description: Video AHB clock from GCC
+      - description: Board XO source
+      - description: Board active XO source
+      - description: Sleep Clock source
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
+    videocc: clock-controller@abf0000 {
+      compatible = "qcom,sa8775p-videocc";
+      reg = <0x0abf0000 0x10000>;
+      clocks = <&gcc GCC_VIDEO_AHB_CLK>,
+               <&rpmhcc RPMH_CXO_CLK>,
+               <&rpmhcc RPMH_CXO_CLK_A>,
+               <&sleep_clk>;
+      power-domains = <&rpmhpd SA8775P_MMCX>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,sa8775p-videocc.h b/include/dt-bindings/clock/qcom,sa8775p-videocc.h
new file mode 100644
index 000000000000..e6325f68c317
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sa8775p-videocc.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_SA8775P_VIDEO_CC_H
+#define _DT_BINDINGS_CLK_QCOM_SA8775P_VIDEO_CC_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0C_CLK					5
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				6
+#define VIDEO_CC_MVS1_CLK					7
+#define VIDEO_CC_MVS1_CLK_SRC					8
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				9
+#define VIDEO_CC_MVS1C_CLK					10
+#define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC				11
+#define VIDEO_CC_PLL_LOCK_MONITOR_CLK				12
+#define VIDEO_CC_SLEEP_CLK					13
+#define VIDEO_CC_SLEEP_CLK_SRC					14
+#define VIDEO_CC_SM_DIV_CLK_SRC					15
+#define VIDEO_CC_SM_OBS_CLK					16
+#define VIDEO_CC_XO_CLK						17
+#define VIDEO_CC_XO_CLK_SRC					18
+#define VIDEO_PLL0						19
+#define VIDEO_PLL1						20
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0C_GDSC					0
+#define VIDEO_CC_MVS0_GDSC					1
+#define VIDEO_CC_MVS1C_GDSC					2
+#define VIDEO_CC_MVS1_GDSC					3
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define VIDEO_CC_MVS0C_BCR					3
+#define VIDEO_CC_MVS1_BCR					4
+#define VIDEO_CC_MVS1C_CLK_ARES					5
+#define VIDEO_CC_MVS1C_BCR					6
+
+#endif

-- 
2.45.2


