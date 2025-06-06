Return-Path: <linux-arm-msm+bounces-60493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC63EAD0757
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 19:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5A843B3F2E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jun 2025 17:21:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA8A28A3F8;
	Fri,  6 Jun 2025 17:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AqKQEvOQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4EC11A275;
	Fri,  6 Jun 2025 17:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749230516; cv=none; b=TJr9/Ifn4A2K0d3eDiu/32BOL/n5wSvfEMk71kcGyJxn2dKVJKpjKswrJAI1d+MJOhdxqZu9tQ2gAKAZPh12lZ6dDtbybWN2lsobqNJf+5pAmcKWl0Qtj2y6HsOJBhLU3tV5cuq2249H4yIz3WH58vT6WudXHAQoU5ivkHyB1GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749230516; c=relaxed/simple;
	bh=pw5Beswsjnx0yzOeXAjrZjJao8RneAyLOokVcUrEDzE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OQcguqqcC1Snc3CMPSeHGeqUzbqOaf2+l8RtU6mLlnMBZwtKT6YI3Cu3dlAOcS8qGAMIuWt2pMLoLQonuqygKXtFNsBobZOQHMs/7bszmgBNJZjWrv7aMR2NlVENHGp8Al6PpCAhzeuNF3Cq1/iVhDvQ35iLfJ/FO+lyEzmtLCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AqKQEvOQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556F9KTq032715;
	Fri, 6 Jun 2025 17:21:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QRwffktGAE8UhNXIgnY83/SS
	AR6OJMXBABcHZsTzDGM=; b=AqKQEvOQ4Op40otOMraVwKDJwQDB2UFDZUxRxFUL
	LcVEDPwTiuyFhMWGsWxDpsPg5Dm6XsRNxh4Eebz56aTh42Gd3VaesMJW+X1moxRi
	CJu2HhCMhoGHeIRETnwQ9qLZ2D+2lxl3b5H+QdzTJ/HV34IbtB1sDCzDHtfkhcHC
	cnTgEFmwSwq8TxEc4ZumzsyFkNeM45e4d1189afWcOHls5EfNWzPG+KzWFRd+MYJ
	poQgpTvnoZu9mujaQMg2/3C62KI2wDXiDaVSBwn7WgM6AF2IHnIwCInBThP3pUiY
	W2m7GHz0rp5Vvc4JEC50P2e3I6LEyWKhZiWm1T2jQBqrvg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8tdbu3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 17:21:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 556HLo2T021384
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Jun 2025 17:21:50 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Jun 2025 10:21:45 -0700
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
Subject: [PATCH v6 2/8] dt-bindings: qcom: geni-se: describe SA8255p
Date: Fri, 6 Jun 2025 22:51:08 +0530
Message-ID: <20250606172114.6618-3-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=eJQTjGp1 c=1 sm=1 tr=0 ts=684323af cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=SsepCFgDwyuPXbE72osA:9 a=sptkURWiP4Gy88Gu7hUp:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: e088sIOkkqlhVLDes5wIpxX4ZiyF7etb
X-Proofpoint-GUID: e088sIOkkqlhVLDes5wIpxX4ZiyF7etb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDE1MCBTYWx0ZWRfXx+M+E8H4ct29
 Xw0HQiwVEhi7s2+dLSxYk3sAjwUd1ER3GISli6G4YGlG5Ml+2iWnCNqLSx9q3IwBn/PHjHths+0
 X0GD3LU4K0FLVfbH287Xk6G4bGc0l3rEEPIuHvMoyDZlhY73XG+9Z++X9GvHvekD1iwHpb92Axw
 2SqKwts+8ZL8sqDyzBPOucUpufJA5ahja+KuKQmKf8PnoCeHDKG7cyo1a82tUSfAYXrCbjX1/lR
 V3BAMf7SI/Rcm4xEDuW2yJ8wt7b5dCFM9areafO+V1UqY6BbotYoktJkY4ofw2y77FGqSjvOYbo
 sEX07L6UyW0C87xFs2/fo0OvO+cfFzSVxxRiJ1GCNKpEgJ362hSpQ+WCHEvpd23epidVUXUtUi4
 UyGGFqiWO2gx2AcqiJVS963VHIIdCVT0U/3Jda+LmHvAgDQnmQiDJqT4D1R4fbEmcpt9cVq5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 phishscore=0 mlxscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506060150

From: Nikunj Kela <quic_nkela@quicinc.com>

SA8255p platform abstracts resources such as clocks, interconnect
configuration in Firmware.

Add DT bindings for the QUP Wrapper on sa8255p platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
v5 -> v6
- added Reviewed-by tag in commit

v3 -> v4
- reordered required:  after properties and patternproperties
- added version log after ---

v2 -> v3
- reordered required option

v1 -> v2
- reorder sequence of tags in commit text
- resolved waring errors while encountered in dt binding and dtb check.
---
 .../soc/qcom/qcom,sa8255p-geni-se-qup.yaml    | 107 ++++++++++++++++++
 1 file changed, 107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
new file mode 100644
index 000000000000..352af3426d34
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,sa8255p-geni-se-qup.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,sa8255p-geni-se-qup.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: GENI Serial Engine QUP Wrapper Controller
+
+maintainers:
+  - Praveen Talari <quic_ptalari@quicinc.com>
+
+description:
+  Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) wrapper
+  is a programmable module for supporting a wide range of serial interfaces
+  like UART, SPI, I2C, I3C, etc. A single QUP module can provide up to 8 Serial
+  Interfaces, using its internal Serial Engines. The GENI Serial Engine QUP
+  Wrapper controller is modeled as a node with zero or more child nodes each
+  representing a serial engine.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-geni-se-qup
+
+  reg:
+    description: QUP wrapper common register address and length.
+    maxItems: 1
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+  iommus:
+    maxItems: 1
+
+  dma-coherent: true
+
+patternProperties:
+  "spi@[0-9a-f]+$":
+    type: object
+    description: GENI serial engine based SPI controller. SPI in master mode
+                 supports up to 50MHz, up to four chip selects, programmable
+                 data path from 4 bits to 32 bits and numerous protocol
+                 variants.
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,sa8255p-geni-spi
+
+  "i2c@[0-9a-f]+$":
+    type: object
+    description: GENI serial engine based I2C controller.
+    additionalProperties: true
+
+    properties:
+      compatible:
+        const: qcom,sa8255p-geni-i2c
+
+  "serial@[0-9a-f]+$":
+    type: object
+    description: GENI Serial Engine based UART Controller.
+    additionalProperties: true
+
+    properties:
+      compatible:
+        enum:
+          - qcom,sa8255p-geni-uart
+          - qcom,sa8255p-geni-debug-uart
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+  - ranges
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        geniqup@9c0000 {
+            compatible = "qcom,sa8255p-geni-se-qup";
+            reg = <0 0x9c0000 0 0x6000>;
+            #address-cells = <2>;
+            #size-cells = <2>;
+            ranges;
+
+            serial@990000 {
+                compatible = "qcom,sa8255p-geni-uart";
+                reg = <0 0x990000 0 0x4000>;
+                interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
+                power-domains = <&scmi0_pd 0>, <&scmi0_dvfs 0>;
+                power-domain-names = "power", "perf";
+            };
+        };
+    };
+...
-- 
2.17.1


