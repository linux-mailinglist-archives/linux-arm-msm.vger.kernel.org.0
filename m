Return-Path: <linux-arm-msm+bounces-33692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 041779968CA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 13:26:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DD3D1F22662
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Oct 2024 11:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC09F192D62;
	Wed,  9 Oct 2024 11:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="k85c0CX7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF8A192B94;
	Wed,  9 Oct 2024 11:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473163; cv=none; b=ONvWceeHUMYnjZCRvk6piVoZ+izlNs0t0VfdpeDnOFS0Re4Uqx5bMf0LQtlX2IVRI7U6mcEMdoopxFEItarvaTik5nBRLZKajRs3ugs8faTIYETnWqaBLf/jy/v9bEB3/C2vB4099rvLbRUuPkUEOvgAIeYCdfexLBvBfvOESu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473163; c=relaxed/simple;
	bh=HEEcfnOq54LR0U51mqX/+LvcTri4c03Xzg8uUxcuZx0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s5T53QxIcS8RxNjXWNOlWRpq1IERvMxxHSYbUSgupWqDYTEOWohITJE+djzBEafWMkNxoGQSscyhvgZdukBYEpCSwm1GSK/IrC6ZnXCDaQtSYEztaTewAHBSWsWePKTrvm/P/KDh+lRPJDrHI+D+7sXcvlEbO0TI8x0wUsBB9nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=k85c0CX7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4992pgJ0021901;
	Wed, 9 Oct 2024 11:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9T6vDCQgh1gIYQoLsdnmEUZ+H4oulTkXaYpu8/f4F1Q=; b=k85c0CX7OiBOAolM
	J+abBeBPtF2gqGMDtH3D2+akrMLUrGmDN7gbjVjjo4Ikk2H8Wru7RLd7MRnD2++A
	tx9VyAZuyGP1/14HdVPDrM9fkKqL1+KvrYThWH0YJCk5ktPdqBkUd0/u4GubQEJd
	p78Ov1X/mRj1QDYQnHz4eFEvkggae7qEIS0AnQoWzxV12TTizY7ta44CBuES86bi
	VPvN3vGLTHWiMM2xMBkcvnLY+XDgR709sy3SHa3inYI+ZqMOfgYGLE5R/wgLXVfS
	F/ZTmWNxxI3BNg9ERq84axGyfj7gS9cd0jhhD5HnF6GmyUU45EXDLfpQN5zNov9b
	PGijqA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 424kaewthv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Oct 2024 11:25:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 499BPkm3012160
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Oct 2024 11:25:46 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 04:25:40 -0700
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
        Bjorn Andersson <andersson@kernel.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Song Chai <quic_songchai@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
Subject: [PATCH v6 3/5] dt-bindings: arm: Add Coresight TMC Control Unit hardware
Date: Wed, 9 Oct 2024 19:25:01 +0800
Message-ID: <20241009112503.1851585-4-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241009112503.1851585-1-quic_jiegan@quicinc.com>
References: <20241009112503.1851585-1-quic_jiegan@quicinc.com>
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
X-Proofpoint-ORIG-GUID: GTYtJbVMWiyZ9wM0vId40vkW5UwMj0ke
X-Proofpoint-GUID: GTYtJbVMWiyZ9wM0vId40vkW5UwMj0ke
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=1 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410090075

Add binding file to specify how to define a Coresight TMC
Control Unit device in device tree.

It is responsible for controlling the data filter function
based on the source device's Trace ID for TMC ETR device.
The trace data with that Trace id can get into ETR's buffer
while other trace data gets ignored.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


