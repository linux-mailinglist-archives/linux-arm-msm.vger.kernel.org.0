Return-Path: <linux-arm-msm+bounces-65964-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 608CEB0CB01
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 21:35:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0A42A1AA7FDB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 19:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3990322B8B6;
	Mon, 21 Jul 2025 19:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJLGNzlF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEB71F418E;
	Mon, 21 Jul 2025 19:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753126547; cv=none; b=sUitDs0pGb2SCTVgqXRLmOqm1Gs5tV85jE486W2zvVq7XgkKccFX7IbgdBbhRKoDD63QRJvOkzZdOLDZCoY8EaEtqx7pTG6E4iuHjoOThd1HIJYIN+HNDw9TWwdKwJJRABfa3F1I9If59PtwfrIiqgcjgj3lshbi6do8EC+OeyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753126547; c=relaxed/simple;
	bh=qjouUFzxPYNotW041AuPIzLMf72AQH27dBeTZYw1Yz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RplREynMY5S/E27h7QkEF1LP+y7H7kGFgS5wCRPGEeWURPtiwWcAf+7Jr+ihss+ojp22IGeKWT4AWpBsy8g6eYceMRdPRrabrWpw+7+wUPYFoS9T6CvCvoTcrUZK1SQQGHf2C2DnPkpv5ZL6sUGhXk4VXhYpH1YQITbxctIE8ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJLGNzlF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B8E5C4CEED;
	Mon, 21 Jul 2025 19:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753126546;
	bh=qjouUFzxPYNotW041AuPIzLMf72AQH27dBeTZYw1Yz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJLGNzlFYPgQacKD4XtBiQDOMY8iAHszXduqI57oUzq2TGz5yN8wVEtvGHjR4Z2EM
	 +40Pxtyo15LNS6mWimMs/P8xlzXpXUUBxF3bHkK9L/ditDna+bg8+R8i/EPSpjtsXM
	 CXI1RgTj4HNixP7mR/dS4J5T5Ngu9rcxtf3ixrZy4w4qmfRxKym687smWajkxHlva/
	 UorLdnpn8f5ZPf9IMW1XMry4edR0F2re7+4uw3/sXb+tjvOZ6mtnS4uDshGUJybDic
	 gSO08YvyCmas2rwPcYCv4bZXCpUvg7W1rhFo/VUu8y7KfJGoywCUZ7l+LFRxS69UWr
	 rcj9MIVwqkDBQ==
Date: Mon, 21 Jul 2025 14:35:45 -0500
From: Rob Herring <robh@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lei Wei <quic_leiwei@quicinc.com>,
	Suruchi Agarwal <quic_suruchia@quicinc.com>,
	Pavithra R <quic_pavir@quicinc.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org,
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com
Subject: Re: [PATCH net-next v6 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Message-ID: <20250721193545.GA1119033-robh@kernel.org>
References: <20250720-qcom_ipq_ppe-v6-0-4ae91c203a5f@quicinc.com>
 <20250720-qcom_ipq_ppe-v6-1-4ae91c203a5f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720-qcom_ipq_ppe-v6-1-4ae91c203a5f@quicinc.com>

On Sun, Jul 20, 2025 at 06:57:08PM +0800, Luo Jie wrote:
> The PPE (packet process engine) hardware block is available in Qualcomm
> IPQ chipsets that support PPE architecture, such as IPQ9574. The PPE in
> the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6 XGMAC), which
> are used to connect with external PHY devices by PCS. It includes an L2
> switch function for bridging packets among the 6 ethernet ports and the
> CPU port. The CPU port enables packet transfer between the ethernet ports
> and the ARM cores in the SoC, using the ethernet DMA.
> 
> The PPE also includes packet processing offload capabilities for various
> networking functions such as route and bridge flows, VLANs, different
> tunnel protocols and VPN.
> 
> The PPE switch is modeled according to the ethernet switch schema, with
> additional properties defined for the switch node for interrupts, clocks,
> resets, interconnects and Ethernet DMA. The switch port node is extended
> with additional properties for clocks and resets.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 529 +++++++++++++++++++++
>  1 file changed, 529 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> new file mode 100644
> index 000000000000..d48169a8ba7c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> @@ -0,0 +1,529 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/qcom,ipq9574-ppe.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ packet process engine (PPE)
> +
> +maintainers:
> +  - Luo Jie <quic_luoj@quicinc.com>
> +  - Lei Wei <quic_leiwei@quicinc.com>
> +  - Suruchi Agarwal <quic_suruchia@quicinc.com>
> +  - Pavithra R <quic_pavir@quicinc.com>
> +
> +description: |
> +  The Ethernet functionality in the PPE (Packet Process Engine) is comprised
> +  of three components, the switch core, port wrapper and Ethernet DMA.
> +
> +  The Switch core in the IPQ9574 PPE has maximum of 6 front panel ports and
> +  two FIFO interfaces. One of the two FIFO interfaces is used for Ethernet
> +  port to host CPU communication using Ethernet DMA. The other is used
> +  communicating to the EIP engine which is used for IPsec offload. On the
> +  IPQ9574, the PPE includes 6 GMAC/XGMACs that can be connected with external
> +  Ethernet PHY. Switch core also includes BM (Buffer Management), QM (Queue
> +  Management) and SCH (Scheduler) modules for supporting the packet processing.
> +
> +  The port wrapper provides connections from the 6 GMAC/XGMACS to UNIPHY (PCS)
> +  supporting various modes such as SGMII/QSGMII/PSGMII/USXGMII/10G-BASER. There
> +  are 3 UNIPHY (PCS) instances supported on the IPQ9574.
> +
> +  Ethernet DMA is used to transmit and receive packets between the six Ethernet
> +  ports and ARM host CPU.
> +
> +  The follow diagram shows the PPE hardware block along with its connectivity
> +  to the external hardware blocks such clock hardware blocks (CMNPLL, GCC,
> +  NSS clock controller) and ethernet PCS/PHY blocks. For depicting the PHY
> +  connectivity, one 4x1 Gbps PHY (QCA8075) and two 10 GBps PHYs are used as an
> +  example.
> +
> +           +---------+
> +           |  48 MHZ |
> +           +----+----+
> +                |(clock)
> +                v
> +           +----+----+
> +    +------| CMN PLL |
> +    |      +----+----+
> +    |           |(clock)
> +    |           v
> +    |      +----+----+           +----+----+  (clock) +----+----+
> +    |  +---|  NSSCC  |           |   GCC   |--------->|   MDIO  |
> +    |  |   +----+----+           +----+----+          +----+----+
> +    |  |        |(clock & reset)      |(clock)
> +    |  |        v                     v
> +    |  |   +----+---------------------+--+----------+----------+---------+
> +    |  |   |       +-----+               |EDMA FIFO |          | EIP FIFO|
> +    |  |   |       | SCH |               +----------+          +---------+
> +    |  |   |       +-----+                        |              |       |
> +    |  |   |  +------+   +------+               +-------------------+    |
> +    |  |   |  |  BM  |   |  QM  |  IPQ9574-PPE  |    L2/L3 Process  |    |
> +    |  |   |  +------+   +------+               +-------------------+    |
> +    |  |   |                                             |               |
> +    |  |   | +-------+ +-------+ +-------+ +-------+ +-------+ +-------+ |
> +    |  |   | |  MAC0 | |  MAC1 | |  MAC2 | |  MAC3 | | XGMAC4| |XGMAC5 | |
> +    |  |   | +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ +---+---+ |
> +    |  |   |     |         |         |         |         |         |     |
> +    |  |   +-----+---------+---------+---------+---------+---------+-----+
> +    |  |         |         |         |         |         |         |
> +    |  |     +---+---------+---------+---------+---+ +---+---+ +---+---+
> +    +--+---->|                PCS0                 | |  PCS1 | | PCS2  |
> +    |(clock) +---+---------+---------+---------+---+ +---+---+ +---+---+
> +    |            |         |         |         |         |         |
> +    |        +---+---------+---------+---------+---+ +---+---+ +---+---+
> +    +------->|             QCA8075 PHY             | | PHY4  | | PHY5  |
> +     (clock) +-------------------------------------+ +-------+ +-------+
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,ipq9574-ppe
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: PPE core clock from NSS clock controller
> +      - description: PPE APB (Advanced Peripheral Bus) clock from NSS clock controller
> +      - description: PPE ingress process engine clock from NSS clock controller
> +      - description: PPE BM, QM and scheduler clock from NSS clock controller

Drop 'from NSS clock controller'. That's outside the scope of this 
binding.

> +
> +  clock-names:
> +    items:
> +      - const: ppe
> +      - const: apb
> +      - const: ipe
> +      - const: btq
> +
> +  resets:
> +    maxItems: 1
> +    description: PPE reset, which is necessary before configuring PPE hardware
> +
> +  interrupts:
> +    maxItems: 1
> +    description: PPE switch miscellaneous interrupt
> +
> +  interconnects:
> +    items:
> +      - description: Clock path leading to PPE switch core function
> +      - description: Clock path leading to PPE register access
> +      - description: Clock path leading to QoS generation
> +      - description: Clock path leading to timeout reference
> +      - description: Clock path leading to NSS NOC from memory NOC
> +      - description: Clock path leading to memory NOC from NSS NOC
> +      - description: Clock path leading to enhanced memory NOC from NSS NOC

Clock path? This should be bus interconnect paths.

> +
> +  interconnect-names:
> +    items:
> +      - const: ppe
> +      - const: ppe_cfg
> +      - const: qos_gen
> +      - const: timeout_ref
> +      - const: nssnoc_memnoc
> +      - const: memnoc_nssnoc
> +      - const: memnoc_nssnoc_1
> +
> +  ethernet-dma:
> +    type: object
> +    additionalProperties: false
> +    description:
> +      EDMA (Ethernet DMA) is used to transmit packets between PPE and ARM
> +      host CPU. There are 32 TX descriptor rings, 32 TX completion rings,
> +      24 RX descriptor rings and 8 RX fill rings supported.
> +
> +    properties:
> +      clocks:
> +        items:
> +          - description: EDMA system clock from NSS Clock Controller
> +          - description: EDMA APB (Advanced Peripheral Bus) clock from
> +              NSS Clock Controller
> +
> +      clock-names:
> +        items:
> +          - const: sys
> +          - const: apb
> +
> +      resets:
> +        maxItems: 1
> +        description: EDMA reset from NSS clock controller
> +
> +      interrupts:
> +        minItems: 65
> +        maxItems: 65
> +
> +      interrupt-names:
> +        minItems: 65
> +        maxItems: 65
> +        description:
> +          Interrupts "txcmpl_[0-31]" are the Ethernet DMA TX completion ring interrupts.
> +          Interrupts "rxfill_[0-7]" are the Ethernet DMA RX fill ring interrupts.
> +          Interrupts "rxdesc_[0-23]" are the Ethernet DMA RX Descriptor ring interrupts.
> +          Interrupt "misc" is the Ethernet DMA miscellaneous error interrupt.

items:
  oneOf:
    - pattern: '^txcmpl_([1-2]?[0-9]|3[01])$'
    - pattern: '^rxfill_[0-7]$'
    - pattern: '^rxdesc_(1?[0-9]|2[0-3])$'
    - const: misc

> +
> +    required:
> +      - clocks
> +      - clock-names
> +      - resets
> +      - interrupts
> +      - interrupt-names
> +
> +patternProperties:
> +  "^(ethernet-)?ports$":

New binding, does 'ethernet-' part need to be optional? No.

> +    patternProperties:
> +      "^ethernet-port@[1-6]+$":
> +        type: object
> +        unevaluatedProperties: false
> +        $ref: ethernet-switch-port.yaml#
> +
> +        properties:
> +          reg:
> +            minimum: 1
> +            maximum: 6
> +            description: PPE Ethernet port ID
> +
> +          clocks:
> +            items:
> +              - description: Port MAC clock from NSS clock controller
> +              - description: Port RX clock from NSS clock controller
> +              - description: Port TX clock from NSS clock controller
> +
> +          clock-names:
> +            items:
> +              - const: mac
> +              - const: rx
> +              - const: tx
> +
> +          resets:
> +            items:
> +              - description: Port MAC reset from NSS clock controller
> +              - description: Port RX reset from NSS clock controller
> +              - description: Port TX reset from NSS clock controller
> +
> +          reset-names:
> +            items:
> +              - const: mac
> +              - const: rx
> +              - const: tx
> +
> +        required:
> +          - reg
> +          - clocks
> +          - clock-names
> +          - resets
> +          - reset-names
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - interconnects
> +  - interconnect-names
> +  - ethernet-dma
> +
> +allOf:
> +  - $ref: ethernet-switch.yaml
> +
> +unevaluatedProperties: false

