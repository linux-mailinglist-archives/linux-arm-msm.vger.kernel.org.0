Return-Path: <linux-arm-msm+bounces-55345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E7379A9A893
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:44:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C68A93AA073
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:42:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EC92571BC;
	Thu, 24 Apr 2025 09:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Tre7mnaB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510E625742D;
	Thu, 24 Apr 2025 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487261; cv=none; b=FDBvnHPE63w2dws9hkU1BCzzKev0UaaRLPu6nQB1MguKpLt3vyT9K7GyO3zuNMVlCNWsKYszxzvlvC2vrdUpcRqQX/6F/rT1na3xjdLIiv0bP9SW9rMLvraY6XgXplOhaLJWAQpThxjEgz5hCBA7ftkroPGyqnKqT19T7VZsf7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487261; c=relaxed/simple;
	bh=HBOBk5hK0NPWBBa+csAWAlujM2F7mQ6XN3iSjlFxzI0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PgMBisPz/li/KV1SNOc8CU3xoXF8KNJwI1us4VLYbofXuXnEMefK1ndRRUIlgTXsYyjzOW/epo3t12rXs2WiIgQIIMO1uEIX3R27ByeqlK3RvAP7spEOCGhj+KtYcwom28HH2kvj7IKIkE3MkD/GfBORbFacpVDAZlmzNqxyYXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Tre7mnaB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FDNR000771;
	Thu, 24 Apr 2025 09:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SggPKLYNteTJFBULHKonomljYP1GYK2s5pgGfrL6Qg4=; b=Tre7mnaBOs65N0rh
	UCUDLpIFgvem5g+Qkk9oClEr6PgVowL30d/IK5NVtwy9NDhtq9IsQiiOtWQHDb/M
	dUkdvjDIVv/kvaq9+4gJwbLyhQRy+D+8JnrsYVqk3RROLrW/+hWwO+RidpZ7KRut
	VluVUJgfgcKlt2Y7hTolkQO6jLWs2KFcw8evCxAYrr6huMUmjAaqQQTG+HD/qtQK
	3cLiJ77P+CNlzLhPeLNrHa8UAHqS5Whbsy9gMS5ORUOZ8sC7wIAVolqPYNu/ow1M
	Nc423zvDNiIK72Assr5QH/2ITHecQ14bVdl2CnPRRL7SCsY3fcbPekwEIvSOFAnX
	DhruyA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3cytr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:34:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O9Y8Oq028892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:34:08 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 02:34:03 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 24 Apr 2025 15:03:03 +0530
Subject: [PATCH v8 08/10] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs615-mm-v7-clock-controllers-v8-8-bacad5b3659a@quicinc.com>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
In-Reply-To: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
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
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfXxxQqYnXdn1Ve hNf+xz08w86xRgkntU4XdDhMS6m60xcTvyAQN2CLM/b87eK1KFwgrS7qNio6xmU675J6NbC+lsk URC+9LGgqBOdffUDohEVRuOxxJZJ6PqJbXw6hhurGmXCx9K4QUIW5qweZh8Mjzs+mBvCquprwq3
 E/hX8NnvPZOr71hymdadB/woVx96a2kzU2/7KQwnpquNTlnsLsJjLXt9odrq29J8PHQ65Hc+aBx lqQKZhKu+GDo6AN1Nke8W5I8f3SIek3bSYnesYmEYAHFuQzY2Z7lqq7c/xkvlld9Urh8KAG3amF 82TwUpZs5BA4u62OEX81x8nNv4XONg7g/RsKmOfOeI2Ni606W1jzCS08mepBLa+2gHyBPRoJKkQ
 mzTZhS6qXO1oU22VX8i0Nz4/aMFl6KTCeArjrBfXrdWmaAzXWmxANUmuuFJK046c01of0gkM
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680a0590 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=Fd_aqQ4HFp4EpFgKmb0A:9
 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: iVOnAA6Qp28ITAbEq2GXZqVtiRTbHYY0
X-Proofpoint-GUID: iVOnAA6Qp28ITAbEq2GXZqVtiRTbHYY0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

Add DT bindings for the Video clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 .../bindings/clock/qcom,qcs615-videocc.yaml        | 47 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,qcs615-videocc.h    | 30 ++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..f51b69de10478d1fcc246e4324dc74bc87b435eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,qcs615-videocc.yaml
@@ -0,0 +1,47 @@
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
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
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
2.34.1


