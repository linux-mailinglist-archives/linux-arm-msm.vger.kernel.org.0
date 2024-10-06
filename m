Return-Path: <linux-arm-msm+bounces-33257-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE149920AB
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38643281B45
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1074618A6CE;
	Sun,  6 Oct 2024 19:29:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580C8189B9C;
	Sun,  6 Oct 2024 19:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728242949; cv=none; b=e8Ooa0z8zBB6Ced2rgPU7aNeuqx+Ikix0eMa878wm2q3vOGUMCriEuFcaiQ+h5JE3U0V4wALvkzUrLDf5XkaiY91i/IOnQdR34vUK0c2CjnToAasAZtUI6jEs3tEmkvZIcpb5+vHc27MSMNAqUEMACKfNmYIE9OzM8ekbdm8zf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728242949; c=relaxed/simple;
	bh=Y2SVB55UuTYItPUxG4rnpm2LnmXr+jJTVx0vnYc/i68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICoJNY8iH9ehEImDOmJxPMA2UEjmjfgUBS3CT2N9zQSHize7Makck75QpH2nYy/PsT3qB26/T2q5r1vnk+lh9xjwsMRPPRsJrkH8yFnntOFT/vNfxnwYPwuJg/5UYSCa4JMH64j6kAtcgab9R33TUCyi5S6poJ5eV4XP+xMt5Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 11A741A1065;
	Sun,  6 Oct 2024 21:29:00 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EE45A1A0E06;
	Sun,  6 Oct 2024 21:28:59 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C0CC9202E3;
	Sun,  6 Oct 2024 21:29:00 +0200 (CEST)
Date: Sun, 6 Oct 2024 21:28:59 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <ZwLk+/GgMeUB7303@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB85062E3A66BA92EF8D996513E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <d2e32a56-3020-47ac-beef-3449053c5d4c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2e32a56-3020-47ac-beef-3449053c5d4c@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Aug 19, 2024 at 05:49:58PM +0200, Andrew Lunn wrote:
> On Sun, Aug 18, 2024 at 09:50:46PM +0000, Jan Petrous (OSS) wrote:
> > The helper rgmii_clock() implemented Russel's hint during stmmac
> > glue driver review:
> > 
> > ---
> > We seem to have multiple cases of very similar logic in lots of stmmac
> > platform drivers, and I think it's about time we said no more to this.
> > So, what I think we should do is as follows:
> > 
> > add the following helper - either in stmmac, or more generically
> > (phylib? - in which case its name will need changing.)
> > 
> > static long stmmac_get_rgmii_clock(int speed)
> > {
> > 	switch (speed) {
> > 	case SPEED_10:
> > 		return 2500000;
> > 
> > 	case SPEED_100:
> > 		return 25000000;
> > 
> > 	case SPEED_1000:
> > 		return 125000000;
> > 
> > 	default:
> > 		return -ENVAL;
> > 	}
> > }
> > 
> > Then, this can become:
> > 
> > 	long tx_clk_rate;
> > 
> > 	...
> > 
> > 	tx_clk_rate = stmmac_get_rgmii_clock(speed);
> > 	if (tx_clk_rate < 0) {
> > 		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> > 		return;
> > 	}
> > 
> > 	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
> > ---
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> This Signed-off-by: needs to be above the first ---, otherwise it gets
> discard.
> 

I see, it is used as delimiter, my fault.
I will change formating for v3.

> When you repost, please do try to get threading correct.
> 

Yeh, I already got the same feedback from Krzysztof.
I'm switching to b4/lei/mutt for v3 what I hope fixed
the threading issue.

BR.
/Jan


