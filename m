Return-Path: <linux-arm-msm+bounces-74553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FCBB97FFF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 03:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9500D4A82DA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 01:24:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D758E1E8322;
	Wed, 24 Sep 2025 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQVVnCS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A100A14B953;
	Wed, 24 Sep 2025 01:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758677072; cv=none; b=uGFYXxhsTzBjlWNnbSh9oi79kUidbYHsDuecuEC49makQoywhT/5oNUP6iHkl/ogu0szIrxxBocS96y60qKWXKPxgIH7QhReDJ0LePGwthfqQ6g4xaiK2km3/eNsBUrmv9ZJ79cQp94fxzz/ueMi4k5ool1HG81G0AF4aXWLbaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758677072; c=relaxed/simple;
	bh=4nT0zPGLX2EGPKXvnIPJ3K4R/r9yo2It3m8dFaJbhn8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MVcmOWuXgebDnYv5PafMzVkQ+5twzVMlr04Fnd2zd7/XoD6DZtYAWJwc+wEH/lCqQdlYEqDD02azf/volSAhT+ObMc5TYiyrtclFPMntyXbOX0o2u8FkuV/pPd15NlMVTtXTCSwulgT+MWWQz9NbkJ+8xI9og64Ab3g21bXY58w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CQVVnCS0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C63CBC4CEF5;
	Wed, 24 Sep 2025 01:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758677072;
	bh=4nT0zPGLX2EGPKXvnIPJ3K4R/r9yo2It3m8dFaJbhn8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CQVVnCS0cLpIk/4a4LNXWEdlDb7ljFy13ZlIFwUp4DQ1PP2SM2Y0RW5+Mveepj1b5
	 IMEpPpvGuPyX+JWQHG46TqZ3u+a8OSatCoMVMHhvtMaFula8jjUJOhVeAFQVUE4eSR
	 cHYOpyMyHFxVvsiCji/w+wSHs2qSFdlQUgVKloZQOhyBbFDgEA4d62J5zeeABG1dIR
	 90M3XocHuNEyYPVPyEuotWHUdJ5j/wVDogBPAhKKfT1VgkysbNZFtvQBZZkkm/rPOZ
	 m6DFWx9B2tkXETWFCisT4IPlMBHoraMTPRIGfFJzIzenFZwVD2noK8IU/LS3n+sloP
	 Y6Q0i40gZetqQ==
Date: Tue, 23 Sep 2025 18:24:29 -0700
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>
Subject: Re: [PATCH net-next v13 13/18] net: phy: marvell10g: Support SFP
 through phy_port
Message-ID: <20250923182429.697b149b@kernel.org>
In-Reply-To: <20250921160419.333427-14-maxime.chevallier@bootlin.com>
References: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
	<20250921160419.333427-14-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 21 Sep 2025 21:34:11 +0530 Maxime Chevallier wrote:
> +/**
> + * phy_port_restrict_mediums - Mask away some of the port's supported mediums
> + * @port: The port to act upon
> + * @mediums: A mask of mediums to support on the port
> + *
> + * This helper allows removing some mediums from a port's list of supported
> + * mediums, which occurs once we have enough information about the port to
> + * know its nature.
> + *
> + * Returns 0 if the change was donne correctly, a negative value otherwise.

kdoc likes colons after return so:

 Returns 0 -> Return: 0

sorry for only providing an automated nit pick..

> + */
> +int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums)
-- 
pw-bot: cr

