Return-Path: <linux-arm-msm+bounces-38406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8239D2FA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 21:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 982C71F23C37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 20:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 672651D3565;
	Tue, 19 Nov 2024 20:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUdJEGNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357261D2F55;
	Tue, 19 Nov 2024 20:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732048746; cv=none; b=JeVa87hsWr5IfhmOGdIk2kRTeryyJXitVo3Xgoq+Ic6VNunZRiMCr+QSHVYertMxiutWdKwXtBJTeLLJi7Rji15OYCuxe1P1cLhxT9eXUfey7u2ncxWM18RpzOuNG+cP6dlZlpikT9l+57ug8YrsOThBBj+bfO7ELMHlvIRL49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732048746; c=relaxed/simple;
	bh=OOWExM1N60jCy1dSIf8NXBKIEYTUdBfF3QKNExZ85/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBPhe9jz5+tFWuGJ8mikUkZS0Pk7s8UhQLsnTVPjdZuQx0vWXENDMRPzDWpxDaBFkvhCfdo9Was+7P+Q40zHCyeyn1ziY9U7dSeovw5eiiOlJUUYofO4RLo+OE7iSuHQN6frnTRMG5+Wa1Al1u8Lw03hp0zAUoi6gCNwcRxES2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUdJEGNf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90738C4CECF;
	Tue, 19 Nov 2024 20:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732048745;
	bh=OOWExM1N60jCy1dSIf8NXBKIEYTUdBfF3QKNExZ85/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fUdJEGNf8LcVFkS4Y/CHZrJRYqDVlgSp1kQtKjHAybajS3sjie9VoShoEaevbBPhW
	 ki94a71CZqVvrGOo7s8W5Z8fuJrxDtqPccHIBE7cCLqVvZoLC/enAP39ybhA6173Jb
	 N35VyndijJVXdMzwKFBuX2F3xs91DDblYtFFXUu9r0JyVn7yF9EkOG8vjwhP0wnhm1
	 bWRtfU2PxlVb7B3BGn1flApnJG5KGRClE4rdvYQSP0+7B+tJU6rQTLS5/Sio/VYXqw
	 UkSeXTNVdJvqhYlvthufmgJg0GDqQAcuW1FkEUwYk+0M8gpYjDUg/Aqyq7U9aRYOg5
	 FrpeQC+YJuDTw==
Date: Tue, 19 Nov 2024 14:39:03 -0600
From: Rob Herring <robh@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v5 13/16] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <20241119203903.GA2249015-robh@kernel.org>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>

On Tue, Nov 19, 2024 at 04:00:19PM +0100, Jan Petrous (OSS) wrote:
> Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> and S32R45 automotive series SoCs.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
>  2 files changed, 108 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> new file mode 100644
> index 000000000000..a141e826a295
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> @@ -0,0 +1,105 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2021-2024 NXP
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> +
> +maintainers:
> +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> +
> +description:
> +  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
> +  The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> +  the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> +  interface over Pinctrl device or the output can be routed
> +  to the embedded SerDes for SGMII connectivity.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: nxp,s32g2-dwmac
> +      - items:
> +        - enum:
> +            - nxp,s32g3-dwmac
> +            - nxp,s32r45-dwmac
> +        - const: nxp,s32g2-dwmac
> +
> +  reg:
> +    items:
> +      - description: Main GMAC registers
> +      - description: GMAC PHY mode control register
> +
> +  interrupts:
> +    maxItems: 1
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
> +  - clocks
> +  - clock-names
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
> +        compatible = "nxp,s32g2-dwmac";
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
> +        };
> +
> +        mtl_tx_setup: tx-queues-config {
> +          snps,tx-queues-to-use = <5>;
> +        };
> +
> +        mdio {
> +          #address-cells = <1>;
> +          #size-cells = <0>;
> +          compatible = "snps,dwmac-mdio";
> +
> +          phy0: ethernet-phy@0 {
> +            reg = <0>;
> +          };
> +        };
> +      };
> +    };
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 4e2ba1bf788c..a88d1c236eaf 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -66,6 +66,9 @@ properties:
>          - ingenic,x2000-mac
>          - loongson,ls2k-dwmac
>          - loongson,ls7a-dwmac
> +        - nxp,s32g2-dwmac
> +        - nxp,s32g3-dwmac
> +        - nxp,s32r-dwmac

You really only need to add nxp,s32g2-dwmac since it's always present.

Other than the yamllint issue,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

