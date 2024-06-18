Return-Path: <linux-arm-msm+bounces-22972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ECD90C488
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 09:42:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BAA3283602
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Jun 2024 07:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D82915B556;
	Tue, 18 Jun 2024 07:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZVXwK2UO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40281E863;
	Tue, 18 Jun 2024 07:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718695706; cv=none; b=oeKOxR8VvXmlRY5OGcLnL98pIe/35nGP1621FeGANaN+RMEhDSzvTF/IfcsO0161XtBWpdgYMlcser5P0dEv5Ll3sYvCPVHePJwANfDGyFZHigc9RqCHhiJfbKov9PnhKzANYV53U/k8tQpkrTQBY/D0x4xb7FMa9t0IhQ95HV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718695706; c=relaxed/simple;
	bh=oEjDln06QJsNagUC9A4L35gwVs7l/b2oJNPxkfp20uw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=movEoh/8yLEg0VVjGWe6UZ4I3tNu0Ym0MvNnFNLwlpBBbXCWFaCt6bxzBvjaTZIE46aMUtUJ2dR4Vln6UJfZGemksRL2dLYS9ck0GNNukbZm0DOuI9C90k5RZ3UjyG3JKqwH53ZtYeiiBm8LfTY8INKyIIEZdW7U5Onkr/vjLd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZVXwK2UO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45I2IGUQ001354;
	Tue, 18 Jun 2024 07:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySKf1ov4DYy3Q0LnAi2e8Fyt34/Otz9gPUTSliULRwI=; b=ZVXwK2UOv2rr4Zrt
	2lKdTyYFW/oi9Ntcp9miiSPMnFrOztF60vCdmpK/ucO15xpopL5OvSTMPPh2Sx/m
	DmLVU940PWsTI1Vlj2Nji3PNIUiFJCUu5644vx/tNIMjXJXmJU5MlUaVwJm0Vp05
	INXIAHHFyGsLbX1kP7Y3WNVl4eOPZ0gBYuUS7TKhwqpmB0+vH1claBg2ek4WLiju
	IHpV5hOAEbR7jcAzTmreXKUfGbVPE3YjLlsSeKVM8Xat2UPXikTpVUBFF2gvQyBt
	QJ3qWHd+2mS1jBvE+iFCJJCtm8GgUQqSQNcYuOUdCuVN4QVB9F2PUvLfJwqgXzPX
	ekN53Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yu1b0rhfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:28:05 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45I7S4H8028143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jun 2024 07:28:04 GMT
Received: from jiegan-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Jun 2024 00:27:57 -0700
From: Jie Gan <quic_jiegan@quicinc.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose
	<suzuki.poulose@arm.com>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>,
        Konrad Dybcio <konradybcio@gmail.com>,
        Mike Leach <mike.leach@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Jinlong Mao <quic_jinlmao@quicinc.com>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Tao Zhang
	<quic_taozha@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Song Chai
	<quic_songchai@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <andersson@kernel.org>,
        <quic_yijiyang@quicinc.com>, <quic_yuanjiey@quicinc.com>,
        <quic_liuxin@quicinc.com>, <quic_yanzl@quicinc.com>,
        <quic_xinlon@quicinc.com>, <quic_xueqnie@quicinc.com>,
        <quic_sijiwu@quicinc.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: Add binding document for Coresight Slave Register device.
Date: Tue, 18 Jun 2024 15:27:24 +0800
Message-ID: <20240618072726.3767974-2-quic_jiegan@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
References: <20240618072726.3767974-1-quic_jiegan@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3lSmKs2Mmku8ygoco9e0y7PJcvw0QTFi
X-Proofpoint-ORIG-GUID: 3lSmKs2Mmku8ygoco9e0y7PJcvw0QTFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-18_02,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 adultscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406180054

Add binding document for Coresight Slave Register device.

Add a new property to TMC, qcom,csr-atid-offset, to indicate which
ATID registers will be used by the TMC ETR. Each TMC ETR device is
associated with four ATID registers that are continuous in address.

Signed-off-by: Jie Gan <quic_jiegan@quicinc.com>
---
 .../bindings/arm/arm,coresight-tmc.yaml       |  8 ++
 .../bindings/arm/qcom,coresight-csr.yaml      | 76 +++++++++++++++++++
 2 files changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index cb8dceaca70e..295641a96c21 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -82,6 +82,14 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     maximum: 15
 
+  qcom,csr-atid-offset:
+    description:
+      Offset to the coresight slave register component's ATID register
+      that is used by specific TMC ETR. The ATID register can be programed according
+      to the trace id to filter out specific trace data which gets through the ETR
+      to the downstream components.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
new file mode 100644
index 000000000000..16f97cbe3d4b
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-csr.yaml
@@ -0,0 +1,76 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: CoreSight Slave Register
+
+maintainers:
+  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
+  - Mao Jinlong <quic_jinlmao@quicinc.com>
+  - Jie Gan <quic_jiegan@quicinc.com>
+
+description:
+  The Coresight Slave Register controls various Coresight behaviors.
+  Used to enable/disable ETR’s data filter function based on trace ID.
+
+properties:
+  compatible:
+    const: qcom,coresight-csr
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    maxItems: 1
+    items:
+      - const: apb_pclk
+
+  reg-names:
+    items:
+      - const: csr-base
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
+    syscon@10001000 {
+        compatible = "qcom,coresight-csr";
+        reg = <0x0 0x10001000 0x0 0x1000>;
+        reg-names = "csr-base";
+
+        in-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csr_in_port0: endpoint {
+                    remote-endpoint = <&etr0_out_port>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csr_in_port1: endpoint {
+                    remote-endpoint = <&etr1_out_port>;
+                };
+            };
+        };
+    };
-- 
2.34.1


