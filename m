Return-Path: <linux-arm-msm+bounces-82608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD77C721E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 04:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E54E04E3F42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 03:54:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882F52853F1;
	Thu, 20 Nov 2025 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L5gYLiXP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC01372ACF;
	Thu, 20 Nov 2025 03:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763610843; cv=none; b=fmbrvLDUqVdDNgItQh91UkXmpzgMa5Omg6BMNQFi9f0sEvOU9PNGPR310w5hwVDIFNcP7TSe4W6qZmjI46mARbIOEQNG5xio4hlQ0md6M/d33SZMUKbY/MDoI07oCFCaWCFglq91oX1K5A3fGH6UI2/DuiTdNfMvv1lndZ1ST5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763610843; c=relaxed/simple;
	bh=a7vnpmXnXdqNvYGCUQj1wNNIzSzZ7tEyGzfOBhzICC8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HDVi50RsUJWFcfrP4jxlXhQG0h2PvyAp/6rGSUotRJC89P7dTjRJAe/G8erBei3koNrJGbWV7tL7ekVME1bz3irTBUhg6yYFjRTVA8AYXurXkZSP11FwJwfhiA1XUlvHRzkUOY2v3AZ5NUidrE8kd4Yu5cP/Qaw2G33VxKVZSiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L5gYLiXP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0371C4CEF1;
	Thu, 20 Nov 2025 03:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763610843;
	bh=a7vnpmXnXdqNvYGCUQj1wNNIzSzZ7tEyGzfOBhzICC8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=L5gYLiXPHSg8nT9iI/9V4WGuGCyjZPy4pOzGn61PY5F14rjSQqAY8nVbUINYCsW6x
	 /mPpFqBKA/iTOjPtr6btfSSNYGV6o9d9KT52nGogQSVUvr7TxsSKdHuYMCEkZ+0Ohb
	 BfQqKbAmdqb91w+iwEWMzR1xOV+WF1N8ms8BJ+VJHuOr9Z+FoqDLsckC4a2a2geGfN
	 FeuQBJ7NM0P2lBrWz6zH0tq0OVqv1DW3ng9ibI9Wv2SuziZfoOAVHnTDZGT4+At4Zn
	 KepKt1hnlN5Xfh7XoqXdA4LCIovpS4NE0vBJQcTQ2+j9uQi1qJaSt7/Bq9YPUo9Lhp
	 ewMqf3JRICEGQ==
Date: Wed, 19 Nov 2025 19:54:00 -0800
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
Subject: Re: [PATCH net-next v17 03/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20251119195400.1bf0cc68@kernel.org>
In-Reply-To: <20251119195920.442860-4-maxime.chevallier@bootlin.com>
References: <20251119195920.442860-1-maxime.chevallier@bootlin.com>
	<20251119195920.442860-4-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 19 Nov 2025 20:59:04 +0100 Maxime Chevallier wrote:
> diff --git a/net/ethtool/common.c b/net/ethtool/common.c
> index 2f4b70f104e8..8216e4ada58e 100644
> --- a/net/ethtool/common.c
> +++ b/net/ethtool/common.c
> @@ -460,6 +460,21 @@ const struct link_mode_info link_mode_params[] = {
>  static_assert(ARRAY_SIZE(link_mode_params) == __ETHTOOL_LINK_MODE_MASK_NBITS);
>  EXPORT_SYMBOL_GPL(link_mode_params);
>  
> +const char ethtool_link_medium_names[][ETH_GSTRING_LEN] = {
> +	[ETHTOOL_LINK_MEDIUM_BASET] = "BaseT",
> +	[ETHTOOL_LINK_MEDIUM_BASEK] = "BaseK",
> +	[ETHTOOL_LINK_MEDIUM_BASES] = "BaseS",
> +	[ETHTOOL_LINK_MEDIUM_BASEC] = "BaseC",
> +	[ETHTOOL_LINK_MEDIUM_BASEL] = "BaseL",
> +	[ETHTOOL_LINK_MEDIUM_BASED] = "BaseD",
> +	[ETHTOOL_LINK_MEDIUM_BASEE] = "BaseE",
> +	[ETHTOOL_LINK_MEDIUM_BASEF] = "BaseF",
> +	[ETHTOOL_LINK_MEDIUM_BASEV] = "BaseV",
> +	[ETHTOOL_LINK_MEDIUM_BASEMLD] = "BaseMLD",
> +	[ETHTOOL_LINK_MEDIUM_NONE] = "None",
> +};
> +static_assert(ARRAY_SIZE(ethtool_link_medium_names) == __ETHTOOL_LINK_MEDIUM_LAST);

Thanks for reshuffling things, this one needs a static tho:

net/ethtool/common.c:463:12: warning: symbol 'ethtool_link_medium_names' was not declared. Should it be static?
-- 
pw-bot: cr


