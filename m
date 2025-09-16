Return-Path: <linux-arm-msm+bounces-73806-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D98D9B5A423
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 23:46:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FC6C1BC16E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Sep 2025 21:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687C21F4701;
	Tue, 16 Sep 2025 21:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WAJ8N01z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDA631BC88;
	Tue, 16 Sep 2025 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758059175; cv=none; b=KspkDG6+jxTLd6X8YWEb9jPmzDyaqWQ1AIVlUl/7s6grvnzcO7IC7U+Y/obV1tbHMtIEirDxxgnV3bSZIHmvbryLjtbzpRgk3Ioe3cZJYxJfm0PO6YJp1SW04K3WCOY6HWntVIMofVHwhjF3RUSiva7IcmBDer2z9vFknKXOSw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758059175; c=relaxed/simple;
	bh=VeS7KFf+rHWJzTKhT4QtPJonbnt8KmLy5lWwTUzmGGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pvi0P5YMRbaBOmNMEPygd9JrTxU3P2GeCftPYTVWtqAYmOle0CbtTWiX4A41rSBUyreUmcO2ZrYOptqM0A/VjpsYwIasYBOAzwJltbwVJcr7eMXbadusu/OI3RSJX5fFEHzj1wWrtePfObfVoqvAvYVZXA6E2haLuc0Mia19Pek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WAJ8N01z; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=144yI2r29gduOQHswHZUx+6arVcgoh3KDtsNCZtQmg4=; b=WAJ8N01z164GRtzHoCPtm4wzjk
	CtCOrB0epqxtdVlrIJED10Gusfhpcm7zJaMaB9iVYD1c/33waZVMeFfWrjmUwr2Q2wCgDsoUVMFO3
	FSP8iSPon8sjyf1isqyfIWurU6KUWbnZSQCJvdlY4BJvo89y59jHsxmELj/AJjq6TT09J8v17ZO98
	uTR0IJ6WVhP1wUtjbgwhpi2QbkiHawIgoLHM7E62C/+CmoJpuuecxz+A9o9XBVsHsI1lZ8mRn4HWe
	7UlOpAXYFWKwjQMPM4MaeJ1fkPkWbS/Nszo8JvL8FH4FFh6O6glDwXWpScw8K0Z2pyMTDAK6HCnic
	NUq8SXDg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:33128)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uydV3-000000006Oj-2r6j;
	Tue, 16 Sep 2025 22:46:09 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uydV2-0000000081B-22fM;
	Tue, 16 Sep 2025 22:46:08 +0100
Date: Tue, 16 Sep 2025 22:46:08 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-arm-msm@vger.kernel.org,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH net-next v2 0/7] net: rework SFP capability parsing and quirks
Message-ID: <aMnaoPjIuzEAsESZ@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

The original SPF module parsing was implemented prior to gaining any
quirks, and was designed such that the upstream calls the parsing
functions to get the translated capabilities of the module.

SFP quirks were then added to cope with modules that didn't correctly
fill out their ID EEPROM. The quirk function was called from
sfp_parse_support() to allow quirks to modify the ethtool link mode
masks.

Using just ethtool link mode masks eventually lead to difficulties
determining the correct phy_interface_t mode, so a bitmap of these
modes were added - needing both the upstream API and quirks to be
updated.

We have had significantly more SFP module quirks added since, some
which are modifying the ID EEPROM as a way of influencing the data
we provide to the upstream - for example, sfp_fixup_10gbaset_30m()
changes id.base.connector so we report PORT_TP. This could be done
more cleanly if the quirks had access to the parsed SFP port.

In order to improve flexibility, and to simplify some of the upstream
code, we group all module capabilities into a single structure that
the upstream can access via sfp_module_get_caps(). This will allow
the module capabilities to be expanded if required without reworking
all the infrastructure and upstreams again.

In this series, we rework the SFP code to use the capability structure
and then rework all the upstream implementations, finally removing the
old kernel internal APIs.

---
v2:
- Add Andrew's r-b to patch 1
- sfp_module_may_have_phy() -> sfp_module_parse_may_have_phy()

 drivers/net/phy/marvell-88x2222.c |  13 +++--
 drivers/net/phy/marvell.c         |   8 ++-
 drivers/net/phy/marvell10g.c      |   7 ++-
 drivers/net/phy/phylink.c         |  11 ++--
 drivers/net/phy/qcom/at803x.c     |   9 ++--
 drivers/net/phy/qcom/qca807x.c    |   7 ++-
 drivers/net/phy/sfp-bus.c         | 107 ++++++++++++++++----------------------
 drivers/net/phy/sfp.c             |  49 +++++++++--------
 drivers/net/phy/sfp.h             |   4 +-
 include/linux/phy.h               |   5 ++
 include/linux/sfp.h               |  48 +++++++++--------
 11 files changed, 126 insertions(+), 142 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

