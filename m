Return-Path: <linux-arm-msm+bounces-63221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF29DAEF9A2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 15:05:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 32CF71668AD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 13:03:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05016264A73;
	Tue,  1 Jul 2025 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uhMQ2Yq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F0D29D0D;
	Tue,  1 Jul 2025 13:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374970; cv=none; b=SWjKPdM9FdTz21kY+pyV0isG4ynISPyrn5/WfTDWFt5Y2dqXfE7HeyYM2UCcVqV328C+Ln1dWcppL2jV1qNVu9I/QXYs1IVmRYU682L02BztlQA9/vuYr7YPv9UT1kgPt+m0gXUgzmR1LR9/ZYv+cioNX+fIuf0I3Mh/FXG1tAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374970; c=relaxed/simple;
	bh=F/84wrFwoijHU+FufPitkE6z85i1QdM2oq4GmNNuc+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tqU1fvTr0Tfy6zjLw9a+nQEYd7odvZBTaxmzUYQIGE5EFD+UZ3TUdVPAvXwjo+tVzE5PSlJP4sQedRb3hYPZVyC6LZqhwklKiWoE+7xl8jTqWsTNVtWfLxBO5LqN4s4rPbtHTUfiPHkfrSAluvTIZDXHwPM2UJL6v9Pc4bVQcFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uhMQ2Yq+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221F4C4CEEB;
	Tue,  1 Jul 2025 13:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751374970;
	bh=F/84wrFwoijHU+FufPitkE6z85i1QdM2oq4GmNNuc+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhMQ2Yq+o7XnI05VtPbOaoIlF3tDHhi+binHqry62SGJq8NNmJHGvv9m+EdyYwzR7
	 IahUmrjXhg248tMGQ1OHGRC7N7VmNU/V2007UfApE+MA2EhRPpuKXR7Rt4liEV4c4P
	 JNM702/9rWgab8vLg0hezsMOojEIWvRh55CFXymv+IQrcF3r9J6gW8d+qWTmCjYoov
	 CcXo4C8TxxvPo2Pj0jDPhts3Q8BLjsPMFb100lhTASoBrbgdt1LXD3v3PvbNnPA0ax
	 zgnbXP6KsUZkj98sG0EGz7rXlMJA3DTLO+jbei3nFlFViaQcXohJJP68WqNxEf6uGT
	 8Ls51CrVOOhfg==
Date: Tue, 1 Jul 2025 14:02:43 +0100
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
Subject: Re: [PATCH net-next v7 04/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250701130243.GA130037@horms.kernel.org>
References: <20250630143315.250879-1-maxime.chevallier@bootlin.com>
 <20250630143315.250879-5-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250630143315.250879-5-maxime.chevallier@bootlin.com>

On Mon, Jun 30, 2025 at 04:33:03PM +0200, Maxime Chevallier wrote:

...

> +/**
> + * phy_port_get_type() - get the PORT_* attribut for that port.
> + * @port: The port we want the information from
> + *
> + * Returns: A PORT_XXX value.
> + */
> +int phy_port_get_type(struct phy_port *port)
> +{
> +	if (port->mediums & ETHTOOL_LINK_MEDIUM_BASET)

Hi Maxime,

Should this be:

	if (port->mediums & BIT(ETHTOOL_LINK_MEDIUM_BASET))

Flagged by Smatch (because ETHTOOL_LINK_MEDIUM_BASET is 0,
so as-is the condition is always false).

> +		return PORT_TP;
> +
> +	if (phy_port_is_fiber(port))
> +		return PORT_FIBRE;
> +
> +	return PORT_OTHER;
> +}
> +EXPORT_SYMBOL_GPL(phy_port_get_type);

...

