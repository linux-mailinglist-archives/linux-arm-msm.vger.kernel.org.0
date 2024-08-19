Return-Path: <linux-arm-msm+bounces-28996-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B15956F63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 17:57:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98E011C2031A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 15:57:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC27413B287;
	Mon, 19 Aug 2024 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="kvKNBQNn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195C8130A47;
	Mon, 19 Aug 2024 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083049; cv=none; b=sqmHcb05hywOdSC7umY6ulpvpxdTf41PxM9vNxV0uFtQUzpHUSQNrneGAMQK65R+7Q3JZ1MXzYaSYHJYdroOzHvDuhCG4LfElFdLs7iBx1HrduholLHj85xwCPXi9dAQLrCpsRdCiu5TCxU6pX+VEEUyrXUj0kSy5NC3fFPM9tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083049; c=relaxed/simple;
	bh=kjhN6zya/HpkbCmFLGSHtGOqrGNiPRQjSzuH4aE3vjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bd37dRRlOd2VyjnGdYWuhHUXvHI5PyZ4mLi6PjYgwpi9/PFtJHKddpV7QTTMDlRPlI19H2KEi9hN6fCCjQEG+zr4WAc2eCQGaW1ZOxk8S2/Tb8SuzQTAln9Rh58ZZ8Wij/MjKfI0lLhBqB4G5bJ0+6jVRzDnuvHOXWc9JyzA4Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=kvKNBQNn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=/eYAUPEosxunb171XvbzrAbh7LSktH4hXqUkCFkLgA0=; b=kvKNBQNnorp3Nb0kSR40Xd5FPV
	BgtqIrkFQHkRcbBon1db93gz3uU3nn26C97Gi4s6lEqv2C95NaursHS5lrprapXY1N3XdQcqqieA4
	tcD4RwJ6d60rErItnmS9V79hBCOiKuUrByyzJiCuZPB5hUPxUhVppA/fPKzWiRFYkJKU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sg4kp-005868-7L; Mon, 19 Aug 2024 17:57:11 +0200
Date: Mon, 19 Aug 2024 17:57:11 +0200
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
Message-ID: <8fe67776-e2b6-48e3-8c60-a5a4f18cd60c@lunn.ch>
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

As Russell pointed out, this code appears a few times in the stmmac
driver. Please include patches changing the other instances to use
this helper.

It also looks like macb, and maybe xgene_enet_hw.c could use it as
well.

	Andrew

