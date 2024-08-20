Return-Path: <linux-arm-msm+bounces-29068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 967B6958171
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 10:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1570B1F2500E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Aug 2024 08:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E46918B490;
	Tue, 20 Aug 2024 08:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TfZ8vNkX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB88918B47E;
	Tue, 20 Aug 2024 08:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724144145; cv=none; b=NDG4O39awrhX8IA8z7l2XpqdOQVOantXdQSVyppGqUQSCLKncNzWZmbsRaTbv3FODmfCxC4oDbJEP7a9yGVDxut2F4d76XnVb8VhzWmskAaU3RaE/k/LFG/bVbGzIFZBaTNCnQ8MUETnZxjwRQHwBx8OxwBwmhfwRkTsZcBv6SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724144145; c=relaxed/simple;
	bh=wURqCD4148aCFdMJGe8MHDMJbsF63fWeJhbw5eYHBpc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gEq1lVFdLlB4+ZnRpcUFwCy01yjYr8A33nUOJrd7AvKs578wfnXdtAw9zSeqQwJV7Ap1zgmoLd8x5SA4ltc91bodn+0OnH2g/WxRhYr4/LKv8udzcvlADkiJGpCqu0WhcxTtxYbuRSp4wr01bSuyJWz70+CzN6EgBUvW/ieKrCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TfZ8vNkX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K73t5j012715;
	Tue, 20 Aug 2024 08:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UUycoAxdz3ZQn0OLL9goT/bgBGRL01o/kuZui47YqyY=; b=TfZ8vNkXMOtvj3Ag
	Lj7P54iNoF2jgG/Cv9YTxIqBJ4f2k80kXgp4nNfBi6kV+2vc8QoRE1/ttevmkSZH
	QkRNoZyxFAUfPy1SpVvtpL2TOvSiFOMD3VKo/DlkTrL2c02XKQhueY66NxL9CgIA
	Fme6N3OKch/G2F5PNVsB6ncKl9wZsmbblq17WjxpKtl+AMZmrIcvch8lFOGrS8qR
	vZjnsS/m4WAU4tj/8QwMiwt74mUZanplZX5okYU2giO5sYJZYy2r7++UlYQjPvvC
	xsqIcFGPDBA4aYcf7qZkH8PtK1OlxMdxvm3FrA0kslXqDO0y/pQm/sXbbTpwc729
	iAxmnw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 414pe5gaqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 08:55:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47K8tc2t029984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 08:55:38 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 01:55:35 -0700
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <andersson@kernel.org>, <krzk+dt@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <quic_viswanat@quicinc.com>, <quic_mmanikan@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_srichara@quicinc.com>
Subject: [PATCH 1/2] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Tue, 20 Aug 2024 14:25:14 +0530
Message-ID: <20240820085517.435566-2-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
References: <20240820085517.435566-1-quic_gokulsri@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G2X3XFAdkzh9GQ05JBraegeD72QVwnqu
X-Proofpoint-GUID: G2X3XFAdkzh9GQ05JBraegeD72QVwnqu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_16,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408200065

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5332, IPQ9574 follows secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
---
 .../remoteproc/qcom,wcss-sec-pil.yaml         | 125 ++++++++++++++++++
 1 file changed, 125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
new file mode 100644
index 000000000000..c69401b6cec1
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,wcss-sec-pil.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm WCSS Secure Peripheral Image Loader
+
+maintainers:
+  - Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
+
+description:
+  WCSS Secure Peripheral Image Loader loads firmware and power up QDSP6
+  remoteproc's on the Qualcomm IPQ9574, IPQ5332 SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: Firmware name for the Hexagon core
+
+  interrupts:
+    items:
+      - description: Watchdog interrupt
+      - description: Fatal interrupt
+      - description: Ready interrupt
+      - description: Handover interrupt
+      - description: Stop acknowledge interrupt
+
+  interrupt-names:
+    items:
+      - const: wdog
+      - const: fatal
+      - const: ready
+      - const: handover
+      - const: stop-ack
+
+  clocks:
+    items:
+      - description: IM SLEEP clock
+
+  clock-names:
+    items:
+      - const: im_sleep
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Shutdown Q6
+      - description: Stop Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: shutdown
+      - const: stop
+
+  memory-region:
+    items:
+      - description: Q6 reserved region
+
+  glink-edge:
+    $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
+    description:
+      Qualcomm G-Link subnode which represents communication edge, channels
+      and devices related to the Modem.
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - firmware-name
+  - reg
+  - interrupts
+  - interrupt-names
+  - qcom,smem-states
+  - qcom,smem-state-names
+  - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
+    q6v5_wcss: remoteproc@d100000 {
+      compatible = "qcom,ipq5332-wcss-sec-pil";
+      reg = <0xd100000 0x4040>;
+      firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";
+      interrupts-extended = <&intc GIC_SPI 291 IRQ_TYPE_EDGE_RISING>,
+                            <&wcss_smp2p_in 0 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 1 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 2 IRQ_TYPE_NONE>,
+                            <&wcss_smp2p_in 3 IRQ_TYPE_NONE>;
+      interrupt-names = "wdog",
+                        "fatal",
+                        "ready",
+                        "handover",
+                        "stop-ack";
+
+      clocks = <&gcc GCC_IM_SLEEP_CLK>;
+      clock-names = "im_sleep";
+
+      qcom,smem-states = <&wcss_smp2p_out 0>,
+                         <&wcss_smp2p_out 1>;
+      qcom,smem-state-names = "shutdown",
+                              "stop";
+
+      memory-region = <&q6_region>;
+
+      glink-edge {
+        interrupts = <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>;
+        label = "rtr";
+        qcom,remote-pid = <1>;
+        mboxes = <&apcs_glb 8>;
+      };
+    };
-- 
2.34.1


