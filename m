Return-Path: <linux-arm-msm+bounces-2170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F64B7FAEDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 01:09:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BBA61C20B19
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 00:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1091C37A;
	Tue, 28 Nov 2023 00:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HnwPnhLt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF328192;
	Mon, 27 Nov 2023 16:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ns3R255gsALDi2Q2TyvQsGBPXsb0MIEuzdoPy5X6KnI=; b=HnwPnhLtC1NJ6kLr+65/SGM542
	v59VSZsTZ7cRCCvbFw41KMq0xkqFLbduLGZ4qO5R3PnQ3Wm/G5Vd/vcR5CXbWVc8vbiTdq4W1WT4L
	Ke6HQCCTY50pF+kV4hyxACfpkCj4yw+AV42r3oz4N9T3oJPI5wx8xRTDIQoX1NBaN7Cs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r7lfO-001OlF-5C; Tue, 28 Nov 2023 01:09:30 +0100
Date: Tue, 28 Nov 2023 01:09:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rob Herring <robh@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next PATCH RFC v3 1/8] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <afacaa4c-c3b1-41ae-aa14-d91efd6ac2d3@lunn.ch>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
 <20231126015346.25208-2-ansuelsmth@gmail.com>
 <20231127221611.GA4023452-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127221611.GA4023452-robh@kernel.org>

> > +    description:
> > +      The base ID number for the PHY package.
> > +      Commonly the ID of the first PHY in the PHY package.
> > +
> > +      Some PHY in the PHY package might be not defined but
> > +      still exist on the device (just not attached to anything).
> > +      The reg defined in the PHY package node might differ and
> > +      the related PHY might be not defined.
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> 
> You are implementing a secondary MDIO bus within this node. It needs a 
> $ref to mdio.yaml instead of defining the bus again implicitly.

This is where i think this is questionable. It is not implemented in
the kernel as a secondary bus. The devices within this container are
just devices on the MDIO bus. The value of reg inside the container
and outside the container refer to the same bus.

However, i do agree about referring to mdio.yaml inside the container.

> > +patternProperties:
> > +  ^ethernet-phy(@[a-f0-9]+)?$:
> > +    $ref: ethernet-phy.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: true
> > +
> > +examples:
> > +  - |
> > +    mdio {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        ethernet-phy-package@16 {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +            compatible = "ethernet-phy-package";

Christian, this needs a specific compatible to the
package. e.g. 'qca807x-package', and that needs its own .yaml file
indicating what properties this package can have.

	   Andrew

