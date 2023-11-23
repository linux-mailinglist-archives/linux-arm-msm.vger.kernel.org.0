Return-Path: <linux-arm-msm+bounces-1614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9FE7F5709
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 04:31:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4CA81C20A57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 03:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4863D87;
	Thu, 23 Nov 2023 03:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="41r6vZ8a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 770611AB;
	Wed, 22 Nov 2023 19:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R2W1eIGoN44WfeZqoSJKCknBFLhg1MSvdghZBej8Tto=; b=41r6vZ8a0N5C3aFfaYIGG3Nt0+
	w3Wk45OWIBchNx7QWgxcgGk46uyazknOwo6LSarraXU0NkFLrQhUmbSFQejl4OYdVtn+LZGZlV1Zk
	r/YlMNC4pQdIepOfwnD2IWi1WitSCbjq3+02JW0KXua8igRoE0YY8hYTujInIJaLRFC8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r60QS-000wAv-CM; Thu, 23 Nov 2023 04:30:48 +0100
Date: Thu, 23 Nov 2023 04:30:48 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655e4939.5d0a0220.d9a9e.0491@mx.google.com>

On Wed, Nov 22, 2023 at 07:32:22PM +0100, Christian Marangi wrote:
> On Tue, Nov 21, 2023 at 03:45:42PM +0100, Andrew Lunn wrote:
> > > > I do think we need somewhere to put package properties. But i don't
> > > > think phy-mode is such a property. At the moment, i don't have a good
> > > > example of a package property.
> > > 
> > > What about power supplies and reset/enable lines?
> > 
> > Yes, good point. I can imagine some packages sharing regulators. Reset
> > might also be shared, but it makes things messy to handle.
> >
> 
> Sooooo.... Sorry if I insist but I would really love to have something
> ""stable"" to move this further. (the changes are easy enough so it's
> really a matter of finding a good DT structure)
> 
> Maybe a good idea would be summarize the concern and see what solution
> was proposed:
> 
> Concern list:
> 1. ethernet-phy-package MUST be placed in mdio node (not in ethernet,
>    the example was wrong anyway) and MUST have an addr
> 
>    Current example doesn't have an addr. I would prefer this way but
>    no problem in changing this.
> 
>    Solution:
>      - Add reg to the ethernet-phy-package node with the base address of
>        the PHY package (base address = the first PHY address of the
>        package)

Yes.

>        We will have a PHY node with the same address of the PHY package
>        node. Each PHY node in the PHY package node will have reg set to
>        the REAL address in the mdio bus.

Basically Yes. I actually think the first sentence is not 100%
correct. It could be all the package configuration registers are in
the base address, without an actual PHY. The PHYs then follow at
addresses above it. I can also imagine a case where the first PHY in
the package is not used, so its not listed at all. So i think it
should be "We often have a PHY node with the same address of the PHY
package node."

> 3. phy-mode is problematic.
> 
>    It's an optional value to enforce a specific mode for each PHY in the
>    package. For complex configuration the mode won't be defined.
> 
>    Solution:
>     - Rename it to package-phy-mode to make it less confusing.
> 
>     - Add an additional function that PHY package can use to make custom
>       validation on the mode for every PHY attached (in the PHY package).
> 
>       Would make it less clear but more flexible for complex
>       configuration. Maybe both solution can be implemented and the
>       special function is used if the mode is not defined?

The description you give is that there are two SERDES, and both could
be connected to a MAC. What does package-phy-mode represent then? 

Luo Jie patch for the qca8084 seems to have the same issue. It has two
SERDES/PMA, and both could be connected to the MACs. So it seems like
QCA devices don't actually fit this model. If we want to describe the
package link mode, we probably need to list each PMA, and have a
property in the PMA node indicating what link mode the PMA is
operating at.

At least for the moment, its not clear we actually need this at
all. It seems like the phy-mode is all we need. The PHY driver should
know what values are valid per port, and so can validate the value.

> 4. Not finding a correct place to put PHY package info.
> 
>    I'm still convinced the mdio node is the correct place.
>    - PHY package are PHY in bundle so they are actual PHY
>    - We already have in the mdio node special handling (every DSA switch
>      use custom compatible and PHY ID is not used to probe them
>      normally)
>    - Node this way won't be treated as PHY as they won't match the PHY
>      node name pattern and also won't have the compatible pattern for
>      PHY.

We do need a compatible for the package. The kernel is unlikely to use
it, but the validation tools will. Each package can have its own DT
properties, so we need a .yaml to describe those properties. So i
would expect to have a "qca807x-package" compatible, which then lists
the tx driver strength etc. The PHYs within the package don't need
compatible, they are just linux PHYs, probed using the same code as
PHYs outside of a package.

    Andrew

