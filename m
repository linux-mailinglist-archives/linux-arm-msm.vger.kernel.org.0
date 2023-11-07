Return-Path: <linux-arm-msm+bounces-20-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C067E3512
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 07:10:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91657280F2C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Nov 2023 06:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EFA5AD5D;
	Tue,  7 Nov 2023 06:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="kHRosIPe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6909449;
	Tue,  7 Nov 2023 06:10:09 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA8E114;
	Mon,  6 Nov 2023 22:10:07 -0800 (PST)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A75d8vw031673;
	Tue, 7 Nov 2023 06:09:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=PWY6YRKU0IXTGM891QJ0ZVdPq5v+3dJUoTHNiXEumQc=;
 b=kHRosIPezjln5uVjYGmk/TgVk7F/xLci5chBTySTA/3nQtYWKeLDo6JLi9p8dMVjzJa0
 J3O7DeZ4UhDuz90F7qRf2osLJIQKwTrSFrbsjv/uJZiJovcGVXNZjKDNvw/wF5tyO6UR
 VJUYWU7AIJEEx1vgwKyJuabTdnXbJdhAvLI+VTH9lj/I234flt36o6j2F8ayvQvMbxRm
 otphDqa1lMXKHOyYo1Gw3TqZnk0ekZKDwk8TMchuadc7UJeJqK8urJutgJL8sTOOoSUT
 PShoDsexKs/ij7qzNpPQqBkrxssvBu/s7nLOYkf4P+WMQ+5a+uBzRdXC/Y6VuQ4w/7XK Xg== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u72r29nas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Nov 2023 06:09:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A769qwB025512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Nov 2023 06:09:52 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 22:09:51 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Andy Gross
	<agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Tao Zhang <quic_taozha@quicinc.com>
Subject: [PATCH v1 2/2] dt-bindings: arm: Add remote etm driver
Date: Mon, 6 Nov 2023 22:09:35 -0800
Message-ID: <20231107060939.13449-3-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231107060939.13449-1-quic_jinlmao@quicinc.com>
References: <20231107060939.13449-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J787pD3w99Bjv3VsOX3KgS6hvR0STSAG
X-Proofpoint-ORIG-GUID: J787pD3w99Bjv3VsOX3KgS6hvR0STSAG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_15,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 mlxlogscore=883 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311070048

Add new coresight-remote-etm.yaml file describing the bindings required
to define coresight remote etm in the device trees.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../arm/qcom,coresight-remote-etm.yaml        | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
new file mode 100644
index 000000000000..04bb57b48d96
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-remote-etm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Coresight Remote ETM
+
+maintainers:
+  - Jinlong Mao <quic_jinlmao@quicinc.com>
+  - Tao Zhang <quic_taozha@quicinc.com>
+
+description: |
+  Support for ETM trace collection on remote processor using coresight
+  framework. Enabling this will allow turning on ETM tracing on remote
+  processor via sysfs and collecting the trace via TMC sinks.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,coresight-remote-etm
+
+  qcom,inst-id:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Instance id of remote etm.
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description: Output connection to the CoreSight Trace bus.
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - qcom,inst-id
+  - out-ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    modem_etm0 {
+        compatible = "qcom,coresight-remote-etm";
+        qcom,inst-id = <2>;
+
+        out-ports {
+            port {
+                modem_etm0_out_funnel_modem: endpoint {
+                remote-endpoint =
+                    <&funnel_modem_in_modem_etm0>;
+                };
+            };
+        };
+    };
+...
-- 
2.41.0


