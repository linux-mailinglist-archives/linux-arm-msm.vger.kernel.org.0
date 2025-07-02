Return-Path: <linux-arm-msm+bounces-63347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCF0AF0EED
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 11:07:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1D08443AA3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 09:06:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78038248F54;
	Wed,  2 Jul 2025 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Jn+ACCQw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D958C241682;
	Wed,  2 Jul 2025 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447151; cv=none; b=AEHLHjzSWxvl6zDeuedp9bSq5gUc3nq4pYcjRyMeNHeTEd+p8eQ9Q2bXAIqUCN2queug7zptH+a+++wBGC1Us1SwEV0dVm7zgRRGj6C9BJRANtQlam8vKQlN8emNOviiNCZHFbFOvd6h1NChKqnqbXMuCKb0wgD9fxG0ZADSHaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447151; c=relaxed/simple;
	bh=fxAj18puHXITqpfnTsxajy+ctigCAtgWkdiBJUOGJQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UiZW6azxUn4CWujR4LCJZwN9mkxYivGvdONVMUV158JVAXm5qQtSCyNOJeI8zTdo9aNlFXZSL4n20rKgzz0dyCcjFmdVIEckeUOrhJbBoBS8HzI/vlhFPin8BIQT38D1XoEa1WJE1NhK0stIfGOPcokpEOas5YBaO90Sg8OtZEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Jn+ACCQw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56261o3Z002189;
	Wed, 2 Jul 2025 09:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QalHrlU7YcD8oOdsGh5RRx8431p71ZkRhDu+SD6/BX4=; b=Jn+ACCQwPzx8zMop
	F7us9GIQDkVK7WHCB7uvrOobzjqtLRKwkwPj2IdplPbiQybo25oREvAT8xiJQv9a
	rdUmHR77w8N+FqJXbNLPx+mXoyajgp68KyCWfguhd8BHYm9WWPtnm//d2iyceCRi
	1g+FSNqfS37BvA412Cji070JAlktfRBgG17bDfmBnlDMjKUetErkIfKg83hAlnVY
	WdxFfg4GcnZ611Omn4c2w3amdNxytjuaZqP0HYRZExe6CbI0yFCivUNc5n313t6G
	hj7bS7IfyJV95CkuWYb1AsSA+aho08XTyAz9jE40sILs1YV/Cdmz1kPW9xiU+y7T
	nKcUTA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcutms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Jul 2025 09:05:41 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56295e85003122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 2 Jul 2025 09:05:40 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 2 Jul 2025 02:05:35 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Wed, 2 Jul 2025 14:34:28 +0530
Subject: [PATCH v11 08/10] dt-bindings: clock: Add Qualcomm QCS615 Video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250702-qcs615-mm-v10-clock-controllers-v11-8-9c216e1615ab@quicinc.com>
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
X-Proofpoint-GUID: DL9wSzJOp0D3HE_KPDik5inZRVi79mdT
X-Proofpoint-ORIG-GUID: DL9wSzJOp0D3HE_KPDik5inZRVi79mdT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA3MyBTYWx0ZWRfX4onbtdMHQWGa
 Ar22g8cGCASCkFg9j0W1W3VjtbQTgDhZQ7IYPExtYaJs0RNV71Ow5BlagA/xvPH3hi0/VCYLg4Z
 LDrLW/Igrgcw6/hcqETyVxhQkoYoCo5jxY8xr/1UuwpJ1V/W0cl5K8gq60wqEXBtZnfah/sABtd
 mskyX1YlFaNxPUurObmdxHvHWx2lArV2rJSssxbPHuZ24fO0qzTevpuwIv62TfHXmXUUt1Palu5
 iT9Xul+JDfLq5VQQyeKvsjK0CwUlHXABwI7mSet4aUGeB8TQjq3MnRxXvD4UsgW+zsFxH3GZ033
 xZj7AFOQ4Tgypt2NGqjzqMHOsnz/+qyooqfgrkiILNfEhia9nOmN8mtT2yE9SVMo4SYcKMWZr5b
 ZGV/b7T9piEKM56lIgYoF6mKBmU4NjWqQmU5TT+lIYWGOcHNmEfgo8twaSBjA6w4vLj0Tk8P
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6864f665 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Fd_aqQ4HFp4EpFgKmb0A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507020073

Add DT bindings for the Video clock on QCS615 platforms. Add the
relevant DT include definitions as well.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


