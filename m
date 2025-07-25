Return-Path: <linux-arm-msm+bounces-66734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6CCB12512
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 22:05:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34D511CE3A30
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 20:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1909B253355;
	Fri, 25 Jul 2025 20:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tc23Ptee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDB72528E1;
	Fri, 25 Jul 2025 20:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753473888; cv=none; b=PZGOT5v5t8rPKTmxU3p8LWFmXETlrRAmyDDNOxj2gx5GHDQjkRF1abXhzTMTEjHGKi7TGABxUtY2CU7Lq2Q0mucIIumYetYaNE8VR98bi9/gP5gUYCPvxaikap45qejKa8BbvAev4DsmsMGdZ+fX4fAb9yhiilbP1ZQRN5tWaNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753473888; c=relaxed/simple;
	bh=XXKRhRbkPdtCnHz5AqzwvY5fPC+7Cnxs+88nTiPHBpE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uqRK3cK/VNHAvDRcjHk08QvQE8SWFNMpyHGRcJ1ogNzAAsy+OlqOO49OayMlj6NY6f9K3jc6fw6TWK8IEMFUGG7fPhy1lj6X16Xse2dW57vO+HyiNxLKoa0uOuQfPb7m3KwK0YQpdeW8IsZWd54btP6Z8QEL4SSbNIx7kMwRuhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tc23Ptee; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D533C4CEE7;
	Fri, 25 Jul 2025 20:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753473887;
	bh=XXKRhRbkPdtCnHz5AqzwvY5fPC+7Cnxs+88nTiPHBpE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tc23PteexjiHb5GWF3qs9ivHEy+H5q1OPzvdp+dh44jd8vBm5+0bhm0wPPLVviUXE
	 h0YSPNOB3hyIqIx/PCzzoOv/mR81NhtPsZLpMBvgtvplYOR6JxNRmua2hgOMzNWGIW
	 HJq5u0pfTtT/aEUinWJeIBcsw3S1rRKrb8sarmtlkB51WR2vJa4YvJmE9JYC/2fld2
	 +esltBUXb6HBDed/ccndqjCLbsZmRc8tuAC6Mo7tlwtl3UdGQYyAQBXvcJLBrpf2ZD
	 GH2ibsBbo78pPXzBPImolt7SgxMAUO8LoRnHNrnnVkGvf2ZMP7hpk50IBI7iE5H+WW
	 tmW2/vlOh+DXA==
Date: Fri, 25 Jul 2025 13:04:45 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Russell King
 <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v10 00/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20250725130445.32e0307f@kernel.org>
In-Reply-To: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Jul 2025 14:16:05 +0200 Maxime Chevallier wrote:
> Here's V10 of the phy_port series. This version doesn't contain any
> significant change, it fixes the conflict on the qualcom PHY driver, as
> well as aggregates the reviews from Rob, K=C3=B6ry and Christophe (thanks
> again).

Looks like we gathered no reviews from PHY maintainers here.
We'll need to Defer this series to 6.18. Perhaps we should
have pinged PHY maintainers a bit more for their input, sorry :(
--=20
pw-bot: cr

