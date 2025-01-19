Return-Path: <linux-arm-msm+bounces-45498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D73A16125
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 11:25:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1B2C1883F1F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Jan 2025 10:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC5A41DF727;
	Sun, 19 Jan 2025 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="F6k21cdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E0F71DF27D;
	Sun, 19 Jan 2025 10:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737282244; cv=none; b=sQPodTz1Y42VR+zWwh/Z0f7usK2LSuyYrnG+JlkIPCgpEx5Sw4y91wZGKw4jElceCWfjKjnINtotGNusQisRApjZyJI178C1aG+87L9osREE0+XbTsGQFRSyeA5cGGQNKmoSvFpLz+OajnsQECOD5+ZDOOspqpKDTnSgSXOSqIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737282244; c=relaxed/simple;
	bh=/2R3t40zujCDcyVUtgGjwSiA5AK0H1iBryY+9mLiPWY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ZQAfkHRM1nH70LRx+61d53RCF06G96FcD1WnZCJPqqvgO5E3rA/CNBJqtLk+wFzboJ2w5Y7oGdNvt/Mckrp0W+ed0Z/kW3PF4ENdGLnrNG9eJNjCJLzODJ6xbmCrpvpaR0UTuemCs18zL91sC4I/86L6sGQnhr5gLFQeA4/bzx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=F6k21cdU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50J78arH010463;
	Sun, 19 Jan 2025 10:23:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRIaldLHI4t9yLZHFNYZRzLa7g5HqP5u+kJst0KVG74=; b=F6k21cdUljcTp71b
	IF2YURs3GfsgROM9uWKEFEoVL9rEXLEnnDBXkSZgJ3rloj9XLraJ/4dibbXdooeH
	Lm5+IiKCbc4f96f7bfE72wgf1bI1C62+m/3KBcK4P0iPH0gF0tTcw6ren7G5Ij/Y
	DYcDYtpcRezsNVepsa7fR8y1GkCsa73oGqawft6ymMu+3ZG68EPQtT1DGts5+KjO
	QSMVxiZPssnhh8ciSpTf5EqLK/ymSudSn6v+0wbOsnwtPFCGbhKla+aCHBSYLoWf
	WzYIeBT2L9IGEKMpzYLH4MeEYxv+jCM0byZVeqNMqRtG7C3DHWIlYVdFGISrhfVh
	24z3dQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4483vw9wjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 10:23:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50JANrSx022730
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 19 Jan 2025 10:23:53 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 19 Jan 2025 02:23:48 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Sun, 19 Jan 2025 15:53:02 +0530
Subject: [PATCH v4 08/10] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250119-qcs615-mm-v4-clockcontroller-v4-8-5d1bdb5a140c@quicinc.com>
References: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
In-Reply-To: <20250119-qcs615-mm-v4-clockcontroller-v4-0-5d1bdb5a140c@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Ip1kftWdra7UjlZ_QhRvGHA-UiwrrC2h
X-Proofpoint-ORIG-GUID: Ip1kftWdra7UjlZ_QhRvGHA-UiwrrC2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-18_10,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501190086

Add DT bindings for the Video clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-videocc.yaml        | 64 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-videocc.h    | 30 ++++++++++
 2 files changed, 94 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3359fb68124341d9673eb860a51d09a60459745d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,qcs615-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on QCS615
+
+maintainers:
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm video clock control module provides clocks, resets and power
+  domains on QCS615 Qualcomm SoCs.
+
+  See also: include/dt-bindings/clock/qcom,qcs615-videocc.h
+
+properties:
+  compatible:
+    const: qcom,qcs615-videocc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
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
+
+    clock-controller@ab00000 {
+      compatible = "qcom,qcs615-videocc";
+      reg = <0xab00000 0x10000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>,
+               <&sleep_clk>;
+
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,qcs615-videocc.h b/include/dt-bindings/clock/qcom,qcs615-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0ca3efb21103d7e0b09ab9c042be761bcbc5960d
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,qcs615-videocc.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_QCS615_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_QCS615_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_SLEEP_CLK					0
+#define VIDEO_CC_SLEEP_CLK_SRC					1
+#define VIDEO_CC_VCODEC0_AXI_CLK				2
+#define VIDEO_CC_VCODEC0_CORE_CLK				3
+#define VIDEO_CC_VENUS_AHB_CLK					4
+#define VIDEO_CC_VENUS_CLK_SRC					5
+#define VIDEO_CC_VENUS_CTL_AXI_CLK				6
+#define VIDEO_CC_VENUS_CTL_CORE_CLK				7
+#define VIDEO_CC_XO_CLK						8
+#define VIDEO_PLL0						9
+
+/* VIDEO_CC power domains */
+#define VCODEC0_GDSC						0
+#define VENUS_GDSC						1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_VCODEC0_BCR					1
+#define VIDEO_CC_VENUS_BCR					2
+
+#endif

-- 
2.45.2


