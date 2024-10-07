Return-Path: <linux-arm-msm+bounces-33318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DE344992443
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 08:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F08CFB23159
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 06:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC4715AAC8;
	Mon,  7 Oct 2024 06:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GznUnUDZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D311013D53E;
	Mon,  7 Oct 2024 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728281461; cv=none; b=uVQ4mo4bWr+MFU+OvlmcIzNupxjgtQ23SFdMN8qXBHzhrEejREFjXQwuAzVuAAeVmbe/ENJljFskMve6knJ/PEazdNYQh7tNvlZnlKWET8NoJ8YZkxJGthmCzt3p3W4H0VKpIBfyfRn1UwCnWJ99MoBTIZhOiEVqWFoKJH/Ofzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728281461; c=relaxed/simple;
	bh=dtzFGR9keZEM55e8WmZBhEIBdx7tvCtDpagYXUy6tls=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G/h52F//IauHepZFEBXuBgpiYQA2pRaBPfbRm2dQI2dE5Pf3rs0DwDa1kmcfadGZO73Ww+9+lxOMk0tAHzGz0VR9g9AceaxVTQ4Yx2osdyhORiEZwq8DGteRDd8C6GQynmguc3MteudXBeaPAodLbELyssklbGxpIh0bgi+ffKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GznUnUDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4974SvFS024105;
	Mon, 7 Oct 2024 06:10:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iB0AI6hLDEK+MEnmfuuaBnzCQbs/s8jNuIuw+FIqfGk=; b=GznUnUDZW3JOmnaV
	c+0zSHBaYYsXjLsdI8WNNXGhMBla7AHdqmkP4Ie0ICo14nMEXlv6X11D7hVxt/OV
	8PtzzrJCSIe5Zpbl6m4wPRlAxgKpET3hrmLnIT/JvTUIbPwWeOCZjDsvi9+uaW7B
	+KmVDYZ+AaUIKIcYgAhlBxsR69aKAk43VCNLK/hjNxFZh0BML4seTB5SdZEJaRTB
	h9my9kIMqhRJBFygp7Ipm7HVscsxjOIb+TF8Jpj1PJ1XrkR/Pu7VPUDafygkd2aR
	udtAkjHQHSiMj0ABDga2YFx92Lud3XPsN7h0mqaB+qNWGO80jdpmC7dt2ikG3yI7
	DVwhfQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 422xtb35n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 06:10:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4976Alkm009204
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Oct 2024 06:10:47 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 6 Oct 2024 23:10:42 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <quic_rgottimu@quicinc.com>, <quic_kshivnan@quicinc.com>,
        <quic_sibis@quicinc.com>, <conor+dt@kernel.org>,
        <arm-scmi@vger.kernel.org>
Subject: [PATCH V4 1/5] dt-bindings: firmware: Document bindings for QCOM SCMI Generic Extension
Date: Mon, 7 Oct 2024 11:40:19 +0530
Message-ID: <20241007061023.1978380-2-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241007061023.1978380-1-quic_sibis@quicinc.com>
References: <20241007061023.1978380-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: olJh3G0kE16WGSuhFmmxu7epI8wpxwKp
X-Proofpoint-GUID: olJh3G0kE16WGSuhFmmxu7epI8wpxwKp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410070041

Document the various memory buses that can be monitored and scaled by
the memory latency governor hosted by the QCOM SCMI Generic Extension
Protocol v1.0.

Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---

v3:
* Restructure the bindings to mimic IMX [Christian]

 .../bindings/firmware/arm,scmi.yaml           |   1 +
 .../bindings/firmware/qcom,scmi-memlat.yaml   | 246 ++++++++++++++++++
 .../dt-bindings/firmware/qcom,scmi-memlat.h   |  22 ++
 3 files changed, 269 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
 create mode 100644 include/dt-bindings/firmware/qcom,scmi-memlat.h

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 54d7d11bfed4..1d405f429168 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -24,6 +24,7 @@ description: |
 
 anyOf:
   - $ref: /schemas/firmware/nxp,imx95-scmi.yaml
+  - $ref: /schemas/firmware/qcom,scmi-memlat.yaml
 
 properties:
   $nodename:
diff --git a/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
new file mode 100644
index 000000000000..0e8ea6dacd6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/qcom,scmi-memlat.yaml
@@ -0,0 +1,246 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/qcom,scmi-memlat.yaml#
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
+  protocol@80:
+    $ref: '/schemas/firmware/arm,scmi.yaml#/$defs/protocol-node'
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        const: 0x80
+
+    patternProperties:
+      '^memory-[0-9]$':
+        type: object
+        unevaluatedProperties: false
+        description:
+          The list of all memory buses that can be monitored and scaled by the
+          memory latency governor running on the SCMI controller.
+
+        properties:
+          qcom,memory-type:
+            $ref: /schemas/types.yaml#/definitions/uint32
+            enum: [0, 1, 2]
+            description: |
+              Memory Bus Identifier
+              0 = QCOM_MEM_TYPE_DDR
+              1 = QCOM_MEM_TYPE_LLCC
+              2 = QCOM_MEM_TYPE_DDR_QOS
+
+          freq-table-hz:
+            items:
+              items:
+                - description: Minimum frequency of the memory bus in Hz
+                - description: Maximum frequency of the memory bus in Hz
+
+        patternProperties:
+          '^monitor-[0-9]$':
+            type: object
+            unevaluatedProperties: false
+            description:
+              The list of all monitors detecting the memory latency bound workloads using
+              various counters.
+
+            properties:
+              qcom,compute-type:
+                description:
+                  Monitors of type compute perform bus dvfs based on a rudimentary CPU
+                  frequency to memory frequency map.
+                type: boolean
+
+              qcom,ipm-ceil:
+                $ref: /schemas/types.yaml#/definitions/uint32
+                description:
+                  Monitors having this property perform bus dvfs based on the same
+                  rudimentary table but the scaling is performed only if the calculated
+                  IPM (Instruction Per Misses) exceeds the given ceiling.
+
+              cpus:
+                $ref: /schemas/types.yaml#/definitions/phandle-array
+                description:
+                  Should be a list of phandles to CPU nodes (as described in
+                  Documentation/devicetree/bindings/arm/cpus.yaml).
+
+              operating-points-v2: true
+              opp-table:
+                type: object
+
+            required:
+              - cpus
+              - operating-points-v2
+
+            oneOf:
+              - required: [ 'qcom,compute-type' ]
+              - required: [ 'qcom,ipm-ceil' ]
+
+        required:
+          - qcom,memory-type
+          - freq-table-hz
+
+additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/firmware/qcom,scmi-memlat.h>
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
diff --git a/include/dt-bindings/firmware/qcom,scmi-memlat.h b/include/dt-bindings/firmware/qcom,scmi-memlat.h
new file mode 100644
index 000000000000..7ae8d8d5623b
--- /dev/null
+++ b/include/dt-bindings/firmware/qcom,scmi-memlat.h
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


