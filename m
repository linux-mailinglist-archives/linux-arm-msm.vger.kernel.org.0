Return-Path: <linux-arm-msm+bounces-28987-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB6956CF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 16:15:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B2031F247F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 14:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18DD16C879;
	Mon, 19 Aug 2024 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuXgYYXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF04416B399;
	Mon, 19 Aug 2024 14:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724076948; cv=none; b=Nzz+q4matUnuB+fw6zaLNDK+vDAvcBBu+E0hTcVdMJWPQEzZPA3nY8WlWUZAICzjG1bpuJs9hj0Xudrog/dcqjIZ4Vn+NxsBnr5Lp8Kx0bPf8Z/g6gLwxkmcvaWhkN3HPO4I8lPOI2Q77AO+aHOo4DkdfOBPlDNOxSmcZuo/soM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724076948; c=relaxed/simple;
	bh=MOZaGaCqrP4GQgWZMCVI3+A5OoGRB7tPix85SODkMRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZdZOBy8CINU3yLdvnocWCvR1V9acIcU2+PP+x5/2BFfHvFBFjy9Ywd5AZdiyqEMUSO4PyrV5XsesiOgMo35TEQUnkfrpywQ3YkM/2319v5iE68wHOu3WSMeqx8HEAt+DiqnekkdpJfXDkWVT4EscS9eF2FFZVOJhV5+nhCBg1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuXgYYXg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00FEC32782;
	Mon, 19 Aug 2024 14:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724076948;
	bh=MOZaGaCqrP4GQgWZMCVI3+A5OoGRB7tPix85SODkMRk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VuXgYYXgjSynhcIUVRd88Vn8jb8VQEyEpu3wrHMFIdS239qr5Kr4EPkq3nBmuubZ2
	 F0ZMxLbQJ6lq1zx8jK2Dr5ST9EpXYGenQL7ZXBJEt8RT/E+lkrcbk08kqTw6pzw8LP
	 hbapYLR4Llew6HLwls8GwWLejwgSGVwbplzcqIaVvsN7wDC4qLHXI2/DJj34ZpEFlG
	 VtY0m+TN7BGYGB3L1nhXvSnSRt2GzIBD4Vfiewa7SuH8WPo94qdsuy1YnSaQHTiFTb
	 TdUa6+F0N5tADiLkoseiIFZt45WEDiTSkGsxJMKUpbubRLni8aC+sCz17UU04A6RSo
	 Opt5qE3otX9wg==
Date: Mon, 19 Aug 2024 15:15:41 +0100
From: Simon Horman <horms@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	dl-S32 <S32@nxp.com>
Subject: Re: [PATCH v2 4/7] net: phy: add helper for mapping RGMII link speed
 to clock rate
Message-ID: <20240819141541.GE11472@kernel.org>
References: <AM9PR04MB85062E3A66BA92EF8D996513E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM9PR04MB85062E3A66BA92EF8D996513E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>

On Sun, Aug 18, 2024 at 09:50:46PM +0000, Jan Petrous (OSS) wrote:
> The helper rgmii_clock() implemented Russel's hint during stmmac
> glue driver review:
> 
> ---
> We seem to have multiple cases of very similar logic in lots of stmmac
> platform drivers, and I think it's about time we said no more to this.
> So, what I think we should do is as follows:
> 
> add the following helper - either in stmmac, or more generically
> (phylib? - in which case its name will need changing.)
> 
> static long stmmac_get_rgmii_clock(int speed)
> {
> 	switch (speed) {
> 	case SPEED_10:
> 		return 2500000;
> 
> 	case SPEED_100:
> 		return 25000000;
> 
> 	case SPEED_1000:
> 		return 125000000;
> 
> 	default:
> 		return -ENVAL;
> 	}
> }
> 
> Then, this can become:
> 
> 	long tx_clk_rate;
> 
> 	...
> 
> 	tx_clk_rate = stmmac_get_rgmii_clock(speed);
> 	if (tx_clk_rate < 0) {
> 		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> 		return;
> 	}
> 
> 	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
> ---
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> ---
>  include/linux/phy.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/include/linux/phy.h b/include/linux/phy.h
> index 6b7d40d49129..bb797364d91c 100644
> --- a/include/linux/phy.h
> +++ b/include/linux/phy.h
> @@ -298,6 +298,27 @@ static inline const char *phy_modes(phy_interface_t interface)
>  	}
>  }
>  
> +/**
> + * rgmi_clock - map link speed to the clock rate

nit: rgmii_clock

     Flagged by ./scripts/kernel-doc -none

> + * @speed: link speed value
> + *
> + * Description: maps RGMII supported link speeds
> + * into the clock rates.
> + */
> +static inline long rgmii_clock(int speed)
> +{
> +	switch (speed) {
> +	case SPEED_10:
> +		return 2500000;
> +	case SPEED_100:
> +		return 25000000;
> +	case SPEED_1000:
> +		return 125000000;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  #define PHY_INIT_TIMEOUT	100000
>  #define PHY_FORCE_TIMEOUT	10
>  
> -- 
> 2.46.0
> 
> 

