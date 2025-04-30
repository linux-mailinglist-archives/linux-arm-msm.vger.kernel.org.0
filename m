Return-Path: <linux-arm-msm+bounces-56214-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA2AA45F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 10:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8A2D9A6CC4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 08:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A1E20C038;
	Wed, 30 Apr 2025 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m1lJ8wzZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5032AEE1;
	Wed, 30 Apr 2025 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003148; cv=none; b=aM5Bu52PLJj8ixrKM4zOzeeiGeAD9hD3Zk4pVzDrwLojlCJP66XqSrZRcyUoBlQiEHEAoQ/O1yIe5LeNiRwN3XIAzdMmQD3E6VxlGX8/ksLpyJYC8ZmfOXDJOGESiEpGyy5GJxury6C7nzN9Swg2Vhm92ZOFm7+eA7lHOAo1+hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003148; c=relaxed/simple;
	bh=7Cul/zndrL+/IVYzqfi6IU1dEFCIVPUdV6j259m69G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a4oZTvmYj4muIx0aZdlG6ovra7vXrM5qVXHWnealPI+18Sg07Fj/5XeJv/YR59LkXHH3wS/OwhcJl0Aq2x9Y5D6u6kIL5thYm3k0OSM16c0cHzu7wb7XbT/AUt1cfFvStCEW+Leo/FmY9ASkTcNdj2gUbLvDhi7+onYA/4fr8aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m1lJ8wzZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 941A3C4CEE9;
	Wed, 30 Apr 2025 08:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746003148;
	bh=7Cul/zndrL+/IVYzqfi6IU1dEFCIVPUdV6j259m69G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1lJ8wzZTPM8DhfyWr4/2HegX1ltD3jb9oyGwEsxQnggTzFu4BmhN+FDUo2zeu1RN
	 giDLlf5a2a05M1NTM0TyNM+3EdxGFIjko0NcwuH8tmM4waxKh+taOw9pETLP/OGysx
	 y6q41rNWMiXvecfuO5utnba6X+/RrlRRRG0Zyp779JD4OXsp8BT5vKLho9xhVLhP01
	 L3pek8e8yF1Kz3U+jqQ8zO6NCEaQ1htsGbDQh30QnW28U8lUEpb18UeDTpFssre9i9
	 UMhCihDPn7fYp+FgDTScyGj9IhAcqbLQNWIY9xOmFsozHxD0z0V8xLXR1vNNBZ07+D
	 pBH9xsh9vL2PA==
Date: Wed, 30 Apr 2025 09:52:20 +0100
From: Simon Horman <horms@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v5 04/14] net: phy: dp83822: Add support for
 phy_port representation
Message-ID: <20250430085220.GS3339421@horms.kernel.org>
References: <20250425141511.182537-1-maxime.chevallier@bootlin.com>
 <20250425141511.182537-5-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425141511.182537-5-maxime.chevallier@bootlin.com>

On Fri, Apr 25, 2025 at 04:14:57PM +0200, Maxime Chevallier wrote:
> With the phy_port representation intrduced, we can use .attach_port to
> populate the port information based on either the straps or the
> ti,fiber-mode property. This allows simplifying the probe function and
> allow users to override the strapping configuration.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/phy/dp83822.c | 70 ++++++++++++++++++++++++---------------
>  1 file changed, 44 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
> index 490c9f4e5d4e..bbbe509f3bd9 100644
> --- a/drivers/net/phy/dp83822.c
> +++ b/drivers/net/phy/dp83822.c
> @@ -11,6 +11,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/phy.h>
> +#include <linux/phy_port.h>
>  #include <linux/netdevice.h>
>  #include <linux/bitfield.h>
>  
> @@ -814,17 +815,6 @@ static int dp83822_of_init(struct phy_device *phydev)
>  	int i, ret;
>  	u32 val;
>  
> -	/* Signal detection for the PHY is only enabled if the FX_EN and the
> -	 * SD_EN pins are strapped. Signal detection can only enabled if FX_EN
> -	 * is strapped otherwise signal detection is disabled for the PHY.
> -	 */
> -	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> -		dp83822->fx_signal_det_low = device_property_present(dev,
> -								     "ti,link-loss-low");
> -	if (!dp83822->fx_enabled)
> -		dp83822->fx_enabled = device_property_present(dev,
> -							      "ti,fiber-mode");
> -
>  	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
>  		if (strcmp(of_val, "mac-if") == 0) {
>  			dp83822->gpio2_clk_out = DP83822_CLK_SRC_MAC_IF;
> @@ -953,6 +943,47 @@ static int dp83822_read_straps(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
> +{
> +	struct dp83822_private *dp83822 = phydev->priv;
> +	struct device *dev = &phydev->mdio.dev;

Hi Maxime,

A nit from my side:

dev is unused if CONFIG_OF_MDIO is not defined.

Perhaps it's scope can be reduced somehow.
Or &phydev->mdio.dev can be used directly?
Or the code guarded by CONFIG_OF_MDIO could be moved into a separate
function that makes use if IS_ENABLED to return early if there is nothing
to do (maybe the best option if possible, as it would increase compile
coverage).
Or ...

> +	int ret;
> +
> +	if (port->mediums) {
> +		if (phy_port_is_fiber(port))
> +			dp83822->fx_enabled = true;
> +	} else {
> +		ret = dp83822_read_straps(phydev);
> +		if (ret)
> +			return ret;
> +
> +#ifdef CONFIG_OF_MDIO
> +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> +			dp83822->fx_signal_det_low =
> +				device_property_present(dev, "ti,link-loss-low");
> +
> +		/* ti,fiber-mode is still used for backwards compatibility, but
> +		 * has been replaced with the mdi node definition, see
> +		 * ethernet-port.yaml
> +		 */
> +		if (!dp83822->fx_enabled)
> +			dp83822->fx_enabled =
> +				device_property_present(dev, "ti,fiber-mode");
> +#endif
> +
> +		if (dp83822->fx_enabled) {
> +			port->lanes = 1;
> +			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF);
> +		} else {
> +			/* This PHY can only to 100BaseTX max, so on 2 lanes */
> +			port->lanes = 2;
> +			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
> +		}
> +	}
> +
> +	return 0;
> +}

...

