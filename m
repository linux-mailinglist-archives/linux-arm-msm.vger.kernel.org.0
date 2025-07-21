Return-Path: <linux-arm-msm+bounces-65945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2BCB0C9F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D641F54458C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 17:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE3572E2EF0;
	Mon, 21 Jul 2025 17:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="oilpXjV4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60CA1D63DD;
	Mon, 21 Jul 2025 17:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753119973; cv=none; b=Zzwt3purPMH2VNV5+y5P10HWle+COgbTQx0zWbaissPQgLPd46VeFQbdOonuuWzwzz6q/gkov9G/1CUieu8xTGWRPhIRn1ftpcKIO5Dv/cC8Hg15BybDwbuyMIVKSjCqose3oBLuxlaj4RQIar2h/VV4rIJwzqac5fy/6nU2U/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753119973; c=relaxed/simple;
	bh=S1Mcy15vodkHlYR4j8Kw3nx51BzBAZtpT4EDnrSILzE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=biorBc1jjnaRDVwBvj0HHlio4XN4WjvO+y8fmzg+RKmvPTISA8QDAIWJJuxKQIK5UbFhAo5MSHkiKETpfxxaEhxFSMZ7cHfKF3CcrvNmijr69xUuBalsP6X+E/F6jxFvfGUechXUfTGVM7eoW+5+BkvGyDoOWpXIoyvI6f1mhNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=oilpXjV4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LG85sO029341;
	Mon, 21 Jul 2025 17:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TwDEn0bMy61ReMDx/G+JZ3R4
	gBQvOoKyE6RbRbC2KVM=; b=oilpXjV49VlzXErLtJ31sO2K+7BPDuqwgNARfCfv
	j0tCdkQcdJWAUYU/bV/JnCCP8Iv/RkWV2WN4i1BLoBaY7DTNjdQ3uAM2VW3NW1IU
	9Oq1ho41OuOttScE5JwnIPqB+OM26Gh3/u2tAEvxd34skRXfIvZNRHlq2AzgUkYl
	eA/B/lk9BqX7QylvViv4Vzq2j4u9VK2L5IzL+z67Hm0NvVgacEY3O1BdiE/ndWZC
	ysYbXUXm8+Jo1OGenveR5j5FfltMdi1JiC5GXFemTrM6Tzisa89yZ9htmBXsO7bg
	nZK6+lo1uDVI4jN+EZzHqWsCkfbb1Ut3pG+IbdYk+CN5rQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048tegtm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:04 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56LHk3cm001027
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Jul 2025 17:46:03 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 21 Jul 2025 10:45:57 -0700
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
        <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <dmitry.baryshkov@oss.qualcomm.com>, <bryan.odonoghue@linaro.org>
CC: <psodagud@quicinc.com>, <djaggi@quicinc.com>, <quic_msavaliy@quicinc.com>,
        <quic_vtanuku@quicinc.com>, <quic_arandive@quicinc.com>,
        <quic_cchiluve@quicinc.com>, <quic_shazhuss@quicinc.com>,
        Nikunj Kela
	<quic_nkela@quicinc.com>
Subject: [PATCH v7 1/8] dt-bindings: serial: describe SA8255p
Date: Mon, 21 Jul 2025 23:15:25 +0530
Message-ID: <20250721174532.14022-2-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721174532.14022-1-quic_ptalari@quicinc.com>
References: <20250721174532.14022-1-quic_ptalari@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE1NyBTYWx0ZWRfX7SA7+GJQ1UUS
 M7Zt0Dyxuj6MkQiLIXpTey7SdyYTzoxupjGNUBQp0LOd6ofVgPfpPJIg9jFm9m2Uwf1PUsUC2UU
 4u0OrJhYYwtlytJMz5W2GlCGD9UC0L/Gx99urm+lHFYq0UJGPHptgm42D7jHiMthobxMNBX+wF0
 j+i15jgcW4HEz3IQUDO4AwvuERw6qc9a6uuS/ENrHtH8qExGPP6Z/O0JHiuOoki9UaGuLXQcXWX
 zVKAGPAaxML6c7ulkLN9BX5W4uFREpf4leTTvNWqTi6rHV9z0+pAjus3CirEn5wqiflTFc7edBe
 ie2HymAfVyjfyLxIFQdkPhJFa6lze4KnheV9uOkgxAW8/1O3ke7VsHSbiqHwnkTrGrr6zDlmtfX
 p+QiW2QzJ6g4R7nvDgJ5VXbO901o4Jkyoqv75T3ErI2RonOSk7SAlH4+wYJars302K/ZhHVB
X-Authority-Analysis: v=2.4 cv=Jb68rVKV c=1 sm=1 tr=0 ts=687e7cdc cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=cGQGwpzbQXJZxZYERO4A:9 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qxY54cjetzcDBhh1jil8LdvgEV9a3B1m
X-Proofpoint-ORIG-GUID: qxY54cjetzcDBhh1jil8LdvgEV9a3B1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507210157

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
v6 -> v7
From Krzysztof:
- added minItems in interrupt-names

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
 .../serial/qcom,sa8255p-geni-uart.yaml        | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
new file mode 100644
index 000000000000..c8f01923cb25
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -0,0 +1,69 @@
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
+    minItems: 1
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


