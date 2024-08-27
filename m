Return-Path: <linux-arm-msm+bounces-29630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E94960AD1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 14:46:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F19DA283C7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2024 12:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A75821BD014;
	Tue, 27 Aug 2024 12:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ParELpY6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D4719CCE7;
	Tue, 27 Aug 2024 12:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724762795; cv=none; b=sEPQlY8q5XfDRVY1AG1IRBiRqJWg42SDe0wjmh6FyptP1oT+DDXlbSgPU44nYBD2LOy/hZYdZxb4gNmUQjdmwBNGcGl+EluEKQnPBDFzGfxH8kXSX8JohHEtC0tlwxSUiFqVljZx+UsVjbgw3OTcyz9eaxDsOzoZ9XiOZNHn5g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724762795; c=relaxed/simple;
	bh=3GbQJzw/8wGhHOr2feAaJ0aET+YDZy/b9qSnEfHA2JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=HABdXPXbjHbuM9mY/LbVPIWSRao0WQBB4SmOdx+xryCqNgxTAOWy8NxJwk0ZSDJRGErAvQ72/eG1XNVvdyk1MdmIijvWWTQSyQxFKl0X78eKWx8LtdzEpN4IiZP2SE5WMJtY6NQ0RqYcpIWsNOU09oOpzxP4oYKHPz+UMeBiOnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ParELpY6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47R7lY0v023264;
	Tue, 27 Aug 2024 12:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Uj4LHv1ILRMKVBGYYHPtT45Q6AjC6e8sSeCwNDDVkk=; b=ParELpY6qYSm8qiO
	YFLS3moEZ/lisE+3byx6dUHCWiyUqyt09AL7ciOWAH+HyslIJbmhFiHOcIZYX3dy
	yQy6XaHuA95zA9MKY9zraivfVFdm8Pku1CgQLYfVFePw8qRoSkbIWMXxnT+4Aq1x
	IIuv6SXPJyuTl3nhijinHTpdKcKwS9CgF9IUmWHacFi5FMjTi3YKw6YyZnd9cT/i
	d4s9kSwoCmaQXxz6XE44dqvboWBpfo8CXNy6YeZtg/QjaElbj3ZMJ8wcrdClripo
	squHHG3dP7wthruAnylKX3pFF0ZQy5ikc0hUk+m990YvsFFo+0knDdCDB59nYMwJ
	MN+MCA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 417980xyq1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 12:46:21 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47RCkKa8019843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 Aug 2024 12:46:20 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 27 Aug 2024 05:46:15 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 27 Aug 2024 20:45:59 +0800
Subject: [PATCH v3 1/4] dt-bindings: clock: qcom: Add CMN PLL clock
 controller for IPQ SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240827-qcom_ipq_cmnpll-v3-1-8e009cece8b2@quicinc.com>
References: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
In-Reply-To: <20240827-qcom_ipq_cmnpll-v3-0-8e009cece8b2@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724762769; l=3811;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=3GbQJzw/8wGhHOr2feAaJ0aET+YDZy/b9qSnEfHA2JA=;
 b=ToDHBqJi5hYK2WESlX8VE0lImAYhUdp3vZgjCVnj+dhI7WVmdOmYp66htA3j9GxYMfj88Qd25
 1rzy6tRhECGA/ajIL0DcBfQtwMuI6RqVM8JNfbcERIOZxw7GxMsuBz9
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2KJsMiOnCStha7re87a-J4rs05PN_7-3
X-Proofpoint-ORIG-GUID: 2KJsMiOnCStha7re87a-J4rs05PN_7-3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-27_06,2024-08-27_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408270094

The CMN PLL controller provides clocks to networking hardware blocks
on Qualcomm IPQ9574 SoC. It receives input clock from the on-chip Wi-Fi,
and produces output clocks at fixed rates. These output rates are
predetermined, and are unrelated to the input clock rate. The output
clocks are supplied to the Ethernet hardware such as PPE (packet
process engine) and the externally connected switch or PHY device.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       | 72 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq-cmn-pll.h       | 15 +++++
 2 files changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
new file mode 100644
index 000000000000..1d9aa5ea01eb
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml
@@ -0,0 +1,72 @@
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
+  The CMN PLL clock controller expects a reference input clock.
+  This reference clock is from the on-board Wi-Fi. The CMN PLL
+  supplies a number of fixed rate output clocks to the Ethernet
+  devices including PPE (packet process engine) and the connected
+  switch or PHY device. The CMN (or common) PLL's only function
+  is to enable clocks to Ethernet hardware used with the IPQ SoC
+  and does not include any other function.
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
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
+
+    clock-controller@9b000 {
+        compatible = "qcom,ipq9574-cmn-pll";
+        reg = <0x0009b000 0x800>;
+        clocks = <&cmn_pll_ref_clk>,
+                 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+                 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+        clock-names = "ref", "ahb", "sys";
+        #clock-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,ipq-cmn-pll.h b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
new file mode 100644
index 000000000000..64b228659389
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,ipq-cmn-pll.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
+#define _DT_BINDINGS_CLK_QCOM_IPQ_CMN_PLL_H
+
+/* The output clocks from CMN PLL of IPQ9574. */
+#define PPE_353MHZ_CLK			0
+#define ETH0_50MHZ_CLK			1
+#define ETH1_50MHZ_CLK			2
+#define ETH2_50MHZ_CLK			3
+#define ETH_25MHZ_CLK			4
+#endif

-- 
2.34.1


