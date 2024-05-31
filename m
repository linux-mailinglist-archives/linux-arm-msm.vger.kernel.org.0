Return-Path: <linux-arm-msm+bounces-21214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BB28D5D97
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 11:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C9F828279D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 May 2024 09:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BBBF157489;
	Fri, 31 May 2024 09:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Q63ZLbPu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3B156C76;
	Fri, 31 May 2024 09:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717146245; cv=none; b=glUhHnIO3TdWkBu1rt63RKgc+0GxfBClT+Yrtoj6f2J4WedMPdhVbrk29QUs111FDo0AQCN1TMY+NaMSklLbaEqkQzPoQ4gGSwBthZFet2WTWOvpDIWsNZt/t91EaCYcQeRftwLg2voc99v2V4RXql/gl6cR+gcbLhicfxo1vhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717146245; c=relaxed/simple;
	bh=0dWwBARTqd1h5OXfDVJpAaxmfpS1GfSxT0C0XzOaJ5c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CU+WWwyx1r99LV2OHhwbYPavaZiKjwDUsqYwtX3kXbpTf2HsjGFERue5SsMavtJfmVrXAM/ofHlr2fvBNGlKOtu7lmlyi4sQJEa4KeRrVQu7VexAdClh0KuwOD6XD9p5C8weue5LzsF8w1q2vzMsCclELQ1WSDRKPcfpaJpPmqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Q63ZLbPu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V8lHuO006252;
	Fri, 31 May 2024 09:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VlfUS+Dy50NSCnH0ANn3RGRG
	Lkj4E31gQTSdqHPRPnM=; b=Q63ZLbPumV4rXUmT94MsIxDt+YZ1quWW+KhpDCNz
	noMBiKqBNIImUCT553cuQP8cduMmcZagpAmDh0rPPsDi04FH94+fTGErpsYYekue
	/dp/NYGqcQbJCK/pmGmMZQX/JbhFRo9NeuxF7+Vwg2svUnFXH6wgQJz5tPKrA0Ow
	YAEV9rT4Y/ei4UPxmYcKpyu7pezQF/F/sr9lckKIizVelpOn/41s5CpDZ5ZoETMB
	5d0JAoXmZh6rKAM79836+RZ+NsovGROY/7G6CdjdyCKQv4OlgaCMlzXXuaESc970
	CS7AG6SwL0gNAfa7I+L6B815gVVBNJWD3jmiAQmq5UwTvw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2he8nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44V93wqd031930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:03:58 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 31 May 2024 02:03:54 -0700
From: Taniya Das <quic_tdas@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_jkona@quicinc.com>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Subject: [PATCH 07/13] dt-bindings: clock: qcom: Add SA8775P video clock controller
Date: Fri, 31 May 2024 14:32:43 +0530
Message-ID: <20240531090249.10293-8-quic_tdas@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531090249.10293-1-quic_tdas@quicinc.com>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: d3xjxnHD6OfdcHKVlg3Fbo9wuqk4XQKX
X-Proofpoint-ORIG-GUID: d3xjxnHD6OfdcHKVlg3Fbo9wuqk4XQKX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-31_05,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405310066

Add device tree bindings for the video clock controller on Qualcomm
SA8775P platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,sa8775p-videocc.yaml  | 75 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sa8775p-videocc.h  | 47 ++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sa8775p-videocc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
new file mode 100644
index 000000000000..3edb29d0e5eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sa8775p-videocc.yaml
@@ -0,0 +1,75 @@
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
+  See also:: include/dt-bindings/clock/qcom,sa8775p-videocc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8775p-videocc
+
+  reg:
+    maxItems: 1
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
+    description:
+      MMCX power domain.
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
+  - '#clock-cells'
+  - '#reset-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
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
2.17.1


