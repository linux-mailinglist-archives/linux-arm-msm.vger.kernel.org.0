Return-Path: <linux-arm-msm+bounces-28933-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 677F995638C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 08:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D2531B20E68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 06:21:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22AA114C5B3;
	Mon, 19 Aug 2024 06:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6rUFYVm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4C83EA69;
	Mon, 19 Aug 2024 06:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724048475; cv=none; b=UpmFply90pN4de6Nx+TIfZCMFJkhfK0trPVJSBnyx//4v21Sfzk4edFg1ZWTW74yFOClR7JidqkZoF+sRutZXb/gCM5gRS/7YLk6MkFeQOUM7wa7U9j+Ylt9W58Pt1+gnP++YcdpUlUBSh2HR7wxIEIco1AaYkW971yYgSOZInM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724048475; c=relaxed/simple;
	bh=JqIMZ0DbqksFrQUeGUYa/0oLg+02rBT4QhPT6cpTFn4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2e0npXiD2RkLE9IaMpOMvTDEbzt4Q2XzW14uEiGG6T+7RHK6XOc/tTXoKAdfVxutsDvp0/dfZSXxWHNNP1zEg0SgNr87YtVL/MwoNzZ05KRgbSLLB55ukJkz9iAIdv1zDDUABmOWMZXtX+Eq96pKSzJrz3DdGIIRpS7g2TNPUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6rUFYVm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EEDC32782;
	Mon, 19 Aug 2024 06:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724048474;
	bh=JqIMZ0DbqksFrQUeGUYa/0oLg+02rBT4QhPT6cpTFn4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X6rUFYVmwEOXOpSPoLjB6r0tYGrfNUQ7CA1F/9XF1GjXFN6BZVFT1w09Myq7DpMgC
	 j8zJWpVTLHPHU79RJC5H0qfchVPrAZubsCwpNAkBzQ6Z0Mo67YX41O5h3LVlF0bBvB
	 WH6p+HzXIMXxj3TiC9q9L28TlU7iUM5wqTn4akCP7p3WcR3aOQ/CVkc1ZCw8auBEE1
	 fYgPlvn2umk98Bhyu/ulK02aT8GvI2KM6pykAnaUqaX8r6gIOr2lbnI7Sji6Pi3pTs
	 41iTIeLZ4ihy5oRYo6l5SQPwYt2E4SPhzaj2kq+aNzw3CwU8dRIZiN/aodupN3J5WI
	 6YEkNY5egs8SA==
Message-ID: <7bbd48c8-7fa6-4d41-9560-3de0a2394c55@kernel.org>
Date: Mon, 19 Aug 2024 08:21:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: net: Add DT bindings for DWMAC on NXP
 S32G/R SoCs
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Richard Cochran <richardcochran@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 dl-S32 <S32@nxp.com>
References: <AM9PR04MB8506A1FAC2DA26F27771D039E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <AM9PR04MB8506A1FAC2DA26F27771D039E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/08/2024 23:50, Jan Petrous (OSS) wrote:
> Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> and S32R45 automotive series SoCs.

Fix your email threading. b4 handle everything correctly, so start using it.

> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../bindings/net/nxp,s32cc-dwmac.yaml         | 127 ++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  2 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
> new file mode 100644
> index 000000000000..443ad918a9a5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml

Filename based on compatible, so what does "cc" stand for?

> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2021-2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,s32cc-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> +
> +maintainers:
> +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> +
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  This device is a platform glue layer for stmmac.

Drop description of driver and instead describe the hardware.

> +  Please see snps,dwmac.yaml for the other unchanged properties.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - nxp,s32g2-dwmac
> +      - nxp,s32g3-dwmac
> +      - nxp,s32r45-dwmac
> +
> +  reg:
> +    items:
> +      - description: Main GMAC registers
> +      - description: GMAC PHY mode control register
> +
> +  interrupts:
> +    description: Common GMAC interrupt

No, instead maxItems: 1

> +
> +  interrupt-names:
> +    const: macirq
> +
> +  clocks:
> +    items:
> +      - description: Main GMAC clock
> +      - description: Transmit clock
> +      - description: Receive clock
> +      - description: PTP reference clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: tx
> +      - const: rx
> +      - const: ptp_ref
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - phy-mode

Drop, snps,dwmac requires this.

> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/phy/phy.h>
> +    bus {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      ethernet@4033c000 {
> +        compatible = "nxp,s32cc-dwmac";
> +        reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
> +              <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
> +        interrupt-parent = <&gic>;
> +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-names = "macirq";
> +        snps,mtl-rx-config = <&mtl_rx_setup>;
> +        snps,mtl-tx-config = <&mtl_tx_setup>;
> +        clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;
> +        clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
> +        phy-mode = "rgmii-id";
> +        phy-handle = <&phy0>;
> +
> +        mtl_rx_setup: rx-queues-config {
> +          snps,rx-queues-to-use = <5>;
> +
> +          queue0 {
> +          };
> +          queue1 {
> +          };


Why listing empty nodes?

Best regards,
Krzysztof


