Return-Path: <linux-arm-msm+bounces-66175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DE5B0E9E3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 07:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D43B81C2426F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 05:01:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 070571DDC2B;
	Wed, 23 Jul 2025 05:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gpb7+GTs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E896882C60;
	Wed, 23 Jul 2025 05:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753246880; cv=none; b=VkBCzLKe30Lgd3w7svoJmYFpdBkPWck60EqmSinSGEHYsl+ikuFvgrqg+WcM6GNgqWlFWlm2aS8Ivp9qB2hGMyM69Ody0cYy0ghPjK6AqHiU6qUGipQlSnDdrHMjeWQH7GKTkpfWVnMa8OpQmU1d5S35YaNvYXq8O/7JdHxBaQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753246880; c=relaxed/simple;
	bh=P1x5PC39rNuVQmhnD6UTsEnFKuJYGigsdtWXPSkXrew=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ZJ8ulb+a6UhGUbv6NwNWRfxnP4Qt4DDIWdrw2I2BuYuS15RWJxUm3c+9ANQhLw6cYeHbDW+wn7hIm6ylV+ez/zQADkfhCqY+ebFcEJfLcwd+6SuVTBDC+WHZCTfW/sD31s8xbVxxokjiiQLHWe9utUE28XBNHTi1BNRKe63gMVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gpb7+GTs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MMNv3X019487;
	Wed, 23 Jul 2025 05:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zp6NOVqNcRv7MKZS6XFS96TzCj/D0AQD+PebpPJS1dE=; b=Gpb7+GTsKLNs6OVE
	MYMmvv+tfq0hUxhXMgQjP/KdV5AODLphqVncLXXIY10x3LVrdJii/2UrRIrCE8Ic
	d5EXGHtwmSqkVy08oy1pCS5sRS++Gmfdf5rLNsgHTy5QzmxJbLFQHBK+brJhFBOK
	/lsQpJMd+qhjWpyhqHWrhVX8tq9zynAJiKTjUWBfl7KVWpIL+751k1qrIYNaW1xZ
	KU2rdd6BjWSQtTUUEV4mz1Td3eIwwoMmld1sOSxYhkOGChR6uMQCYA2HuVpqrEjF
	4btW5HraKIFZIWs656gm0EesLfqnf8KohRn0jcFVNmpiJn9y9N9qT3HvB7kycKB6
	bowyaQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6p2xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 05:01:01 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56N510Nm008283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Jul 2025 05:01:00 GMT
Received: from [10.253.77.44] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 22 Jul
 2025 22:00:55 -0700
Message-ID: <cb3e0c01-1ce6-4651-8b3d-e45ebd7b938a@quicinc.com>
Date: Wed, 23 Jul 2025 13:00:53 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
To: Rob Herring <robh@kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei
	<quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        <linux-arm-msm@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <quic_kkumarcs@quicinc.com>, <quic_linchen@quicinc.com>
References: <20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com>
 <20250720-qcom_ipq_ppe-v6-1-4ae91c203a5f@quicinc.com>
 <20250721193545.GA1119033-robh@kernel.org>
Content-Language: en-US
From: Luo Jie <quic_luoj@quicinc.com>
In-Reply-To: <20250721193545.GA1119033-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=68806c8d cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=gEfo2CItAAAA:8
 a=COk6AnOGAAAA:8 a=LWk5nEbthusw8WdjMxUA:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: DMhAUMIZsln-XEztU4hL_gYEIycieGq-
X-Proofpoint-GUID: DMhAUMIZsln-XEztU4hL_gYEIycieGq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDAzOSBTYWx0ZWRfXyx74rlI0ZBf/
 bNT3clwXQvuDB4NcJsAVV/P1Tkj1ITt1SfZ2sjlKW+mrbmakbA2S4nTkbRGXHfuBc7u8LuV6k79
 E5wFbW/azO2XByJsC9GvZ6JZCO5ykMQzgNqmc9OoxXWGsuUf8aO//8X8yVSXEspCO8Y35dWvnSx
 tsMXrMZRM8ZgNdcN41T9flDrVqEfnidkuSL8qVnRtdP6h5T+IWHjzwqpLo6MYePDg7/FYRcweT/
 dyzKmW//GDqJWkwlbphS1HeJ1dLVSWsdn5cPNRjYY8ChSVlwn5jovm7ZUW2qTV6ilJitH2RieYm
 2s8z0Rs3Bm6qbpw9VPyliUBTP7we4CykuCDPEvH1pngx9f6cF1fxkqk8OdTjrGKzbzTQBPOzWW9
 w1TE5hWQjPeqVOJq/izSi6REErEWuwS3nPXdxTR2ls+/dZ8LpSW1rl/LV5MAcKSRqiCVrTKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_01,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230039



On 7/22/2025 3:35 AM, Rob Herring wrote:
> On Sun, Jul 20, 2025 at 06:57:08PM +0800, Luo Jie wrote:
>> The PPE (packet process engine) hardware block is available in Qualcomm
>> IPQ chipsets that support PPE architecture, such as IPQ9574. The PPE in
>> the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6 XGMAC), which
>> are used to connect with external PHY devices by PCS. It includes an L2
>> switch function for bridging packets among the 6 ethernet ports and the
>> CPU port. The CPU port enables packet transfer between the ethernet ports
>> and the ARM cores in the SoC, using the ethernet DMA.
>>
>> The PPE also includes packet processing offload capabilities for various
>> networking functions such as route and bridge flows, VLANs, different
>> tunnel protocols and VPN.
>>
>> The PPE switch is modeled according to the ethernet switch schema, with
>> additional properties defined for the switch node for interrupts, clocks,
>> resets, interconnects and Ethernet DMA. The switch port node is extended
>> with additional properties for clocks and resets.
>>
>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>> ---
>>   .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 529 +++++++++++++++++++++
>>   1 file changed, 529 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> new file mode 100644
>> index 000000000000..d48169a8ba7c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
>> @@ -0,0 +1,529 @@
>> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/net/qcom,ipq9574-ppe.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ packet process engine (PPE)
>> +
>> +maintainers:
>> +  - Luo Jie <quic_luoj@quicinc.com>
>> +  - Lei Wei <quic_leiwei@quicinc.com>
>> +  - Suruchi Agarwal <quic_suruchia@quicinc.com>
>> +  - Pavithra R <quic_pavir@quicinc.com>
>> +
>> +description: |
>> +  The Ethernet functionality in the PPE (Packet Process Engine) is comprised
>> +  of three components, the switch core, port wrapper and Ethernet DMA.
>> +
>> +  The Switch core in the IPQ9574 PPE has maximum of 6 front panel ports and
>> +  two FIFO interfaces. One of the two FIFO interfaces is used for Ethernet
>> +  port to host CPU communication using Ethernet DMA. The other is used
>> +  communicating to the EIP engine which is used for IPsec offload. On the
>> +  IPQ9574, the PPE includes 6 GMAC/XGMACs that can be connected with external
>> +  Ethernet PHY. Switch core also includes BM (Buffer Management), QM (Queue
>> +  Management) and SCH (Scheduler) modules for supporting the packet processing.
>> +
>> +  The port wrapper provides connections from the 6 GMAC/XGMACS to UNIPHY (PCS)
>> +  supporting various modes such as SGMII/QSGMII/PSGMII/USXGMII/10G-BASER. There
>> +  are 3 UNIPHY (PCS) instances supported on the IPQ9574.
>> +
>> +  Ethernet DMA is used to transmit and receive packets between the six Ethernet
>> +  ports and ARM host CPU.
>> +
>> +  The follow diagram shows the PPE hardware block along with its connectivity
>> +  to the external hardware blocks such clock hardware blocks (CMNPLL, GCC,
>> +  NSS clock controller) and ethernet PCS/PHY blocks. For depicting the PHY
>> +  connectivity, one 4x1 Gbps PHY (QCA8075) and two 10 GBps PHYs are used as an
>> +  example.
>> +
>> +           +---------+
>> +           |  48 MHZ |
>> +           +----+----+
>> +                |(clock)
>> +                v
>> +           +----+----+
>> +    +------| CMN PLL |
>> +    |      +----+----+
>> +    |           |(clock)
>> +    |           v
>> +    |      +----+----+           +----+----+  (clock) +----+----+
>> +    |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
>> +    |  |   +----+----+           +----+----+          +----+----+
>> +    |  |        |(clock & reset)      |(clock)
>> +    |  |        v                     v
>> +    |  |   +----+---------------------+--+----------+----------+---------+
>> +    |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
>> +    |  |   |       | SCH |               +----------+          +---------+
>> +    |  |   |       +-----+                        |              |       |
>> +    |  |   |  +------+   +------+               +-------------------+    |
>> +    |  |   |  |  BM  |   |  QM  |  IPQ9574-PPE  |    L2/L3 Process  |    |
>> +    |  |   |  +------+   +------+               +-------------------+    |
>> +    |  |   |                                             |               |
>> +    |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
>> +    |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
>> +    |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
>> +    |  |   |     |         |         |         |         |         |     |
>> +    |  |   +-----+---------+---------+---------+---------+---------+-----+
>> +    |  |         |         |         |         |         |         |
>> +    |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
>> +    +--+---->|                PCS0                 | |  PCS1 | | PCS2  |
>> +    |(clock) +---+---------+---------+---------+---+ +---+---+ +---+---+
>> +    |            |         |         |         |         |         |
>> +    |        +---+---------+---------+---------+---+ +---+---+ +---+---+
>> +    +------->|             QCA8075 PHY             | | PHY4  | | PHY5  |
>> +     (clock) +-------------------------------------+ +-------+ +-------+
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,ipq9574-ppe
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: PPE core clock from NSS clock controller
>> +      - description: PPE APB (Advanced Peripheral Bus) clock from NSS clock controller
>> +      - description: PPE ingress process engine clock from NSS clock controller
>> +      - description: PPE BM, QM and scheduler clock from NSS clock controller
> 
> Drop 'from NSS clock controller'. That's outside the scope of this
> binding.

Ok, will update.

> 
>> +
>> +  clock-names:
>> +    items:
>> +      - const: ppe
>> +      - const: apb
>> +      - const: ipe
>> +      - const: btq
>> +
>> +  resets:
>> +    maxItems: 1
>> +    description: PPE reset, which is necessary before configuring PPE hardware
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +    description: PPE switch miscellaneous interrupt
>> +
>> +  interconnects:
>> +    items:
>> +      - description: Clock path leading to PPE switch core function
>> +      - description: Clock path leading to PPE register access
>> +      - description: Clock path leading to QoS generation
>> +      - description: Clock path leading to timeout reference
>> +      - description: Clock path leading to NSS NOC from memory NOC
>> +      - description: Clock path leading to memory NOC from NSS NOC
>> +      - description: Clock path leading to enhanced memory NOC from NSS NOC
> 
> Clock path? This should be bus interconnect paths.

Sure, I will use "bus interconnect path" for clarity.

> 
>> +
>> +  interconnect-names:
>> +    items:
>> +      - const: ppe
>> +      - const: ppe_cfg
>> +      - const: qos_gen
>> +      - const: timeout_ref
>> +      - const: nssnoc_memnoc
>> +      - const: memnoc_nssnoc
>> +      - const: memnoc_nssnoc_1
>> +
>> +  ethernet-dma:
>> +    type: object
>> +    additionalProperties: false
>> +    description:
>> +      EDMA (Ethernet DMA) is used to transmit packets between PPE and ARM
>> +      host CPU. There are 32 TX descriptor rings, 32 TX completion rings,
>> +      24 RX descriptor rings and 8 RX fill rings supported.
>> +
>> +    properties:
>> +      clocks:
>> +        items:
>> +          - description: EDMA system clock from NSS Clock Controller
>> +          - description: EDMA APB (Advanced Peripheral Bus) clock from
>> +              NSS Clock Controller
>> +
>> +      clock-names:
>> +        items:
>> +          - const: sys
>> +          - const: apb
>> +
>> +      resets:
>> +        maxItems: 1
>> +        description: EDMA reset from NSS clock controller
>> +
>> +      interrupts:
>> +        minItems: 65
>> +        maxItems: 65
>> +
>> +      interrupt-names:
>> +        minItems: 65
>> +        maxItems: 65
>> +        description:
>> +          Interrupts "txcmpl_[0-31]" are the Ethernet DMA TX completion ring interrupts.
>> +          Interrupts "rxfill_[0-7]" are the Ethernet DMA RX fill ring interrupts.
>> +          Interrupts "rxdesc_[0-23]" are the Ethernet DMA RX Descriptor ring interrupts.
>> +          Interrupt "misc" is the Ethernet DMA miscellaneous error interrupt.
> 
> items:
>    oneOf:
>      - pattern: '^txcmpl_([1-2]?[0-9]|3[01])$'
>      - pattern: '^rxfill_[0-7]$'
>      - pattern: '^rxdesc_(1?[0-9]|2[0-3])$'
>      - const: misc
> 

Thanks for the suggestion, I will add the constraint.

>> +
>> +    required:
>> +      - clocks
>> +      - clock-names
>> +      - resets
>> +      - interrupts
>> +      - interrupt-names
>> +
>> +patternProperties:
>> +  "^(ethernet-)?ports$":
> 
> New binding, does 'ethernet-' part need to be optional? No.

OK, understand. Will update to make 'ethernet-' mandatory.

> 
>> +    patternProperties:
>> +      "^ethernet-port@[1-6]+$":
>> +        type: object
>> +        unevaluatedProperties: false
>> +        $ref: ethernet-switch-port.yaml#
>> +
>> +        properties:
>> +          reg:
>> +            minimum: 1
>> +            maximum: 6
>> +            description: PPE Ethernet port ID
>> +
>> +          clocks:
>> +            items:
>> +              - description: Port MAC clock from NSS clock controller
>> +              - description: Port RX clock from NSS clock controller
>> +              - description: Port TX clock from NSS clock controller
>> +
>> +          clock-names:
>> +            items:
>> +              - const: mac
>> +              - const: rx
>> +              - const: tx
>> +
>> +          resets:
>> +            items:
>> +              - description: Port MAC reset from NSS clock controller
>> +              - description: Port RX reset from NSS clock controller
>> +              - description: Port TX reset from NSS clock controller
>> +
>> +          reset-names:
>> +            items:
>> +              - const: mac
>> +              - const: rx
>> +              - const: tx
>> +
>> +        required:
>> +          - reg
>> +          - clocks
>> +          - clock-names
>> +          - resets
>> +          - reset-names
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - resets
>> +  - interconnects
>> +  - interconnect-names
>> +  - ethernet-dma
>> +
>> +allOf:
>> +  - $ref: ethernet-switch.yaml
>> +
>> +unevaluatedProperties: false


