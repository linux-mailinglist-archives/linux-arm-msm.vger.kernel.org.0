Return-Path: <linux-arm-msm+bounces-48155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9807CA37E4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 10:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 683C416C468
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 09:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D0E22063C3;
	Mon, 17 Feb 2025 09:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O8hZx/ym"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6AD200BA8;
	Mon, 17 Feb 2025 09:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739784041; cv=none; b=aYjuovMeIKukyFvpbLzgsjHydJV9vSXCEjnEMcnllzMz5OsKoql03nGGORAb5D6u+g0A7qGPdb27AZgFN3F/T2k1sAiJEgPEB1hTTfVfhSfl14gHm3G+LwzJZ3S+NSKA8Gnbtp2a2fsiLcsnMGZZya19xqXhbV2Q7I2itmDtV/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739784041; c=relaxed/simple;
	bh=B7AeQ3K/+X7WndovNJX4Lf8aEdNeBasRxace1em9mGI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K2Y9vxGAEvtNc/Yyt1nweQp4ZIbZVlxu5tcLg4hdsJoKawFtM3JwyGM8cRax6ZrjDYUpFa5cnpVde/tpKcPEeCJ65fjHtHXniNVRQ1/uWHtbvC7VcgxlRBVDztqNv4BPp5sX9NtbFvsKKXCD0CEMUIa23QmcJkI7g2A19TU/hBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O8hZx/ym; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C149D433F7;
	Mon, 17 Feb 2025 09:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739784031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7GD/trcjVijv8BKevRiWl5MHpKoDGJj6DiZdAEWA58A=;
	b=O8hZx/ymgHX4GoVoMacfk+ZkAzzQFc8Y7uJbRnSDolWhl89wf2G+d7CH3FJtjOatyk+7Fx
	USQoWr1Pp3D6Wy1YAUPv/kS2Wx9nw1yGzFzsCJ6uGO7dAKBvzpR6EvasweX3J0REhK9XTa
	gx1FZiZRpuwAkWDXaq8mReLD894MUa18pTlSlV+v4Ud6MRD5vPDilf4jApT7cDSE3wn4M5
	ihurz1M7oMaQOOrYllUZCpaiYalw0RAwEdxs9PhcdF/4RygANnjjNz3e0myezG0ZDzysSQ
	3/g46MUaBaJ5C9WAQtYIN+SOfCCNoBnN6z7XKxVhauG7MbSPVT0ACC5/d0zdXA==
Date: Mon, 17 Feb 2025 10:20:26 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jakub Kicinski <kuba@kernel.org>
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Sean Anderson
 <seanga2@gmail.com>
Subject: Re: [PATCH net-next v4 00/15] Introduce an ethernet port
 representation
Message-ID: <20250217102026.780ebf36@fedora.home>
In-Reply-To: <20250214165345.6cab996f@kernel.org>
References: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
	<20250214165345.6cab996f@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehkedtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepvgguuhhmrgiivghtsehgohhoghhlvgdrtghomh
X-GND-Sasl: maxime.chevallier@bootlin.com

On Fri, 14 Feb 2025 16:53:45 -0800
Jakub Kicinski <kuba@kernel.org> wrote:

> On Thu, 13 Feb 2025 11:15:48 +0100 Maxime Chevallier wrote:
> > This is V4 of the series introducing the phy_port infrastructure.  
> 
> FWIW it doesn't seem to apply:
> 
> Applying: net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
> Applying: net: ethtool: Export the link_mode_params definitions
> error: sha1 information is lacking or useless (net/ethtool/common.c).
> error: could not build fake ancestor

Hmm strange, I may have messed-up somewhere ? I'll rebase anyways for
the next iterations, some of the recently merged work with the
.get_nexy_update_time conflicts with the series as well.

Thanks,

Maxime


