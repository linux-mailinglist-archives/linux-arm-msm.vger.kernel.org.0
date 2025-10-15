Return-Path: <linux-arm-msm+bounces-77413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C19BDEFE7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7119B486046
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:20:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 804FA243969;
	Wed, 15 Oct 2025 14:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="bleYCwZ6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD96224AED;
	Wed, 15 Oct 2025 14:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538019; cv=none; b=fKFCnQAFYMPY9GQ2flMfZE2bP/OrZnUacnL0/14n/2cqkxBSYD2GOOI8e/8qItp6kz/mGdMrXr3EJ2ePVCzIXOmk1lBMCPx+gj7jn/Sb+RZFUjIo7HF0XqqOaG6Q4O4WA1e1Vch1DiFoYrAR54k+hpXWcUqA/pZb0oMOgbxeMJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538019; c=relaxed/simple;
	bh=+fp4oQ/3yyn9S+l1Agz8qFnINHQ32q1ZmJr9Ejfxkrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ab+Yw5Y8lBGEd0pHJ0LVjTokrOE935co0WaLJpy9lu1sJn6a/JWex8uoH1JrH7MHZg+DMh4E7vHFIwZBWAXnMx1VFyzWyQjjoqa4EVuCXt9IEsLKuCdOWB3BHVV42UPkb1NLktTtSIs3+90Hxr7Bnq08CzO3lv/fe8qSyUE7P70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=bleYCwZ6; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Cd+vnc5+2R6vO0E42gKoeqL/Lm72sDaXvug1pdMXk+E=; b=bleYCwZ6e9k8KI/AZUcw/0mN5x
	XDEE8vjEzTMt/+6uSPa63ftpsRMY4htwHlql8pMUz3+0VZozXUAOT4QGKpTq9ehE+hYDvYe7UKWqP
	WVur47biWXiBt6sotW/N8jLKOnSTG44pE0v2eVLpQn7pqpokXPgo+5L9wm7DTbh3A2a8fCaseTcfY
	TilXzGcq+cFtkzIlSC0/Sq1vbVEpaK+6FCQ3vle5P5vt4eHebtdYOTnsA8v47tU8Ivf9z0hsShO+i
	XXSefj6hPUCwC52GpDDetTntyxCgyYqC2KkDIHvDnSfkNW3es1lc+KNIrSx9sqi8jv8N3JAdzjFnB
	rx0X6IIA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58174)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v92Lq-000000004dh-3LdE;
	Wed, 15 Oct 2025 15:19:38 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v92Ld-000000002KU-2IwM;
	Wed, 15 Oct 2025 15:19:25 +0100
Date: Wed, 15 Oct 2025 15:19:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
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
Subject: [PATCH net-next 00/14] net: stmmac: phylink PCS conversion
Message-ID: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

This series is radical - it takes the brave step of ripping out much of
the existing PCS support code and throwing it all away.

I have discussed the introduction of the STMMAC_FLAG_HAS_INTEGRATED_PCS
flag with Bartosz Golaszewski, and the conclusion I came to is that
this is to workaround the breakage that I've been going on about
concerning the phylink conversion for the last five or six years.

The problem is that the stmmac PCS code manipulates the netif carrier
state, which confuses phylink.

There is a way of testing this out on the Jetson Xavier NX platform as
the "PCS" code paths can be exercised while in RGMII mode - because
RGMII also has in-band status and the status register is shared with
SGMII. Testing this out confirms my long held theory: the interrupt
handler manipulates the netif carrier state before phylink gets a
look-in, which means that the mac_link_up() and mac_link_down() methods
are never called, resulting in the device being non-functional.

Moreover, on dwmac4 cores, ethtool reports incorrect information -
despite having a full-duplex link, ethtool reports that it is
half-dupex.

Thus, this code is completely broken - anyone using it will not have
a functional platform, and thus it doesn't deserve to live any longer,
especially as it's a thorn in phylink.

Rip all this out, leaving just the bare bones initialisation in place.

However, this is not the last of what's broken. We have this hw->ps
integer which is really not descriptive, and the DT property from
which it comes from does little to help understand what's going on.
Putting all the clues together:

- early configuration of the GMAC configuration register for the
  speed.
- setting the SGMII rate adapter layer to take its speed from the
  GMAC configuration register.

Lastly, setting the transmit enable (TE) bit, which is a typo that puts
the nail in the coffin of this code. It should be the transmit
configuration (TC) bit. Given that when the link comes up, phylink
will call mac_link_up() which will overwrite the speed in the GMAC
configuration register, the only part of this that is functional is
changing where the SGMII rate adapter layer gets its speed from,
which is a boolean.

From what I've found so far, everyone who sets the snps,ps-speed
property which configures this mode also configures a fixed link,
so the pre-configuration is unnecessary - the link will come up
anyway.

So, this series rips that out the preconfiguration as well, and
replaces hw->ps with a boolean hw->reverse_sgmii_enable flag.

We then move the sole PCS configuration into a phylink_pcs instance,
which configures the PCS control register in the same way as is done
during the probe function.

Thus, we end up with much easier and simpler conversion to phylink PCS
than previous attempts.

Even so, this still results in inband mode always being enabled at the
moment in the new .pcs_config() method to reflect what the probe
function was doing. The next stage will be to change that to allow
phylink to correctly configure the PCS. This needs fixing to allow
platform glue maintainers who are currently blocked to progress.

Please note, however, that this has not been tested with any SGMII
platform.

I've tried to get as many people into the Cc list with get_maintainers,
I hope that's sufficient to get enough eyeballs on this.

Changes since RFC:
- new patch (7) to remove RGMII "pcs" mode
- new patch (8) to move reverse "pcs" mode to stmmac_check_pcs_mode()
- new patch (9) to simplify the code moved in the previous patch
- new patch (10) to rename the confusing hw->ps to something more
  understandable.
- new patch (11) to shut up inappropriate complaints about
  "snps,ps-speed" being invalid.
- new patch (13) to add a MAC .pcs_init method, which will only be
  called when core has PCS present.
- modify patch 14 to use this new pcs_init method.

Despite getting a couple of responses to the RFC series posted in
September, I have had nothing testing this on hardware. I have tested
this on the Jetson Xavier NX, which included trial runs with enabling
the RGMII "pcs" mode, hence the new patches that rip out this mode. I
have come to the conclusion that the only way to get stmmac changes
tested is to get them merged into net-next, thereby forcing people to
have to run with them... and we'll deal with any fallout later.

 drivers/net/ethernet/stmicro/stmmac/Makefile       |  2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h       |  5 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  6 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  6 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 65 ++-------------------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 66 ++-------------------
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    | 25 +-------
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  4 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  4 ++
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   | 68 +---------------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 24 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 47 +++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   | 23 ++++++--
 include/linux/stmmac.h                             |  1 -
 15 files changed, 104 insertions(+), 245 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

