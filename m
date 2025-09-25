Return-Path: <linux-arm-msm+bounces-75124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F33B9F952
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 15:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 057B932536F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 13:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A708261393;
	Thu, 25 Sep 2025 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WnYSM/C8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A37230D1E;
	Thu, 25 Sep 2025 13:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758807146; cv=none; b=rducIsnoscV8h4k+YjA+WLGFOuKkiYk+bqXpQg/HN/p6mszovKjTgkKUeeTWUVqdTB7HYZKgDmXNDRo5DvEgdRcUS0b48Vnpuvn0qaUZwtrlKaiqSPAA87aRcyjjSS+Pb+XivC1N63QHI7k3kPg4UDUQX16tfLLFcry0ffkav2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758807146; c=relaxed/simple;
	bh=eXk5c65/ZeMSWeIcTcOzAK6FyGQ4YI5tGmbGiDLUIE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EnTdgOTv5bPa+7P/No6/Z/BCiv5C53atC1k3xsjK5DdtGwSJrKAgDZK9b1JCyUkR/4usToAx3C0OvhXv8uCNxDbADV872uqjVoWAGi5jjAWmrZjgGkDsZI6DY0hTv9tjAiHSlHQ6V1PbG1DHUckChA1uoJGDWa39H2M0MpNcIXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WnYSM/C8; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+JTi6m8c71S5T93QgsVYDnnHaK5veNh8luB+E8eyeWY=; b=WnYSM/C8fOejMG1d2bpodYRk8t
	wALItpSq7FYCgA2YHczQb+FMz3p21BaGlbQPutk7M0D9OFcnHngOCO3asmhRv0g/UFZ3dybOMeMfg
	qt3k/h8GG/lESNkqP1H7274pfR/Y6jSsb+gYiyVMLZ6fas4mm3MT1zXXlsg7WfQU4nEie7q3gsjxv
	IUqrrriRvLN3PZUJY5yont0AdpYn1BSgwgfjLrqgWREvPTDfpUBXDJJYOVQpmt5DVVhesFpXXVCru
	DOfb8y3/RJfxu/kbYmUvi49AXkWyTHROJuSWKe/0TWNcaJ5BV+Bm1UTiCQVTx0vwCEAVEUas9cHpf
	pyeEt3ug==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35828)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v1m4c-000000002En-1dmh;
	Thu, 25 Sep 2025 14:31:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v1m4N-000000008A2-3RWp;
	Thu, 25 Sep 2025 14:31:35 +0100
Date: Thu, 25 Sep 2025 14:31:35 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
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
Message-ID: <aNVENwSF4I3hyP4q@shell.armlinux.org.uk>
References: <aNQ1oI0mt3VVcUcF@shell.armlinux.org.uk>
 <4822b6a5-5b40-47bb-8bff-7a3cc91f93c8@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4822b6a5-5b40-47bb-8bff-7a3cc91f93c8@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Sep 25, 2025 at 05:26:01PM +0530, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 24/09/2025 23:47, Russell King (Oracle) wrote:
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
> >    speed.
> > - setting the SGMII rate adapter layer to take its speed from the
> >    GMAC configuration register.
> > 
> > Lastly, setting the transmit enable (TE) bit, which is a typo that puts
> > the nail in the coffin of this code. It should be the transmit
> > configuration (TC) bit. Given that when the link comes up, phylink
> > will call mac_link_up() which will overwrite the speed in the GMAC
> > configuration register, the only part of this that is functional is
> > changing where the SGMII rate adapter layer gets its speed from,
> > which is a boolean.
> > 
> >  From what I've found so far, everyone who sets the snps,ps-speed
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
> 
> Thanks for that.
> 
> I'll give this a test on socfpga next week, as I don't have access to the HW
> right now. It may not be the best platform to test this on, as it has a lynx
> PCS and no internal PCS :/

Thanks for the offer of testing.

Do you know how the stmmac core has been synthesized as far as the
MII interface from it?

If not, if it's using gmac1000, possibly later cores as well, then
DMA_HW_FEATURE (or FEATURE0) bits 30:28 should give that information.
I'd guess GMII, so probably contains 0. The driver doesn't actually
use these, or even look at them.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

