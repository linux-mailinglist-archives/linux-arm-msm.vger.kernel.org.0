Return-Path: <linux-arm-msm+bounces-42466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E449F43C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 07:34:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A77967A3A67
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 06:34:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915E717BEA2;
	Tue, 17 Dec 2024 06:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L5bGYqqV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23A615E5C2;
	Tue, 17 Dec 2024 06:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417239; cv=none; b=s73/lkTcb2H2F6J+jrFX4r494QZyI3UOuKIv08s42Ta/1i7H1sYCcHsYzPwGJ8Po7yXhAzhRvYyrWeg4b1BBxs+sVapPqJ3NwmmlQ/bwUwFt39Qz33SRHGYKosK6JDeuoQr1i7Hy9nwAYEnG1Bngi+KOmoH2kVREK4LWtooFQ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417239; c=relaxed/simple;
	bh=17L6RxlAAmZYFDTR/8OEMHU4272skNl60EBVua4UGD8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUGmOhAFcRSunnS5lmOg6lFH6utdvkNPlXOvlAOPiNFPphrBAjI335p+/6gDMh4m0v/ZDKQzNVP4wPHsjjG93Uc4n3ueTuz3hCiqH+KruySONer8Neo3kKvEiTQjG+DJkHwaC4gYXD6H+lkmODFAUtq0/paoskQYzSxXFS7EUsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L5bGYqqV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH57e09016394;
	Tue, 17 Dec 2024 06:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6P95HpMGJDOKmggyc3L9t0v1
	wE5NjWPbwPRRdaN2/R4=; b=L5bGYqqVNDdpwHOzYhw6LyyWtTDJwjILgUuykidp
	Maf1JMfANZZ2kWtw/dU9OeIebyhZ7ZcgXVGrA2Os3w/BTxncHq8KavVz5TLxbuRC
	xmo9oJLogcMGuYfuQDAOTNKgiqNsNRXbYAB2oHghOszfVqRULBua6DkIsCIVmKP+
	DnG8iUocFS0ejNa7fvGrX/vna2kqRzx+QL51yQCR1VvHTLpqPmJ+VQ/4/LGw5OHq
	F5y1uWxF0BVUB9j248xD/u5FQI8hHq1I0kvPzzzpAEbtReDZq4JBOWxoNQJG3qZN
	oMEnFhqagDdnp6kIw4eUevtY5ACibtNfeUDMqKTjCsv4cQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k2vng6c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:33:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BH6XlMC026858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:33:47 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 16 Dec 2024 22:33:44 -0800
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
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v6 1/2] dt-bindings: arm: Add label in the coresight components
Date: Tue, 17 Dec 2024 14:33:23 +0800
Message-ID: <20241217063324.33781-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
References: <20241217063324.33781-1-quic_jinlmao@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T-8qbHi71ebsOrfdVz6rTczSX3OouCzZ
X-Proofpoint-ORIG-GUID: T-8qbHi71ebsOrfdVz6rTczSX3OouCzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170052

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
---
 .../devicetree/bindings/arm/arm,coresight-cti.yaml          | 6 ++++++
 .../devicetree/bindings/arm/arm,coresight-dummy-sink.yaml   | 6 ++++++
 .../devicetree/bindings/arm/arm,coresight-dummy-source.yaml | 6 ++++++
 .../bindings/arm/arm,coresight-dynamic-funnel.yaml          | 6 ++++++
 .../bindings/arm/arm,coresight-dynamic-replicator.yaml      | 6 ++++++
 .../bindings/arm/arm,coresight-static-funnel.yaml           | 6 ++++++
 .../bindings/arm/arm,coresight-static-replicator.yaml       | 6 ++++++
 .../devicetree/bindings/arm/arm,coresight-tmc.yaml          | 6 ++++++
 .../devicetree/bindings/arm/qcom,coresight-tpda.yaml        | 6 ++++++
 .../devicetree/bindings/arm/qcom,coresight-tpdm.yaml        | 6 ++++++
 10 files changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
index 2d5545a2b49c..5ca6d3d313a3 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
@@ -98,6 +98,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   arm,cti-ctm-id:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
index 08b89b62c505..bc82cd1f3595 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-sink.yaml
@@ -39,6 +39,12 @@ properties:
     enum:
       - arm,coresight-dummy-sink
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
index 04a8c37b4aff..245929c36357 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dummy-source.yaml
@@ -38,6 +38,12 @@ properties:
     enum:
       - arm,coresight-dummy-source
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
index 44a1041cb0fc..30776610d4b4 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
@@ -57,6 +57,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
index 03792e9bd97a..178a3861ee29 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-replicator.yaml
@@ -54,6 +54,12 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   power-domains:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
index cc8c3baa79b4..39b291909cc4 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-funnel.yaml
@@ -30,6 +30,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index 1892a091ac35..ba10897043cf 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -39,6 +39,12 @@ properties:
         description: Input connection from CoreSight Trace bus
         $ref: /schemas/graph.yaml#/properties/port
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
index cb8dceaca70e..8d952150d7b9 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
@@ -55,6 +55,12 @@ properties:
       - const: apb_pclk
       - const: atclk
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   iommus:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
index 76163abed655..986b9b4f360d 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpda.yaml
@@ -65,6 +65,12 @@ properties:
     items:
       - const: apb_pclk
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   in-ports:
     description: |
       Input connections from TPDM to TPDA
diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 8eec07d9d454..59e533720bdd 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -77,6 +77,12 @@ properties:
     minimum: 0
     maximum: 32
 
+  label:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Define the label which can describe what kind of HW or system the
+      coresight device belongs to.
+
   clocks:
     maxItems: 1
 
-- 
2.17.1


