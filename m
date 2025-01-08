Return-Path: <linux-arm-msm+bounces-44384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C45AA05D52
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 939973A70D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C021FCFDB;
	Wed,  8 Jan 2025 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GcCk+O2T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0661FCF47;
	Wed,  8 Jan 2025 13:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736344087; cv=none; b=eA0hDaIZmgjlpkqXOvV3oChG7KMntwVctlJyEkRAKNDnWh/Ged3YKYabd1ykkRA1BXcbeSb4vaY5FNJoX+xIolS5Zgmt1b7SnPhcVZaY8ZcpzNjXd+SuNYuZk+5Gg4ynBBnafY5Fbsaj8Ayyu1UXO4nHb1UXeCGaE7iiiBrgkVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736344087; c=relaxed/simple;
	bh=0iSJdISmlVFot5QJe5M9sHVdIrP8Oxikxq1gCFrwTlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=NZGlmlpA7mX3tKoyKOgEVimIpDqzvGmy792KtDgSpu3oCFAU4Ld2wbONbn/EQW1i3A/fiBkzLo5UQNvguLvRTM4g0k74Vi5F68NNh0V5q3XFMzrl73Yid/tryhOodizZRgtN1UV/usVpPO9kODAK706VvuvIb/mhOFHQK/LmwGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GcCk+O2T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508BqcnD028792;
	Wed, 8 Jan 2025 13:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yGacb9+b++dOzCUslR9IS4eqHgIVML/Mcs3/axuSy9M=; b=GcCk+O2Tm/iBR7Nj
	ImS6d2wnzqZv6dChq4dEKX961tR5P9tQY47sluISY9pv7P912hy8l4AkFv2pD67L
	2mR8m5bxEHWFNGtlqyANewUM0LztAYVnsXBzeo/lcSy/GZDYxeqhQ2tjm9F/gfyd
	OaRZG2r0SpPBAPKd+AfSQ0wv00PODwhQePORVd68SIZhIkAnHegmqwi1z8VUcXB6
	WluSycwWYULExnj4j9gBcGe4HU8eNxZ6EJcNSfPTZAMX78IEzDo/htlF4ZaQSzCA
	8Arot85LorKeX4Do4Vy+3JLtn7j4/dfDpnNCNo9vSH0cb8EsQAMEgnpZDFSW2KKy
	cwQO7A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441rvh081f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:47:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 508Dlo1L026457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 Jan 2025 13:47:50 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 Jan 2025 05:47:43 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Wed, 8 Jan 2025 21:47:08 +0800
Subject: [PATCH net-next v2 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250108-qcom_ipq_ppe-v2-1-7394dbda7199@quicinc.com>
References: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
In-Reply-To: <20250108-qcom_ipq_ppe-v2-0-7394dbda7199@quicinc.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal
	<quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>,
        "Simon
 Horman" <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Kees Cook
	<kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Philipp
 Zabel" <p.zabel@pengutronix.de>
CC: <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>,
        <srinivas.kandagatla@linaro.org>, <bartosz.golaszewski@linaro.org>,
        <john@phrozen.org>, Luo Jie <quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736344057; l=18790;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=0iSJdISmlVFot5QJe5M9sHVdIrP8Oxikxq1gCFrwTlg=;
 b=Ikw88M75fpgNl/HFnXwAjTUJc2b/GINXqyegvisUrtlJon65vWb1P8OuX5iC2204KfxNtTduv
 3pOAHO6Xmm4Bk/i4oKXBZXzsxctvkObl8Gg3UgIjPxI7EGeZAIiVswn
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NpZTe80vfkbDZhDnPzbDlZlTT41ej5HK
X-Proofpoint-GUID: NpZTe80vfkbDZhDnPzbDlZlTT41ej5HK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080115

The PPE (packet process engine) hardware block is available in Qualcomm
IPQ chipsets that support PPE architecture, such as IPQ9574. The PPE in
the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6 XGMAC), which
are used to connect with external PHY devices by PCS. It includes an L2
switch function for bridging packets among the 6 ethernet ports and the
CPU port. The CPU port enables packet transfer between the ethernet
ports and the ARM cores in the SoC, using the ethernet DMA.

The PPE also includes packet processing offload capabilities for various
networking functions such as route and bridge flows, VLANs, different
tunnel protocols and VPN.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 459 +++++++++++++++++++++
 1 file changed, 459 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
new file mode 100644
index 000000000000..9aab7a7c5064
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -0,0 +1,459 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,ipq9574-ppe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ packet process engine (PPE)
+
+maintainers:
+  - Luo Jie <quic_luoj@quicinc.com>
+  - Lei Wei <quic_leiwei@quicinc.com>
+  - Suruchi Agarwal <quic_suruchia@quicinc.com>
+  - Pavithra R <quic_pavir@quicinc.com>>
+
+description:
+  The Ethernet functionality in the PPE (Packet Process Engine) is comprised
+  of three components, the switch core, port wrapper and Ethernet DMA.
+
+  The Switch core in the IPQ9574 PPE has maximum of 6 front panel ports and
+  two FIFO interfaces. One of the two FIFO interfaces is used for Ethernet
+  port to host CPU communication using Ethernet DMA. The other is used
+  communicating to the EIP engine which is used for IPsec offload. On the
+  IPQ9574, the PPE includes 6 GMAC/XGMACs that can be connected with external
+  Ethernet PHY. Switch core also includes BM (Buffer Management), QM (Queue
+  Management) and SCH (Scheduler) modules for supporting the packet processing.
+
+  The port wrapper provides connections from the 6 GMAC/XGMACS to UNIPHY (PCS)
+  supporting various modes such as SGMII/QSGMII/PSGMII/USXGMII/10G-BASER. There
+  are 3 UNIPHY (PCS) instances supported on the IPQ9574.
+
+  Ethernet DMA is used to transmit and receive packets between the six Ethernet
+  ports and ARM host CPU.
+
+  The follow diagram shows the PPE hardware block along with its connectivity
+  to the external hardware blocks such clock hardware blocks (CMNPLL, GCC,
+  NSS clock controller) and ethernet PCS/PHY blocks. For depicting the PHY
+  connectivity, one 4x1 Gbps PHY (QCA8075) and two 10 GBps PHYs are used as an
+  example.
+  - |
+         +---------+
+         |  48 MHZ |
+         +----+----+
+              |(clock)
+              v
+         +----+----+
+  +------| CMN PLL |
+  |      +----+----+
+  |           |(clock)
+  |           v
+  |      +----+----+           +----+----+  (clock) +----+----+
+  |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
+  |  |   +----+----+           +----+----+          +----+----+
+  |  |        |(clock & reset)      |(clock)
+  |  |        v                     v
+  |  |   +-----------------------------+----------+----------+---------+
+  |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
+  |  |   |       | SCH |               +----------+          +---------+
+  |  |   |       +-----+                        |              |       |
+  |  |   |  +------+   +------+               +-------------------+    |
+  |  |   |  |  BM  |   |  QM  |  IPQ9574-PPE  |    L2/L3 Process  |    |
+  |  |   |  +------+   +------+               +-------------------+    |
+  |  |   |                                             |               |
+  |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
+  |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
+  |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
+  |  |   |     |         |         |         |         |         |     |
+  |  |   +-----+---------+---------+---------+---------+---------+-----+
+  |  |         |         |         |         |         |         |
+  |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
+  +--+---->|                PCS0                 | |  PCS1 | | PCS2  |
+  |(clock) +---+---------+---------+---------+---+ +---+---+ +---+---+
+  |            |         |         |         |         |         |
+  |        +---+---------+---------+---------+---+ +---+---+ +---+---+
+  +------->|             QCA8075 PHY             | | PHY4  | | PHY5  |
+   (clock) +-------------------------------------+ +-------+ +-------+
+
+properties:
+  compatible:
+    enum:
+      - qcom,ipq9574-ppe
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: PPE core clock from NSS clock controller
+      - description: PPE APB (Advanced Peripheral Bus) clock from NSS clock controller
+      - description: PPE ingress process engine clock from NSS clock controller
+      - description: PPE BM, QM and scheduler clock from NSS clock controller
+
+  clock-names:
+    items:
+      - const: ppe
+      - const: apb
+      - const: ipe
+      - const: btq
+
+  resets:
+    maxItems: 1
+    description: PPE reset, which is necessary before configuring PPE hardware
+
+  interconnects:
+    items:
+      - description: Clock path leading to PPE switch core function
+      - description: Clock path leading to PPE register access
+      - description: Clock path leading to QoS generation
+      - description: Clock path leading to timeout reference
+      - description: Clock path leading to NSS NOC from memory NOC
+      - description: Clock path leading to memory NOC from NSS NOC
+      - description: Clock path leading to enhanced memory NOC from NSS NOC
+
+  interconnect-names:
+    items:
+      - const: ppe
+      - const: ppe_cfg
+      - const: qos_gen
+      - const: timeout_ref
+      - const: nssnoc_memnoc
+      - const: memnoc_nssnoc
+      - const: memnoc_nssnoc_1
+
+  ethernet-dma:
+    type: object
+    additionalProperties: false
+    description:
+      EDMA (Ethernet DMA) is used to transmit packets between PPE and ARM
+      host CPU. There are 32 TX descriptor rings, 32 TX completion rings,
+      24 RX descriptor rings and 8 RX fill rings supported.
+
+    properties:
+      clocks:
+        items:
+          - description: EDMA system clock from NSS Clock Controller
+          - description: EDMA APB (Advanced Peripheral Bus) clock from
+              NSS Clock Controller
+
+      clock-names:
+        items:
+          - const: sys
+          - const: apb
+
+      resets:
+        maxItems: 1
+        description: EDMA reset from NSS clock controller
+
+      interrupts:
+        minItems: 29
+        maxItems: 57
+
+      interrupt-names:
+        minItems: 29
+        maxItems: 57
+        items:
+          pattern: '^(txcmpl_([0-9]|[1-2][0-9]|3[0-1])|rxdesc_([0-9]|1[0-9]|2[0-3])|misc)$'
+        description:
+          Interrupts "txcmpl_[0-31]" are the Ethernet DMA Tx completion ring interrupts.
+          Interrupts "rxdesc_[0-23]" are the Ethernet DMA Rx Descriptor ring interrupts.
+          Interrupt "misc" is the Ethernet DMA miscellaneous error interrupt.
+
+    required:
+      - clocks
+      - clock-names
+      - resets
+      - interrupts
+      - interrupt-names
+
+  ethernet-ports:
+    type: object
+    additionalProperties: false
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
+    patternProperties:
+      "^port@[1-6]$":
+        type: object
+        $ref: ethernet-controller.yaml#
+        unevaluatedProperties: false
+        description:
+          PPE port that includes the MAC used to connect the external
+          switch or PHY via the PCS.
+
+        properties:
+          reg:
+            minimum: 1
+            maximum: 6
+            description: PPE port ID
+
+          clocks:
+            items:
+              - description: Port MAC clock from NSS clock controller
+              - description: Port RX clock from NSS clock controller
+              - description: Port TX clock from NSS clock controller
+
+          clock-names:
+            items:
+              - const: mac
+              - const: rx
+              - const: tx
+
+          resets:
+            items:
+              - description: Port MAC reset from NSS clock controller
+              - description: Port RX reset from NSS clock controller
+              - description: Port TX reset from NSS clock controller
+
+          reset-names:
+            items:
+              - const: mac
+              - const: rx
+              - const: tx
+
+        required:
+          - reg
+          - clocks
+          - clock-names
+          - resets
+          - reset-names
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - resets
+  - interconnects
+  - interconnect-names
+  - ethernet-dma
+  - ethernet-ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
+    #include <dt-bindings/interconnect/qcom,ipq9574.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet@3a000000 {
+        compatible = "qcom,ipq9574-ppe";
+        reg = <0x3a000000 0xbef800>;
+        clocks = <&nsscc 80>,
+                 <&nsscc 79>,
+                 <&nsscc 81>,
+                 <&nsscc 78>;
+        clock-names = "ppe",
+                      "apb",
+                      "ipe",
+                      "btq";
+        resets = <&nsscc 108>;
+        interconnects = <&nsscc MASTER_NSSNOC_PPE &nsscc SLAVE_NSSNOC_PPE>,
+                        <&nsscc MASTER_NSSNOC_PPE_CFG &nsscc SLAVE_NSSNOC_PPE_CFG>,
+                        <&gcc MASTER_NSSNOC_QOSGEN_REF &gcc SLAVE_NSSNOC_QOSGEN_REF>,
+                        <&gcc MASTER_NSSNOC_TIMEOUT_REF &gcc SLAVE_NSSNOC_TIMEOUT_REF>,
+                        <&gcc MASTER_MEM_NOC_NSSNOC &gcc SLAVE_MEM_NOC_NSSNOC>,
+                        <&gcc MASTER_NSSNOC_MEMNOC &gcc SLAVE_NSSNOC_MEMNOC>,
+                        <&gcc MASTER_NSSNOC_MEM_NOC_1 &gcc SLAVE_NSSNOC_MEM_NOC_1>;
+        interconnect-names = "ppe",
+                             "ppe_cfg",
+                             "qos_gen",
+                             "timeout_ref",
+                             "nssnoc_memnoc",
+                             "memnoc_nssnoc",
+                             "memnoc_nssnoc_1";
+
+        ethernet-dma {
+            clocks = <&nsscc 77>,
+                     <&nsscc 76>;
+            clock-names = "sys",
+                          "apb";
+            resets = <&nsscc 0>;
+            interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "txcmpl_8",
+                              "txcmpl_9",
+                              "txcmpl_10",
+                              "txcmpl_11",
+                              "txcmpl_12",
+                              "txcmpl_13",
+                              "txcmpl_14",
+                              "txcmpl_15",
+                              "txcmpl_16",
+                              "txcmpl_17",
+                              "txcmpl_18",
+                              "txcmpl_19",
+                              "txcmpl_20",
+                              "txcmpl_21",
+                              "txcmpl_22",
+                              "txcmpl_23",
+                              "txcmpl_24",
+                              "txcmpl_25",
+                              "txcmpl_26",
+                              "txcmpl_27",
+                              "txcmpl_28",
+                              "txcmpl_29",
+                              "txcmpl_30",
+                              "txcmpl_31",
+                              "rxdesc_20",
+                              "rxdesc_21",
+                              "rxdesc_22",
+                              "rxdesc_23",
+                              "misc";
+        };
+
+        ethernet-ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@1 {
+                reg = <1>;
+                phy-mode = "qsgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy0>;
+                pcs-handle = <&pcs0_mii0>;
+                clocks = <&nsscc 33>,
+                         <&nsscc 34>,
+                         <&nsscc 37>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc 29>,
+                         <&nsscc 96>,
+                         <&nsscc 97>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            port@2 {
+                reg = <2>;
+                phy-mode = "qsgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy1>;
+                pcs-handle = <&pcs0_mii1>;
+                clocks = <&nsscc 40>,
+                         <&nsscc 41>,
+                         <&nsscc 44>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc 30>,
+                         <&nsscc 98>,
+                         <&nsscc 99>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            port@3 {
+                reg = <3>;
+                phy-mode = "qsgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy2>;
+                pcs-handle = <&pcs0_mii2>;
+                clocks = <&nsscc 47>,
+                         <&nsscc 48>,
+                         <&nsscc 51>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc 31>,
+                         <&nsscc 100>,
+                         <&nsscc 101>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            port@4 {
+                reg = <4>;
+                phy-mode = "qsgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy3>;
+                pcs-handle = <&pcs0_mii3>;
+                clocks = <&nsscc 54>,
+                         <&nsscc 55>,
+                         <&nsscc 58>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc 32>,
+                         <&nsscc 102>,
+                         <&nsscc 103>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            port@5 {
+                reg = <5>;
+                phy-mode = "usxgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy4>;
+                pcs-handle = <&pcs1_mii0>;
+                clocks = <&nsscc 61>,
+                         <&nsscc 62>,
+                         <&nsscc 65>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc 33>,
+                         <&nsscc 104>,
+                         <&nsscc 105>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            port@6 {
+                reg = <6>;
+                phy-mode = "usxgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy5>;
+                pcs-handle = <&pcs2_mii0>;
+                clocks = <&nsscc 68>,
+                         <&nsscc 69>,
+                         <&nsscc 72>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc 34>,
+                         <&nsscc 106>,
+                         <&nsscc 107>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+        };
+    };

-- 
2.34.1


