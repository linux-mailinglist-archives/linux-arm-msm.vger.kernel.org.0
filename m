Return-Path: <linux-arm-msm+bounces-56564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14710AA7867
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 19:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B9833BABBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 17:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429DB266B4D;
	Fri,  2 May 2025 17:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZEYUyU3d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9D71A2630;
	Fri,  2 May 2025 17:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746206093; cv=none; b=QcrrNgtXkJ9HQgv8gOZvoMnZ75fKr+p1F3JhpwTfXp9xpNrMzi8tiBi3kqX0JTD3FIViUx4Ji5FHbfF0NXYGYmJYlpLo6/USq+Py6Joyb6C7sDBddO5NReTOXZZnGlabRMHe9iQHAX9vesA0W6/LUCoMZ/22fgDX7aPe/iKyZGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746206093; c=relaxed/simple;
	bh=sVkf3Y2HnpNok8eqG//23tz3qwxUtfV+KWrcN1FZNOc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EZYwGEf7Iq9y1/4MQBw4+yz+Nu5w0oNSnRaHm5L+7bSR32o2lriHlPFjBTDbCWIRms01bPfxNISMG4fQePbQZ1g+3OVW/DzE7w08Qv2l0LaSzzbkP330aAX23VT159/7l3EW6jqVeLla8pUhDGv5Tk8Orsv/ps0evGc2X083PiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZEYUyU3d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 542Dejkk021325;
	Fri, 2 May 2025 17:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8OCkbTOFAgLHwjUOYf/TFQKD
	r98P+n9NHETAM0Yb7j0=; b=ZEYUyU3ddEV4DNnLUKtnJje4bLQZ5uc6Az826ZA7
	Gw8cvEoTxXwNUgJXVQGN2jQWuF09RbvjWVWQXPZd/2zvZnOr94XGRyxU4jAYeE94
	tLvnp29kfn/HCWuEW/aqp9QfafCUkTlVSfVz0D/M6NlcZxf8rx8K1gK0XjNjHJxt
	kTshbjIuc7PXGq7aL/LVpvRh7hmSzWiUK/DHmG6L3MsHRUOSUKCtcK4AAftEmjua
	PFuuofjkpE8EzYO/miXMDoAQX5PIk4bxRK8lwsNRsfPppZafRKb/jF3qYlKd8z5F
	Dxj68H1yDAhIC3uSmCeqch1dbcTggJoPmbO87IFXAJWyqw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6u8guff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 17:14:47 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 542HElO0010759
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 2 May 2025 17:14:47 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 2 May 2025 10:14:41 -0700
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
Subject: [PATCH v4 1/8] dt-bindings: serial: describe SA8255p
Date: Fri, 2 May 2025 22:44:10 +0530
Message-ID: <20250502171417.28856-2-quic_ptalari@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250502171417.28856-1-quic_ptalari@quicinc.com>
References: <20250502171417.28856-1-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=B7i50PtM c=1 sm=1 tr=0 ts=6814fd88 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=rjx3OjMNV77wTL7fGyAA:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: qEr_DxgS4bC3VoQJcMpR2Njni7V0Rs5V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEzNyBTYWx0ZWRfX8sOQA38KLIcJ k3oWqSGM98JXlO3DsicTiNDMVmw1lseQqg0QjqokRfRW87QCpdQRi9cpnCMSwQerhm4WXsfOp4o /c9CsPEG91oTIMCjn+hdH7uK3IyQLbzMAQOuEGUpWjfpCKlsRCf9i4nJpoh9xssJJ/l7h3QR5Rj
 O9zmWcsmsn4bHk430DNnKW1ZtIKhUjj6mgKo7woD0Y8IYEfOCaMYLVztaTyt6zozIs/e9su1Lbu JU9kriD9NY0Xaa2K6lgGL4uCphynkLxXUkBvr5P61qwzdQFe4bxQdkc0Qt1B7OkXJ0I+kwAz4vF 3OzCB/nAKAtQD8oCp+3E+g6Lsipb2Bgw7lvojTBVB8X0vSNHhsWiBYI1VLCKAJ4AzX+/CzgX4F5
 /TpAMVHpY/2epRmPDMBJTTKPr5PauLL3VhAl8URIh4eF1fEdkLIQkDXUg6jYF9z0fvyJFsuX
X-Proofpoint-ORIG-GUID: qEr_DxgS4bC3VoQJcMpR2Njni7V0Rs5V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015
 mlxscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020137

From: Nikunj Kela <quic_nkela@quicinc.com>

SA8255p platform abstracts resources such as clocks, interconnect and
GPIO pins configuration in Firmware. SCMI power and perf protocols are
used to send request for resource configurations.

Add DT bindings for the QUP GENI UART controller on sa8255p platform.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
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
 .../serial/qcom,sa8255p-geni-uart.yaml        | 64 +++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml

diff --git a/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
new file mode 100644
index 000000000000..85b1d7c05079
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/qcom,sa8255p-geni-uart.yaml
@@ -0,0 +1,64 @@
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
+        interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+        power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+        power-domain-names = "power", "perf";
+    };
+...
-- 
2.17.1


