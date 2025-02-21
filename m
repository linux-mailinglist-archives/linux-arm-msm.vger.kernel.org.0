Return-Path: <linux-arm-msm+bounces-48814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED051A3ED70
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 08:41:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37A7F19C2BA5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 07:41:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D17C61FF1D0;
	Fri, 21 Feb 2025 07:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m53jZtQX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4906D1F9F51;
	Fri, 21 Feb 2025 07:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740123678; cv=none; b=K6DS54E7gQhcYfYZGFnjlhbMhhHyO+uY9LNqE0UcB685/d7E6DCJBAPEEwrwumvJfgMih+2O1ZN+86jxQwodmI5l3NmX8GrezdV7PreDEolywL+dNAf8JbpviWPEyjeUtsmxmJD2Nu29zTaPEUYpD/EEzIsifkldiv0BfgxnQSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740123678; c=relaxed/simple;
	bh=ySYv5oAl7rxrIABHsrIW5uaZdj2vv/AflGOAoDAa3zg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QnvsRd2ECZJENxO+73+stfsRCn0zdNzNHDSIK/I0bjju+jdMM2M9uty2tS8I3gnnkrkjlJt7SdcFWlniv0fMZF2D32/QHK2Idy3iaXXBmhl+QODILCJfvVrdhShUbSpC/1otSLH/NPH3gOAX0Pa9u7dN4rOhgmphSpyEfeuMb1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=m53jZtQX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L6POOb020255;
	Fri, 21 Feb 2025 07:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/cL+CCL0X6aLAARkr+HxhuD5UGrruT/1yZpL7/mWVpg=; b=m53jZtQXJOfXSn89
	mHn3bz7mDFNWSeGuVg4toZExK4wPH8hXRIRC9uWmC2ESbtrtAB2m79tYhYY8fEWM
	NocuMQt8IeVESThZ0n6VEVdyvYuM6p1G7oFoWzmyuA9nbD/+avkFHTujyGkeujcZ
	jjToDTs9c43Pn0k6B86aN/rnJU5zmeLionRhP99EZOnjP8lgpji1MNYNdzHoZZRa
	Ny8Zq/ihrCc6cnV75kDbL48a9qzlxg/bLxhKJsdit98+T6XgIuuoMKfTEevXB4Ds
	+nguQsk9oZhIsoHT4SLnsrvPlWEYu9NjOUAWdwNNm/8q3bwKjRXytLmAH7PayhD3
	IimCsg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x06t3mmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:08 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L7f7pv023798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 07:41:07 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 23:41:00 -0800
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Fri, 21 Feb 2025 15:40:28 +0800
Subject: [PATCH 1/5] dt-bindings: arm: Add Coresight device Trace NOC
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-trace-noc-driver-v1-1-0a23fc643217@quicinc.com>
References: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
In-Reply-To: <20250221-trace-noc-driver-v1-0-0a23fc643217@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740123656; l=3425;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=ySYv5oAl7rxrIABHsrIW5uaZdj2vv/AflGOAoDAa3zg=;
 b=17a/d3ZqlHjVIDZY9CzvuPLH4VuYYNMHJu617TMR4rxMfSamQ1h8SFu5ac/wNIQW857iCDvjg
 kaBhlMulT3eAq/hNMWmlqRm58kGDaKPm/Bt4vQ13z232X3/4yvu//Dz
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: M6Zmf43fv4HFpO_XqBI4L2shkAoCfu67
X-Proofpoint-GUID: M6Zmf43fv4HFpO_XqBI4L2shkAoCfu67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=1
 clxscore=1011 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210056

Adds new coresight-tnoc.yaml file describing the bindings required
to define Trace NOC in the device trees.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 .../bindings/arm/qcom,coresight-tnoc.yaml          | 107 +++++++++++++++++++++
 1 file changed, 107 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..b8c1aaf014fb483fd960ec55d1193fb3f66136d2
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -0,0 +1,107 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Ttrace NOC(Network On Chip)
+
+maintainers:
+  - yuanfang Zhang <quic_yuanfang@quicinc.com>
+
+description:
+  The Trace NoC is an integration hierarchy which is a replacement of Dragonlink tile configuration.
+  It brings together debug component like TPDA, funnel and interconnect Trace Noc which collects trace
+  from subsystems and transfers to QDSS sink.
+
+  It sits in the different subsystem of SOC and aggregates the trace and transports it to Aggregation TNoC
+  or to QDSS trace sink eventually. Trace NoC embeds bridges for all the interfaces(APB, ATB, QPMDA & NTS).
+
+  Trace NoC can take inputs from different trace sources i.e. ATB, QPMDA.
+
+# Need a custom select here or 'arm,primecell' will match on lots of nodes
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - qcom,coresight-tnoc
+  required:
+    - compatible
+
+properties:
+  $nodename:
+    pattern: "^tn(@[0-9a-f]+)$"
+  compatible:
+    items:
+      - const: qcom,coresight-tnoc
+      - const: arm,primecell
+
+  reg:
+    minItems: 1
+    maxItems: 2
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+  in-ports:
+    description: |
+      Input connections from subsystem to TNoC
+    $ref: /schemas/graph.yaml#/properties/ports
+
+  out-ports:
+    description: |
+      Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port:
+        description: |
+          Output connections from the TNoC to Aggreg TNoC or to legacy CoreSight trace bus.
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - in-ports
+  - out-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    tn@109ab000  {
+      compatible = "qcom,coresight-tnoc", "arm,primecell";
+      reg = <0x0 0x109ab000  0x0 0x4200>;
+
+      clocks = <&aoss_qmp>;
+      clock-names = "apb_pclk";
+
+      in-ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          tn_ag_in_tpdm_gcc: endpoint {
+            remote-endpoint = <&tpdm_gcc_out_tn_ag>;
+          };
+        };
+      };
+
+      out-ports {
+        port {
+          tn_ag_out_funnel_in1: endpoint {
+            remote-endpoint = <&funnel_in1_in_tn_ag>;
+          };
+        };
+      };
+    };
+...

-- 
2.34.1


