Return-Path: <linux-arm-msm+bounces-60943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 113F5AD5249
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 12:43:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F04318820DC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 10:43:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F4127145D;
	Wed, 11 Jun 2025 10:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="hqZuBbCj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC84282FA;
	Wed, 11 Jun 2025 10:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638594; cv=none; b=Po9Ax3WD2fH2nWxssjv7vIZt+nG5T05wclMHkt/g/WbXeTjPshalKCZ7VNv0OGNyJ9gRGpI2B5RIY+CziTVm0zLqeuZovOGYK44aQ7Jb7oFkzFFymf1F1zze24+iAjVGYg05O1vtSYeqKTbnIvQ3T8//Q5wX4abZjIz2S8rqWp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638594; c=relaxed/simple;
	bh=AFlPDAfvpFRs502y4BiSUg4V6YbG9yCR4NGBIEHaSpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=RVkiKeJTnuFLtHl4cpernP25yWx4ZYbLBU96sp9+VYYXOKrzeSxboQOEeaeCw8o8QyW8kzR14MDm+LCBz19Uuuw80Tb7l5pO3yeCP1Ecnn5uHbXXxEFPFTJSTIHhPiA4Y8i1fUZQ9ucFlXo4Suzrll3eqxSaaxwSwBu09JPBK9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=hqZuBbCj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DLGx011142;
	Wed, 11 Jun 2025 10:43:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	evrkd87jfn0W/wAyuRRT/tRWfSuU3fmS4lf2bubqfAc=; b=hqZuBbCjJpjX0Pk1
	BmojHaOlKxCW8seJ7WOknnd3OyjRidNKRgSiMteiVONxi6oQdN14z42PdXe/hOwa
	NUdNFSD0McSnff5420APJC3Z8cqMo0rAVlYCOV81S24qGTaId7CRj1JSSXc+Rqm2
	SOkog4U/GZIE0OXgRj2ZSll0dJ7sZmlZYID3Gf11l4yKNffRy2L3v8xKRu0O5h4K
	2Sq1VV8zCuvnB9k3q/9k0QK4oljf4JsKHmdcVcDsRYF8pKgbivQrO/Fju3RlE3PJ
	7uKPUISiDZAFYN8VVfAmDIzdJAUHLDaOl26NDjAHOXFWME9bfnC0iaVYQ57cx1CG
	2PP34g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpvaqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:43:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55BAh3LY016200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 10:43:03 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Jun 2025 03:42:59 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Date: Wed, 11 Jun 2025 18:42:21 +0800
Subject: [PATCH v10 1/2] dt-bindings: arm: Add device Trace Network On Chip
 definition
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250611-trace-noc-v10-1-a83b5c63da34@quicinc.com>
References: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
In-Reply-To: <20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749638575; l=3706;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=AFlPDAfvpFRs502y4BiSUg4V6YbG9yCR4NGBIEHaSpc=;
 b=n1jVq1uuBPSFz+gY94JOd1cu/H6pSYLMvA8Mp08lifMdaIAjKUA9xWvMw631uaBsXrqAasW+U
 jlisVmriQr4AQLP97KYSd2xdt4Uex9NNE+3xTzVLnYrT/bEwSmzzewK
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68495db7 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=APcPAnuBUoPLjZ3N-PUA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5MCBTYWx0ZWRfX1xyu6v3LTgmy
 7R+YFkTNS/A7xUIV2eNp8oKmHiiuM6iNAk4jytOXy0qVnLKyVBTyNUQbJvIFB+vkcqS4qSBy9Lb
 jwWCGC3KOVkzN6PnnzVPbNc3soWWGAT4jMRaxSdnI4d+isIUyW/W9URFscyRqVvviMb/x1mr+is
 BvzUOf3BVyplpTjpTNqHN59gkwp3JYmFatYW80jUoc9URvrTodGJHOJpXPkwcNbUdW9ej2QpPjL
 ZwGrqwJyrPjdSgov6xfBcbI+F2Pg4XVN2PLZzyR+dNnXtaP59Jxs3N/QlfEutREzj/TD0gTQj2l
 kC0lLvGDiKQDgEmCh584wyGO5nS2MNZXXjsEEScQ9GhcDxBuCObGQyNGkRtc/8q531Ifv/moRCM
 BRXVDuQjp/huw+FO3UyuAvNohvYRbl8WLw9lYt8bTFRhqOFGdsvrFLe3YHmsSK/omMD2nXkp
X-Proofpoint-GUID: aTl36BpolgaVWALcR-usMWYWU5BB4cmg
X-Proofpoint-ORIG-GUID: aTl36BpolgaVWALcR-usMWYWU5BB4cmg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=2 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110090

Add a new coresight-tnoc.yaml file to describe the bindings required to
define Trace Network On Chip (TNOC) in device trees. TNOC is an
integration hierarchy which is a hardware component that integrates the
functionalities of TPDA and funnels. It collects trace form subsystems
and transfers to coresight sink.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
 .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9d1c93a9ade3ff14ede4a8d1481782776cf47be9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tnoc.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/qcom,coresight-tnoc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Trace Network On Chip - TNOC
+
+maintainers:
+  - Yuanfang Zhang <quic_yuanfang@quicinc.com>
+
+description: >
+  The Trace Network On Chip (TNOC) is an integration hierarchy hardware
+  component that integrates the functionalities of TPDA and funnels.
+
+  It sits in the different subsystem of SOC and aggregates the trace and
+  transports it to Aggregation TNOC or to coresight trace sink eventually.
+  TNOC embeds bridges for all the interfaces APB, ATB, TPDA and NTS (Narrow
+  Time Stamp).
+
+  TNOC can take inputs from different trace sources i.e. ATB, TPDM.
+
+  Note this binding is specifically intended for Aggregator TNOC instances.
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
+
+  compatible:
+    items:
+      - const: qcom,coresight-tnoc
+      - const: arm,primecell
+
+  reg:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: apb_pclk
+
+  clocks:
+    items:
+      - description: APB register access clock
+
+  in-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    patternProperties:
+      '^port(@[0-9a-f]{1,2})?$':
+        description: Input connections from CoreSight Trace Bus
+        $ref: /schemas/graph.yaml#/properties/port
+
+  out-ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    additionalProperties: false
+
+    properties:
+      port:
+        description:
+          Output connection to CoreSight Trace Bus
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
+      reg = <0x109ab000 0x4200>;
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


