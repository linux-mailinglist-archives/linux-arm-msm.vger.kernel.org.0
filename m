Return-Path: <linux-arm-msm+bounces-71024-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B1B38478
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 16:10:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A978C203588
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 14:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C583570DF;
	Wed, 27 Aug 2025 14:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bs1AvK3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68AC298CDE;
	Wed, 27 Aug 2025 14:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756303818; cv=none; b=nYiRQ7RWHiQTAJcOJV7vzSF25sTgx13cK5ESwrsqnw2cdZVJENEFj4ScE2Z1hsOkFFeAX5XqOwDOjaeQ9z4GbURFXtojSzvV3NrCkSCVQBt764hDDihfHVpBSCnWjVS/fwUErWHEpS/Cesjud15PvJzWztUkXkI2AR8MAqDRVOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756303818; c=relaxed/simple;
	bh=2mnJ7BqJjiKjx1k4qNtB2x+XuREt1qIWZU2G+JEvDYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TcY0YMSLV0qGl8pRF1hAgozrB3Hjy1C2m0U6sTc9YOWx7OG0b1bKwodNwRRNRko7qxah4VAktJ0HaCrHGtNzOCE4HY6Ka9L10EkdSokfjVApHxYPvUendwEc642VblYehl2dMNaXjr5JX7grP7gjDfv1RBfRZcABhTFWKPgZIGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bs1AvK3M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07EC2C4CEEB;
	Wed, 27 Aug 2025 14:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756303817;
	bh=2mnJ7BqJjiKjx1k4qNtB2x+XuREt1qIWZU2G+JEvDYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bs1AvK3MHePNswMm6fIRkInIPsAjmB9ZTarTGIqrbDf6TDRPklhaKpz6KMOzZc0rj
	 TOWKFa5uGXQKmyx++paphCGl7qMRqyj+3jiYTuzqaAfGqt1NmHeyrceTnmP89GCyAp
	 2yfKNrvJRCjIZToLvvqvQWVe5fqZufxRk5O7zTlsCS8jYsXtNpi9YQh8aCqd2Vm8ra
	 SRR7FX7syFNR66wbDiiTPOJL/I1QDr3HDg1ScdMEMvJpeMwgLr0kA0BXIfKRVuSWnT
	 YnaXRgrVxR23F2Pt9TShg9P1JzIvomO08f6IqC+MKYgDReEcPbkvWkf13JtKb+8Vik
	 MR4pvvreMt1jg==
Date: Wed, 27 Aug 2025 15:10:09 +0100
From: Simon Horman <horms@kernel.org>
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
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	mwojtas@chromium.org, Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v11 08/16] net: phy: Introduce generic SFP
 handling for PHY drivers
Message-ID: <20250827141009.GB5652@horms.kernel.org>
References: <20250814135832.174911-1-maxime.chevallier@bootlin.com>
 <20250814135832.174911-9-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250814135832.174911-9-maxime.chevallier@bootlin.com>

On Thu, Aug 14, 2025 at 03:58:23PM +0200, Maxime Chevallier wrote:

...

> diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
> index f47ac5f5ef9e..697721a6239f 100644
> --- a/include/linux/phy_port.h
> +++ b/include/linux/phy_port.h
> @@ -67,6 +67,7 @@ struct phy_port {
>  	unsigned int not_described:1;
>  	unsigned int active:1;
>  	unsigned int is_mii:1;
> +	unsigned int is_sfp:1;

nit: Please also add is_spf to the Kernel doc for this structure.


>  };
>  
>  struct phy_port *phy_port_alloc(void);
> -- 
> 2.49.0
> 

