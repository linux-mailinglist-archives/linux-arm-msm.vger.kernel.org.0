Return-Path: <linux-arm-msm+bounces-82411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62210C6C8C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 04:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B73024F0475
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 03:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5B42E9EC3;
	Wed, 19 Nov 2025 03:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxUFiRqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF802E974D;
	Wed, 19 Nov 2025 03:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763522129; cv=none; b=shffCKJtC3QwdL3J/htfV4S9DPHNBLOEOKN1J6KRXsYqEMaGLlYmKUgTlesN5Uv8vHAX5OBQY2sdaSvDylmNoI/B5vMhs6JPTaIZXYJHAOkEPZVhU6M2puKL2NGleABOpjSjBXKrKYbCb9gUeHnfMV/Nt6O8bzFEz/MSrBhqeRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763522129; c=relaxed/simple;
	bh=YOmZc5YkShaSn+TX5Z50l4bn0lVGLCCXoWsdflxq00k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eSNpKbi91Dfs/268AO/d0ubBK6X7c5iU+bDyi1mjt4ozpcJERI05Ok5tSHtk/TVytYj33MwkTskf+wjihjQH1UwXkDPNX9MC2EC3TwDlKTA/kGOpQiy1V9nQ22tMO5qR/vJ/bC8kGNu9vPUXkwr1jXHSaGFZ4iBrmA9mRAcicbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxUFiRqO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88573C113D0;
	Wed, 19 Nov 2025 03:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763522128;
	bh=YOmZc5YkShaSn+TX5Z50l4bn0lVGLCCXoWsdflxq00k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hxUFiRqOKzZpf/5IGRwwjsZIvduHM2jeGVy6jyUOF2zF+sIjEPzNZBq9nPr5v/rr9
	 hdMyHjar+KKvRSgBOoJYX7eKl5kFirM5ZHsKhotXziMKk+N6cwDxUDGrtTwUGX1rJ7
	 5wttXB+JMF5nkhpkRyIBb9Kut33ZIjai8XO6cAKbjd/9osutzKKq3nIh5emqaQr/M+
	 DIFbuex/If6iNDPbTW3fXCPexl9FoNjHgozgwhkT3QKGAiJrsnGrWGV0wq+7yqPi/j
	 JfMz5g85oU++rcfheWS5gzv4Q7idLIOEHDAqQKNRFExRAymryZmbGjKKO5KAK7O9Op
	 po7iPszoyo+ig==
Date: Tue, 18 Nov 2025 19:15:23 -0800
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
Subject: Re: [PATCH net-next v16 03/15] net: phy: Introduce PHY ports
 representation
Message-ID: <20251118191523.4719ca2c@kernel.org>
In-Reply-To: <20251113081418.180557-4-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
	<20251113081418.180557-4-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Nov 2025 09:14:05 +0100 Maxime Chevallier wrote:
> --- a/include/linux/ethtool.h
> +++ b/include/linux/ethtool.h
> @@ -228,6 +228,10 @@ extern const struct link_mode_info link_mode_params[];
>  
>  extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
>  
> +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))

Hm, I think this is defined in uAPI as well?

>  static inline const char *phy_mediums(enum ethtool_link_medium medium)
>  {
>  	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
> @@ -236,6 +240,22 @@ static inline const char *phy_mediums(enum ethtool_link_medium medium)
>  	return ethtool_link_medium_names[medium];
>  }
>  
> +static inline enum ethtool_link_medium ethtool_str_to_medium(const char *str)
> +{
> +	int i;
> +
> +	for (i = 0; i < __ETHTOOL_LINK_MEDIUM_LAST; i++)
> +		if (!strcmp(phy_mediums(i), str))
> +			return i;
> +
> +	return ETHTOOL_LINK_MEDIUM_NONE;
> +}

Same comment about possibly moving this elsewhere as on phy_mediums()

> +static inline int ethtool_linkmode_n_pairs(unsigned int mode)
> +{
> +	return link_mode_params[mode].pairs;
> +}

