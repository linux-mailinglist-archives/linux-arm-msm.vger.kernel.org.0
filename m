Return-Path: <linux-arm-msm+bounces-22502-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 69923905AF4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 20:32:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEA01B25A28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70226A031;
	Wed, 12 Jun 2024 18:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ODbk6cFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AD35FBB7;
	Wed, 12 Jun 2024 18:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217077; cv=none; b=Mu97ynS4yO8Xy+ccAUD2pXjdcSZ23BFUgLJvFRnb3wmGRAvRNMf6kLMpWwdY2wVjOWs+qqAEztpopSsiEH0v63amCT0qCi4w4uIl41uULQlrZ/yF8efpkXgegtGW2dR7H02yIw4phUHSATXXakI8A2e62o/k6LG3CaOTSsdM8FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217077; c=relaxed/simple;
	bh=oou1jM5VFq/2y2bcsmpwOiyQfeAuRop+eiyLGDLCMxU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qQsxUZCm297ADWf1W0sz+BiOvti2uNSvLM2HJ2uQ61E2Xucc0+vk22rxmHbQKZVOy5sSU5TSdW044I9diV45J5chAKENIKrctviN/VR0EE83cmjVIBmXCT6sjtEGUifAFNUoORlq/LIGkEoYjW0Fg3i5qiBNwI4Qsn8GcmqrrvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ODbk6cFg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45CGOUTF011256;
	Wed, 12 Jun 2024 18:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j5G049VqCQMeE3w0OXR+7RWXAi7MH2G9dMoTlQcaq/4=; b=ODbk6cFgyhN6+Stw
	xKoFPfFysI6gAsAJ+lmQP0CRNgysllSA4BxPaNxfODtAtQSBidlPfnIDOiPrcoHd
	USM0PWwlR7vuDrsoViywASn9GTQKbiVVFzH1iywKW1VY03L6I99qlaR/iZSglRu9
	OZ2w/xwBBwV2nWOHcVOGyVUjFgILkKinU2Lh7QN65r/0LfO9filA4nvD7ExBJf2s
	ecFm0Af4i8pYPl9mLyGc9wHjI9ZAAmNoz7uN6/coobeXKlrjUs7uwgUZQ9WANoGl
	43U5DlTeP7eLFgJhteleI/+AXEZfiXiLdsGLUPF91/7kx9L0iOq0F3KKankiYFRq
	8DsKwQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yq83wh5ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:31:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45CIV2qV027832
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 18:31:02 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Jun 2024 11:30:57 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>
Subject: [RFC V2 1/4] dt-bindings: firmware: Add support for QCOM Vendor Protocol
Date: Thu, 13 Jun 2024 00:00:28 +0530
Message-ID: <20240612183031.219906-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240612183031.219906-1-quic_sibis@quicinc.com>
References: <20240612183031.219906-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4P1iCEa0ItLAyj1ZsloIKOQNT-aT8dT-
X-Proofpoint-ORIG-GUID: 4P1iCEa0ItLAyj1ZsloIKOQNT-aT8dT-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_09,2024-06-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120131

Document the SCMI QCOM Vendor protocol v1.0 bindings and the various memory
buses that can be monitored and scaled by memory latency governor hosted
on it.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---

v1:
* Add missing bindings for the protocol. [Konrad/Dmitry]
* Use alternate bindings. [Dmitry/Konrad]

 .../bindings/firmware/arm,scmi.yaml           |  21 ++
 .../bindings/soc/qcom/qcom,scmi-memlat.yaml   | 243 ++++++++++++++++++
 include/dt-bindings/soc/qcom,scmi-vendor.h    |  22 ++
 3 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
 create mode 100644 include/dt-bindings/soc/qcom,scmi-vendor.h

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 7de2c29606e5..21e4da53d02c 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -278,6 +278,27 @@ properties:
     required:
       - reg
 
+  protocol@80:
+    $ref: '#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
+      memlat-dvfs:
+        type: object
+        additionalProperties: false
+        description:
+          The list of all memory buses that can be monitored and scaled by the
+          memory latency governor running on the SCMI controller.
+
+        patternProperties:
+          '^memory-[0-9]$':
+            type: object
+            $ref: /schemas/soc/qcom/qcom,scmi-memlat.yaml#
+            unevaluatedProperties: false
+
 additionalProperties: false
 
 $defs:
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
new file mode 100644
index 000000000000..c6e3d163c4a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
@@ -0,0 +1,243 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,scmi-memlat.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SCMI Memory Bus nodes
+
+maintainers:
+  - Sibi Sankar <quic_sibis@quicinc.com>
+
+description: |
+  This binding describes the various memory buses that can be monitored and scaled
+  by memory latency governor running on the CPU Control Processor (SCMI controller).
+
+properties:
+  qcom,memory-type:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2]
+    description:
+      Memory Bus Identifier
+        0 = QCOM_MEM_TYPE_DDR
+        1 = QCOM_MEM_TYPE_LLCC
+        2 = QCOM_MEM_TYPE_DDR_QOS
+
+  freq-table-hz:
+    items:
+      items:
+        - description: Minimum frequency of the memory bus in Hz
+        - description: Maximum frequency of the memory bus in Hz
+
+patternProperties:
+  '^monitor-[0-9]$':
+    type: object
+    unevaluatedProperties: false
+    description:
+      The list of all monitors detecting the memory latency bound workloads using
+      various counters.
+
+    properties:
+      qcom,compute-type:
+        description:
+          Monitors of type compute perform bus dvfs based on a rudimentary CPU
+          frequency to memory frequency map.
+        type: boolean
+
+      qcom,ipm-ceil:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Monitors having this property perform bus dvfs based on the same
+          rudimentary table but the scaling is performed only if the calculated
+          IPM (Instruction Per Misses) exceeds the given ceiling.
+
+      qcom,cpulist:
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description:
+          List of phandles to the CPUs nodes whose frequency and IPM are to be
+          monitored.
+
+      operating-points-v2: true
+      opp-table:
+        type: object
+
+    required:
+      - qcom,cpulist
+      - operating-points-v2
+      - opp-table
+
+    allOf:
+      - if:
+          properties:
+            qcom,compute-type: false
+        then:
+          required:
+            - qcom,ipm-ceil
+
+      - if:
+          properties:
+            qcom,ipm-ceil: false
+        then:
+          required:
+            - qcom,compute-type
+
+required:
+  - qcom,memory-type
+  - freq-table-hz
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/qcom,scmi-vendor.h>
+
+    firmware {
+        scmi {
+            compatible = "arm,scmi";
+            mboxes = <&cpucp_mbox 0>, <&cpucp_mbox 2>;
+            mbox-names = "tx", "rx";
+            shmem = <&cpu_scp_lpri0>, <&cpu_scp_lpri1>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            protocol@80 {
+                reg = <0x80>;
+
+                memlat-dvfs {
+                    memory-0 {
+                        qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
+                        freq-table-hz = /bits/ 64 <200000000 4224000000>;
+
+                        monitor-0 {
+                            qcom,ipm-ceil = <20000000>;
+                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
+                                            &CPU8 &CPU9 &CPU10 &CPU11>;
+                            operating-points-v2 = <&memory0_monitor0_opp_table>;
+
+                            memory0_monitor0_opp_table: opp-table {
+                                compatible = "operating-points-v2";
+
+                                opp-999000000 {
+                                    opp-hz = /bits/ 64 <999000000 547000000>;
+                                };
+
+                                opp-1440000000 {
+                                    opp-hz = /bits/ 64 <1440000000 768000000>;
+                                };
+
+                                opp-1671000000 {
+                                    opp-hz = /bits/ 64 <1671000000 1555000000>;
+                                };
+
+                                opp-2189000000 {
+                                    opp-hz = /bits/ 64 <2189000000 2092000000>;
+                                };
+
+                                opp-2516000000 {
+                                    opp-hz = /bits/ 64 <2516000000 3187000000>;
+                                };
+
+                                opp-3860000000 {
+                                    opp-hz = /bits/ 64 <3860000000 4224000000>;
+                                };
+                            };
+                        };
+
+                        monitor-1 {
+                            qcom,compute-type;
+                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
+                                            &CPU8 &CPU9 &CPU10 &CPU11>;
+                            operating-points-v2 = <&memory0_monitor1_opp_table>;
+
+                            memory0_monitor1_opp_table: opp-table {
+                                compatible = "operating-points-v2";
+
+                                opp-1440000000 {
+                                        opp-hz = /bits/ 64 <1440000000 200000000>;
+                                };
+
+                                opp-2189000000 {
+                                        opp-hz = /bits/ 64 <2189000000 768000000>;
+                                };
+
+                                opp-2516000000 {
+                                        opp-hz = /bits/ 64 <2516000000 1555000000>;
+                                };
+
+                                opp-3860000000 {
+                                        opp-hz = /bits/ 64 <3860000000 4224000000>;
+                                };
+                            };
+                        };
+                    };
+
+                    memory-1 {
+                        qcom,memory-type = <QCOM_MEM_TYPE_LLCC>;
+                        freq-table-hz = /bits/ 64 <300000000 1067000000>;
+
+                        monitor-0 {
+                            qcom,ipm-ceil = <20000000>;
+                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
+                                            &CPU8 &CPU9 &CPU10 &CPU11>;
+                            operating-points-v2 = <&memory1_monitor0_opp_table>;
+
+                            memory1_monitor0_opp_table: opp-table {
+                                compatible = "operating-points-v2";
+
+                                opp-999000000 {
+                                    opp-hz = /bits/ 64 <999000000 300000000>;
+                                };
+
+                                opp-1440000000 {
+                                    opp-hz = /bits/ 64 <1440000000 466000000>;
+                                };
+
+                                opp-1671000000 {
+                                    opp-hz = /bits/ 64 <1671000000 600000000>;
+                                };
+
+                                opp-2189000000 {
+                                    opp-hz = /bits/ 64 <2189000000 806000000>;
+                                };
+
+                                opp-2516000000 {
+                                    opp-hz = /bits/ 64 <2516000000 933000000>;
+                                };
+
+                                opp-3860000000 {
+                                    opp-hz = /bits/ 64 <3860000000 1066000000>;
+                                };
+                            };
+                        };
+                    };
+
+                    memory-2 {
+                        qcom,memory-type = <QCOM_MEM_TYPE_DDR_QOS>;
+                        freq-table-hz = /bits/ 64 <QCOM_DDR_LEVEL_AUTO QCOM_DDR_LEVEL_PERF>;
+
+                        monitor-0 {
+                            qcom,ipm-ceil = <20000000>;
+                            qcom,cpulist = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
+                                            &CPU8 &CPU9 &CPU10 &CPU11>;
+                            operating-points-v2 = <&memory2_monitor0_opp_table>;
+
+                            memory2_monitor0_opp_table: opp-table {
+                                compatible = "operating-points-v2";
+
+                                opp-2189000000 {
+                                    opp-hz = /bits/ 64 <2189000000>;
+                                    opp-level = <QCOM_DDR_LEVEL_AUTO>;
+                                };
+
+                                opp-3860000000 {
+                                    opp-hz = /bits/ 64 <3860000000>;
+                                    opp-level = <QCOM_DDR_LEVEL_PERF>;
+                                };
+                            };
+                        };
+                    };
+                };
+            };
+        };
+    };
diff --git a/include/dt-bindings/soc/qcom,scmi-vendor.h b/include/dt-bindings/soc/qcom,scmi-vendor.h
new file mode 100644
index 000000000000..7ae8d8d5623b
--- /dev/null
+++ b/include/dt-bindings/soc/qcom,scmi-vendor.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+#ifndef __DT_BINDINGS_QCOM_SCMI_VENDOR_H
+#define __DT_BINDINGS_QCOM_SCMI_VENDOR
+
+/* Memory IDs */
+#define QCOM_MEM_TYPE_DDR	0x0
+#define QCOM_MEM_TYPE_LLCC	0x1
+#define QCOM_MEM_TYPE_DDR_QOS	0x2
+
+/*
+ * QCOM_MEM_TYPE_DDR_QOS supports the following states.
+ *
+ * %QCOM_DDR_LEVEL_AUTO:	DDR operates with LPM enabled
+ * %QCOM_DDR_LEVEL_PERF:	DDR operates with LPM disabled
+ */
+#define QCOM_DDR_LEVEL_AUTO	0x0
+#define QCOM_DDR_LEVEL_PERF	0x1
+
+#endif /* __DT_BINDINGS_QCOM_SCMI_VENDOR_H */
-- 
2.34.1


