Return-Path: <linux-arm-msm+bounces-75413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FACBA6CDA
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 11:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCE12170E58
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Sep 2025 09:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F7D2D24B8;
	Sun, 28 Sep 2025 09:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="zrt8GaeN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C717B22370A;
	Sun, 28 Sep 2025 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759050881; cv=none; b=DziBdWtkYeWlUGlGixLQeD7Sv/JlKGfNkwuPcihrPRkmqNSxmrvA3Sql5F7Fm33VX/CKu/jFRTMi1dKme8EwFvY3YCxRVPLpCs53eVm7FxYvbUGEHA3vA2BHrMeoeBBS5yMOUZ9gjENmVUmZICy8HntEWg9nN6kTfQsWJlAV5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759050881; c=relaxed/simple;
	bh=n60qJ+pMNGVYAWE/y/Lcg9q5dNvO9i5l0ss9GcK6DF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+moEBqtH5icf1SfFfW54Ded9uIxK7u94MLqO0mT2PnNtF5181Z/TbbAc8nbIvLN0fVhhGSCISATqSt4ITObqeTCPsfRgq1bnix58dOjzjoMvVGjhgtxvEaogqqP1uw+gqBoooNUrXFV6ZYgVPdNmXkziLl/Z5hKhVLvm+GHUok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=zrt8GaeN; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CrsZJsDm1lLjC1J6W9qU2UxrU3wiJPo7+vrG1pU08b4=; b=zrt8GaeNXA1mzxe+JXJUFRNsGP
	Zwe7g1PJwjsMH+3npMSE5FDxLi5P+QAIzYgXTa1giz9iR52ywg0fsSP0N4YRdAPQpdoX3S8jnyA4W
	59XdMxbTxgj45OU5cP7MW8BUpPr7fQjmLxB5EKQ9eJro8jVeN6+Tp88yaAaRIo1a/kUXSMb/vAOvj
	lbnGlkDvlkC3a5+BbJWmh9CJDEPyD1qmgOSbpPgYEfduuxO87xRPwlRpgRwE5fqwMJie8ru1kZsts
	lwJxz3QG72kyrV4o0Kz94Xm/WDQ9YQ+hiGBK+qhiWCgZBrJpeXSHmmQJK3pgO9u7cS6x3UW3sCKdP
	wlKfXFZg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48448)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v2nTq-000000005Dn-2yGp;
	Sun, 28 Sep 2025 10:14:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v2nTf-000000002ST-1rVo;
	Sun, 28 Sep 2025 10:13:55 +0100
Date: Sun, 28 Sep 2025 10:13:55 +0100
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
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>, Huacai Chen <chenhuacai@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>, Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
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
Subject: [PATCH RFC net-next v2 0/19] net: stmmac: experimental PCS conversion
Message-ID: <aNj8U4xPJ0JepmZs@shell.armlinux.org.uk>
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

v2: numerous changes, too many to have kept track of, sorry. As one can
see, the series has more than doubled in size. Some are not up to
mainline submission quality, but I've included them as they give the
full picture. b4 may be able to do a better job at identifying the
differences between the two series than I could ever do.

 drivers/net/ethernet/stmicro/stmmac/Makefile       |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h       |  11 ++-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   6 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   | 101 ++++++++------------
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |   3 -
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  | 105 ++++++++-------------
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |  39 ++++----
 drivers/net/ethernet/stmicro/stmmac/hwif.c         |   2 +
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |  12 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   4 +
 .../net/ethernet/stmicro/stmmac/stmmac_ethtool.c   |  68 +------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c   |   3 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  65 ++++++-------
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   |  88 +++++++++++++++++
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  29 +++++-
 include/linux/stmmac.h                             |   1 -
 17 files changed, 269 insertions(+), 277 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

