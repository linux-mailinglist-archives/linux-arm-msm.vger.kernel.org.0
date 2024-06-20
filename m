Return-Path: <linux-arm-msm+bounces-23425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DED91121F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 21:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 161F41F25621
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 19:31:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BC01B9AA4;
	Thu, 20 Jun 2024 19:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="GGXQ8Uic"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2AE1B47A7;
	Thu, 20 Jun 2024 19:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718911865; cv=none; b=bVFIt456wBT3w3kjrhQPxceLqBr3y5Sb6y4rymAaVKNoQRxrnQ80E7ugF9rxUH6+v6oW0YH501GZkm5PuTJ7vygKuu3JwWkrNBoVzQIxhfCLlq+bs8zNST7WbkF4DitYzwbHSf5vngfaPHj7hx4eQQ4/kMKqcHwl58x3j768ZgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718911865; c=relaxed/simple;
	bh=gkfRtQRHo90+OxwvrZ+jMzIy+2Er2TIZMDZy1EGtqNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lPVvnbzfiJX5t2O0zUCRGmgU83dXXEZ+CI3BeWzEGJk1fzHHij/x7vEJtHXIu91ToH7wEqf3xpB3xcci8JrPx0msbwYbJ0APBbvjBe3jUW03JZ90ruHe61uZEC8QC2qK5rXSSTVRpsPkdraR1f4+1C6mrULorVAFLMhX/+ZxJdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=GGXQ8Uic; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=Xp5DdyyOVSdJC4Y+QKf7CMgqOpurY27ZBMpNeiF2Pto=; b=GG
	XQ8UicF96zmhbcHGoTPgJoHkHmIKsRWvUZL6rRR1A72fnCH0t+10Oe25CCIUeJQpveAK5sgkOKwMr
	Vi0vhjT16ZEzeJOQcyQG/u/z/3bIbR5gGM6r05SNYLSXtbHy3KBGEwfnI5S6asVVtUHXfA1dOX9K4
	srruDiqvTmdOt0M=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sKNUW-000bO0-RG; Thu, 20 Jun 2024 21:30:40 +0200
Date: Thu, 20 Jun 2024 21:30:40 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next 8/8] net: stmmac: qcom-ethqos: add a DMA-reset
 quirk for sa8775p-ride-r3
Message-ID: <b747f841-7520-4fee-9a1f-f3215203e138@lunn.ch>
References: <20240619184550.34524-1-brgl@bgdev.pl>
 <20240619184550.34524-9-brgl@bgdev.pl>
 <f4af7cb3-d139-4820-8923-c90f28cca998@lunn.ch>
 <CAMRc=MeP9o2n8AqHYNZMno5gFA94DnQCoHupYiofQLLw03bL6A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeP9o2n8AqHYNZMno5gFA94DnQCoHupYiofQLLw03bL6A@mail.gmail.com>

On Thu, Jun 20, 2024 at 10:20:08AM +0200, Bartosz Golaszewski wrote:
> On Wed, Jun 19, 2024 at 9:33 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Wed, Jun 19, 2024 at 08:45:49PM +0200, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > >
> > > On sa8775p-ride the RX clocks from the AQR115C PHY are not available at
> > > the time of the DMA reset so we need to loop TX clocks to RX and then
> > > disable loopback after link-up. Use the provided callbacks to do it for
> > > this board.
> >
> > How does this differ to ethqos_clks_config()?
> >
> 
> I'm not sure I understand the question. This function is called at
> probe/remove and suspend/resume. It's not linked to the issue solved
> here.

		/* Enable functional clock to prevent DMA reset to timeout due
		 * to lacking PHY clock after the hardware block has been power
		 * cycled. The actual configuration will be adjusted once
		 * ethqos_fix_mac_speed() is invoked.

It sounds similar, "DMA reset", "lacking PHY clock".

There is also

commit 58329b03a5957904fa2b33b3824ed19e7b42c9e9
Author: Romain Gantois <romain.gantois@bootlin.com>
Date:   Tue Mar 26 14:32:11 2024 +0100

    net: stmmac: Signal to PHY/PCS drivers to keep RX clock on
    
    There is a reocurring issue with stmmac controllers where the MAC fails to
    initialize its hardware if an RX clock signal isn't provided on the MAC/PHY
    link.
    
    This causes issues when PHY or PCS devices either go into suspend while
    cutting the RX clock or do not bring the clock signal up early enough for
    the MAC to initialize successfully.
    
    Set the mac_requires_rxc flag in the stmmac phylink config so that PHY/PCS
    drivers know to keep the RX clock up at all times.

It would be good to explain the big pictures, why these two changes
are not sufficient.

    Andrew

