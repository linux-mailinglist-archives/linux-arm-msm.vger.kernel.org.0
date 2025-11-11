Return-Path: <linux-arm-msm+bounces-81163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 593C0C4B616
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 04:59:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3276C1890BF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 03:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 079963128CB;
	Tue, 11 Nov 2025 03:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="bb7j0aBA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C83E2FD67A;
	Tue, 11 Nov 2025 03:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762833534; cv=none; b=XqbtMlIwzHDsNB6hEIITvYjTYOG87oYoIWcrzJ9DW4Y7C0sNO0b8IgyfAep+x4MoUm8f2WokTUcxLbsnYoOeFyfvZriPr1puiogrvQ0CA+IlS+aPmupgwpj19F55uVKnEhfc4kLx7s7Rm9wfwjFPFMzKB6As7dYe4/CE4+kbhdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762833534; c=relaxed/simple;
	bh=AYGSMRIFbVoBYpbYxtM7gO+C0wiGDQ9RGkDynVoBkiI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqeAluGUUCwePM9SHQCbrE4h4zfVdBxm9HVa+KbvPyhtShmwt3r9QnDJentqFfWoNmmfV9TzAwCK/EdzwHGrQ19S4zQ2YDEFYYZ4OtqOUNhLhGr1iseTXiy+UjUSt+JP0hm/JvceN6Bmw6rvv0q6DmJvfsEQe6z77c951y64HbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=bb7j0aBA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bmQrc44iJz5u+hImAPDDt4huoJSd7wm/+r68X7iQLaw=; b=bb7j0aBATwc8+DvD1MF0ml6VvU
	moqxFUWPjEp62mqmxs0Dncr+iKlq9Wy9d/LUMvVxGeqbLJ1vXQxZzygMLY8YN3ES4zXZUJIXPwdTP
	LxuQ+GneAX8FDApKuoDH4kpWEiyJtMyNn9loKzGn5Dmfjm0c4mSOSag0jTYEVhSlVeUY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfWk-00DaWu-Cw; Tue, 11 Nov 2025 04:58:42 +0100
Date: Tue, 11 Nov 2025 04:58:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v15 07/15] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <7fac025c-3ec3-4900-9fa0-5e1a06cafeb4@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-8-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-8-maxime.chevallier@bootlin.com>

On Thu, Nov 06, 2025 at 10:47:32AM +0100, Maxime Chevallier wrote:
> There are currently 4 PHY drivers that can drive downstream SFPs:
> marvell.c, marvell10g.c, at803x.c and marvell-88x2222.c. Most of the
> logic is boilerplate, either calling into generic phylib helpers (for
> SFP PHY attach, bus attach, etc.) or performing the same tasks with a
> bit of validation :
>  - Getting the module's expected interface mode
>  - Making sure the PHY supports it
>  - Optionaly perform some configuration to make sure the PHY outputs
>    the right mode
> 
> This can be made more generic by leveraging the phy_port, and its
> configure_mii() callback which allows setting a port's interfaces when
> the port is a serdes.
> 
> Introduce a generic PHY SFP support. If a driver doesn't probe the SFP
> bus itself, but an SFP phandle is found in devicetree/firmware, then the
> generic PHY SFP support will be used, relying on port ops.
> 
> PHY driver need to :
>  - Register a .attach_port() callback
>  - When a serdes port is registered to the PHY, drivers must set
>    port->interfaces to the set of PHY_INTERFACE_MODE the port can output
>  - If the port has limitations regarding speed, duplex and aneg, the
>    port can also fine-tune the final linkmodes that can be supported
>  - The port may register a set of ops, including .configure_mii(), that
>    will be called at module_insert time to adjust the interface based on
>    the module detected.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

