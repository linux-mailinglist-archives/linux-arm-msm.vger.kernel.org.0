Return-Path: <linux-arm-msm+bounces-56994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A9DAACCB0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 20:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 031AB7B138A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 18:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6242857FF;
	Tue,  6 May 2025 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fZRpO7lL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707772857F5;
	Tue,  6 May 2025 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746554599; cv=none; b=l4CFKBnAG351sSmqyGUlrY/xWBhW8VYx5tKKue9jPPTBXdrM/zQSm8H4Dfwr5qNzapF3Xv3nRZ706pAvvCUUyV5tt9+IvQYeNKeBwIib9+T8LQmL2Edfz1Mr2yuuQWN2cvtdZ7zYxETYxgUs5fRfG7hZQm59OeBvUPwzzh47UOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746554599; c=relaxed/simple;
	bh=TpXZNbB9YnRrg6Ix+sp6ZDmJvS2db/lB+J/f6QUcX18=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JWGSKDsdJ5Gh84HCuhMp8YRWYx8YwYpjIWJl8ddIeA9EpScD6mIwt9bttYgTScjwXQA5+RRYbPUI2yY+88PTNpmI6l8C2pmYIqXvhFhfyQGyLDtWZpkIpxphio+neiVV2jnblIiEmBYKVEgFXb69uwrWdMoTXB3ywobrkMCosD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fZRpO7lL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546ABgR2016498;
	Tue, 6 May 2025 18:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0VGmdbyUsxplAfPM7cv4SxYW
	bnsuKVhRDLsMucmVBj8=; b=fZRpO7lLiijvMJgYq5NA9OUbsTHwW/27ELxLlER7
	2w1GCCSVHZzEMVumrSMvzHQ7NnSy7CDQpdKXNk5lW/zKu6RwjsvCMzxfBEm1a3/w
	4+53wXa8WFzQ70JbebHcpcrobkh28CaTjmZ/agNmpx/q27DIK3xialOCu6aaZIvl
	aKnYn9EIpvyS9I33LIbHV0AiCCnGzt9ircraNj/5KuU6EeyXF78PsKxuGDN7cZ+T
	4a6ZRf+Kt1gMc6HSZnEdyhv8Br1Ee4NIVghVS+jWLdjAFL0JBlpzcV7xUv6KVazH
	j8TWovNiLawp2cWoCxK3UvLbARupeURSEmjtnEnnRCP48g==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f8gv2ufs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 18:03:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 546I3C1Q020747
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 18:03:12 GMT
Received: from hu-ptalari-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 11:03:06 -0700
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
Subject: [PATCH v5 2/8] dt-bindings: qcom: geni-se: describe SA8255p
Date: Tue, 6 May 2025 23:32:26 +0530
Message-ID: <20250506180232.1299-3-quic_ptalari@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=dYmA3WXe c=1 sm=1 tr=0 ts=681a4ee1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8
 a=v7CWcBsnNxNFVLN3aFYA:9 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 5lwBX8pBcU89ygpYkKjTnRUm_GV_oQnN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3MCBTYWx0ZWRfX8G5KDwTs8fk0
 2+ZI8nB4vS4RMoZitht37eiQDCH6vKxUDLo4ILyu6RQJz5+8DRrvM9Gv1IqVGcXIMDhDkwT5Omi
 LQl40si+A1evfoip0AWGCzdPBGgnG02wfoANbMcCNY4egPQGymDBNBv2kE8PXt/Uzdv5RTWuZu5
 LaSVSmnmMkqwOQ8RyTvfFkSvUMGbRCt7nDFCkwx5Do5fdn5RtYVGOQH2630wLfSGNi9v12TNekC
 gvYA8uEqfQkpc4SbC2XOx+A2bAtlI7K28NCHQtSXbD2Votswio5hg0X7gvpXQT9RIHOfK/vFkb6
 C0fWXhSguD4gQRv2kglkzv8GOe/m9kmkH/9GC+6uyIpgjq4dt+JmnEfhbYgQRfkh1M6fdG+FMrb
 nBgaFd1o8MB+ZudvsK552/HW5M6L/HTW2MFj5mr6OuSvdKrDtad6bP6MdKm8NpFh6TFVaRqe
X-Proofpoint-GUID: 5lwBX8pBcU89ygpYkKjTnRUm_GV_oQnN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060170

From: Nikunj Kela <quic_nkela@quicinc.com>

SA8255p platform abstracts resources such as clocks, interconnect
configuration in Firmware.

Add DT bindings for the QUP Wrapper on sa8255p platform.

Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Praveen Talari <quic_ptalari@quicinc.com>
Signed-off-by: Praveen Talari <quic_ptalari@quicinc.com>
---
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


