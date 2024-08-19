Return-Path: <linux-arm-msm+bounces-28995-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C74D956F3F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 17:50:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD3752819AE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 15:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D07B12D766;
	Mon, 19 Aug 2024 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4lNnUPRx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFD44964D;
	Mon, 19 Aug 2024 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724082629; cv=none; b=ER+0Vk2F92cL0tHYTYKn3vs2CqF6VWL7WzWhzor2XqfwuOwKLwgAeJePzqx7lO5DKFyIJmzeRCse78nNaxS4NyVExAgL5ZFqj7ec47YNRw/n4wJBlco7jeuarYjk9HvbSs6QnPVffcGvsDRSYVlE1dy1Xsx+V/BLz9U5LQGA3fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724082629; c=relaxed/simple;
	bh=AF7Ie2vA0zKLOZBuUow20YfIWSKgaodPRlDeEpmodfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h10AdBKp8pWlZvVJfZOM77UMcwc24ID6EoG28drFikxzxJjfRGLR+tdru9WYM4h4gvFGhqId+NWxPN06FKEeDBoEe8xIraY3UIaSR4whO40vA4rs4OirBUsbZF0ET+D9awBIBP9AXtLDHc4TZEw8MN3k4lLMr6jz4qbu+aamt0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4lNnUPRx; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yy/PrdZKYJ86mJeO7sXTSgOh3UITg8REGzRP4f6IK+s=; b=4lNnUPRxzIbW61EXMPmdi8iURk
	jhGF2mI7N3qVUn+Xr4uhbder/6ZuxDUF91O63R47oxSJVvXvzpwmV8dTHRv1l6z7uagPiC6fymWXw
	mtx2FPn8m5oAObTkmu+kPoh9944GxxGo67vcbYyPFnq4tdjeQ7yy3P3sYj+r0LQxwRfc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sg4dq-00582r-N5; Mon, 19 Aug 2024 17:49:58 +0200
Date: Mon, 19 Aug 2024 17:49:58 +0200
From: Andrew Lunn <andrew@lunn.ch>
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
	Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <d2e32a56-3020-47ac-beef-3449053c5d4c@lunn.ch>
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

This Signed-off-by: needs to be above the first ---, otherwise it gets
discard.

When you repost, please do try to get threading correct.

    Andrew

---
pw-bot: cr

