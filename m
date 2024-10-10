Return-Path: <linux-arm-msm+bounces-33920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3D89991BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 21:06:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A1A51F26A2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 19:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39B9A1E8834;
	Thu, 10 Oct 2024 18:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mCUnPJ3g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0C61E882F;
	Thu, 10 Oct 2024 18:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728586748; cv=none; b=sS/6MJPdVo2PMZcMTKiZPsgC1x4SHuh+xzno+FsjYHI0EzhfuFaT67/LpjL+46PawUgHISCOfEXo42O4kKem6ZC/Wv0bncOalsJd52NZIRPDob0zOqNzMdl+759qRRn4xKvqGqmOgq6NFhmrgLVtIu6Nv+rsdfMWpJkk1h4IGo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728586748; c=relaxed/simple;
	bh=+A8RFRUS61uWhuEoNyF8u4O922mStjHv/1XJ2RoSNjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=uxdyLlkWMYKrj82ps2i6xRRKad6Y4Zda/3ZIwsb3cQAn1L7LD3XhyLKfCS2aB9Xmx9EdDPad6dKunqtdLULGLDlgB7QVZhW+T5lSBKwBXyM1BXNTg+rHOqyQHiN6zTWid8rQC3Uy1FVGhFiDflUh4GmgojI1WhPMiraJHmB6CXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mCUnPJ3g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AHLBAi024403;
	Thu, 10 Oct 2024 18:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1csGEs8fBZ7XAK8K+fr3BSgM/C/Dzd0jMdLdzpnxTx8=; b=mCUnPJ3gZcp+7njd
	X0qQYUO/oDnSWs49WTBvf0/wPVfEeXZkKUneA+OaZgYAIb2SS4IRPTWjERvOs/FN
	AVupxyi/SdCC7owrjhCBYQs3P4nYEGNkKwcdRU90GAeELL3Hq4bgLaV2F/Ncv37F
	nBA5Hw1HIAHDa+BoekyevxaTwhOlFmX3t5ICzyp+mnOruBMwJ9kIlFBgNIaJAinB
	+8ET7E9XHEFVH8r2nKhDx41FU8nJnRKIlJlbxJLhzN0SbKOZHjCZh9jmzdV7yfEZ
	AehCSau+Vc7F1hfkxGWJ2l3RMPCPdErVZjemDVqjlEmShRa4JZmGwX9qxNo2yffA
	pbShXQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426adhhun4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49AIx07u006716
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 18:59:00 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Oct 2024 11:58:55 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 11 Oct 2024 00:28:31 +0530
Subject: [PATCH v5 1/8] dt-bindings: clock: qcom: Add SA8775P video clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241011-sa8775p-mm-v4-resend-patches-v5-1-4a9f17dc683a@quicinc.com>
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
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5vsDWuj-ZGJXIamu9O5qBnChJblhJ3fM
X-Proofpoint-ORIG-GUID: 5vsDWuj-ZGJXIamu9O5qBnChJblhJ3fM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410100125

Add device tree bindings for the video clock controller on Qualcomm
SA8775P platform.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sa8775p-videocc.yaml       | 62 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,sa8775p-videocc.h   | 47 ++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..928131bff4c1954871cd4067ba331d0cc7233307
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
index 0000000000000000000000000000000000000000..e6325f68c31733f46e5d33281df86902e1f75095
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


