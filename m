Return-Path: <linux-arm-msm+bounces-57675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C53BBAB50A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 12:00:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AF3D8609CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 09:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC45F23E34D;
	Tue, 13 May 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="EqCVW57+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94EB23C50A;
	Tue, 13 May 2025 09:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130342; cv=none; b=QDMvrbOXqfV8sCazwZoP+hnTJuNdKrck5xoMLhFR8AHX34LarZ5rDscjc5brSRTBl4zjdp4yLaPw8dsE/LNu4Kgwy736Ox97K4uVm0gPbf0AsZsx6OqrocHvJdghOUrGAMC7c/L+RdnO5OgxV1YrFA7S7I9GSSHFkJqhK94ytP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130342; c=relaxed/simple;
	bh=eKetsvsMaOxTaVAYFMuqjN043togvKBZej/RPXkHcEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=QbGnPHfYSMF160lImaMlJ3S4mryRZPQhgt32tOYIXMDTFN0fa0i0A90gK+kN/wo1TiD1MqocsBFe7adK7WIfcXOc3dW3LlXscK1fyoIvd+TL1lVNm1ds47I1vnYWZPie752+Tg4KkB9z12Pbl21bL6ZSPoJDq/1iuBm9uXdtGKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=EqCVW57+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D6F3Qg029694;
	Tue, 13 May 2025 09:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T3d0Ybrd/X7HAfMU06/8nI4JWqRwxp/eM/eIAa5glYI=; b=EqCVW57+TR5NXhdi
	yI7yhnDyckYeMo1tXK0C+DDCULRj+32NwEA4W5JOvz/XnTO/YAXAzBCZdtatm4cN
	ULHqsqMRocgf3oofMAQHtm1ld7UdLWM456rONB3uajNKockaUi0M7EZ3R5vyjJpe
	cx8/mpwZtVod8S9H4v2y15SdZ7HfLvxOspTjPC265tvBUnZSKLxCXMTl8fWRrq0K
	NwfC9B5knKQSn5k/E4OsyN4mEc/5BA0Ac1wX84PqBBP0/pyILu4XJxwGU/VNjkmQ
	ZiX8K0R9x/WOz5IcFNeC0ylLNyv3i5omN38ZDJ5e4mu/EGLnlMuuRFxWWTxmBDoN
	MMoXEQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hvghfjnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:58:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54D9wg5m006597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 09:58:42 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 13 May 2025 02:58:36 -0700
From: Luo Jie <quic_luoj@quicinc.com>
Date: Tue, 13 May 2025 17:58:21 +0800
Subject: [PATCH net-next v4 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250513-qcom_ipq_ppe-v4-1-4fbe40cbbb71@quicinc.com>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
In-Reply-To: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747130310; l=17373;
 i=quic_luoj@quicinc.com; s=20250209; h=from:subject:message-id;
 bh=eKetsvsMaOxTaVAYFMuqjN043togvKBZej/RPXkHcEg=;
 b=Uwek6L9b4tQkqNBXGKNQDbUFgwGBwTELp9CWC5Vn+lJVcdOqqnx30N/vroIG993xMFTVCfhxi
 4J5AuaMajGxB8SgqrL6DRYAn9wFMINCRqHwbFr5gWmb3048a1zZSoYQ
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=pzwy8bU5tJZ5UKGTv28n+QOuktaWuriznGmriA9Qkfc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5Bu6yQHp8l-9LiGAb-fLpCcu3HLyHJsZ
X-Proofpoint-ORIG-GUID: 5Bu6yQHp8l-9LiGAb-fLpCcu3HLyHJsZ
X-Authority-Analysis: v=2.4 cv=AMDybF65 c=1 sm=1 tr=0 ts=682317d3 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=Dp9n6NpNsZXrJzVADQAA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDA5NCBTYWx0ZWRfX9BuAFjO6VIzB
 4JplzM61HSiUG8Nh/bk1+6YMRH/wca42F8JvbB13RLHTOxcQvm0GKopp9DrRiAgXcEv/41IZb67
 9/zl8GEtGfW4UkXAaw6N7yahDmmxB8aaKA1Yal1cYAbaAQwwNtl4r90bsvFmYdn3mtfwx0pbH0z
 Q0lQ4JQuopbD8GyxGT8DNALLJOonayKo3aUQJT0M/Wvw3YN0UB/X4awOtww5ITxSHg1IyyFZ4zt
 nTjbOZEnXT7ixSjLUtvzxCV6yUACajv1R5fnCSaO4flziN5ztfDrxDZiIgvoAlEODSmtGNy0yfj
 1IUHtWBTjYx5ktgQ/KYVtqIrLmHnX2RjDrMZQRkR1Myss79s69GHMABIuBK9SeuG2hAyy/37ZSs
 EcCYzqNf3ahi8z9S/HlM5FqeWw7UaJAsDmTOPiITO1QcC9kgH/E7dzQRzhGX9aSYvdqE32Jv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130094

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
 .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 406 +++++++++++++++++++++
 1 file changed, 406 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
new file mode 100644
index 000000000000..f36f4d180674
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
@@ -0,0 +1,406 @@
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
+    #include <dt-bindings/interconnect/qcom,ipq9574.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    ethernet-switch@3a000000 {
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


