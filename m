Return-Path: <linux-arm-msm+bounces-56993-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0998AAACCAC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 20:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9AF61C05E5C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9839A284B46;
	Tue,  6 May 2025 18:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Md6972CK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CFA1AAA1F;
	Tue,  6 May 2025 18:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554591; cv=none; b=qyDZAqoAyD9aWdoHEfsyjI4PAWIO63Fv3EeGVbUyU/JvZ1P7yIIX8ZfPBBJm7OYvkd+G9uNX4qgYR7y6RhpQW8a0e/+ReB9cbmE5Bk3ewFon+7KHJbVHTIF/9lvDEdsHStumR2+SqjU3Nl9PYr74HG+3pQ05b7NpFtuFpCAgVwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554591; c=relaxed/simple;
	bh=KF+PIXvjYR8NRjW0lfwgS1a9Isu2yni/x774xQvxk2A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CdyrhXrqBC1Iws6eEEYwwsrgKkzX4VJjSWu3yZcssAjNLwOuFrKTVzHOElLNq6362ZtlZtx1pzk9l+KO1SbayGvpI4E3VgXUXf4fcmLVSVB9DDihfVJvIlUu9726iN6f3cLg6xTGBcr9E37skmpWyaFbB1GgfFz3sm2DpI/BV9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Md6972CK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546AdBDQ015425;
	Tue, 6 May 2025 18:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=cskM/Nfz7qs+eKdo+ZzQr9p7
	XKs9BZyGAAX9bpARVnQ=; b=Md6972CKnfHFZlvXlgsMTnZ48Px9tTa8vquw5YVu
	YRF32vnegeajyoX+Gd5lHr/B27WJbrB4kY4gqnKMuwhugIE7mIOCnI1Qbfr5bDnf
	Rus7AeboKmfawxF/i/ztNI8VO0IEDt5H39jo3DRMHDWjSB80dUQCorjhPh/TfEqS
	rU8LneLYHucc3raeCTGEKu6NynHlPsuMIEZHDZRLSkVZpt16ZKiBe0XuYS11Don/
	+bNlkPJYq2ASWOZafPWIh3TGpz+D4mrjKGxz6h8YdcQmdUBC9OJ2qrmQ3nU7P+QX
	af6+9sj3S1Nca5aEQCFgHQalu+e2/2mel9Yip9NQO/AvsQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fguuh9th-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 18:03:06 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546I35rK022319
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 18:03:05 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 11:02:59 -0700
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
Subject: [PATCH v5 1/8] dt-bindings: serial: describe SA8255p
Date: Tue, 6 May 2025 23:32:25 +0530
Message-ID: <20250506180232.1299-2-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250506180232.1299-1-quic_ptalari@quicinc.com>
References: <20250506180232.1299-1-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=UJPdHDfy c=1 sm=1 tr=0 ts=681a4eda cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=rjx3OjMNV77wTL7fGyAA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ExDhvwjBAjEagnKSnTwZrD7WYgQUckHP
X-Proofpoint-GUID: ExDhvwjBAjEagnKSnTwZrD7WYgQUckHP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3MCBTYWx0ZWRfX/hEyAEpr9/Hy
 kyuyy0XQxU3/tuuquf8nK6QqwcCTBQeoRc3+cQos4KWTnV2QeMRDNLOFqX+nPaeF6XKxMyUzVKe
 1MszZZ0oA+RJVXlyVqS4u+o5osPFXQbCb1hPxJ53PfdGiiWy878ap0jlAaP9GZFZE4IV6EXduHs
 BuQwncHrjntou8JdEX6TrCR7DLc+LIiwD0y68XIk0vSmW8CmqgAa8H2rgOt6FezqC+bGiWAEm+r
 OOTN9Nd39kAAOM7QiRkOJomBHjLOBhZCbE73JNHGm7/iQ3BBczoHB9CNedSOR7PVzYf/xWLRsjR
 ev50MY+0PoKY8mtkbC1xZLEOoqqrhityKSveOnyM8W87LE04Qtpg+Z5O4KqAOJLzQDhWjNUwjS1
 6tdHd80uoM23QoCXmWZtIW48BVT37SJMNKdFotLuWiQei/OhesZNS1G+FVMkFXru0o3/4hMR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505060170

From: Nikunj Kela <quic_nkela@quicinc.com>

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocols are
used to send request for resource configurations.

Add DT bindings for the QUP GENI UART controller on sa8255p platform.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
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
 .../serial/qcom,sa8255p-geni-uart.yaml        | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
new file mode 100644
index 000000000000..c939ddb4d253
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -0,0 +1,66 @@
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
+        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+                     <&tlmm 35 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "uart", "wakeup";
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };
+...
-- 
2.17.1


