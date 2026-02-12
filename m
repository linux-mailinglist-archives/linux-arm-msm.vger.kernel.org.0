Return-Path: <linux-arm-msm+bounces-92630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMOEAT4ajWlbzAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:09:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5723312870F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 01:09:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B900F306641B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 00:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 518FEA55;
	Thu, 12 Feb 2026 00:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="zepebKy6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CFC1391;
	Thu, 12 Feb 2026 00:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770854971; cv=none; b=EPbtM5hti4SxSQK8cWH689Huvq7hLiLthwHcBWIl4c9coArHKMX+jd73aFErFzpKSWVJMD1LEGLYv0lJTTx5uxGlBIZIUSd5yZtplQBOwSLK6Cg8VR9wCNg+jTJPuUl52B6+i6o3MPKcjOwD1fmc2zHgMCU76ctuS+w4IxK4PfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770854971; c=relaxed/simple;
	bh=k9Yiz6bjxfwJ9NTo3MYrwcNDRFZckjhrRvAgPXVqct8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mM3JuxG/uxqINFs5joX4kVt+IkENzeLucT0jQR7OEFBTpQkHwxXNWyTWt5RXR2bMnA2tpYWAX/ecI8Fp6qTxxHJrPDyJOXPq05dwM9xFMo4LKp9N6JrOEyl7+2E9sWq4ttazRGfUL+uTbGt1rUxM6X6SwHAEemEgg3n/Qxq82aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=zepebKy6; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=dQ0e0Hl+hfGkqhFEDP77ZKILri8DDFwL1Z6H3AicD1s=; b=zepebKy64GwoNXQrxyGz2TPsZF
	3LxVrg75F4GEdZEEFM1/YnMYQGvNya//tXUH3O4SChkqLTvHEyDkFo3TF6i5aR7K4TH67h1QlwRBf
	G5nZ/nfhK8UcaR+gKAf5WJlWMXWxMXp97lwk5PwsnlCrkAooQFCYain6Yo8ny2vVfiB/iHcJ5n1am
	x6RuEW0yUcK6PsFDBL7ohioeotBbfIxMMkM2c7FP4N8SbGGJp9WlYILfoZOC0amusLgE46fmEXS/6
	c/c+/Syj45BvlndpwlUV+k9RTfYY6YGcQlg6DCFoPkx5KX+sPULFoIhqCVzWXl/QqRur3wVyUynkV
	SXmRCCJQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48532)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vqKGh-000000003na-2YvA;
	Thu, 12 Feb 2026 00:09:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vqKGc-000000004EB-1Ubm;
	Thu, 12 Feb 2026 00:09:10 +0000
Date: Thu, 12 Feb 2026 00:09:10 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH RFC net-next 0/9] net: stmmac: qcom-ethqos: cleanups and
 re-organise SerDes handling
Message-ID: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92630-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5723312870F
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

Please test this patch set, and let me know whether this works, or
where it breaks.

Thanks.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  11 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   3 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 114 ++++++++++++---------
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  11 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |   3 +-
 include/linux/stmmac.h                             |   3 +-
 8 files changed, 90 insertions(+), 61 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

