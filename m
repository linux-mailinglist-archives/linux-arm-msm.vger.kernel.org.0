Return-Path: <linux-arm-msm+bounces-81162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 53187C4B5F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 04:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3AED94F10E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 03:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 472C431280E;
	Tue, 11 Nov 2025 03:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DSspYwhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AF3081B8;
	Tue, 11 Nov 2025 03:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762833393; cv=none; b=DiFXqo9shmbKhE3SMx4OqtK+7sGRYo52Er7EBbJFIImyUoiYSK88QLm5Gsh0FTfUjcg6F/P0ZsepYA2yERFlzdMRB2qW4AxnT+rixLYg2L0njPVV1XV1WHl76knLreF6o6f6MUTpNs0c8NjfuLlbwUiJ9VbBZaBuLLeplGECDLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762833393; c=relaxed/simple;
	bh=Er99pcx+UU2AIpaK7DG03f3Rvn8ydNFWhYj8DHsMono=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CdA50x/SgGa6Bp3j+ldN8QQGPh2OJY/DS4Nq0wflP/7FDYtRPZvdTOoTOklGNjwxDALnztFwRplJGZiY7VnZjM/+VhN1ltYlDGEUTeYfNebDERGGLl6Q3Kez2qqML1yVkBr4tVfJJeQDDByJ6dvDmWuuRgTRHw4vEIyKkUFNo/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DSspYwhH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Le5nkVZYrAXxjvDfpSDzejjapA5EScUcNa0eOq/Z0hY=; b=DSspYwhHwJPeRD94cKYCbwN/cK
	KcUwjxaG5MyGmplRdRob4Dkwou65KhP6hMfHDQRcTMmx+bLLv4FicAR26anoVEpwOj1cCTIuj1tvF
	CXS76rZDkYkfNyp/d7EzC11qhElcBFTkWbsJzPgFdZ23WhdbD+hForA4MVDiWi7zmMvA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfUT-00DaVZ-FV; Tue, 11 Nov 2025 04:56:21 +0100
Date: Tue, 11 Nov 2025 04:56:21 +0100
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
Subject: Re: [PATCH net-next v15 06/15] net: phy: Create a phy_port for
 PHY-driven SFPs
Message-ID: <75f5c474-ad95-495f-a62c-3244caa34216@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-7-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-7-maxime.chevallier@bootlin.com>

On Thu, Nov 06, 2025 at 10:47:31AM +0100, Maxime Chevallier wrote:
> Some PHY devices may be used as media-converters to drive SFP ports (for
> example, to allow using SFP when the SoC can only output RGMII). This is
> already supported to some extend by allowing PHY drivers to registers
> themselves as being SFP upstream.
> 
> However, the logic to drive the SFP can actually be split to a per-port
> control logic, allowing support for multi-port PHYs, or PHYs that can
> either drive SFPs or Copper.
> 
> To that extent, create a phy_port when registering an SFP bus onto a
> PHY. This port is considered a "serdes" port, in that it can feed data
> to anther entity on the link. The PHY driver needs to specify the

another

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

