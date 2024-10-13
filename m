Return-Path: <linux-arm-msm+bounces-34210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A2099BA19
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 17:33:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A64D3B21021
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 15:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F2313DDB9;
	Sun, 13 Oct 2024 15:33:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B22F855;
	Sun, 13 Oct 2024 15:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728833604; cv=none; b=Q5HDNW3YpgdOmYa/2UNWjkMjZDrtsWx/W2HrklLEOz47UsoX/Qxgwi0QNm1IQBibWxvCBX4LKEX4eEtI+RFj6bV/Ehi6CCMA7A42VpKPnc9kcv1nNcYZvBG0aDAJ2LWdB1gsLvy56m+BZKwUA0Qs1oVeZOWfKX5Fn7WFsmOxWA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728833604; c=relaxed/simple;
	bh=fJkul6k+1xkEG6jqLAyJbONQ+3rSxf+oxu/+tMfJTrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U1xM0RrR7CkqZnyd7yU1vZ4XqPSIP5HMh7kRu3j870t1Y9Jaz7YkZG7UvI7jvOStQuCnhnzja6ZZpSQNaKuv0dTX337MJF+pGr7aPUOA5MFR65YNxNs5eslshGSx76ZELdeSvwNTxC6RDiK3aSkuY39Olcb5g2U59STaHuInk+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0C6EA1A13F7;
	Sun, 13 Oct 2024 17:33:15 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 052241A1C55;
	Sun, 13 Oct 2024 17:33:15 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C72CB20406;
	Sun, 13 Oct 2024 17:33:15 +0200 (CEST)
Date: Sun, 13 Oct 2024 17:33:14 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	dl-S32 <S32@nxp.com>
Subject: Re: [PATCH v2 3/7] dt-bindings: net: Add DT bindings for DWMAC on
 NXP S32G/R SoCs
Message-ID: <ZwvoOpgApLQWWY05@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB8506A1FAC2DA26F27771D039E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <7bbd48c8-7fa6-4d41-9560-3de0a2394c55@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7bbd48c8-7fa6-4d41-9560-3de0a2394c55@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Aug 19, 2024 at 08:21:03AM +0200, Krzysztof Kozlowski wrote:
> On 18/08/2024 23:50, Jan Petrous (OSS) wrote:
> > Add basic description for DWMAC ethernet IP on NXP S32G2xx, S32G3xx
> > and S32R45 automotive series SoCs.
> 
> Fix your email threading. b4 handle everything correctly, so start using it.
> 

Done. V3 will be sent by b4/msmtp.

> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  .../bindings/net/nxp,s32cc-dwmac.yaml         | 127 ++++++++++++++++++
> >  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
> >  2 files changed, 128 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml b/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
> > new file mode 100644
> > index 000000000000..443ad918a9a5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/net/nxp,s32cc-dwmac.yaml
> 
> Filename based on compatible, so what does "cc" stand for?

Ok, removed 'cc'.

> 
> > @@ -0,0 +1,127 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +# Copyright 2021-2024 NXP
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,s32cc-dwmac.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP S32G2xx/S32G3xx/S32R45 GMAC ethernet controller
> > +
> > +maintainers:
> > +  - Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > +
> > +description: |
> 
> Do not need '|' unless you need to preserve formatting.

Removed.

> 
> > +  This device is a platform glue layer for stmmac.
> 
> Drop description of driver and instead describe the hardware.

Changed in v3.

> 
> > +  Please see snps,dwmac.yaml for the other unchanged properties.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - nxp,s32g2-dwmac
> > +      - nxp,s32g3-dwmac
> > +      - nxp,s32r45-dwmac
> > +
> > +  reg:
> > +    items:
> > +      - description: Main GMAC registers
> > +      - description: GMAC PHY mode control register
> > +
> > +  interrupts:
> > +    description: Common GMAC interrupt
> 
> No, instead maxItems: 1
> 

Done.

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
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - interrupt-names
> > +  - clocks
> > +  - clock-names
> > +  - phy-mode
> 
> Drop, snps,dwmac requires this.

Compressed to 'clocks' and 'clock-names'.

> 
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
> > +        compatible = "nxp,s32cc-dwmac";
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
> > +
> > +          queue0 {
> > +          };
> > +          queue1 {
> > +          };
> 
> 
> Why listing empty nodes?

Removed in v3.

> 
> Best regards,
> Krzysztof
> 

Thanks.
/Jan

