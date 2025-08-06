Return-Path: <linux-arm-msm+bounces-67885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CCEB1C43E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 12:27:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11506162179
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 10:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EA9C28AB16;
	Wed,  6 Aug 2025 10:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m33GbMQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61652244E8C;
	Wed,  6 Aug 2025 10:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754476044; cv=none; b=oajD6i3iL5X6QVtEqtKc7Mu1nwVOp26KRPW+oP+9vnrB3kIcR5wqusp6K+cH4Ey2WTQhbwPak9c3Q5s4llQWS1g+MFlvGvj17/c0v0G3LA8mexTwNcGqEyib27DSYMCcPvpE4cgmCY0faoFDuwC/4EeAd5+x7Ipkxynvvw3aeIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754476044; c=relaxed/simple;
	bh=zMDa6geO1E8x6J2DZtJkG1wc7SVhQBTS/4MwrcT0/TI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipIz2cOk6ywSrBUeZuvRIepdPFWU7kfdC1dN9VkdhwMyyDG4JRMNa7CuVd5t3cEVpdGqi5SeCsbCcofq/Q0gSx7XW5QEdP4kFFSy3fZXjMvfLBEWR5akHdS3HSTEv2QpDPWjdpoahDRd1n8o+xP1b1Edl14f1rQiDv+Iq0i0LqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m33GbMQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5769ekJG032246;
	Wed, 6 Aug 2025 10:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qwm+UjEPRIZ0qNK/Yj6Iuy4ylM15S97DIRgqe5a+wRc=; b=m33GbMQLKnXxSDiA
	INxSyYnf9Hw/0NxJk6zfQKrzyLbOtNUy/B+4lFAzC+JsWBBE0n1BapJgmP3s87xv
	VEwFpqmq8MiQu5Uan21WkAUmEwrROeD0hb5W946xYdifrbKuV5tr3+rudYH4flJn
	M6GczgqW4ceJFn2Di/qAfQQom19wR8vlvpxaHp7qF+PU6zZoXj/Rkh1lLablPEI6
	h1Ew/XrNZ3J/Rk8e/l3G2g7dXZ3a+umJLjtsK5gdzkWDpUhQxyYrMd32TJZqtMNC
	8hgktM6IFp+Xlb9Km5PTEKcEJWaaKh8P+34gaDA5NGHunjHaUtVhMU5oC6075/7k
	JuVyTQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpw2tf5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 10:27:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 576ARBPf012436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 10:27:11 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 6 Aug 2025 03:27:11 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 1/2] dt-bindings: arm: Add label in the coresight components
Date: Wed, 6 Aug 2025 03:26:57 -0700
Message-ID: <20250806102658.536683-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
References: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Vbz3PEp9 c=1 sm=1 tr=0 ts=68932e00 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=lttKXCBnEA6mHFaSAm4A:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hdxJwik6Slo3pGl-FT5ZiAL5eyt-dMYI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOCBTYWx0ZWRfX1o/uvGxBEzHQ
 HkxuagS0ArCPQerGWy2YCjvS3cn7VAHuuavA/ifMBmQN+/iOXIBZQAJNeNUMmr+R/AahpGEh+vb
 AXYy3zKAPrWewkH7jERSJ7EdJSv4XYQFyOHV1GyrZ08rzW+PqA9uEawIPljYZ/oYt4BhSMHbgH5
 KLVsBiyMgoQdCdeRNEDpBH3oJOi7+oH/9tNst3wkcIiETA8cIlL0nt+p7W87l2CLvQTdKr0Vn3K
 Xu7gk9ebg3Zj6Yv1gFBOeSDBRaMKRWAjQnwzYKcAZe6Sr3Y4fqbC5F7ocohFPgq/ViDdL0yIQaC
 eteVGiaMH5t5H14NFXF7vZKlyv+hG2DGwNOJQMuJETAAMarSJ17Y3XfjE/gEeb2eQbPFsZ9v0To
 6Q8Xqwd6
X-Proofpoint-GUID: hdxJwik6Slo3pGl-FT5ZiAL5eyt-dMYI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508060008

Current name of coresight component's folder consists of prefix of
the device and the id in the device list. When run 'ls' command,
we can get the register address of the device. Take CTI for example,
if we want to set the config for modem CTI, but we can't know which
CTI is modem CTI from all current information.

cti_sys0 -> ../../../devices/platform/soc@0/138f0000.cti/cti_sys0
cti_sys1 -> ../../../devices/platform/soc@0/13900000.cti/cti_sys1

Add label to show hardware context information of each coresight
device. There will be a sysfs node label in each device folder.

cat /sys/bus/coresight/devices/cti_sys0/label

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
---
 Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml  | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-dummy-sink.yaml     | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml   | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml | 4 ++++
 .../bindings/arm/arm,coresight-dynamic-replicator.yaml        | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-etb10.yaml          | 4 ++++
 Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml  | 4 ++++
 .../devicetree/bindings/arm/arm,coresight-static-funnel.yaml  | 4 ++++
 .../bindings/arm/arm,coresight-static-replicator.yaml         | 4 ++++
 Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml  | 4 ++++
 Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml | 4 ++++
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml          | 4 ++++
 .../devicetree/bindings/arm/qcom,coresight-remote-etm.yaml    | 4 ++++
 .../devicetree/bindings/arm/qcom,coresight-tpda.yaml          | 4 ++++
 .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml          | 4 ++++
 15 files changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2d5545a2b49c..2a91670ccb8c 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -98,6 +98,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    description:
+      Description of a coresight device.
+
   arm,cti-ctm-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
index 08b89b62c505..ed091dc0c10a 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
@@ -39,6 +39,10 @@ properties:
     enum:
       - arm,coresight-dummy-sink
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
index 742dc4e25d3b..78337be42b55 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
@@ -38,6 +38,10 @@ properties:
     enum:
       - arm,coresight-dummy-source
 
+  label:
+    description:
+      Description of a coresight device.
+
   arm,static-trace-id:
     description: If dummy source needs static id support, use this to set trace id.
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index 44a1041cb0fc..b74db15e5f8a 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -57,6 +57,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
index 03792e9bd97a..17ea936b796f 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
@@ -54,6 +54,10 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
index 90679788e0bf..892df7aca1ac 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etb10.yaml
@@ -54,6 +54,10 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
index 01200f67504a..71f2e1ed27e5 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
@@ -85,6 +85,10 @@ properties:
       CPU powers down the coresight component also powers down and loses its
       context.
 
+  label:
+    description:
+      Description of a coresight device.
+
   arm,cp14:
     type: boolean
     description:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
index cc8c3baa79b4..9598a3d0a95b 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
@@ -30,6 +30,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index 0c1017affbad..b81851b26c74 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -43,6 +43,10 @@ properties:
           - const: dbg_trc
           - const: dbg_apb
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index 4787d7c6bac2..96dd5b5f771a 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -55,6 +55,10 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   iommus:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
index 61a0cdc27745..a207f6899e67 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
@@ -54,6 +54,10 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..c969c16c21ef 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,10 @@ properties:
     items:
       - const: apb
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..ffe613efeabe 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -20,6 +20,10 @@ properties:
   compatible:
     const: qcom,coresight-remote-etm
 
+  label:
+    description:
+      Description of a coresight device.
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index 5ed40f21b8eb..a48c9ac3eaa9 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -64,6 +64,10 @@ properties:
     items:
       - const: apb_pclk
 
+  label:
+    description:
+      Description of a coresight device.
+
   in-ports:
     description: |
       Input connections from TPDM to TPDA
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 07d21a3617f5..4edc47483851 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -76,6 +76,10 @@ properties:
     minimum: 0
     maximum: 32
 
+  label:
+    description:
+      Description of a coresight device.
+
   clocks:
     maxItems: 1
 
-- 
2.25.1


