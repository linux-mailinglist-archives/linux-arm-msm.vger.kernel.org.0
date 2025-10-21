Return-Path: <linux-arm-msm+bounces-78067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED165BF4526
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 03:52:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BCDD818884D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 01:53:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4433615687D;
	Tue, 21 Oct 2025 01:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d7bFmOvY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02127E105;
	Tue, 21 Oct 2025 01:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761011572; cv=none; b=O4TZo0sBA6qBow8cHPu6EDYLo8oOWz7faRV8jswK8/29C3krR6ze4zt2HOeZ3IVjY0ENFcgmT4fJwgH69qOhyewzDeBPQZXp2MsIi7F0uXwqvh7ITYjYsA74MFpXj2abFFa+m5aNUc46IVOHmNC9Xq1Rq9eggBhcbMV7Ij+4sFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761011572; c=relaxed/simple;
	bh=DYZ+NvvXDV3GLpnrmo/lEqoRa29w7O428mCra33ZZ18=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JDEUWXOj4Dg9//O+Ok/P8ixajHXAXOYq9/SW9D0vsFK9CwijFzQX0W+6pi9uJPr1mdH6j26QNbFx6qhwdQhDOpxF4mr6TyA+cO0594r/1jI7Odd65pYxUrd/dehBSYs1+oplbssJfgfdoA7s1uxHRt2Uae/vXyJIlamnyU+iiQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d7bFmOvY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB1CC4CEFB;
	Tue, 21 Oct 2025 01:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761011571;
	bh=DYZ+NvvXDV3GLpnrmo/lEqoRa29w7O428mCra33ZZ18=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=d7bFmOvYou2jVLWtmxieZwAGRgonwPmZSCPDWuIolmQx0M4Y5zhvniT/tOcwtn9RQ
	 l2IhR3X6Al2Nb290zycAxVMwew6eXS1PI5Z67wY71A2YkQI/IfsttMCvOaqSkhvpF0
	 th8NqPcpgNXEvT3EQhfp9MjJxqybhWV9hzuelw2I0d4fsK75z09aGiVeF9Shcgta5Y
	 msD9yFUVjqF4ApvAhN6aqAuh2zgN4AAYin+y4AI02O5nfP5FgIbPrDykx/5mseg/SY
	 8HriN8sx5C1HeVJBpPnNlXEY33sV04wvbvNoXZtFN0KhTuxSZjB7RrUAbb4fKtxFio
	 Xvn8rrwWJU8Rg==
Date: Mon, 20 Oct 2025 18:52:49 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Herve Codina
 <herve.codina@bootlin.com>, Florian Fainelli <f.fainelli@gmail.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>, Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v14 00/16] net: phy: Introduce PHY ports
 representation
Message-ID: <20251020185249.32d93799@kernel.org>
In-Reply-To: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 13 Oct 2025 16:31:26 +0200 Maxime Chevallier wrote:
> Hi everyone,
> 
> Here is a V14 for the phy_port work, aiming at representing the
> connectors and outputs of PHY devices.

I can't help but read the lack of replies from PHY maintainers
here as a tacit rejection. Not entirely sure what to do here.
Should we discuss this at the netdev call tomorrow (8:30am PT)?
Would any PHY maintainer be willing to share their opinion?

