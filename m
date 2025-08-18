Return-Path: <linux-arm-msm+bounces-69574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC99B2A486
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 15:21:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCBE27BB803
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CD92326D4B;
	Mon, 18 Aug 2025 13:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="XgEE9GGb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A2320CCE;
	Mon, 18 Aug 2025 13:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522928; cv=none; b=T7pMf8W8LRQ24vqbGOD7JlORILNnJ8ZBmZQwlPAoe7QzFoR6G9TBb+lEcelLb0UAWdIwZcSv6/YDymekozAdSXHe4d2KrKt4S4Jx+selmAWFhOQPh/jABGdB8glrxU9Knxb1AQIYqyPBZaCZoXcyeC+eyspC6kCbHdD/A5iokXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522928; c=relaxed/simple;
	bh=Qv982O7CajZtmv5+MLQ3l5c0r7I6Dw8puJU4bjas2mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=K7O9M6WYgNz6QoFCAysmx+4qkjiIANOny59uZN6CQxnrebA2uCHKRldRboHsqVqa8LFWWXDv9WZ3XzJ7P9gkGYWOIhqSHbeUAblk0xuV1ssTFbOffja15y/BsOVc3qkx7tDb8Nr+oanRq+Eyb/QUo6UzQvki+XcBKoDIWeCaNM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=XgEE9GGb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7Ui0I025668;
	Mon, 18 Aug 2025 13:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gFotkbkzEPLGM0K6AIPWOUrRabuumeAP50l5mKoANHU=; b=XgEE9GGbpj2PP33z
	wsEuoYE7LVA/HMHwH2j4B9Mg85HMEOEd54sBAv8qll+YZmqmDI6fjUhB6j8gie6t
	3ygS+BDv3/myVedeoQholy2Fm5SkisRLml/PVWMivPcOCHEHPlnuPqZtQgEjBVUy
	iWm7WNvFXEbjB7HaKF04OeuEz8XZXVU4TWGxeF1p/PB6h7PcnUmX+8zQyzynsn64
	G6/i+iIav7ZKnF4vzVOpZOc+MkMjfKSTEHIP+YMVuF4quEEJhWAJmyd71zTSSwGI
	3WP/dteOhjUJFOtisv/48WLq7u5ADgaaEhpTiM46yT+s5r70cNwwcKRYzvNmaXnS
	kOjvKQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48kyuns1aw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 13:15:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57IDF0QG012970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 13:15:00 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 18 Aug 2025 06:14:54 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Mon, 18 Aug 2025 21:14:25 +0800
Subject: [PATCH net-next v8 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250818-qcom_ipq_ppe-v8-1-1d4ff641fce9@quicinc.com>
References: <20250818-qcom_ipq_ppe-v8-0-1d4ff641fce9@quicinc.com>
In-Reply-To: <20250818-qcom_ipq_ppe-v8-0-1d4ff641fce9@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755522889; l=23649;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=Qv982O7CajZtmv5+MLQ3l5c0r7I6Dw8puJU4bjas2mc=;
 b=8pa6i+GHGzBUNrFh0t06KF0WslMecug4NfcOZmfy9nNGBBlfLPU+VuBlHnhTLM1cV77viT/ZR
 X4tuYexPJ0sBcp/gopzxZgo1umd0ljmUKaST5kh1Sm2Oo9MZKiolgph
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: HGCZfIOYkjJSJ5o898V76Du21kIQ9C4V
X-Authority-Analysis: v=2.4 cv=N6UpF39B c=1 sm=1 tr=0 ts=68a32755 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=v1KnxslhLN2fqV9aa6wA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDA3MSBTYWx0ZWRfX4h3q4DcdMkbP
 3z50baQISzoRwoistSNRpLMnGdeewI14wHfTKoVyYJ+ZVHoeoAzMnGZJIpjRBCN/S+YJ3OYVynp
 +7cho4S5mN31vbdfpnSD/x+dyVqjOkwbMV0D9vQRs4hv3tI3GJif6Lanpjfl0ujhrWO6hd3qYki
 PokzJy3t+7cvZK+Ut3S7ESx1JdN1RB7rMW6YPdzxvPw0XsAgluRiIvVcvLtbGwpNZkprt8MOZCq
 I6Li7cMzss+E5A1o5CEYfuVx0c6yk7uwwXxYgTs44qsKf7QPdSQ3RGuH9m6BwtFHgWXl+EQZjU5
 Z3XglQr2ClOj5vWkyg0vi1bYI38AdbaxPa/p3m2Hy8t79i0Ame/1i7gUgN47AlOFHZ+Y5s2l3TR
 dUBaIyoo
X-Proofpoint-ORIG-GUID: HGCZfIOYkjJSJ5o898V76Du21kIQ9C4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180071

The PPE (packet process engine) hardware block is available in Qualcomm
IPQ chipsets that support PPE architecture, such as IPQ9574. The PPE in
the IPQ9574 SoC includes six Ethernet ports (6 GMAC and 6 XGMAC), which
are used to connect with external PHY devices by PCS. It includes an L2
switch function for bridging packets among the 6 Ethernet ports and the
CPU port. The CPU port enables packet transfer between the Ethernet ports
and the ARM cores in the SoC, using the Ethernet DMA.

The PPE also includes packet processing offload capabilities for various
networking functions such as route and bridge flows, VLANs, different
tunnel protocols and VPN.

The PPE switch is modeled according to the Ethernet switch schema, with
additional properties defined for the switch node for interrupts, clocks,
resets, interconnects and Ethernet DMA. The switch port node is extended
with additional properties for clocks and resets.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 533 +++++++++++++++++++++
 1 file changed, 533 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
new file mode 100644
index 000000000000..753f370b7605
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -0,0 +1,533 @@
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
+  NSS clock controller) and Ethernet PCS/PHY blocks. For depicting the PHY
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
+      - description: PPE core clock
+      - description: PPE APB (Advanced Peripheral Bus) clock
+      - description: PPE IPE (Ingress Process Engine) clock
+      - description: PPE BM, QM and scheduler clock
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
+      - description: Bus interconnect path leading to PPE switch core function
+      - description: Bus interconnect path leading to PPE register access
+      - description: Bus interconnect path leading to QoS generation
+      - description: Bus interconnect path leading to timeout reference
+      - description: Bus interconnect path leading to NSS NOC from memory NOC
+      - description: Bus interconnect path leading to memory NOC from NSS NOC
+      - description: Bus interconnect path leading to enhanced memory NOC from NSS NOC
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
+          - description: EDMA system clock
+          - description: EDMA APB (Advanced Peripheral Bus) clock
+
+      clock-names:
+        items:
+          - const: sys
+          - const: apb
+
+      resets:
+        maxItems: 1
+        description: EDMA reset
+
+      interrupts:
+        minItems: 65
+        maxItems: 65
+
+      interrupt-names:
+        minItems: 65
+        maxItems: 65
+        items:
+          oneOf:
+            - pattern: '^txcmpl_([1-2]?[0-9]|3[01])$'
+            - pattern: '^rxfill_[0-7]$'
+            - pattern: '^rxdesc_(1?[0-9]|2[0-3])$'
+            - const: misc
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
+  ethernet-ports:
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
+              - description: Port MAC clock
+              - description: Port RX clock
+              - description: Port TX clock
+
+          clock-names:
+            items:
+              - const: mac
+              - const: rx
+              - const: tx
+
+          resets:
+            items:
+              - description: Port MAC reset
+              - description: Port RX reset
+              - description: Port TX reset
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


