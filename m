Return-Path: <linux-arm-msm+bounces-24910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7529247E6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 21:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 988C8282378
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 19:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3311CD5C3;
	Tue,  2 Jul 2024 19:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="S8ImlkQU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D0B1CB301;
	Tue,  2 Jul 2024 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719947718; cv=none; b=BR2oeTAMQVHW8dw8Ioi31pxpzl+HylhjmQm2iZyaDi+tfdJljnderFWc0u3n6ZxKbCewZ0Q0QTSDFCHTXSXVapT9XHJaOxHA8A7F1H/6v0td9h8aiSzwNB/hvvYPZreWwSl8qO8yEN87/QC/b7IKMuuv6XU1zEMvRd8x0+XzOO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719947718; c=relaxed/simple;
	bh=H+e64wW03gZxsOvun7Eo0x0T46AzDs+m7L1uAOf2Z8E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VTqBwSdMdzpoTvOqA7khwd23K5GOVmDkaYrng0mhb8bcnYOYWPVWkikS5PIM2+JAa5orCw3J5YSREU8p5yEJ40L27a9P9jvqj5usiixkIItQwySBA10oeCa9+sVNzCS4aDaOr4ppZYMPTc18XLxTYAU54+fh0g+u4NEgqScNVEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=S8ImlkQU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 462HA7k4030531;
	Tue, 2 Jul 2024 19:15:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z0DBqS5vR5+lA9kDy9ecaSugZpkGCNtPOOHlIzjoQ18=; b=S8ImlkQU8qnyUxxB
	X51ERSPrvsYOdHmryJ6MFt9Ub044VisXlNTUTIi664xpt9VG6p64Z9q8b9GdVJBk
	p7D1GGPq+3aXKWYc89lWyKYKCeevEFUYnAlYRwqYOjvF6iw/4yfZfV8DrG/EGGRj
	ycGsKoPhULc7eqVmUYdoFCjbAx57XwB819g09soQkqX7HVM547wdMoivWypogvj4
	OHR36jWpNffzKJlMCp9V/dpuH4gXCksadYf4wttimdTYuvO8xk3s/Du46w2fRTSY
	qCw8Pj7AQMvkfEsmnv3vJ2oki9ejPH0raWgwrsIYY8qOe4MW27X5FNHf9bYnBcug
	kOO0kg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4029uxesat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Jul 2024 19:15:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 462JF5qF031767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 2 Jul 2024 19:15:05 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 2 Jul 2024 12:15:00 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>
Subject: [RFC V3 1/4] dt-bindings: firmware: Document bindings for ARM SCMI QCOM Vendor Protocol
Date: Wed, 3 Jul 2024 00:44:37 +0530
Message-ID: <20240702191440.2161623-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240702191440.2161623-1-quic_sibis@quicinc.com>
References: <20240702191440.2161623-1-quic_sibis@quicinc.com>
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
X-Proofpoint-GUID: 4mKv3k27xcXZGdFjevvYCRbZ_uknNAEy
X-Proofpoint-ORIG-GUID: 4mKv3k27xcXZGdFjevvYCRbZ_uknNAEy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-02_14,2024-07-02_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407020140

Document the various memory buses that can be monitored and scaled by the
memory latency governor hosted by the ARM SCMI QCOM Vendor protocol v1.0.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---

Adding a reg property in scmi-memlat.yaml seems incorrect/superfluous
but without it I see the following errors:

Err Logs:
protocol@80: 'reg' does not match any of the regexes: '^memory-[0-9]$', 'pinctrl-[0-9]+'
protocol@80: Unevaluated properties are not allowed ('memory-0', 'memory-1', 'memory-2' were unexpected)

v2:
* Drop container dvfs memlat container node. [Rob]
* Move scmi-memlat.yaml to protocol level given that a lot of vendors might end up
  using the same protocol number. [Rob]
* Replace qcom,cpulist with the standard "cpus" property. [Rob]
* Fix up compute-type/ipm-ceil required. [Rob]

 .../bindings/firmware/arm,scmi.yaml           |  15 ++
 .../bindings/soc/qcom/qcom,scmi-memlat.yaml   | 242 ++++++++++++++++++
 include/dt-bindings/soc/qcom,scmi-vendor.h    |  22 ++
 3 files changed, 279 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
 create mode 100644 include/dt-bindings/soc/qcom,scmi-vendor.h

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 4d823f3b1f0e..a4022682e5ca 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -284,6 +284,21 @@ properties:
     required:
       - reg
 
+  protocol@80:
+    type: object
+    allOf:
+      - $ref: '#/$defs/protocol-node'
+      - $ref: /schemas/soc/qcom/qcom,scmi-memlat.yaml#
+
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
+    required:
+      - reg
+
 additionalProperties: false
 
 $defs:
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
new file mode 100644
index 000000000000..915a6bf5697f
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,scmi-memlat.yaml
@@ -0,0 +1,242 @@
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
+description:
+  This binding describes the various memory buses that can be monitored and scaled
+  by memory latency governor running on the CPU Control Processor (SCMI controller).
+
+properties:
+  reg:
+    maxItems: 1
+
+patternProperties:
+  '^memory-[0-9]$':
+    type: object
+    description:
+      The list of all memory buses that can be monitored and scaled by the
+      memory latency governor running on the SCMI controller.
+
+    unevaluatedProperties: false
+
+    properties:
+      qcom,memory-type:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        enum: [0, 1, 2]
+        description: |
+          Memory Bus Identifier
+          0 = QCOM_MEM_TYPE_DDR
+          1 = QCOM_MEM_TYPE_LLCC
+          2 = QCOM_MEM_TYPE_DDR_QOS
+
+      freq-table-hz:
+        items:
+          items:
+            - description: Minimum frequency of the memory bus in Hz
+            - description: Maximum frequency of the memory bus in Hz
+
+    patternProperties:
+      '^monitor-[0-9]$':
+        type: object
+        unevaluatedProperties: false
+        description:
+          The list of all monitors detecting the memory latency bound workloads using
+          various counters.
+
+        properties:
+          qcom,compute-type:
+            description:
+              Monitors of type compute perform bus dvfs based on a rudimentary CPU
+              frequency to memory frequency map.
+            type: boolean
+
+          qcom,ipm-ceil:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            description:
+              Monitors having this property perform bus dvfs based on the same
+              rudimentary table but the scaling is performed only if the calculated
+              IPM (Instruction Per Misses) exceeds the given ceiling.
+
+          cpus:
+            $ref: /schemas/types.yaml#/definitions/phandle-array
+            description:
+              Should be a list of phandles to CPU nodes (as described in
+              Documentation/devicetree/bindings/arm/cpus.yaml).
+
+          operating-points-v2: true
+          opp-table:
+            type: object
+
+        required:
+          - cpus
+          - operating-points-v2
+
+        oneOf:
+          - required: [ 'qcom,compute-type' ]
+          - required: [ 'qcom,ipm-ceil' ]
+
+    required:
+      - qcom,memory-type
+      - freq-table-hz
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
+                memory-0 {
+                    qcom,memory-type = <QCOM_MEM_TYPE_DDR>;
+                    freq-table-hz = /bits/ 64 <200000000 4224000000>;
+
+                    monitor-0 {
+                        qcom,ipm-ceil = <20000000>;
+                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
+                                &CPU8 &CPU9 &CPU10 &CPU11>;
+                        operating-points-v2 = <&memory0_monitor0_opp_table>;
+
+                        memory0_monitor0_opp_table: opp-table {
+                            compatible = "operating-points-v2";
+
+                            opp-999000000 {
+                                opp-hz = /bits/ 64 <999000000 547000000>;
+                            };
+
+                            opp-1440000000 {
+                                opp-hz = /bits/ 64 <1440000000 768000000>;
+                            };
+
+                            opp-1671000000 {
+                                opp-hz = /bits/ 64 <1671000000 1555000000>;
+                            };
+
+                            opp-2189000000 {
+                                opp-hz = /bits/ 64 <2189000000 2092000000>;
+                            };
+
+                            opp-2516000000 {
+                                opp-hz = /bits/ 64 <2516000000 3187000000>;
+                            };
+
+                            opp-3860000000 {
+                                opp-hz = /bits/ 64 <3860000000 4224000000>;
+                            };
+                        };
+                    };
+
+                    monitor-1 {
+                        qcom,compute-type;
+                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
+                                &CPU8 &CPU9 &CPU10 &CPU11>;
+                        operating-points-v2 = <&memory0_monitor1_opp_table>;
+
+                        memory0_monitor1_opp_table: opp-table {
+                            compatible = "operating-points-v2";
+
+                            opp-1440000000 {
+                                    opp-hz = /bits/ 64 <1440000000 200000000>;
+                            };
+
+                            opp-2189000000 {
+                                    opp-hz = /bits/ 64 <2189000000 768000000>;
+                            };
+
+                            opp-2516000000 {
+                                    opp-hz = /bits/ 64 <2516000000 1555000000>;
+                            };
+
+                            opp-3860000000 {
+                                    opp-hz = /bits/ 64 <3860000000 4224000000>;
+                            };
+                        };
+                    };
+                };
+
+                memory-1 {
+                    qcom,memory-type = <QCOM_MEM_TYPE_LLCC>;
+                    freq-table-hz = /bits/ 64 <300000000 1067000000>;
+
+                    monitor-0 {
+                        qcom,ipm-ceil = <20000000>;
+                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
+                                &CPU8 &CPU9 &CPU10 &CPU11>;
+                        operating-points-v2 = <&memory1_monitor0_opp_table>;
+
+                        memory1_monitor0_opp_table: opp-table {
+                            compatible = "operating-points-v2";
+
+                            opp-999000000 {
+                                opp-hz = /bits/ 64 <999000000 300000000>;
+                            };
+
+                            opp-1440000000 {
+                                opp-hz = /bits/ 64 <1440000000 466000000>;
+                            };
+
+                            opp-1671000000 {
+                                opp-hz = /bits/ 64 <1671000000 600000000>;
+                            };
+
+                            opp-2189000000 {
+                                opp-hz = /bits/ 64 <2189000000 806000000>;
+                            };
+
+                            opp-2516000000 {
+                                opp-hz = /bits/ 64 <2516000000 933000000>;
+                            };
+
+                            opp-3860000000 {
+                                opp-hz = /bits/ 64 <3860000000 1066000000>;
+                            };
+                        };
+                    };
+                };
+
+                memory-2 {
+                    qcom,memory-type = <QCOM_MEM_TYPE_DDR_QOS>;
+                    freq-table-hz = /bits/ 64 <QCOM_DDR_LEVEL_AUTO QCOM_DDR_LEVEL_PERF>;
+
+                    monitor-0 {
+                        qcom,ipm-ceil = <20000000>;
+                        cpus = <&CPU0 &CPU1 &CPU2 &CPU3 &CPU4 &CPU5 &CPU6 &CPU7
+                                &CPU8 &CPU9 &CPU10 &CPU11>;
+                        operating-points-v2 = <&memory2_monitor0_opp_table>;
+
+                        memory2_monitor0_opp_table: opp-table {
+                            compatible = "operating-points-v2";
+
+                            opp-2189000000 {
+                                opp-hz = /bits/ 64 <2189000000>;
+                                opp-level = <QCOM_DDR_LEVEL_AUTO>;
+                            };
+
+                            opp-3860000000 {
+                                opp-hz = /bits/ 64 <3860000000>;
+                                opp-level = <QCOM_DDR_LEVEL_PERF>;
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


