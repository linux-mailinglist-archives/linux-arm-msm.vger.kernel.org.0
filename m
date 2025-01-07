Return-Path: <linux-arm-msm+bounces-44101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 524F5A03C13
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 11:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B99593A5504
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 10:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9698F1E7668;
	Tue,  7 Jan 2025 10:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Ofb8V+Kf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CE21E3DFA;
	Tue,  7 Jan 2025 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736245052; cv=none; b=ifBu45Ygye3V+Z4SMu+KrStWzDMATSzbUGC9H6+xMhsl6Lmy01Hatx/EFGs99l5dg+g7xlSsXqs3gMpNSq6mHqn/PsQ7EXD0Jnvu1iHxDM+H+AVyqW0XPd10qaA0nh+5tkpMlq45R5yKy3nVD6AdClcj1VNWAOwnRdxiY0ZgzKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736245052; c=relaxed/simple;
	bh=KQJmw7bHC//FBOVrBNf2qj+80h8LpfTncaZJarpE2F8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aGqq+1UYBGou0rlx8n6az9Pgj7vFLjZiu1we/Ere17H5FvGej3g/bPTFdG1hdLuGkoSViOqDLw7n6VCFtKH7+bvu2DKV17bvfSPKewIbMOmPE5WTtQItQUq7vTkFifIgRmsI6xHff8P8SCqQ9atJ35FIsW2/rvDR0Wn1fb+rC+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Ofb8V+Kf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507A8VcR023341;
	Tue, 7 Jan 2025 10:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iI+rsrkGXA5rtNyJkGS7wUpvsSWkR0GESU/p5qr4H5I=; b=Ofb8V+KfKOt5fY48
	1/eGwrpAucN+2h7lTa9x+i9wpYTQ82exGC3HLsNM7Rx629ZxAEkRdVcyMIFMsJED
	RN86ZL3qaYMecy9brUdGcuCSHfjh73MeDTKHRYLUjRjbKmEOOaXJ9IXXWD3pcSFU
	NTYvDukYMVFTrqpEAaM1cf22lIdNmsWEOhrg8rK89U0PRYPQCbnoXNwrlDrArd38
	uRoTtp8rwwQaCTVzr20HI+pSh3WQXhrjKLsTjlQrxmgcrTfIhdWE3a1oUYX4Ak5u
	xaK5pk1R9PR0eL146hsX2C2s8Q+z562Z1mT5qaP4SUrglH88pl822YvePcYmWFMU
	Rtzlkg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44128nr0r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 10:17:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 507AHLqE014416
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 10:17:21 GMT
Received: from hu-gokulsri-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 7 Jan 2025 02:17:16 -0800
From: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
To: <jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <mathieu.poirier@linaro.org>, <konradybcio@kernel.org>,
        <quic_mmanikan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <dmitry.baryshkov@linaro.org>
CC: <quic_gokulsri@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_srichara@quicinc.com>
Subject: [PATCH V3 2/8] dt-bindings: remoteproc: qcom: document hexagon based WCSS secure PIL
Date: Tue, 7 Jan 2025 15:46:41 +0530
Message-ID: <20250107101647.2087358-3-quic_gokulsri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
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
X-Proofpoint-GUID: Oi2Hay70l_toQz5TCtmyjSJJNuQSQC4c
X-Proofpoint-ORIG-GUID: Oi2Hay70l_toQz5TCtmyjSJJNuQSQC4c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070085

From: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>

Add new binding document for hexagon based WCSS secure PIL remoteproc.
IPQ5332, IPQ5424 and IPQ9574 follows secure PIL remoteproc.

Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../remoteproc/qcom,wcss-sec-pil.yaml         | 131 ++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
new file mode 100644
index 000000000000..1db36d36e5e5
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcss-sec-pil.yaml
@@ -0,0 +1,131 @@
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
+  Wireless Connectivity Subsystem (WCSS) Secure Peripheral Image Loader loads
+  firmware and power up QDSP6 remoteproc on the Qualcomm IPQ series SoC.
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq5332-wcss-sec-pil
+      - qcom,ipq5424-wcss-sec-pil
+      - qcom,ipq9574-wcss-sec-pil
+
+  reg:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
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
+      - description: sleep clock
+
+  clock-names:
+    items:
+      - const: sleep
+
+  mboxes:
+    maxItems: 1
+    description: A phandle for the TMECom mailbox driver
+
+  qcom,smem-states:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: States used by the AP to signal the remote processor
+    items:
+      - description: Stop Q6
+      - description: Shutdown Q6
+
+  qcom,smem-state-names:
+    description:
+      Names of the states used by the AP to signal the remote processor
+    items:
+      - const: stop
+      - const: shutdown
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
+  - reg
+  - firmware-name
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
+    remoteproc@d100000 {
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
+      clock-names = "sleep";
+
+      mboxes = <&tmel_qmp 0>;
+      qcom,smem-states = <&wcss_smp2p_out 1>,
+                         <&wcss_smp2p_out 0>;
+      qcom,smem-state-names = "stop",
+                              "shutdown";
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


