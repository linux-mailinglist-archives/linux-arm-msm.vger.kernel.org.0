Return-Path: <linux-arm-msm+bounces-36177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5BC9B327B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 15:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55F82B22945
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 14:04:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1FE41DD877;
	Mon, 28 Oct 2024 14:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S2X3Wnzl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70121885A1;
	Mon, 28 Oct 2024 14:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730124283; cv=none; b=l0Wz9M7V+PPJNGj0qLn/D0mFuSOGmLUMWqxCfN4MRxiClCYTgSTccf5KrIyJEQzjTJkuyVPi6aZ+D9BZVtbdYbkIqcu6WTaVCtNeq30XuLwHis3/meisR6LnOIhqg4cBJ19rYgKMpkeTl5REAZlS0HlCKYdNmW9+NqJTFlWQA80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730124283; c=relaxed/simple;
	bh=hjNN+PqFdSkSj/o6TRXfxOXwvZoIzTjelI3Jk9bcBOU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=ADT/4j5L8HgVcz+nF0UguA3XKE5YqbcfQAIb1ZqP1ICikZ7zJiaUtjDJCB9hgKFrDZU2fPClDFbGyhMsQezzCan9MEAUYYeEjagkSa1dUbwe/V8BN0cj8O4vqREx+ECiHRPIUNKAIjsCbDPRlPu+EbHoccO+O1tNMzTOOUThriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S2X3Wnzl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49SBElor002475;
	Mon, 28 Oct 2024 14:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J19nT1QL83AH9WO+0awWFJgS43oQQOHcCslTZEH/0Mo=; b=S2X3WnzlceQX9i7Q
	41s+PaOKEVXTggofxL726VCHNgT3LB6vC6GiYuOOsLUcx1Si5nCK1Ooage5hzq1d
	jhV2kORG6oR64smFDvLkv9AwV05MYbJDLc0yc5KhXQpqRS0cjoC3kOlVu7gzmh5c
	CJR4k5C8vqzly8i/oEqHrwNrby4UV1caVXxQTwUgbd03Ln28OxC3Xe7WqgDcyy9u
	FfSYpb1IoltJ1a2yqqjOn/qpgP511LHU3H7fV/vygwt9B7MZ65fjby6HGh6r1Zfc
	lQG4biPf4puYAvnovjOWQbHrD+/JDtdLKu3nC1aj4rz/EA16aDetEVYiP1nzHO5C
	Gbc32Q==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gs6e56d9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 14:04:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49SE4T9O031010
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Oct 2024 14:04:29 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 28 Oct 2024 07:04:23 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Mon, 28 Oct 2024 22:04:08 +0800
Subject: [PATCH v5 1/4] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241028-qcom_ipq_cmnpll-v5-1-339994b0388d@quicinc.com>
References: <20241028-qcom_ipq_cmnpll-v5-0-339994b0388d@quicinc.com>
In-Reply-To: <20241028-qcom_ipq_cmnpll-v5-0-339994b0388d@quicinc.com>
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
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>,
        Luo Jie
	<quic_luoj@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730124258; l=4608;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=hjNN+PqFdSkSj/o6TRXfxOXwvZoIzTjelI3Jk9bcBOU=;
 b=nv2CVdjAZob6/0hbxjeHVyfw6heHAvdO0VNDeIHuGMTjDGA1BBl+ugCesRinF0RbJqaLGH+62
 HLAiJQBMoVcAPTV6wMjAqxkgKuwdJhg09YzCHuBTMcoixQQwB0OVP8l
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jbReC1LhQ6al1hN7sMaKsk7Rld3cib72
X-Proofpoint-GUID: jbReC1LhQ6al1hN7sMaKsk7Rld3cib72
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410280113

The CMN PLL controller provides clocks to networking hardware blocks
and to GCC on Qualcomm IPQ9574 SoC. It receives input clock from the
on-chip Wi-Fi, and produces output clocks at fixed rates. These output
rates are predetermined, and are unrelated to the input clock rate.
The primary purpose of CMN PLL is to supply clocks to the networking
hardware such as PPE (packet process engine), PCS and the externally
connected switch or PHY device. The CMN PLL block also outputs fixed
rate clocks to GCC, such as 24 MHZ as XO clock and 32 KHZ as sleep
clock supplied to GCC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 85 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 22 ++++++
 2 files changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
new file mode 100644
index 000000000000..db8a3ee56067
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -0,0 +1,85 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq9574-cmn-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CMN PLL Clock Controller on IPQ SoC
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Luo Jie <quic_luoj@quicinc.com>
+
+description:
+  The CMN (or common) PLL clock controller expects a reference
+  input clock. This reference clock is from the on-board Wi-Fi.
+  The CMN PLL supplies a number of fixed rate output clocks to
+  the devices providing networking functions and to GCC. These
+  networking hardware include PPE (packet process engine), PCS
+  and the externally connected switch or PHY devices. The CMN
+  PLL block also outputs fixed rate clocks to GCC. The PLL's
+  primary function is to enable fixed rate output clocks for
+  networking hardware functions used with the IPQ SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq9574-cmn-pll
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The reference clock. The supported clock rates include
+          25000000, 31250000, 40000000, 48000000, 50000000 and 96000000 HZ.
+      - description: The AHB clock
+      - description: The SYS clock
+    description:
+      The reference clock is the source clock of CMN PLL, which is from the
+      Wi-Fi. The AHB and SYS clocks must be enabled to access CMN PLL
+      clock registers.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: ahb
+      - const: sys
+
+  "#clock-cells":
+    const: 1
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-rates-u64:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+  - assigned-clocks
+  - assigned-clock-rates-u64
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
+    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
+
+    cmn_pll: clock-controller@9b000 {
+        compatible = "qcom,ipq9574-cmn-pll";
+        reg = <0x0009b000 0x800>;
+        clocks = <&cmn_pll_ref_clk>,
+                 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+                 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+        clock-names = "ref", "ahb", "sys";
+        #clock-cells = <1>;
+        assigned-clocks = <&cmn_pll CMN_PLL_CLK>;
+        assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
new file mode 100644
index 000000000000..936e92b3b62c
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
+
+/* CMN PLL core clock. */
+#define CMN_PLL_CLK			0
+
+/* The output clocks from CMN PLL of IPQ9574. */
+#define XO_24MHZ_CLK			1
+#define SLEEP_32KHZ_CLK			2
+#define PCS_31P25MHZ_CLK		3
+#define NSS_1200MHZ_CLK			4
+#define PPE_353MHZ_CLK			5
+#define ETH0_50MHZ_CLK			6
+#define ETH1_50MHZ_CLK			7
+#define ETH2_50MHZ_CLK			8
+#define ETH_25MHZ_CLK			9
+#endif

-- 
2.34.1


