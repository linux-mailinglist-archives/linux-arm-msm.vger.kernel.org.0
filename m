Return-Path: <linux-arm-msm+bounces-28163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 596B494BF08
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 16:04:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2777B24620
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2024 14:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F77F18E768;
	Thu,  8 Aug 2024 14:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fpqbtqo0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44A218E751;
	Thu,  8 Aug 2024 14:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723125856; cv=none; b=Dwvs8lPaAM5Gm7ww+RQFLxYHho8YE6A9vmuwBUJVrVw9cyhYUQGBEbRqgXQ5Asl45EYmRoe8iqwlr5R8dTAVo461+7aidivds6ImYz/fQF75iHF/q4KnJEa1bwR4j7rm/1Aj3hbI8Kox+gYIWLdYZo7/vf/FUsvy0XdR3SHyeGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723125856; c=relaxed/simple;
	bh=bqymaGN7lV2NoCv9XT3InR9+WQfCR0oVo66v/yxIWRI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=D34rbVnEychO6TwBkORDgr+J5WMHGf8rYU5U/9sD1Tsc2bAqR3/RQAufIOAGlEcwutVlrpAvXndYbVofWmKOtND1sKT2QReoqFeaIETyylpJuLrMPDhvSqpAGTH66i/Ely8E464YDH82SQSNmJFkJtzbHM4Q1Jh2+Z7Iw9fjE9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fpqbtqo0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47890bsc000996;
	Thu, 8 Aug 2024 14:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2YUPwwXAfbcS25kXOW1+pIM9WQ4zb8c2WzP5UzMuWA=; b=fpqbtqo0rombt/0W
	cgU4A2UaARFInfDHVvWGpJnFS1PtL3dvbq6i51WwRnz531I3abUPkfw71Q+kINit
	rTnYVMG/QrqDzIDM7KYN8Y24lagDgnGtbE1J8L4BnaEGB+Grhka3gE4oq20+ofHC
	XgdMZQG+U/Wt/oXxkIkHAgEEdr+F1lXAzWTbZNMkZ1DOQKeraLqYc+lQbcRjOr+c
	VsqHDpwFabdIoQp4E/eLMGZiQpK1I5MdePaIHVx2W8GreF1bWz60qHlx97+iavy/
	EboVOyE9OEK6aGhYoDLwOE/Xh61dqkFvxasHCbZh+KsmqsOvBkpSDSFbLPXHRLJq
	/2qsrQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vfav2ba4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Aug 2024 14:04:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 478E44bB020893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 Aug 2024 14:04:04 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 07:03:59 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 8 Aug 2024 22:03:12 +0800
Subject: [PATCH 1/4] dt-bindings: clock: qcom: Add common PLL clock
 controller for IPQ SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240808-qcom_ipq_cmnpll-v1-1-b0631dcbf785@quicinc.com>
References: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
In-Reply-To: <20240808-qcom_ipq_cmnpll-v1-0-b0631dcbf785@quicinc.com>
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
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723125835; l=3457;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=bqymaGN7lV2NoCv9XT3InR9+WQfCR0oVo66v/yxIWRI=;
 b=Nk7Wez3VXXPKqrcKEJNmQZcnuf0h0fDNO7KboC9aiMoFLsAgatw7B2lrHrIKzwk0sPfBSIvfi
 5+Scdq024P5D3cNhbQo83hA4MNuAiEuK6VQDd5LgRXPhESu14oRsXc7
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: StMIi3mr6pk-Rfde23clEiARM9B7MHkk
X-Proofpoint-GUID: StMIi3mr6pk-Rfde23clEiARM9B7MHkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_14,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1011 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408080099

The common PLL controller provides clocks to networking hardware
blocks on Qualcomm IPQ SoC. It receives input clock from the on-chip
Wi-Fi, and produces output clocks at fixed rates. These output rates
are predetermined, and are unrelated to the input clock rate. The
output clocks are supplied to the Ethernet hardware such as PPE
(packet process engine) and the externally connected switch or PHY
device.

The common PLL driver is initially being supported for IPQ9574 SoC.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../bindings/clock/qcom,ipq-cmn-pll.yaml           | 87 ++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,ipq-cmn-pll.yaml b/Documentation/devicetree/bindings/clock/qcom,ipq-cmn-pll.yaml
new file mode 100644
index 000000000000..c45b3a201751
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,ipq-cmn-pll.yaml
@@ -0,0 +1,87 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,ipq-cmn-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Common PLL Clock Controller on IPQ SoC
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Luo Jie <quic_luoj@quicinc.com>
+
+description:
+  The common PLL clock controller expects a reference input clock.
+  This reference clock is from the on-board Wi-Fi. The CMN PLL
+  supplies a number of fixed rate output clocks to the Ethernet
+  devices including PPE (packet process engine) and the connected
+  switch or PHY device.
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
+      - description: The reference clock, the supported clock rates include
+          25000000, 31250000, 40000000, 48000000, 50000000 and 96000000 HZ.
+      - description: The AHB clock
+      - description: The SYS clock
+    description:
+      The reference clock is the source clock of CMN PLL, which is from the
+      Wi-Fi. The AHB and SYS clocks must be enabled to access common PLL
+      clock registers.
+
+  clock-names:
+    items:
+      - const: ref
+      - const: ahb
+      - const: sys
+
+  clock-output-names:
+    items:
+      - const: ppe-353mhz
+      - const: eth0-50mhz
+      - const: eth1-50mhz
+      - const: eth2-50mhz
+      - const: eth-25mhz
+    description:
+      The output clocks are given to Ethernet blocks that includes PPE and
+      the connected switch or PHY device.
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - clock-output-names
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
+        clock-output-names = "ppe-353mhz",
+                             "eth0-50mhz",
+                             "eth1-50mhz",
+                             "eth2-50mhz",
+                             "eth-25mhz";
+        #clock-cells = <1>;
+    };
+...

-- 
2.34.1


