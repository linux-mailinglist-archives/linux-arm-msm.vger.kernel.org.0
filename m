Return-Path: <linux-arm-msm+bounces-1231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3B37F1E27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 21:45:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52B68B21705
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Nov 2023 20:45:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350ED2033D;
	Mon, 20 Nov 2023 20:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yuT8rGT0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27204CD;
	Mon, 20 Nov 2023 12:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=sIArtSu73qZ+pj+BkJUnVf1olPkA9bvYl7JJi8jdX28=; b=yuT8rGT0TTi4VPzDs6M2tW4+WD
	t30M18tp5flsnRnUYv0P085yVZDhzSKt6/kQdYDCH5cy2zQMSZ8DTp7v66dUeDdQVEETNn0QxSktR
	NxU60V3wCYit/jTCg0cdTlQVb8Fwyhu8m5Ecqct7NMmQ19I4zPSWZD1sZXTlmaP7DVEA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5B8c-000gjh-WD; Mon, 20 Nov 2023 21:44:59 +0100
Date: Mon, 20 Nov 2023 21:44:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
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
Message-ID: <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231120135041.15259-4-ansuelsmth@gmail.com>

On Mon, Nov 20, 2023 at 02:50:30PM +0100, Christian Marangi wrote:
> Document ethernet PHY package nodes used to describe PHY shipped in
> bundle of 4-5 PHY. These particular PHY require specific PHY in the
> package for global onfiguration of the PHY package.
> 
> Example are PHY package that have some regs only in one PHY of the
> package and will affect every other PHY in the package, for example
> related to PHY interface mode calibration or global PHY mode selection.

I think you are being overly narrow here. The 'global' registers could
be spread over multiple addresses. Particularly for a C22 PHY. I
suppose they could even be in a N+1 address space, where there is no
PHY at all.

Where the global registers are is specific to a PHY package
vendor/model. The PHY driver should know this. All the PHY driver
needs to know is some sort of base offset. PHY0 in this package is
using address X. It can then use relative addressing from this base to
access the global registers for this package.
 
> It's also possible to specify the property phy-mode to specify that the
> PHY package sets a global PHY interface mode and every PHY of the
> package requires to have the same PHY interface mode.

I don't think it is what simple. See the QCA8084 for example. 3 of the
4 PHYs must use QXGMII. The fourth PHY can also use QXGMII but it can
be multiplexed to a different PMA and use 1000BaseX, SGMII or
2500BaseX.

I do think we need somewhere to put package properties. But i don't
think phy-mode is such a property. At the moment, i don't have a good
example of a package property.

> +examples:
> +  - |
> +    ethernet {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy-package {
> +            compatible = "ethernet-phy-package";
> +            #address-cells = <1>;
> +            #size-cells = <0>;

You have the PHYs within the Ethernet node. This is allowed by DT, for
historic reasons. However, i don't remember the last time a patch was
submitted that actually used this method. Now a days, PHYs are on an
MDIO bus, and they are children of that bus in the DT representation.
However you represent the package needs to work with MDIO busses.


    Andrew

---
pw-bot: cr

