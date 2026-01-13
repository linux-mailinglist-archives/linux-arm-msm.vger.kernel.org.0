Return-Path: <linux-arm-msm+bounces-88797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E53D199AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:49:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1879D30662A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2957A296BD2;
	Tue, 13 Jan 2026 14:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1UJICsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05524287268;
	Tue, 13 Jan 2026 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315577; cv=none; b=i7Klcgcs6n5yD83GN3MOhfbyNj+H+u7VhoXWyAaoZD851Nlbx+0gJZ++Z57+1T3o6222QcHzvRT1VcGFOACPnBXn6TnlRuOjkPFTHg1GPIx0/opJ0S2ymTvBKimUfx4OldR/j4sa/k10FfVAc3YFp7BDoiZi16wN6drpyhw22Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315577; c=relaxed/simple;
	bh=cEyiVLjNwfdDXJ0451AwNlqy8+a2Ag+lY1jlX6JLTDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifj+xwkPaGyz6CDpifyE/fwX1ZjWWM6k3rVlR88UjZNnw41L4VeVeDy/9UDRUj4T3xBX0ADV3aebjLAYJYtu2UvmrwltE7oXYEPVXsDMB7abRJ0jUSVYaeBLGyQvhhcft6wBsS+syKiEHaVXA+OWb0hj3OHuxbZtO4toGX1T7Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1UJICsW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BD9C116C6;
	Tue, 13 Jan 2026 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768315576;
	bh=cEyiVLjNwfdDXJ0451AwNlqy8+a2Ag+lY1jlX6JLTDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k1UJICsWnKR2goQAsuExFImjT+eFEgpQjbCn0i5tvA/k95KQgHuEfHWabfCo+6Db6
	 9svQn2BaVk+2sQ6ujwqRGONZITsj+220A1aY4SwFzU5YAcBAxC+GywH7gTGuuc1B+4
	 tiKFkQ7kxBF3i9wBtnNadL9pSMYwCecxMURmjbVijmuChN4/9GnWBP2lem64Lb8qF0
	 hhF+fEfxqHVM+lNuqC/SRooItfr1lUEujnaArVkqu1CKMAP14hyEyPhFjku9KRqJxk
	 lTgv8gv+OOqwo5FezVP1Kg/P7NzSojA5ovnHWZBE6s3w71SMHflg38zqdsUUO/+0Ps
	 bBkd5y2nQBz8A==
Date: Tue, 13 Jan 2026 08:46:14 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: linux-arm-msm@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	mwojtas@chromium.org, devicetree@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	netdev@vger.kernel.org, davem@davemloft.net,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Tariq Toukan <tariqt@nvidia.com>, Simon Horman <horms@kernel.org>,
	Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v22 01/14] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <176831557374.3740779.1775436338458125748.robh@kernel.org>
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
 <20260108080041.553250-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108080041.553250-2-maxime.chevallier@bootlin.com>


On Thu, 08 Jan 2026 09:00:26 +0100, Maxime Chevallier wrote:
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
>  - The number of pairs, which is a quite generic property that allows
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
>  .../bindings/net/ethernet-connector.yaml      | 56 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 75 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


