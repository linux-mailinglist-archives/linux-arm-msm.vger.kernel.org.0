Return-Path: <linux-arm-msm+bounces-81171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA366C4B6FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 05:14:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D2E043BA58A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 04:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B83234C137;
	Tue, 11 Nov 2025 04:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="j61E5U9M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC49122068A;
	Tue, 11 Nov 2025 04:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762834033; cv=none; b=DdQiyIURyBc+GYDLvvE1mVBSnqwauP6EpgvTYnXBb9u7uGzBFyJbgZVm2YnStx5uDJtbGqp2ctRPW16gjKu/3k9HEEQchR98awBrzSzVJhpkpEtnbAnfiJ2+bZVGO9xi0WCGO8cMrW63qUbbeGCbqsAltL2hyTmoNRTU8ohOnlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762834033; c=relaxed/simple;
	bh=xOwLj1YT62kZN6OFBocFdx7GmjYybVhNUMgPLGSghUU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqHs2NEpeFEmeKd76pOj3gQlZxENvOJCCmctoFDfPQwiJipQOO3GHiPCga+Q+V4reEc9xvEbRSrPHByXm4OHemqj8pLv5rlOqju75K2a7TAHoqba4SAGy2kI/PuXh9L/HQDkOQOmqE1OxkYyGkG8YdZ57yV706H26oVJ2JZHDus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=j61E5U9M; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=xwKgCT7UgpBPVs3A9bvNkrtgllf6iBmZlYjueL9aTC0=; b=j61E5U9MPDRarkCrxC7ZfYtMrY
	Tiw7xN67w2Nf3U+gEZz5o6vJ+BvigMpOt3EZYwx0U+pIKLXD7V4wnkwDu6/us6vvjYGVTg+mzCxvJ
	O5njDT7C1vGO1Z2lujfNPhbk9ykHyZTGZtWB8Y2BwBFfTp1YmHoGDfhom+XL7aFhRbR0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfeo-00DadL-3t; Tue, 11 Nov 2025 05:07:02 +0100
Date: Tue, 11 Nov 2025 05:07:02 +0100
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
Subject: Re: [PATCH net-next v15 13/15] net: phy: Only rely on phy_port for
 PHY-driven SFP
Message-ID: <bacdb0fd-55c6-41b6-b54f-2311c9b46674@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-14-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-14-maxime.chevallier@bootlin.com>

On Thu, Nov 06, 2025 at 10:47:38AM +0100, Maxime Chevallier wrote:
> Now that all PHY drivers that support downstream SFP have been converted
> to phy_port serdes handling, we can make the generic PHY SFP handling
> mandatory, thus making all phylib sfp helpers static.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

