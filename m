Return-Path: <linux-arm-msm+bounces-65775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 433A5B0B511
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 12:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C9E5189B948
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 10:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D97A20103A;
	Sun, 20 Jul 2025 10:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JHndircJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CEE1DF73A;
	Sun, 20 Jul 2025 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753009071; cv=none; b=CworH3RzX7OiTzjLaLu4n/ropVf+s2rZT//dt4i+m26Fu2MzP960dB8zv6rFZRRlB5sGxZiegDc5I3PAVDnRdSKT/r75JSgKH0JFL5TudFC6gl+kxkSUZzsbB8/zms02ebqJ59bPwyOaUaojqmh/2R97OPhlGjNjMxKMDFmuu+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753009071; c=relaxed/simple;
	bh=z/p2kh/oDBWqC8FrgmXr12XNqLuHhF77kn3fLgTiQik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=Sz5JfzFzoeOivupRQGeZtcXFKz8yTGhf+E2mm/paJQab4ETqBp3dg1oroOiaJQTKK4NiJDGHWwXf1Ds1ME9alEt11+wP18VLyIXt1CcUyaNYSzOnenoZiodXymYWhvX8Dp+s74FYG4FGwGifra6rBLmHi4YxPdqEzW6A13bpeJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JHndircJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K8oRZJ013374;
	Sun, 20 Jul 2025 10:57:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xjgj1QxOy70N66kYud24GoaHCBqvwHVbMC5lW0y8CyE=; b=JHndircJjLgw/k6v
	arcFuwZPAwogDgRvDMm68kus1LS42EAX9H59NLfA0eUuseXJDI1iEsTaPTNVetMx
	gNoAT5zTqP5B/r7gZR2Fjx2+5PZIssZidQLFBfikmmU57H4IaLjHGysttacNpupy
	d9XBegIprOvMNDXJ1fvLSr8T6iny1wAsu8j2JcrP2otjD9KGr+aogSXZYUSzbKqD
	dOJC9KYe3s17Y7lDitioc2pE6IgwIVWYst01rt4nTW8sIZoLuZtwiiuHHwI2fv9e
	3yuBrNX7K5jWqMFeSg9f9+kmGwoDeQ2I6V+yKROKOrRyKad/kkAGOTUVmA+QUj6l
	IUmB6w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451a2n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:57:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56KAvR1Z032538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Jul 2025 10:57:27 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Sun, 20 Jul 2025 03:57:22 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Sun, 20 Jul 2025 18:57:08 +0800
Subject: [PATCH net-next v6 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250720-qcom_ipq_ppe-v6-1-4ae91c203a5f@quicinc.com>
References: <20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com>
In-Reply-To: <20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com>
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
        Luo Jie
	<quic_luoj@quicinc.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753009036; l=23683;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=z/p2kh/oDBWqC8FrgmXr12XNqLuHhF77kn3fLgTiQik=;
 b=6LtBHc/030u7bHIl7obUjKUEgr+l9uEqpRMASalzzSY4uTMeJUvMA9wTc7+71kD0UkBbL4GJs
 LNaWTvguk3CBDuY4j5r9joee4r7slqQgDzzbDDihFoMoQHPcpGL6v/z
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687ccb98 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=v1KnxslhLN2fqV9aa6wA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cOQw7onQKLtvNAI-70Dn2A_DnnscTp4c
X-Proofpoint-GUID: cOQw7onQKLtvNAI-70Dn2A_DnnscTp4c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDEwNCBTYWx0ZWRfXw/jMWQm6N2G/
 qXw6tYFAQExUVzbGmv/l6yG7O2iptFBkRWBDQPWx0ZidyFzRVJ+svzQwWoFL2+b6AB9VUtDvD+C
 afzxrPcQzyGCv8fCy3Y0gvsjbnITfQzT0Y0J9CyXkJ6MD0/necmrydqkPe6YnqgoXAlLXNqhB+u
 UZLRiCopV0RemXjFPTkciPyh1XZMtNlXo5IO7RnxfrKPBrQeY8bIUgJmQZKt2Jk/2hwoXjZ10lz
 9tgelUuIE0xxnkCSuI+pTfpEvwoPQwJ9zG5Z3uRoUi201MjhLJyW0Dny1IQlMEuPhyyopaiFGHw
 S0uPWEXec8Wp3mk1ya4Lc9ZVCrkFFZ3aLSjzKVMK4DiXg1U771gdiV6wFaIXTbv4NPPmXvbZkoY
 TVY4LCyl388wWY9CCqzTodvidKy0YpAu7FmPj0QrpdZd1On8ikU/BaeMCBHCNz7pkYuVLYzA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507200104

The PPE (packet process engine) hardware block is available in Qualcomm
IPQ chipsets that support PPE architecture, such as IPQ9574. The PPE in
the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6 XGMAC), which
are used to connect with external PHY devices by PCS. It includes an L2
switch function for bridging packets among the 6 ethernet ports and the
CPU port. The CPU port enables packet transfer between the ethernet ports
and the ARM cores in the SoC, using the ethernet DMA.

The PPE also includes packet processing offload capabilities for various
networking functions such as route and bridge flows, VLANs, different
tunnel protocols and VPN.

The PPE switch is modeled according to the ethernet switch schema, with
additional properties defined for the switch node for interrupts, clocks,
resets, interconnects and Ethernet DMA. The switch port node is extended
with additional properties for clocks and resets.

Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 529 +++++++++++++++++++++
 1 file changed, 529 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
new file mode 100644
index 000000000000..d48169a8ba7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -0,0 +1,529 @@
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
+  - Pavithra R <quic_pavir@quicinc.com>
+
+description: |
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
+
+           +---------+
+           |  48 MHZ |
+           +----+----+
+                |(clock)
+                v
+           +----+----+
+    +------| CMN PLL |
+    |      +----+----+
+    |           |(clock)
+    |           v
+    |      +----+----+           +----+----+  (clock) +----+----+
+    |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
+    |  |   +----+----+           +----+----+          +----+----+
+    |  |        |(clock & reset)      |(clock)
+    |  |        v                     v
+    |  |   +----+---------------------+--+----------+----------+---------+
+    |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
+    |  |   |       | SCH |               +----------+          +---------+
+    |  |   |       +-----+                        |              |       |
+    |  |   |  +------+   +------+               +-------------------+    |
+    |  |   |  |  BM  |   |  QM  |  IPQ9574-PPE  |    L2/L3 Process  |    |
+    |  |   |  +------+   +------+               +-------------------+    |
+    |  |   |                                             |               |
+    |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
+    |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
+    |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
+    |  |   |     |         |         |         |         |         |     |
+    |  |   +-----+---------+---------+---------+---------+---------+-----+
+    |  |         |         |         |         |         |         |
+    |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
+    +--+---->|                PCS0                 | |  PCS1 | | PCS2  |
+    |(clock) +---+---------+---------+---------+---+ +---+---+ +---+---+
+    |            |         |         |         |         |         |
+    |        +---+---------+---------+---------+---+ +---+---+ +---+---+
+    +------->|             QCA8075 PHY             | | PHY4  | | PHY5  |
+     (clock) +-------------------------------------+ +-------+ +-------+
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
+  interrupts:
+    maxItems: 1
+    description: PPE switch miscellaneous interrupt
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
+        minItems: 65
+        maxItems: 65
+
+      interrupt-names:
+        minItems: 65
+        maxItems: 65
+        description:
+          Interrupts "txcmpl_[0-31]" are the Ethernet DMA TX completion ring interrupts.
+          Interrupts "rxfill_[0-7]" are the Ethernet DMA RX fill ring interrupts.
+          Interrupts "rxdesc_[0-23]" are the Ethernet DMA RX Descriptor ring interrupts.
+          Interrupt "misc" is the Ethernet DMA miscellaneous error interrupt.
+
+    required:
+      - clocks
+      - clock-names
+      - resets
+      - interrupts
+      - interrupt-names
+
+patternProperties:
+  "^(ethernet-)?ports$":
+    patternProperties:
+      "^ethernet-port@[1-6]+$":
+        type: object
+        unevaluatedProperties: false
+        $ref: ethernet-switch-port.yaml#
+
+        properties:
+          reg:
+            minimum: 1
+            maximum: 6
+            description: PPE Ethernet port ID
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
+
+allOf:
+  - $ref: ethernet-switch.yaml
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
+    #include <dt-bindings/clock/qcom,ipq9574-nsscc.h>
+    #include <dt-bindings/interconnect/qcom,ipq9574.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/reset/qcom,ipq9574-nsscc.h>
+
+    ethernet-switch@3a000000 {
+        compatible = "qcom,ipq9574-ppe";
+        reg = <0x3a000000 0xbef800>;
+        clocks = <&nsscc NSS_CC_PPE_SWITCH_CLK>,
+                 <&nsscc NSS_CC_PPE_SWITCH_CFG_CLK>,
+                 <&nsscc NSS_CC_PPE_SWITCH_IPE_CLK>,
+                 <&nsscc NSS_CC_PPE_SWITCH_BTQ_CLK>;
+        clock-names = "ppe",
+                      "apb",
+                      "ipe",
+                      "btq";
+        resets = <&nsscc PPE_FULL_RESET>;
+        interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>;
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
+            clocks = <&nsscc NSS_CC_PPE_EDMA_CLK>,
+                     <&nsscc NSS_CC_PPE_EDMA_CFG_CLK>;
+            clock-names = "sys",
+                          "apb";
+            resets = <&nsscc EDMA_HW_RESET>;
+            interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
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
+                         <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "txcmpl_0",
+                              "txcmpl_1",
+                              "txcmpl_2",
+                              "txcmpl_3",
+                              "txcmpl_4",
+                              "txcmpl_5",
+                              "txcmpl_6",
+                              "txcmpl_7",
+                              "txcmpl_8",
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
+                              "rxfill_0",
+                              "rxfill_1",
+                              "rxfill_2",
+                              "rxfill_3",
+                              "rxfill_4",
+                              "rxfill_5",
+                              "rxfill_6",
+                              "rxfill_7",
+                              "rxdesc_0",
+                              "rxdesc_1",
+                              "rxdesc_2",
+                              "rxdesc_3",
+                              "rxdesc_4",
+                              "rxdesc_5",
+                              "rxdesc_6",
+                              "rxdesc_7",
+                              "rxdesc_8",
+                              "rxdesc_9",
+                              "rxdesc_10",
+                              "rxdesc_11",
+                              "rxdesc_12",
+                              "rxdesc_13",
+                              "rxdesc_14",
+                              "rxdesc_15",
+                              "rxdesc_16",
+                              "rxdesc_17",
+                              "rxdesc_18",
+                              "rxdesc_19",
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
+            ethernet-port@1 {
+                reg = <1>;
+                phy-mode = "qsgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy0>;
+                pcs-handle = <&pcs0_ch0>;
+                clocks = <&nsscc NSS_CC_PORT1_MAC_CLK>,
+                         <&nsscc NSS_CC_PORT1_RX_CLK>,
+                         <&nsscc NSS_CC_PORT1_TX_CLK>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc PORT1_MAC_ARES>,
+                         <&nsscc PORT1_RX_ARES>,
+                         <&nsscc PORT1_TX_ARES>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            ethernet-port@2 {
+                reg = <2>;
+                phy-mode = "qsgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy1>;
+                pcs-handle = <&pcs0_ch1>;
+                clocks = <&nsscc NSS_CC_PORT2_MAC_CLK>,
+                         <&nsscc NSS_CC_PORT2_RX_CLK>,
+                         <&nsscc NSS_CC_PORT2_TX_CLK>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc PORT2_MAC_ARES>,
+                         <&nsscc PORT2_RX_ARES>,
+                         <&nsscc PORT2_TX_ARES>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            ethernet-port@3 {
+                reg = <3>;
+                phy-mode = "qsgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy2>;
+                pcs-handle = <&pcs0_ch2>;
+                clocks = <&nsscc NSS_CC_PORT3_MAC_CLK>,
+                         <&nsscc NSS_CC_PORT3_RX_CLK>,
+                         <&nsscc NSS_CC_PORT3_TX_CLK>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc PORT3_MAC_ARES>,
+                         <&nsscc PORT3_RX_ARES>,
+                         <&nsscc PORT3_TX_ARES>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            ethernet-port@4 {
+                reg = <4>;
+                phy-mode = "qsgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy3>;
+                pcs-handle = <&pcs0_ch3>;
+                clocks = <&nsscc NSS_CC_PORT4_MAC_CLK>,
+                         <&nsscc NSS_CC_PORT4_RX_CLK>,
+                         <&nsscc NSS_CC_PORT4_TX_CLK>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc PORT4_MAC_ARES>,
+                         <&nsscc PORT4_RX_ARES>,
+                         <&nsscc PORT4_TX_ARES>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            ethernet-port@5 {
+                reg = <5>;
+                phy-mode = "usxgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy4>;
+                pcs-handle = <&pcs1_ch0>;
+                clocks = <&nsscc NSS_CC_PORT5_MAC_CLK>,
+                         <&nsscc NSS_CC_PORT5_RX_CLK>,
+                         <&nsscc NSS_CC_PORT5_TX_CLK>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc PORT5_MAC_ARES>,
+                         <&nsscc PORT5_RX_ARES>,
+                         <&nsscc PORT5_TX_ARES>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+
+            ethernet-port@6 {
+                reg = <6>;
+                phy-mode = "usxgmii";
+                managed = "in-band-status";
+                phy-handle = <&phy5>;
+                pcs-handle = <&pcs2_ch0>;
+                clocks = <&nsscc NSS_CC_PORT6_MAC_CLK>,
+                         <&nsscc NSS_CC_PORT6_RX_CLK>,
+                         <&nsscc NSS_CC_PORT6_TX_CLK>;
+                clock-names = "mac",
+                              "rx",
+                              "tx";
+                resets = <&nsscc PORT6_MAC_ARES>,
+                         <&nsscc PORT6_RX_ARES>,
+                         <&nsscc PORT6_TX_ARES>;
+                reset-names = "mac",
+                              "rx",
+                              "tx";
+            };
+        };
+    };

-- 
2.34.1


