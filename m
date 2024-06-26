Return-Path: <linux-arm-msm+bounces-24316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC079918562
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 17:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A641328F32E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Jun 2024 15:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142401891DB;
	Wed, 26 Jun 2024 15:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="x5uAcgRS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FDA186283;
	Wed, 26 Jun 2024 15:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414659; cv=none; b=kz2jnqWBagmcJRBjI4y1LMLVFYUAou4p46rlDmACDtDdhnaczwgXByd7Fu8IOfA93wGpOZiN/a0Bi/++hauDekAPu23ah82RClpB6/3iwgcemXfzyvvN8AbwVjIPU6o4pbYkiMgq5W9D4c35DKi015pxlJXOklnRHxUzbQNc+Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414659; c=relaxed/simple;
	bh=FSmDhvFUJs9NsQfwLU6nxFJxJmU5Amm6j4FF1hXKJhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRGKrhMIZ8x221YY2iTyqPsa2dmbN6trbj5y0R4fs1L+Q/TD6YsQpDpFQieSZjMGdcQwGVr62z7EblThjdRtO0ggnmuyylr49d+RIThHpadJKUjVb292qcfjar0yUMKDGIVU6WReuXR7N07imb/QY0iDrgsSgn1Sh62Rb2sFfMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=x5uAcgRS; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=5m14rGTG9LmbrjjJ/l2NwU7Y0IP12ob5tulLHsA6h8Y=; b=x5uAcgRSuDey6PsbTz4RgEk3QC
	drc99olvsjw4sho1UzY7/RgPeU+6fqMXABv4CCYbvOHKAIvSvbybYg3tum5gjF2jlknX8p6SVbSQi
	9aaPjlimypP6O7gE7ewL7dQEICSVKlTqAqjToRvGJSov3kD/jukiN1oByp9Y0KBMx+iE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sMUI7-0013Aj-CP; Wed, 26 Jun 2024 17:10:35 +0200
Date: Wed, 26 Jun 2024 17:10:35 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] net: stmmac: Bring down the clocks to lower
 frequencies when mac link goes down
Message-ID: <d2bb85e4-fab5-49fe-aaf0-9d1bf2279e3d@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-3-eaa7cf9060f0@quicinc.com>
 <qf4zl7qupkzbrb6ik4v4nkjct7tsh34cmoufy23zozcht5gch6@kvymsd2ue6cd>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <qf4zl7qupkzbrb6ik4v4nkjct7tsh34cmoufy23zozcht5gch6@kvymsd2ue6cd>

> I'm still curious if any of the netdev folks have any opinion on scaling
> things down like this on link down.

It does make sense, in that there are no frames to process, so the
clock can be reduced. But i also think it is a bit of a workaround for
poor hardware design. Often you can tell the MAC the link is down, and
it can shut down a lot more, and even turn all the clocks off.

I also wounder if there are going to be any side effects of this. Some
Ethernet MACs export a clock to the PHY. Is that clock going to
change? I don't think it will, because we are changing to a valid MAC
speed, not 0. So the PHY has to work at this speed clock.

But to make it easier to find issues like this, open() should probably
set the clocks to a low speed until the link is up. That way, if there
are going to be problems, the link should never come up, as opposed to
the link never comes up after being lost the first time...

     Andrew

