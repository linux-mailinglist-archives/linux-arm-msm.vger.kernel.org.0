Return-Path: <linux-arm-msm+bounces-47811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B67A3300D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 20:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ABC9188BEE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2025 19:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2881FF7C1;
	Wed, 12 Feb 2025 19:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgXONBeQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9DF1FF7AC;
	Wed, 12 Feb 2025 19:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739389691; cv=none; b=IRSbgJKMYd66BLX/6oZO7nx13PbjaqL8Wx0pejh1g2OOUQFb3jBvFUSSKaUm8+LwKOt8kYbTJIfCv96nSDN40WjpLvfNtJGyVZrNoeZXqP8QFemOG+UbOiNzHU5zzcBNfxWXm8YNVsC5Gc0cKeoyzGaOTzkLP5ZCPfFeoUrd5Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739389691; c=relaxed/simple;
	bh=yVac8dY+M10XXCZ6KGuP6RmE55GlDz/HkM5TX68DG/A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s0E9r+XHZxZFp4lBceYe7VYCMcdqedNsMOfeD1QycOue/zJl2KGi7QOymrzlB+b5Tc9advZbJY0yOa6lmsTZV3Lfsn26RyV19vtJvWCx78bLu6cZDTFNEm75I0KJv3cJoXd1TSnYCnKnTgh6dXy1kQ4vhafzKBzzxaSVIOvci/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgXONBeQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D56CC4CEDF;
	Wed, 12 Feb 2025 19:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739389689;
	bh=yVac8dY+M10XXCZ6KGuP6RmE55GlDz/HkM5TX68DG/A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgXONBeQyNYIxCc/hTehCunY9lF08ToTiWnCSIRSenYMIT1SqXIhvSIlngpnyTDTU
	 PEkxliqEa34rjyB2LC4pPC9FOdzTh4NrRDk7vU8QmAJmvTInujX4qV5XXlQfnxyBuv
	 sW6rJ9++nSArChktyXzKGsMeG8vSuZ+27MeSnehTADfXNOJSCaqHHu0lxkDt/2eKki
	 6iwfLDfT8xpeZSFBT0Ge6CXEIx/dTcw7ZC2BDPG8LPZBarPA/GfoA/dNkbCTgz+Iyb
	 ptUWUqpHtvQUS4tGcnczPUsWhW/Ah79BG0gU+TXiy+JVNzSYh5BOMUJLd6k+uPd1cH
	 MXCM7l1WLACGA==
Date: Wed, 12 Feb 2025 13:48:08 -0600
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
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH net-next 00/13] Introduce an ethernet port representation
Message-ID: <20250212194808.GA130810-robh@kernel.org>
References: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250207223634.600218-1-maxime.chevallier@bootlin.com>

On Fri, Feb 07, 2025 at 11:36:19PM +0100, Maxime Chevallier wrote:
> Hello everyone,
> 
> This series follows the 2 RFC that were sent a few weeks ago :
> RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
> RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/

That makes this series v3. RFC is not a version, but a condition the 
patches are in (not ready to merge).

Rob

