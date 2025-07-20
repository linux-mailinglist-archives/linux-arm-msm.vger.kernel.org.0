Return-Path: <linux-arm-msm+bounces-65832-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65722B0B933
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 01:29:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0EC1176754
	for <lists+linux-arm-msm@lfdr.de>; Sun, 20 Jul 2025 23:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D390322DFBE;
	Sun, 20 Jul 2025 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8V/zCiy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB1212CDA5;
	Sun, 20 Jul 2025 23:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753054193; cv=none; b=CGYVq/8qLSOSCF0qYU0kE6nucQzGCJOpt1Qb2Kadi2PaxTnNuUillVAPtf3KB62B/4whCX0UJcOv5xiKfDgo7oYbEhlZtzdUpqmiqAvs0r/4oP6o9We5ZeJgTGJIV5QyYFEwM1FQHWzrV3UQYu0m5KvOVfZxqMMf2zv6S1Rr2CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753054193; c=relaxed/simple;
	bh=9vRFi57eCNNn/RDG1UsnpLJA0b2NK9C+iSXFxF1Bsu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1FrqveAG5O50zY4x126Ffp40SI63pGNJ+hLMKuGbD5Dk+gsYNCN2IUVuIIhg/3UmGPh1R/uuvKPqoenjfwlAF3/kGc8uKvQWcKZ3SeLoHgCSHmO/oAH/JJHNdNkxS8q0I0n7JzlPa8YUo/CCQs6BCDCzSKgWtrHQmbLKPteDuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8V/zCiy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C0CC4CEE7;
	Sun, 20 Jul 2025 23:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753054193;
	bh=9vRFi57eCNNn/RDG1UsnpLJA0b2NK9C+iSXFxF1Bsu4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8V/zCiyA4u/5PyfBrhpwGiPbXUwMo0HTAx+K7zSRwdmp+PKBPT2vii+6hPfcbAjy
	 2E+uTWZ8QZjdX4Z8defLdoE1RtHOnwdeMWfjGsGtRSXdWPp+pMDXXBmabMPFi0t7X5
	 MTeg9th7oSkxf7MG4+Gj/EC+h26qOlzDV9EYcDUzPD1z6ls4lI+4MwTFzBqICzXShD
	 7BLvUbAPGD84WrSLNxuwEP9AFhXNN7/0qmkEwJX5EABaJ2MSfEeTWET8LKrSJZcXeQ
	 5uKxFu29ob4YwEuI5dYLikVQDIyrjpBvw2WgVNlD1qxkp1PFkSuYTK8vxJhWkGC+Yv
	 UE+r0AgmhZ79w==
Date: Sun, 20 Jul 2025 18:29:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: =?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	davem@davemloft.net, Conor Dooley <conor+dt@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Antoine Tenart <atenart@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Paolo Abeni <pabeni@redhat.com>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Daniel Golle <daniel@makrotopia.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>, mwojtas@chromium.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next v9 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <175305419142.3067276.17489545129976520306.robh@kernel.org>
References: <20250717073020.154010-1-maxime.chevallier@bootlin.com>
 <20250717073020.154010-2-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717073020.154010-2-maxime.chevallier@bootlin.com>


On Thu, 17 Jul 2025 09:30:05 +0200, Maxime Chevallier wrote:
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
>  .../bindings/net/ethernet-connector.yaml      | 45 +++++++++++++++++++
>  .../devicetree/bindings/net/ethernet-phy.yaml | 18 ++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


