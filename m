Return-Path: <linux-arm-msm+bounces-62661-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 94188AEA09C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 16:32:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C840E7B1405
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 14:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07EC2EBBB6;
	Thu, 26 Jun 2025 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JA5aAS24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEBC42EA48F;
	Thu, 26 Jun 2025 14:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948310; cv=none; b=q7e9HZPKTMo5oJ1Oov1u6naIlElLPIPkKL8oCvICE0iYOMAfVX1QwwrLHlZ9krIFf5XHKYKqZo8b2Sp4cBNgwxRnHfh2wpOzzktBbq1qXQS4LHZ78vmXKDGgVYSmNMlP/KZ0BhH3MQoWI7xE/zAvg7sznpNp3maSWPRQgY9Vgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948310; c=relaxed/simple;
	bh=fuvlr5G+XSwMMlOuxli4Q4B9jGUz7Nog5/1Z3fxkblk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=BGF15ozAendMDY/KcAHV4i6APOTai5DbdAA9l6+eLneRYih/xGvqvPimH6OzfGLdZFpyQLbgQUkagKr/KT/5Ytk9ykyBfrCpyhdfZZl1ZG4YJemcBT1bC13aJMmcEyt3mmJZwQLpMKTe9zFZ+3UjhPajBy0MZM9PMTTa0EdNqKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JA5aAS24; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9cFId018618;
	Thu, 26 Jun 2025 14:31:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYAEC2S9n4vivRNx96M58ISLTf/mJs6tLAMyPnxul9M=; b=JA5aAS24UPlf5BpH
	YpZZylCdr00Pcx2S+y8khsNl30eI3bmsiLdwFT9NilYic++svkD9KGJjVTdAEND5
	vghMpP0o4jO2aUttOtMu+Nk56acLzpAl4SqaB+MT/b5CaTi2uXi4kedWVk7N+WCh
	j/gGlkTzW6RR9C9+MKT2qEjZePoHBkzrL2ljDYSGF51QvKbw/9D533QXMEIZjYbu
	vkIpDaErUiS3fSOg4R7gcRMPTWuwT9mpXjomUILHLLlqywW+sXsvrahbNgC9HBE9
	C1nEfakNrn2H/ALzeIlo+dsS46BYNd3FkIxwsIOtROGcih3zO13rzojro3k8Q1Q0
	M7y60w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26dyjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:31:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55QEVSu6004046
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:31:28 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 26 Jun 2025 07:31:22 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Thu, 26 Jun 2025 22:31:00 +0800
Subject: [PATCH net-next v5 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250626-qcom_ipq_ppe-v5-1-95bdc6b8f6ff@quicinc.com>
References: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
In-Reply-To: <20250626-qcom_ipq_ppe-v5-0-95bdc6b8f6ff@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750948277; l=23047;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=fuvlr5G+XSwMMlOuxli4Q4B9jGUz7Nog5/1Z3fxkblk=;
 b=awQ6GHo38AosmzH+B/s4pSFaMY8YSP4XIAtDz9d/jel+3hXVQQbKasgQNtzukPVSzpYusNDex
 elHHVZ/ecBFBUiY9HqTfH8kdNA8QVIqzSpdPludf8AuJ/y5Hl3FdoqO
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMyBTYWx0ZWRfX3gue1zmjPSUm
 Giw86mMfW11xCKUkpLwvpezi9L8oq3opcHC+1o8+Xl1y6OsOXpchN5oU9sW59P+F9QZ1sH9yBYt
 ikxw7a68Pgq4uQsZWAchOtu/LgtpbqCzE35f8WRPbbJyHH8uGBpk/gbHpiiSLqKCgcagc2k89ET
 h6BgLszWof3GiipgMBvMbsr513H1hl3YiIhi8td9e/r87rScCDnbJxnhf+BBY4UCWedHz9MwSQ0
 0X6OySbt3zkkHiuJtn1hJLbKSo/l35U/St/j5+I4zgXQuvRnvlA1JmfpY0O9v+5Thy63aaKuFYt
 8+2ZGWaG27be++UQ4ntTTHaHfb9JauTZ3B1R6tP7MLiG5e2R9g3KWZU9LdFxHmfms/QmTV5TvFN
 iGK95snWTfG2T/VFgClNr5Tw2PfVkP+K3sFnS0X7A4wC0OKYMj4xgJ5oEz9HHRzRGHUbudkl
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685d59c0 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=thqVrQUV_BeX1yurthwA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: aMxwt4l-GD-utP5wMqd5K-YoAD5iMpvy
X-Proofpoint-ORIG-GUID: aMxwt4l-GD-utP5wMqd5K-YoAD5iMpvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260123

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
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 521 +++++++++++++++++++++
 1 file changed, 521 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
new file mode 100644
index 000000000000..83625b06c83e
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -0,0 +1,521 @@
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
+    |  |   +-----------------------------+----------+----------+---------+
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
+  "^(ethernet-)?port@[0-9a-f]+$":
+    unevaluatedProperties: false
+    $ref: ethernet-switch-port.yaml#
+
+    properties:
+      clocks:
+        items:
+          - description: Port MAC clock from NSS clock controller
+          - description: Port RX clock from NSS clock controller
+          - description: Port TX clock from NSS clock controller
+
+      clock-names:
+        items:
+          - const: mac
+          - const: rx
+          - const: tx
+
+      resets:
+        items:
+          - description: Port MAC reset from NSS clock controller
+          - description: Port RX reset from NSS clock controller
+          - description: Port TX reset from NSS clock controller
+
+      reset-names:
+        items:
+          - const: mac
+          - const: rx
+          - const: tx
+
+    required:
+      - reg
+      - clocks
+      - clock-names
+      - resets
+      - reset-names
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
+            port@1 {
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
+            port@2 {
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
+            port@3 {
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
+            port@4 {
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
+            port@5 {
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
+            port@6 {
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


