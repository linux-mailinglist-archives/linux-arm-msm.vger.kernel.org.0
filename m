Return-Path: <linux-arm-msm+bounces-23350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06B9103A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 14:06:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AB371C20FEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 12:06:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715471AB53A;
	Thu, 20 Jun 2024 12:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fRO7UO76"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E280C1A4F3D;
	Thu, 20 Jun 2024 12:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718885208; cv=none; b=biRQURLEId2FgJd+twg6gSvS8hMj3XMdrJTZi0T+yKpzaqH2y4/Q3QqNxiU1Cj09WfX2jzrIpuxqZt9tGldvidBK3eEZ18JLMiiRvLqeBKhilyEy5GE9VhZz3I1/CJ7zzSZJYWa+VP7hjg+dRDff68eMIgJGmcR4utOOGK/uLQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718885208; c=relaxed/simple;
	bh=OvvuAY6JJeKz8HMylM8rgAQ3tTJmQ8c69rhKOwcV0/o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GufGnpEzMEFebHEpCKUiOZYAh6pQCam6DDOaAfKgT4KBFXajRACJht1VFxuJDyfvCUJzAo7+BGzlJoo0SHpO2YYr7FTu4Fbpl1RrG8ZkEeaN8xtNsAjuJ1rghtPHU3mdwkzKnsk0kRcvxmdMzKzxNmyfSIPA8TBpFPPL1Ojowr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fRO7UO76; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K9v8Ie016880;
	Thu, 20 Jun 2024 12:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5tRKl3MbIlCDWeWB/RY5B88txA5Kn3AKNMxA1n/Auy0=; b=fRO7UO76xzdewTIR
	unnfobTROV7xE6ZkTMnFCf+mkcUsIuv3Q5jDHZehTv61css+XyKX+08pSpDO0zRh
	RLUCqOp2bV/bjwrDxGOMwT2rMALWD5cR13iD2o6B3FAJPvhpP7QfDUs+HjALRv5P
	/agj1quBvnBIhAEx58H2VUN29Al0hFqKtSJtCQ397S8Ao77Vy6L+MCX+rKwLO63p
	fY3wUq2GUA7DMPX/JEl6bdeA70y2LLHDUNN2ElrHQZ6A+35QN3JRfMUHNmfDR22i
	p68joYAx4x2N7tN3TKkRZGWEWpSoj2McPpseJbvvaZ6S0Jad1j6snDVFqvThTqui
	L6AkGQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9x4dpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 12:06:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KC6fUc019754
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 12:06:41 GMT
Received: from hu-kbajaj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 05:06:37 -0700
From: Komal Bajaj <quic_kbajaj@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier
	<mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>,
        Komal Bajaj <quic_kbajaj@quicinc.com>
Subject: [PATCH v3 1/4] dt-bindings: remoteproc: mpss: Document QDU1000/QRU1000 mpss devices
Date: Thu, 20 Jun 2024 17:31:40 +0530
Message-ID: <20240620120143.12375-2-quic_kbajaj@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240620120143.12375-1-quic_kbajaj@quicinc.com>
References: <20240620120143.12375-1-quic_kbajaj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 18-OQiEz8jUQkypsXdJLhjO3Y92KtTfj
X-Proofpoint-GUID: 18-OQiEz8jUQkypsXdJLhjO3Y92KtTfj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_07,2024-06-20_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406200087

From: Melody Olvera <quic_molvera@quicinc.com>

Document the compatible for the component used to boot the MPSS on the
QDU1000 and QRU1000 SoCs.

The QDU1000 and QRU1000 mpss boot process now requires the specification
of an RMB register space to complete the handshake needed to start or
attach the mpss.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
Signed-off-by: Komal Bajaj <quic_kbajaj@quicinc.com>
---
 .../remoteproc/qcom,qdu1000-mpss-pas.yaml     | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml
new file mode 100644
index 000000000000..71c5a85b679e
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,qdu1000-mpss-pas.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,qdu1000-mpss-pas.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QDU1000 Modem Peripheral Authentication Service
+
+maintainers:
+  - Melody Olvera <quic_molvera@quicinc.com>
+  - Komal Bajaj <quic_kbajaj@quicinc.com>
+
+description:
+  Qualcomm QDU1000 SoC Peripheral Authentication Service loads and boots firmware
+  on the Qualcomm DSP Hexagon core.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qdu1000-mpss-pas
+
+  reg:
+    items:
+      - description: Address offset and size for MPSS PAS register set
+      - description: Address offset and size for MPSS RMB register set
+
+  reg-names:
+    items:
+      - const: base
+      - const: rmb
+
+  clocks:
+    items:
+      - description: XO clock
+
+  clock-names:
+    items:
+      - const: xo
+
+  qcom,qmp:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Reference to the AOSS side-channel message RAM.
+
+  smd-edge: false
+
+  firmware-name:
+    items:
+      - description: Firmware name of the Hexagon core
+      - description: Firmware name of the Hexagon Devicetree
+
+  memory-region:
+    items:
+      - description: Memory region for main Firmware authentication
+      - description: Memory region for Devicetree Firmware authentication
+      - description: DSM Memory region
+
+  power-domains:
+    items:
+      - description: CX power domain
+      - description: MSS power domain
+
+  power-domain-names:
+    items:
+      - const: cx
+      - const: mss
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - memory-region
+
+allOf:
+  - $ref: /schemas/remoteproc/qcom,pas-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/interconnect/qcom,qdu1000-rpmh.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/mailbox/qcom-ipcc.h>
+    #include <dt-bindings/power/qcom-rpmpd.h>
+
+    remoteproc@4080000 {
+        compatible = "qcom,qdu1000-mpss-pas";
+        reg = <0x4080000 0x4040>,
+              <0x4180000 0x1000>;
+        reg-names = "base", "rmb";
+
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "xo";
+
+        interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
+                              <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "wdog", "fatal", "ready", "handover",
+                          "stop-ack", "shutdown-ack";
+
+        memory-region = <&mpss_mem>, <&dtb_mpss_mem>, <&mpss_dsm_mem>;
+
+        firmware-name = "qcom/qdu1000/modem.mbn",
+                        "qcom/qdu1000/modem_dtb.mbn";
+
+        power-domains = <&rpmhpd QDU1000_CX>,
+                        <&rpmhpd QDU1000_MSS>;
+        power-domain-names = "cx", "mss";
+
+        interconnects = <&mc_virt MASTER_LLCC &mc_virt SLAVE_EBI1>;
+
+        qcom,qmp = <&aoss_qmp>;
+
+        qcom,smem-states = <&smp2p_adsp_out 0>;
+        qcom,smem-state-names = "stop";
+
+        glink-edge {
+            interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
+                                         IPCC_MPROC_SIGNAL_GLINK_QMP
+                                         IRQ_TYPE_EDGE_RISING>;
+            mboxes = <&ipcc IPCC_CLIENT_MPSS IPCC_MPROC_SIGNAL_GLINK_QMP>;
+
+            label = "modem";
+            qcom,remote-pid = <2>;
+        };
--
2.42.0


