Return-Path: <linux-arm-msm+bounces-83522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AD3C8CB4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 04:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EE63D4E3025
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 03:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFEA221710;
	Thu, 27 Nov 2025 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LmWQoFG+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89171125A9;
	Thu, 27 Nov 2025 03:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764212438; cv=none; b=Dd46cM7nEu5RgaVl+sHXoFQi88Ivdr/OwXtHBN/883IMazGTds+GPmLuuXuc/BkyQZxR4rpdHRC37P/JbgfQuNqZXSJi2v4nRil67ORBmkPE/PCJTFZzQ1qD7LWbw7GULlzVL5KW/mUWfDrqItzFJDN4kssRhItvc8Y1o//VzQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764212438; c=relaxed/simple;
	bh=v2WQNfal91+gWtKQBH1S6BdVlVROCwiYaZ7ZQoZBk1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ng23fNux7aQ4+xJCm9tNeOWDJ+4+iGeqi4NLKI65SfMzrvBFPXt8DlhZp7p2dMGJb6dBtdNwkGJZR6XVsPVdhG5N8kvcPi0RlrFJC5gfjqUbzMPG0ycrvoLf4Dj1yRsC2fEQp5sGCTHJg4bZurvqhKyEDrce8PAoimYriSDVn0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LmWQoFG+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B1BC4CEF7;
	Thu, 27 Nov 2025 03:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764212438;
	bh=v2WQNfal91+gWtKQBH1S6BdVlVROCwiYaZ7ZQoZBk1Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=LmWQoFG+K2x4+zLvpAOtkz5iXNNnVAO+FfbYqKfocyTo7bEVVoHek7Xak8bai9wWD
	 JJXdXt6+GxyQeSTV6WoQRL41EZiQmdxg9L9i7yBimodEjJleglV5xFFIz0EpcdhXhs
	 d2pjSrL/gfF7PiZA+fCkN2nZezcwQbUZNPUgGlL4f3bvdovO7LI1Vkem0kJZ+zbWI3
	 SmABmF1MoMi0GiyWpQgyMy419+1zQk3gLCuOgmm3em4wLMx5HQ4BP+NqdYcwkEqXni
	 yNsKm0gKPYSmvDR/ovyr5HW6GHAA4wWTts1IA8MHwfxES9N7+3jGnbrI97VuZ8wKXK
	 VeBD/c5xQm/YQ==
Date: Wed, 26 Nov 2025 19:00:35 -0800
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Tariq Toukan
 <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20251126190035.2a4e0558@kernel.org>
In-Reply-To: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
> 
> This v19 has no changes compared to v18, but patch 2 was rebased on top
> of the recent 1.6T linkmodes.
> 
> Thanks for everyone's patience and reviews on that work ! Now, the
> usual blurb for the series description.

Hopefully we can still make v6.19, but we hooked up Claude Code review
to patchwork this week, and it points out some legit issues here :(
Some look transient but others are definitely legit, please look thru
this:

https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574
-- 
pw-bot: cr

