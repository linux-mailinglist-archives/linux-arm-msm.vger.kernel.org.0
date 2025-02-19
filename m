Return-Path: <linux-arm-msm+bounces-48576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44248A3CC6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 23:35:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2438A16BE75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 22:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58BD325A2AA;
	Wed, 19 Feb 2025 22:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jf7MQjPi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ECB214A91;
	Wed, 19 Feb 2025 22:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740004532; cv=none; b=r7p+0/Ptg/S7Up72d2F9Cl07GoqC7thSkyYtLukySjL58nPd5Nd1wPAwxyzyQT3vipcNuwregtDXCEJFY5PvYC3/YvROv2dvCUfpWactEk58Jp0LLkK+ejJi86OCD8OrhC1HvgyrmUgOPz8EnG/w0UeyrqRnjvz68Dcn6LU7sMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740004532; c=relaxed/simple;
	bh=55H0to5iJJXxoB8dBhy7Y7xBqqr3s5lvCudSq0wSeNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHt7E8UjZHInD996tpKe+DC8cP1JRSHaH0mJ1FqkmYtrbWNxSqGhs7k2kG6P8SYZUmDprKdAzjEVbtu8vkNqi6FBo50U9ySSkfc5IRu64AKSKxjvGyO+/GfAeyfOyARmBge+TGP7myEjp9tJaaP/yj125Ft4f33uOB76JJ0sHgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jf7MQjPi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A2DC4CED1;
	Wed, 19 Feb 2025 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740004531;
	bh=55H0to5iJJXxoB8dBhy7Y7xBqqr3s5lvCudSq0wSeNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jf7MQjPiA7iK7U0a9ySuTi0W67tdHacWDNQ5dtOzNiBEONFe2CQcWhfG0s3VzBVvj
	 n0WdGBPt+nbZMneOJ/B4oSNTT9NamtLGW0RGyyfoxkhEw+fMtKa7i8eaq5VFmAVaka
	 p5clfwqR9yZM9+ivSfoG6SrY9WoYcU9Xje2jAALmtfsE11HuTTmzC4Zq1FqxTRcrh6
	 N9U6zYreW8k8M1yvo/f2MVlledrW4YXrIzHo2ZjMe891D1zV5lcol8HG9H7jiTiT0W
	 tMr8vdjzEe6PrRZRSCWq9YhtKncfUOdM5aO0GvMXSqxTvjO+b9xinBFjVgaN27O84h
	 Fn9JXtogOFZTA==
Date: Wed, 19 Feb 2025 16:35:30 -0600
From: Rob Herring <robh@kernel.org>
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
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 15/15] dt-bindings: net: Introduce the
 phy-port description
Message-ID: <20250219223530.GA3083990-robh@kernel.org>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
 <20250213101606.1154014-16-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213101606.1154014-16-maxime.chevallier@bootlin.com>

On Thu, Feb 13, 2025 at 11:16:03AM +0100, Maxime Chevallier wrote:
> The ability to describe the physical ports of Ethernet devices is useful
> to describe multi-port devices, as well as to remove any ambiguity with
> regard to the nature of the port.
> 
> Moreover, describing ports allows for a better description of features
> that are tied to connectors, such as PoE through the PSE-PD devices.
> 
> Introduce a binding to allow describing the ports, for now with 2
> attributes :
> 
>  - The number of lanes, which is a quite generic property that allows
>    differentating between multiple similar technologies such as BaseT1
>    and "regular" BaseT (which usually means BaseT4).
> 
>  - The media that can be used on that port, such as BaseT for Twisted
>    Copper, BaseC for coax copper, BaseS/L for Fiber, BaseK for backplane
>    ethernet, etc. This allows defining the nature of the port, and
>    therefore avoids the need for vendor-specific properties such as
>    "micrel,fiber-mode" or "ti,fiber-mode".
> 
> The port description lives in its own file, as it is intended in the
> future to allow describing the ports for phy-less devices.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
> V4: no changes
> 
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 +++++++
>  .../bindings/net/ethernet-port.yaml           | 47 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-port.yaml

Seems my comments on v2 were ignored. Those issues remain.

