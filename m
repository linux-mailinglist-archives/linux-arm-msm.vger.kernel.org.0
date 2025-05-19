Return-Path: <linux-arm-msm+bounces-58375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 059C0ABB6E6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEBE11898A83
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D01EC269816;
	Mon, 19 May 2025 08:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hpGTNOOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97789153BD9;
	Mon, 19 May 2025 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642581; cv=none; b=G2J8ANA4+9FMgkIrgkcu3RsXXGSJcnqtL/yB7Fu60UAkXjEEj7Mrf5fImQH5bdfQWm5mVVHEwH6Gqd1Cc5GGatfWzz19cSDxDodZ3tcKC+rg2lH1x78ihV+gRuGncvVcOPxIsAVsf2CCyZPRtJaxBnzh2dvyQZzqeudd8NwtDac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642581; c=relaxed/simple;
	bh=DvnlKbccpce+ZLmY4HBn+RM09MSGUVos8+IsFw28Ywc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLqHnS+tzM/1VOVJglViWY4xmEJsZDRYmyAnIpQMRDmYk9Kq3GqB4fgVzMO+y0zw0MmkuktXn87/X3IZWKVlRGDbkzaMgjZJp8b3mdQJOHa3SmtSdv3Qjox8UkV+N2npi29LG4J303MT3exnVvxaTG8MErQiZ7+RRRE3kTmxPuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hpGTNOOr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D460C4CEE4;
	Mon, 19 May 2025 08:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747642578;
	bh=DvnlKbccpce+ZLmY4HBn+RM09MSGUVos8+IsFw28Ywc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hpGTNOOrWSFUDHgI6XCMYfrSYWMtBuqAWnHne0vqSTAMz/FBpZvw7dBI3hnI7zVit
	 Bw+B76++GEnYckqbgpz62CuGsKPWxRq8Ad/h+iK801pGqx2ZEOH5XMyNmIHkUaMTnK
	 DqDDpg4H5gHNzU/rdbfdR45Mm2bOb1FSh+wM65K8Ra+0arTgLFSxs+xM+urN6jpJ5B
	 SXNfRI3G4IAN/D5QOckZK+JAdEQEoMc2o2TGD052ElTEFKKeiMjBsIqTNotj2jHwMv
	 /WLvjXccX53XD9XK9LYtht1CjnW3S/aNMWASi0PFoXJLU+4uRXmHCExfI/O9A91Li+
	 rCDlE+Dkwbmxg==
Date: Mon, 19 May 2025 10:16:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lei Wei <quic_leiwei@quicinc.com>, Suruchi Agarwal <quic_suruchia@quicinc.com>, 
	Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com, srinivas.kandagatla@linaro.org, 
	bartosz.golaszewski@linaro.org, john@phrozen.org
Subject: Re: [PATCH net-next v4 01/14] dt-bindings: net: Add PPE for Qualcomm
 IPQ9574 SoC
Message-ID: <20250519-garrulous-monumental-shrimp-94ad70@kuoka>
References: <20250513-qcom_ipq_ppe-v4-0-4fbe40cbbb71@quicinc.com>
 <20250513-qcom_ipq_ppe-v4-1-4fbe40cbbb71@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250513-qcom_ipq_ppe-v4-1-4fbe40cbbb71@quicinc.com>

On Tue, May 13, 2025 at 05:58:21PM GMT, Luo Jie wrote:
> The PPE (packet process engine) hardware block is available in Qualcomm
> IPQ chipsets that support PPE architecture, such as IPQ9574. The PPE in
> the IPQ9574 SoC includes six ethernet ports (6 GMAC and 6 XGMAC), which
> are used to connect with external PHY devices by PCS. It includes an L2
> switch function for bridging packets among the 6 ethernet ports and the
> CPU port. The CPU port enables packet transfer between the ethernet
> ports and the ARM cores in the SoC, using the ethernet DMA.
> 
> The PPE also includes packet processing offload capabilities for various
> networking functions such as route and bridge flows, VLANs, different
> tunnel protocols and VPN.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../devicetree/bindings/net/qcom,ipq9574-ppe.yaml  | 406 +++++++++++++++++++++
>  1 file changed, 406 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> new file mode 100644
> index 000000000000..f36f4d180674
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/qcom,ipq9574-ppe.yaml
> @@ -0,0 +1,406 @@
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
> +  - Pavithra R <quic_pavir@quicinc.com>>

Double >>

> +
> +description:

You got here comment didn't you?

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

...

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
> +  interconnects:
> +    items:
> +      - description: Clock path leading to PPE switch core function
> +      - description: Clock path leading to PPE register access
> +      - description: Clock path leading to QoS generation
> +      - description: Clock path leading to timeout reference
> +      - description: Clock path leading to NSS NOC from memory NOC
> +      - description: Clock path leading to memory NOC from NSS NOC
> +      - description: Clock path leading to enhanced memory NOC from NSS NOC
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

I don't get why this is a separate node.

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
> +        minItems: 29
> +        maxItems: 57

Why is this flexible on the same SoC?

Best regards,
Krzysztof


