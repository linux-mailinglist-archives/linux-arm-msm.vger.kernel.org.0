Return-Path: <linux-arm-msm+bounces-60492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B3DAD0752
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 19:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E160917A091
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA4E28A1D7;
	Fri,  6 Jun 2025 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Mnix4zS5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD211A275;
	Fri,  6 Jun 2025 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749230509; cv=none; b=WZRq12R7PhvC6fST1MP9KjDRCTFKn780tF7+aqpLpi0juc/ol5yPyEwfwqFCsVU/kQMGBgpzm074H+cHqa6gQmv+i9DlGDhYL9tFLxcSZ2vLLmerIt0BOcMlXO/J1o4fCt7gtgVuYQaqaBL8l5LvlOFbgQEgWKoPlZrCLTPnDL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749230509; c=relaxed/simple;
	bh=3Hq7lzykC2sTjHyxaENTwquxzIuKwvc+Tz24Mg0gxrw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUGqQShN0Vz3qyBia/xRxV6u9O4aFnw3NXhqhKR0PIiX6hD5jORnj2PAvVj4kXG5LowCd1/tO5DaWXIZuYOatDI8GOlOygL4aWSdciH46ZuKCR5HxtuKzCr2mUdHnGePXfI0KDN2KHVBUZiCy5VoQ1B9LDw3NtP341sT92Phg3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Mnix4zS5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9JJM018885;
	Fri, 6 Jun 2025 17:21:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UgL2slgGQFSfvLTeCyM3dlSY
	30alk5AXrMJlf/pqymc=; b=Mnix4zS5mh72DAoWZhj3wdvan0AR3lrV2vQohGvg
	N4qcxyQzBmYi3ad7em3I2v0GSe+OFNNvsBTECZHqSTMYq1MxXSgGz3J8NW5t1V6N
	fzMEox7BMaSJrYgx/RLX0pT5CNtvoRdzGZqabQnB1lQjX7lFjYBX4QyuRs16R5QT
	2UbZX2QibvHTwNYS88FNhyzhRXsBCSFy4OPcTvG97hweV3wZ++dchDkko2hEgJAh
	oB0V2TOnODtAfbaaZXOLsUsiYJdiif5t7fEXktcclw/p4Onh5p+TllwHrteqxct1
	FmR2Kk1xS4i1JUnTHjkSvt/XnL/MdWdLxqzFEANiX+aXjA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8nwamj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 17:21:44 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556HLh8n017490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 17:21:43 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 10:21:38 -0700
From: Praveen Talari <quic_ptalari@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby
	<jirislaby@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Praveen
 Talari" <quic_ptalari@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_mnaresh@quicinc.com>, <quic_shazhuss@quicinc.com>,
        Nikunj Kela
	<quic_nkela@quicinc.com>
Subject: [PATCH v6 1/8] dt-bindings: serial: describe SA8255p
Date: Fri, 6 Jun 2025 22:51:07 +0530
Message-ID: <20250606172114.6618-2-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250606172114.6618-1-quic_ptalari@quicinc.com>
References: <20250606172114.6618-1-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HgRtEayebz3ZrJR1z6a2DdfBfUfo_bkt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE1MSBTYWx0ZWRfX3WqjH46T+W8J
 rMvSDO1gvmIbyxy4dXcMWHlRKBMdkai9QYNXg64XOe6xU/HB/clyCO1ia0je9rZF4WNelecoiyq
 0xBDQY3zFZRQy8dfLzNV1hsmQiYjFOHXc+HJ/SUbIcNg1nhCTPiapno25THZWIc+TcGybMzygZh
 IFX8OXtfBYi4KxWtlYeRqXz8med0u1A5jqLh4h9F8jicrSEH/4YaYDHBVO43K+/qA10gfvtZ6TJ
 zKZXH99f3ETOJ9yz9M0pDr3UumQvShrdoLdKfGpe+HT4kpOwjTarChqGnMruZvNaU77qApASRvs
 NIGwaMm6N7avnOUEg1D8TSxHzR9N0Im30pSYQmPUkPxjGmwTpUOJf4ytE6ITouqL+/7VuDvNMtZ
 5xcSMXfOpWNXgm7rEAu19we4OpZZ2E/+DCYzoetzMYER+WVfRFS193it6jX6PzAHQBbK/3cA
X-Proofpoint-ORIG-GUID: HgRtEayebz3ZrJR1z6a2DdfBfUfo_bkt
X-Authority-Analysis: v=2.4 cv=UphjN/wB c=1 sm=1 tr=0 ts=684323a8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=cGQGwpzbQXJZxZYERO4A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 malwarescore=0 adultscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060151

From: Nikunj Kela <quic_nkela@quicinc.com>

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocols are
used to send request for resource configurations.

Add DT bindings for the QUP GENI UART controller on sa8255p platform.

The wakeup interrupt (IRQ) is treated as optional, as not all UART
instances have a wakeup-capable interrupt routed via the PDC.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v5 -> v6
- added description for interrupt-names
- added wakeup irq as optional information in commit text and
  property description.
- removed wake irq form example node.

v4 -> v5
- added wake irq in example node

v3 -> v4
- added version log after ---

v2 -> v3
- dropped description for interrupt-names
- rebased reg property order in required option

v1 -> v2
- reorder sequence of tags in commit text
- moved reg property after compatible field
- added interrupt-names property
---
 .../serial/qcom,sa8255p-geni-uart.yaml        | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
new file mode 100644
index 000000000000..c2e11ddcc0f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/qcom,sa8255p-geni-uart.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Geni based QUP UART interface
+
+maintainers:
+  - Praveen Talari <quic_ptalari@quicinc.com>
+
+allOf:
+  - $ref: /schemas/serial/serial.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8255p-geni-uart
+      - qcom,sa8255p-geni-debug-uart
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: UART core irq
+      - description: Wakeup irq (RX GPIO)
+
+  interrupt-names:
+    description:
+      The UART interrupt and optionally the RX in-band wakeup interrupt
+      as not all UART instances have a wakeup-capable interrupt routed
+      via the PDC.
+    items:
+      - const: uart
+      - const: wakeup
+
+  power-domains:
+    minItems: 2
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: perf
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - power-domains
+  - power-domain-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    serial@990000 {
+        compatible = "qcom,sa8255p-geni-uart";
+        reg = <0x990000 0x4000>;
+        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };
+...
-- 
2.17.1


