Return-Path: <linux-arm-msm+bounces-47775-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AFA32A5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 16:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDF52166DEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 15:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 840FA213232;
	Wed, 12 Feb 2025 15:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GQCOmaBS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF7527180B;
	Wed, 12 Feb 2025 15:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739375063; cv=none; b=OofSFeFHI92J/a04c8JjvFe7BLSwi7iKwkDbB8G0n59p86DzpDeUKU/XADxrqwai9FWQBVaU8xjrG3RiKFcf8UEXNUBojDmnkrHqrlmuxMYqGtdqof0xDKZ1/hWDhymusw5uU4o2jFC91BjHB2tCA6/KiOmZ2MYNQl1gOZYAAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739375063; c=relaxed/simple;
	bh=u3RvzOgNrNM8mFoNbu1E+RUhbcpxb+sYPcFpWLzQLtY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=arS2r27exRREr3rmMI8/3uV88/oIRqEsO1yGCJNB19ftElKPmyzsVON0f/DtzN+vOmUHt87MIU8mTzqBO6A3Vlt+ZcCrK8ayaEb8Zm5s99u3V7vI6fkMieFxohk45cXh/550rM4dlnAkKs6IVjid8oUaPgbuaHfgW5dPRdUCP5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GQCOmaBS; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1E980442D6;
	Wed, 12 Feb 2025 15:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Nvg4QglQodfKQr7m6fSz0niTjDrBbuKs7TKOdeAwXU=;
	b=GQCOmaBSnC/i8iAsgY0efCfiAYTph6AI1qwgDbCc/xKGaEGtfOjA75c13OJfSiIX+WIlzW
	39yW+7hD3mBQ8Y/uitR2/zs9njJpnio5rOM6ZZGHiJo4ZPwYmA3Pvy/D6TFIyh5Csu5Yev
	kSMYw8PtUxEgE6yUCTzJuwjwjE466REOQAIFBtvWS1LrGOtnBmwja6nPstr5FvNNKkjKt3
	vUjxrLnITnk50g3TFKciPai+9I4abS0fD/Xnixd9dtbv5jNlkh3UscX2V6l+J8h0oYeJAU
	KOiqlTLOedhisvAE4IOeMpMn3Nk/vCpAtFprgSYfTw7OsBSL0AiMJVB8+FGPtw==
Date: Wed, 12 Feb 2025 16:44:15 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Sean Anderson <seanga2@gmail.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>, Marek
 =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>, Oleksij Rempel
 <o.rempel@pengutronix.de>, =?UTF-8?B?Tmljb2zDsg==?= Veronese
 <nicveronese@gmail.com>, Simon Horman <horms@kernel.org>,
 mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Romain
 Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 00/13] Introduce an ethernet port
 representation
Message-ID: <20250212164415.02ad5cec@fedora.home>
In-Reply-To: <c927247b-e39c-8511-d95c-77fb23b82808@gmail.com>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
	<8349c217-f0ef-3629-6a70-f35d36636635@gmail.com>
	<20250210095542.721bf967@fedora-1.home>
	<c927247b-e39c-8511-d95c-77fb23b82808@gmail.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedvjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegveeltddvveeuhefhvefhlefhkeevfedtgfeiudefffeiledttdfgfeeuhfeukeenucfkphepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvpdhhvghlohepfhgvughorhgrrdhhohhmvgdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvledprhgtphhtthhopehsvggrnhhgrgdvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello Sean,

On Wed, 12 Feb 2025 10:39:48 -0500
Sean Anderson <seanga2@gmail.com> wrote:


> > Sorry if all of that was blurry, I did make so good of a job linking to
> > all previous discussions on the topic, I'll address that for the next
> > round.  
> 
> Thanks for the detailed explanation, especially regarding PHY redundancy.
> Could you add it to a commit message (or even better to Documentation/)?

Sure thing :)

Thanks,

Maxime

