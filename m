Return-Path: <linux-arm-msm+bounces-77495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 508C5BE0E26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 23:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3F7A44E817B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:57:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA983043C4;
	Wed, 15 Oct 2025 21:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="mn7QF/uG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F0729D279;
	Wed, 15 Oct 2025 21:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760565461; cv=none; b=Vs2pEguLTGxrjGWK/O6G4iJthDxWYPpSz/xhieMIFw/gvG0TqOmpyKWZX+x+Cy8UVTmRBeOt75tEWR9RE1hv4ScI/YkaPf4COSrf91qfNG15YG7JuEHBy+NL1bCHccjsavjm9uccEeRuIlwUYqW7nD+oNCo7L8JSkI5y2wXfPr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760565461; c=relaxed/simple;
	bh=WUMK/p1NpKi6lgRs+bVf1M0kCd8OsC05g8BX3feRS7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gVhFauIrHKH+vM6/5db/oczeg6QexGGCj2HYdQg7DkVU8dGScciG/YpQn4ESi2rVzKKsM0YO0udWvmmaZvVCmQ4u8W8V60FuAfFZOgotavfSK4j02CsTgqYYpOQREyjHqKNo8ONujVlADNH7iMoOCGn5b3QBhjNZWW919YHo+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=mn7QF/uG; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w4Vhb+pWajT1Ug9vm6p2q425XInEco8nPyGgnsCFC6I=; b=mn7QF/uGABpKN3xNzZQhmz2z8B
	o11ld6ctbXR/ky2Bzy9GmguS3MZrXnF1v2rYnkjP5YhUCZo59ImkCcNqhMFbUqqZQngxwTgx92ZgP
	uUcm3aQsK5C3oeuTJBBTA4Gjy7CdOrDM7lZERKde429KjydqJBEKRvmUAlv4qS4lv/4CxMntHi6Ri
	B4m95goSjEKH1jPj2ZEIvSgu3K+3K8pRLhYL5jP6gUIBKXXpuBTVy5nhRltxZuXFPSEphg8trRGUe
	DyxHgnVYT6D5oWp5MRGliTSF6l4qTUbUxfZn86zYEQT44SrSmakBSNxf9lqsMxS+akwDPJ+7/yJjR
	NxC1+iNw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33366)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v99Uh-000000005Vv-0ZMi;
	Wed, 15 Oct 2025 22:57:15 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v99Ua-000000002di-3k6X;
	Wed, 15 Oct 2025 22:57:08 +0100
Date: Wed, 15 Oct 2025 22:57:08 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
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
Subject: Re: [PATCH net-next 14/14] net: stmmac: convert to phylink PCS
 support
Message-ID: <aPAYtHPcF5bes7Xi@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92NJ-0000000AmHi-1ZGJ@rmk-PC.armlinux.org.uk>
 <040a2f29-4c95-4561-87c0-2a70308d3f00@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <040a2f29-4c95-4561-87c0-2a70308d3f00@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Oct 15, 2025 at 11:31:37PM +0200, Andrew Lunn wrote:
> > - create stmmac_pcs.c, which contains the phylink_pcs_ops structure, a
> >   dummy .pcs_get_state() method which always reports link-down
> 
> I've not followed the PCS code too closely. Why always report link
> down? Why is a dummy method needed?

If phylink is put into inband mode, and a PCS is supplied to phylink
where this method left NULL, the kernel will oops.

As the code stands today in mainline, if phylink were to be put into
inband mode with the integrated PCS, then there will be no phylink PCS,
and so phylink_mac_pcs_get_state() will fall into the "else" path of:

        pcs = pl->pcs;
        if (pcs)
                pcs->ops->pcs_get_state(pcs, pl->pcs_neg_mode, state);
        else
                state->link = 0;

and force the link down.

So, adding this method keeps the status quo - not oopsing the kernel
and not allowing the link to come up. No unintended behavioural
change in this regard from how it would behave today. :)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

