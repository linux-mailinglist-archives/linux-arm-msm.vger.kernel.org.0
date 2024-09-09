Return-Path: <linux-arm-msm+bounces-31236-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A94970C56
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 05:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3DBDB1C21A8C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Sep 2024 03:36:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94C1E1AD409;
	Mon,  9 Sep 2024 03:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mqMr6dzs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BAB1ACDE0;
	Mon,  9 Sep 2024 03:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725852962; cv=none; b=uzXIhIt1Rtgkgtg5pvmGM/mjL+eR7qENw9mhdetoHzVtNy/rtyNbI4Wfew6wQh3I+ygZkWYkWnv272GN9p2GZKrBlYJCApdlsIiaO6bS8i1LqUgS5JbSvpw4jWLA/Tn29S4FBciv7pfwqgzPLxi+wuvz4xwAPbQCARMpb/6OCUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725852962; c=relaxed/simple;
	bh=0ZWLle+C57j1TYiOQCo5iJEztCk7xTCz1FPwU/ne7pc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FdA6gA6i2D7RbbsxKrg9FbhAP0/OWd+5H7lfzPDkxxF0d2oBOKVDHly6eQ5x8HSKFf/+VrYFa0rvGUS90cBTEQDwqpsvd/rPTWzDz8c52CkPItZyhgBCovHwcZtsj1vufSUzv2ryEb5uyTZtpwuwIFwRqtvxoeUVIPYkcyEia5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mqMr6dzs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4890LrvI007779;
	Mon, 9 Sep 2024 03:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lAv+HvwlohKvnAUnYu+v3G5/3MXQD13BRoONTWtMgq0=; b=mqMr6dzslPxPiIag
	LGTyuyD9DXLkgR8dOKE4gar/UtVtoIIFpkfUpSUFrMshNmiz2b8eBXYi133uDbYO
	YJu7es+jEVNgTiePcV7mfQQW0HHN3QNlb4JS8xLJMLD0P1xezpJsQ8i+GaAzN7ca
	5KulULiYyrbUg+q4DyGl2jhOJCJqMYIwXawpzq5VtgDKcWnI2g5wu75aunuY1uzN
	gzvfQDjwHy0XrRoZfRWmw8upxU2zAUpcByxQyiFisnkjJ0PdSGthTRG/Io7RDFoK
	hBk/ENP3y2eC69rSJhnWuKKeAtqKPJ2pjaDOMFzuaxIpEFSiQiACKRJTj06Yerl8
	FSG9ew==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy7fhjx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 03:35:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4893ZarQ016248
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 03:35:36 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 8 Sep 2024 20:35:30 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v5 3/5] dt-bindings: arm: Add Coresight TMC Control Unit hardware
Date: Mon, 9 Sep 2024 11:34:56 +0800
Message-ID: <20240909033458.3118238-4-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240909033458.3118238-1-quic_jiegan@quicinc.com>
References: <20240909033458.3118238-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Rvana_JGJOdSn4_U2dCDccrlEpV1Lsi8
X-Proofpoint-GUID: Rvana_JGJOdSn4_U2dCDccrlEpV1Lsi8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=1 phishscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409090027

Add binding file to specify how to define a Coresight TMC
Control Unit device in device tree.

It is responsible for controlling the data filter function
based on the source device's Trace ID for TMC ETR device.
The trace data with that Trace id can get into ETR's buffer
while other trace data gets ignored.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml     | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
new file mode 100644
index 000000000000..843b52eaf872
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-ctcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CoreSight TMC Control Unit
+
+maintainers:
+  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
+  - Mao Jinlong <quic_jinlmao@quicinc.com>
+  - Jie Gan <quic_jiegan@quicinc.com>
+
+description: |
+  The Trace Memory Controller(TMC) is used for Embedded Trace Buffer(ETB),
+  Embedded Trace FIFO(ETF) and Embedded Trace Router(ETR) configurations.
+  The configuration mode (ETB, ETF, ETR) is discovered at boot time when
+  the device is probed.
+
+  The Coresight TMC Control unit controls various Coresight behaviors.
+  It works as a helper device when connected to TMC ETR device.
+  It is responsible for controlling the data filter function based on
+  the source device's Trace ID for TMC ETR device. The trace data with
+  that Trace id can get into ETR's buffer while other trace data gets
+  ignored.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sa8775p-ctcu
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port(@[0-1])?$':
+        description: Input connections from CoreSight Trace bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - in-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    ctcu@1001000 {
+        compatible = "qcom,sa8775p-ctcu";
+        reg = <0x1001000 0x1000>;
+
+        clocks = <&aoss_qmp>;
+        clock-names = "apb";
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                ctcu_in_port0: endpoint {
+                    remote-endpoint = <&etr0_out_port>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                ctcu_in_port1: endpoint {
+                    remote-endpoint = <&etr1_out_port>;
+                };
+            };
+        };
+    };
-- 
2.34.1


