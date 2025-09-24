Return-Path: <linux-arm-msm+bounces-74662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E29F2B9BB77
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 21:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05ACE1BC2440
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 19:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A0E421767C;
	Wed, 24 Sep 2025 19:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="b5/u/dXh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7C425BEE8;
	Wed, 24 Sep 2025 19:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742306; cv=none; b=O2G8ZMKpx9D01rAvRNblyQyGQ5LUS9T/fz4XbC4geRjh22Xuh6QyvH8Ppkm5f6z3tkxrdfEYoD3pPdqNnuFL5hKuNx8NUlzTIm5aGVl9U8VVCs+lqhuUyCqR/rzAWfG+J2oVkFx5IC60+7Kyg5UY/e0jYQII5u5w6SxSFZeMPlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742306; c=relaxed/simple;
	bh=tlixfbHwjHBby8L7DHyt8s5o7TZ4R6qxUBlWrExicus=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cCSoXZUDBXvx4kty6ux+5P+UFUHGuldKaCvhVCjNQApruvhLz7GJKJ7mei6CrCww1DdbENKiH6AKWjKLXZ3m2Vm73PnC8ldjPmTsJqZjvcE1naQoQminDBN86gSxrBd4dfFTgfeaoSINGN4TU1OJW+1aK/dQdX+sPG/b63mFOgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=b5/u/dXh; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wWHuMNffMGutQbJvBKG/MZveRAosfgTjgtTC/tzZqkI=; b=b5/u/dXh0JBJyMqjvQCaQFkHk+
	8Ksv2CPwkCAHaWyXWet8FTyq9FgPyo7XewgPvma6VXyppo3tezvBghJZfbT9HetuKxM795x5Kn7sr
	hIwXirxpW1Br4vDkZdC0CkWR6PKd2tEIxzEtktNIuD7WKO7pXP4kAfvgqHmmkTra4W+m4smtqCSuK
	XCOL9BxcPLVKGW785xU3zvkHu3JWuKs4AbGatRATYJYy4dHehqcVXwlroC7HjAXdeuwBz+1c2MDRq
	4FJmYWRFEXRXE1ABa/Jzw5zSJ3zIMTfFp8EaqrW37NtkfPs0PSG0jrfnENMkugEBKVbMTyULQoSIV
	Sb37R4Rg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:34686)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v1VCp-000000001DY-2osw;
	Wed, 24 Sep 2025 20:31:11 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v1VCd-000000007PA-3Edy;
	Wed, 24 Sep 2025 20:30:59 +0100
Date: Wed, 24 Sep 2025 20:30:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Choong Yong Liang <yong.liang.choong@linux.intel.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org, Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>, Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: Re: [PATCH RFC net-next 0/9] net: stmmac: experimental PCS conversion
Message-ID: <aNRG82biP9mA-rvm@shell.armlinux.org.uk>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
 <b7fb3c8c-bfa6-4e46-b5ed-05e4752bbc00@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7fb3c8c-bfa6-4e46-b5ed-05e4752bbc00@intel.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Sep 24, 2025 at 12:13:18PM -0700, Jacob Keller wrote:
> 
> 
> On 9/24/2025 11:17 AM, Russell King (Oracle) wrote:
> > This series is radical - it takes the brave step of ripping out much of
> > the existing PCS support code and throwing it all away.
> > 
> > I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
> > flag with Bartosz Golaszewski, and the conclusion I came to is that
> > this is to workaround the breakage that I've been going on about
> > concerning the phylink conversion for the last five or six years.
> > 
> > The problem is that the stmmac PCS code manipulates the netif carrier
> > state, which confuses phylink.
> > 
> > There is a way of testing this out on the Jetson Xavier NX platform as
> > the "PCS" code paths can be exercised while in RGMII mode - because
> > RGMII also has in-band status and the status register is shared with
> > SGMII. Testing this out confirms my long held theory: the interrupt
> > handler manipulates the netif carrier state before phylink gets a
> > look-in, which means that the mac_link_up() and mac_link_down() methods
> > are never called, resulting in the device being non-functional.
> > 
> > Moreover, on dwmac4 cores, ethtool reports incorrect information -
> > despite having a full-duplex link, ethtool reports that it is
> > half-dupex.
> > 
> > Thus, this code is completely broken - anyone using it will not have
> > a functional platform, and thus it doesn't deserve to live any longer,
> > especially as it's a thorn in phylink.
> > 
> > Rip all this out, leaving just the bare bones initialisation in place.
> > 
> > However, this is not the last of what's broken. We have this hw->ps
> > integer which is really not descriptive, and the DT property from
> > which it comes from does little to help understand what's going on.
> > Putting all the clues together:
> > 
> > - early configuration of the GMAC configuration register for the
> >   speed.
> > - setting the SGMII rate adapter layer to take its speed from the
> >   GMAC configuration register.
> > 
> > Lastly, setting the transmit enable (TE) bit, which is a typo that puts
> > the nail in the coffin of this code. It should be the transmit
> > configuration (TC) bit. Given that when the link comes up, phylink
> > will call mac_link_up() which will overwrite the speed in the GMAC
> > configuration register, the only part of this that is functional is
> > changing where the SGMII rate adapter layer gets its speed from,
> > which is a boolean.
> > 
> > From what I've found so far, everyone who sets the snps,ps-speed
> > property which configures this mode also configures a fixed link,
> > so the pre-configuration is unnecessary - the link will come up
> > anyway.
> > 
> > So, this series rips that out the preconfiguration as well, and
> > replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.
> > 
> > We then move the sole PCS configuration into a phylink_pcs instance,
> > which configures the PCS control register in the same way as is done
> > during the probe function.
> > 
> > Thus, we end up with much easier and simpler conversion to phylink PCS
> > than previous attempts.
> > 
> > Even so, this still results in inband mode always being enabled at the
> > moment in the new .pcs_config() method to reflect what the probe
> > function was doing. The next stage will be to change that to allow
> > phylink to correctly configure the PCS. This needs fixing to allow
> > platform glue maintainers who are currently blocked to progress.
> > 
> > Please note, however, that this has not been tested with any SGMII
> > platform.
> > 
> > I've tried to get as many people into the Cc list with get_maintainers,
> > I hope that's sufficient to get enough eyeballs on this.
> > 
> 
> I'm no expert with this hardware or driver, but all of your explanations
> seem reasonable to me.
> 
> I'd guess the real step is to try and get this tested against the
> variety of hardware supported by stmmac?

Yes please, that would be very helpful, as I don't want to regress
anyone's setup. I'm hoping that this series is going to be the low-
risk change.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

