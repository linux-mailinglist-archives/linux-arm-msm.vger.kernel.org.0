Return-Path: <linux-arm-msm+bounces-93625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NoBNRYfnGkZ/wMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:34:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75F0D173F29
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 10:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3076D30048D1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 09:34:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31DE734DCC4;
	Mon, 23 Feb 2026 09:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="KqTMupwg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6E5344DAE;
	Mon, 23 Feb 2026 09:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839252; cv=none; b=JL/o19nMhcGWIIcLcyhENsih28+TAOE+HU2WHUaFwfJk4NTYFszj7OL4MSKGFu30CkDK6TJM/XwYAvJ/C5Def+hVBGFYVFg1c3qt9XtW4hCfZhQV/O60pGN8eArYFTqMg88RqTijhKkcpPCjw3HKNulx3QMZDXyJ2hUcOwlvRk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839252; c=relaxed/simple;
	bh=RypTf0aMcT3Gvihug4VTgy7+ut33JHRXRF4noGUpbvo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dC8mo0HWvuorN6A5B5W9yi+kzuP9io/FYLL/adUpzOMTXAP5bWqkaIQ9WH93riNVZEjDbwWL16szDSeOgTa19nyksAzpFzP4/qyUH4SyMtPyMC0vQpmixWW4GmsAmOiy0ajYFF9pYAT7NqYj2+a3Ymc9VPzrCUmIUIXtKklFpaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=KqTMupwg; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jYLQAmS2V5vH5hD2lJBwU5t9ZdEBHgF8ZElCbh4Vl38=; b=KqTMupwg9pYja1LrDQB6IHXOgf
	nMKlIz/G73+crJNsBegu4iKfDndmFaAg8ZxegYlGob+Wmq14kOgydAtMmWReeV3lPjU0m/obpOCzv
	wk5Pt4ig1LUxoIeqnyZ1Fgprt0Os7TAeYYJ484oRSDlbombqK53ahPv+tzhe79izF8HuyW5MvoCPu
	bg+UwVKp682N6FBHyDHPzOYBieoyGr/eceMPZIivAQLoMDs5G/TcPAdeyTwU9UuUwSWisKozf2N76
	vvlPGbTBdADqCY53pQ37qQ/1Ntja6rm0Pi8GSl1+uohnold+g0j7V9WGoEU+SxC7IYrYN1ra7pswA
	dU20lQgg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:47704)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vuSKD-000000003lh-2rgk;
	Mon, 23 Feb 2026 09:33:57 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vuSK9-000000007Fx-0IGw;
	Mon, 23 Feb 2026 09:33:53 +0000
Date: Mon, 23 Feb 2026 09:33:52 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 00/10] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aZwfAFJQcp9f0niI@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93625-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,shell.armlinux.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 75F0D173F29
X-Rspamd-Action: no action

Hi,

As the last series had issues with stability, I've changed the approach
in this series to concentrate on keeping much of the SerDes related
code within the qcom-ethqos driver rather than trying to move it out at
this stage. This means it should be possible to bisect these patches and
pinpoint exactly the code movement that causes any instability.

This series starts with various cleanups to qcom-ethqos (the first four
patches) before beginning to move code, passing phylink's phy interface
(which will change) to the fix_mac_speed() method, and then using that
to configure the serdes and inband setting before moving the SerDes
code.

This patch set has been tested.

Thanks.

Changes since RFC:
- add set_clk_tx_rate() conversion as that was also tested.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 135 ++++++++++++---------
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
 include/linux/stmmac.h                             |   3 +-
 8 files changed, 101 insertions(+), 71 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

