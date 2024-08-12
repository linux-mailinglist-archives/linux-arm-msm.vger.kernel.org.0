Return-Path: <linux-arm-msm+bounces-28274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D119394E520
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 04:43:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F11A1F220D8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 02:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 114321487E2;
	Mon, 12 Aug 2024 02:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="WC8HiO8+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75DED1482F2;
	Mon, 12 Aug 2024 02:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723430564; cv=none; b=HCr3H8DHIY0jHQeupi8a7cnUXdeq3y3qVtUMoX0luJHkZsZJC2+adgycVXHM/VRZ+RlbWSGA101z6UURkl7TgGp/U62Kz/PEpWI4CWFLhgBHNN2M7MTX8wizZAGg64qsx8Az3viMXwCF4yewzyy/ap7OBX4p9DlI393vzmd6RCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723430564; c=relaxed/simple;
	bh=rD+DddyJ/G6nhPu/1et2xgHKm2IBiE8YCwCjVnKohSc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTqbsfhndAyWX2MvIvVSrDNQEpLwFeIAq3429kjaPZDb/ME1QkbYCLJnOHzeQrMr6JM48XpgnvqLs4XvZSpKL8FJwWx3+3Y+nu0DfyyZAhQZX97jxK2FtK2DxmG//moglH6GJeABex23tbDwuf4hIvVdwhVXchGPcoOI1FFtKHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=WC8HiO8+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47C2ZTke013894;
	Mon, 12 Aug 2024 02:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rgzJxGVm4vz3DSAO3MkZJA7YD/X8xsX0QO+9oUmXHSI=; b=WC8HiO8+pPt1WzMT
	taoclU9gGspBOv5jSlpWAObEmlyt4X2ohA2mGtcihNQrHICOJbXbVjNnaINdPlwP
	Uq8o4nwrHeauffq18Q+7+C31Q6hBnYwdFU2xPg8h524582pPFqDEWr4EaHmrFXLv
	DMdZBWrG8P+MjeKLsnjSXFrP1et8DEWoJZhfefSicl1FsLb19cMEpBoo0tmpR5Ft
	YQzZOjvZkH1HvLHrLbaki3lZB5ZCj1ytJ1g9TWu3InZ1oKwbAR4IQ5Z45kdkZ0VW
	p5G4IRGZ/2AgdsTg9OqTnGWB+mQcNF6vUKe0XKlDIYRbQBmPEtvpppgbcmSxwH/F
	wM5rdQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x18xtn74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 02:42:27 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47C2gQ0k013164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 02:42:26 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 11 Aug 2024 19:42:20 -0700
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
Subject: [PATCH v3 3/5] dt-bindings: arm: Add Coresight TMC Control Unit hardware
Date: Mon, 12 Aug 2024 10:41:39 +0800
Message-ID: <20240812024141.2867655-4-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
References: <20240812024141.2867655-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-GUID: nZLhdqjfXYciUdyx37e07Nh6yTgBc7qB
X-Proofpoint-ORIG-GUID: nZLhdqjfXYciUdyx37e07Nh6yTgBc7qB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-11_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=7 mlxlogscore=999
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408120018

Add binding file to specify how to define a Coresight TMC
Control Unit device in device tree.

It is responsible for controlling the data filter function
based on the source device's Trace ID for TMC ETR device.
The trace data with that Trace id can get into ETR's buffer
while other trace data gets ignored.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml     | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
new file mode 100644
index 000000000000..7a9580007942
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -0,0 +1,79 @@
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
+description:
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
+      '^port(@[0-7])?$':
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


