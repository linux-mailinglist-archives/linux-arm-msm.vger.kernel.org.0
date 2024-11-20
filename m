Return-Path: <linux-arm-msm+bounces-38497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF2E9D3C36
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 14:07:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E7A091F25531
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:07:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E4DC1C1F11;
	Wed, 20 Nov 2024 13:01:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030B1AA782;
	Wed, 20 Nov 2024 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732107718; cv=none; b=O3/SpVVocsq+nb53nO2qMcDzwD+QQYmI9whkxvcLjWJSZVDKJnKNaJuwcOizvvcVY0vQSQKrBW016MqUco1q7/MPrmMCRjFrWDreyhny1IInYGqgVuTaZQvpBSNY1WsRvUPBfy+VBtWAOkqCChwksoc3LP22WyRBIG/tYP9hlKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732107718; c=relaxed/simple;
	bh=YAdf51mk3yxuCs2OUJEetCC1+47aPHLM8gQBhUIr1v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6scQDExRMVcX9IkMNxmYufq8x9LdSdGXQMrcHQ2HcC8ZEHQepqZ+CuV4fBEIHchPFLmn3AfjwLOBrNDyg3Fla5JusdZrZ/Z1KR8Ybl4m8/pSc9nPvrPaGjrQ/jyEVZlZ9bLRUu3yeU9AMEEyOMriY6CRel/Rw1BHfM/3hFDZFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B088D201D81;
	Wed, 20 Nov 2024 14:01:54 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id AABEC200262;
	Wed, 20 Nov 2024 14:01:54 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 58A4D203C8;
	Wed, 20 Nov 2024 14:01:54 +0100 (CET)
Date: Wed, 20 Nov 2024 14:01:54 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Rob Herring <robh@kernel.org>
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
Message-ID: <Zz3dwo5lQZBNpdwM@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-13-7dcc90fcffef@oss.nxp.com>
 <20241119203903.GA2249015-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119203903.GA2249015-robh@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Nov 19, 2024 at 02:39:03PM -0600, Rob Herring wrote:
> On Tue, Nov 19, 2024 at 04:00:19PM +0100, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../devicetree/bindings/net/nxp,s32-dwmac.yaml     | 105 +++++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml        |   3 +
> >  2 files changed, 108 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > new file mode 100644
> > index 000000000000..a141e826a295
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nxp,s32-dwmac.yaml
> > @@ -0,0 +1,105 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2021-2024 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,s32-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> > +
> > +maintainers:
> > +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > +
> > +description:
> > +  This device is a Synopsys DWC IP, integrated on NXP S32G/R SoCs.
> > +  The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> > +  the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> > +  interface over Pinctrl device or the output can be routed
> > +  to the embedded SerDes for SGMII connectivity.
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - const: nxp,s32g2-dwmac
> > +      - items:
> > +        - enum:
> > +            - nxp,s32g3-dwmac
> > +            - nxp,s32r45-dwmac
> > +        - const: nxp,s32g2-dwmac
> > +
> > +  reg:
> > +    items:
> > +      - description: Main GMAC registers
> > +      - description: GMAC PHY mode control register
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-names:
> > +    const: macirq
> > +
> > +  clocks:
> > +    items:
> > +      - description: Main GMAC clock
> > +      - description: Transmit clock
> > +      - description: Receive clock
> > +      - description: PTP reference clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: stmmaceth
> > +      - const: tx
> > +      - const: rx
> > +      - const: ptp_ref
> > +
> > +required:
> > +  - clocks
> > +  - clock-names
> > +
> > +allOf:
> > +  - $ref: snps,dwmac.yaml#
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/phy/phy.h>
> > +    bus {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      ethernet@4033c000 {
> > +        compatible = "nxp,s32g2-dwmac";
> > +        reg = <0x0 0x4033c000 0x0 0x2000>, /* gmac IP */
> > +              <0x0 0x4007c004 0x0 0x4>;    /* GMAC_0_CTRL_STS */
> > +        interrupt-parent = <&gic>;
> > +        interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > +        interrupt-names = "macirq";
> > +        snps,mtl-rx-config = <&mtl_rx_setup>;
> > +        snps,mtl-tx-config = <&mtl_tx_setup>;
> > +        clocks = <&clks 24>, <&clks 17>, <&clks 16>, <&clks 15>;
> > +        clock-names = "stmmaceth", "tx", "rx", "ptp_ref";
> > +        phy-mode = "rgmii-id";
> > +        phy-handle = <&phy0>;
> > +
> > +        mtl_rx_setup: rx-queues-config {
> > +          snps,rx-queues-to-use = <5>;
> > +        };
> > +
> > +        mtl_tx_setup: tx-queues-config {
> > +          snps,tx-queues-to-use = <5>;
> > +        };
> > +
> > +        mdio {
> > +          #address-cells = <1>;
> > +          #size-cells = <0>;
> > +          compatible = "snps,dwmac-mdio";
> > +
> > +          phy0: ethernet-phy@0 {
> > +            reg = <0>;
> > +          };
> > +        };
> > +      };
> > +    };
> > diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > index 4e2ba1bf788c..a88d1c236eaf 100644
> > --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> > @@ -66,6 +66,9 @@ properties:
> >          - ingenic,x2000-mac
> >          - loongson,ls2k-dwmac
> >          - loongson,ls7a-dwmac
> > +        - nxp,s32g2-dwmac
> > +        - nxp,s32g3-dwmac
> > +        - nxp,s32r-dwmac
> 
> You really only need to add nxp,s32g2-dwmac since it's always present.

Ok, I will remove those two in v6.

> 
> Other than the yamllint issue,
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Thanks.
/Jan

