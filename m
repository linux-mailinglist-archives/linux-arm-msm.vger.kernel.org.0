Return-Path: <linux-arm-msm+bounces-82410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A9CC6C8B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 04:16:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B51994EDFC8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 03:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044142E62C6;
	Wed, 19 Nov 2025 03:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKueXAfw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F8729898B;
	Wed, 19 Nov 2025 03:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522122; cv=none; b=cYeJY05ZiDs1AnshCqUlMFAjYKXHCAP19qhsUn5lyqOQuEZ936mW5zq3aqb917mIBBE0qRmmRVXW0ex28AMcCkV8qfk1vvrrPkZVAuICrFLJpqrMXIDTNzAlZTS1yLQfCB3D/qSxXkapxT/NaEE3CGaf7edzoBnpjrhVLOfLbpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522122; c=relaxed/simple;
	bh=jppTVEZ7+b57BpzoBkGxDxEcHrfhod9Sylcsl4PBp2M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nBQ7nb6dCpykUbucBRjakFDcB8dyU4CdDtHWIdEydDWODOrQkVW8m2t8WZAEIKmi0pMnV/cnLuwOaPuCYP/x7olgMk2kPDP0e+lOaiCfF2+tVwMU6PZGtY1eWwf5faX10GEEdPp81HngaEtSCSJprAgcPvpwTAV3rFIJyUCLbKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKueXAfw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61698C2BCB0;
	Wed, 19 Nov 2025 03:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763522122;
	bh=jppTVEZ7+b57BpzoBkGxDxEcHrfhod9Sylcsl4PBp2M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IKueXAfwGpXxKjDN3my/fqv1yoK/JMu5VDNsDHVUadXWHn43VKfMAFfmOOdA4DaEi
	 m7Y7CwbXMRzf4w5qI/T3hEb6leiiu3VpBQHc6VHDVVwFpgyIYOxGmyki3Eme5QzECC
	 yBP7JdcF10UywPvnd/Y7v6jSYdUkRluJBdETGQ2LhGi62vUDClbhEM7PlV7COFI1HS
	 i2ywsp4XCzKV/Li7NHGOrgTfSO2s62Wi7AOqERyBrsVEVe8LP6L3sRr5waJa+tEZCI
	 J/FRiC07J4mSiFpOsylBEkBqubUaqi8JkIDdKg8DkRMW/8bqEPLCGcHin2mfnRpSYC
	 Pcb85/4PMtSwA==
Date: Tue, 18 Nov 2025 19:15:17 -0800
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
Subject: Re: [PATCH net-next v16 02/15] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <20251118191517.1a369dad@kernel.org>
In-Reply-To: <20251113081418.180557-3-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
	<20251113081418.180557-3-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Nov 2025 09:14:04 +0100 Maxime Chevallier wrote:
> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
> index c2d8b4ec62eb..ad2b5ed9522b 100644
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -216,13 +216,26 @@ static inline u8 *ethtool_rxfh_context_key(struct ethtool_rxfh_context *ctx)
>  void ethtool_rxfh_context_lost(struct net_device *dev, u32 context_id);
>  
>  struct link_mode_info {
> -	int                             speed;
> -	u8                              lanes;
> -	u8                              duplex;
> +	int	speed;
> +	u8	lanes;
> +	u8	min_pairs;
> +	u8	pairs;
> +	u8	duplex;
> +	u16	mediums;
>  };
>  
>  extern const struct link_mode_info link_mode_params[];
>  
> +extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
> +
> +static inline const char *phy_mediums(enum ethtool_link_medium medium)
> +{
> +	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
> +		return "unknown";
> +
> +	return ethtool_link_medium_names[medium];
> +}

Will this function be called by a lot of drivers? Would be great to
find a more suitable place for it, ethtool.h is included by thousands
of objects :(

>  /* declare a link mode bitmap */
>  #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
>  	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
> diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
> index 8bd5ea5469d9..6ed235053aed 100644
> --- a/include/uapi/linux/ethtool.h
> +++ b/include/uapi/linux/ethtool.h
> @@ -2587,4 +2587,24 @@ enum phy_upstream {
>  	PHY_UPSTREAM_PHY,
>  };
>  
> +enum ethtool_link_medium {
> +	ETHTOOL_LINK_MEDIUM_BASET = 0,
> +	ETHTOOL_LINK_MEDIUM_BASEK,
> +	ETHTOOL_LINK_MEDIUM_BASES,
> +	ETHTOOL_LINK_MEDIUM_BASEC,
> +	ETHTOOL_LINK_MEDIUM_BASEL,
> +	ETHTOOL_LINK_MEDIUM_BASED,
> +	ETHTOOL_LINK_MEDIUM_BASEE,
> +	ETHTOOL_LINK_MEDIUM_BASEF,
> +	ETHTOOL_LINK_MEDIUM_BASEV,
> +	ETHTOOL_LINK_MEDIUM_BASEMLD,
> +	ETHTOOL_LINK_MEDIUM_NONE,
> +
> +	__ETHTOOL_LINK_MEDIUM_LAST,
> +};

Why is this in uAPI? I'd have expected it to either exist in the YAML
spec if there's a new uAPI that needs it, or in kernel headers.
Let's move it out for now to be safe, we can always move it in.

> +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))

Ditto.

