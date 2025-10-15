Return-Path: <linux-arm-msm+bounces-77490-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D0EBE0D27
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 23:32:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5452C4E27C3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47BD2E2DF1;
	Wed, 15 Oct 2025 21:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WqREv1Qg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468111DC9B1;
	Wed, 15 Oct 2025 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760563963; cv=none; b=Sm+72kR3wHxXWQVaTjIgSXln6ayx1be6bqZaw2VGYO14LdRyYLR8ajMZZLURgOFZWEVNQ36oiWsP3GgQzogWiUnsDBtzE8ihrwFWSVebNXjMA0V2f/gBAuIsNrzV1BkDQIi5NWlV8A4iGPaOPbxWo94J/IAkPbaaOPaa9suUVSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760563963; c=relaxed/simple;
	bh=UfHw6/43XAdG7dgYHvjYRARS6PhSqgGnItY9MYr/b5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQPhQGclShS8y2vAsDS5BrzLiCIj5F8C3X+HvnrzLusnhFtCGmmZfBSZ5c9A9K7/UvlIaLnsSlZ92Fmk7htQ1omVOuEyTyMyiHz+FfUV3O8EOHjBAgD7phSSKeeIX+Vt1wT4rKt7lE95o/JfeXdcaQ4kLe9ORVe9xxAPR7WEzsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WqREv1Qg; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/UUBwbfmVL4sGFj/GLilqDN9Jt7D7NF8Dxz8jPhNnLs=; b=WqREv1Qgfd1EfNtd3ps7chdP4O
	14bpo7XvjBgl19XBh0KGb9l/6IYCvd8J0N5Zu4zQLmhTEmG8zqMqg7b5rNKHLeAq0qMhXXbtVBk7R
	JIVUJX0x5SSq625vF4eG3diKV7Wj5OG+hmcqr7Sz45THbuxb8j1nSH+MLMS6XmR+cpJyLoDgOaT6A
	Db4Ml2a25jbY92ennRKu6tzEtMcXpZCumdbIHQdB4HS1c7qSEzBtim0BSicLK2h8Z/FOSNNLObTib
	WN7+r9Xgi+rdlFuq3V1czeIA2pRU6j54BFGoPjoUd+lLux6ykjBlhPRunR0ZGL/3kB8Ald8Z3UZh3
	Nl6ISwfQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:50056)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v996R-000000005TK-4AjF;
	Wed, 15 Oct 2025 22:32:12 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v996G-000000002cV-1O1R;
	Wed, 15 Oct 2025 22:32:00 +0100
Date: Wed, 15 Oct 2025 22:32:00 +0100
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
Subject: Re: [PATCH net-next 13/14] net: stmmac: provide PCS initialisation
 hook
Message-ID: <aPAS0J32l2ueVhcK@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92NE-0000000AmHd-15fv@rmk-PC.armlinux.org.uk>
 <96842284-8d92-46b8-8b28-2b20755c3523@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96842284-8d92-46b8-8b28-2b20755c3523@lunn.ch>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Oct 15, 2025 at 11:11:22PM +0200, Andrew Lunn wrote:
> > +	/* Unimplemented PCS init (as indicated by stmmac_do_callback()
> > +	 * perversely returning -EINVAL) is non-fatal.
> > +	 */
> > +	ret = stmmac_mac_pcs_init(priv);
> > +	if (ret != -EINVAL)
> > +		return ret;
> 
> Oh, that's ugly.

Yes, I completely agree, and...

> which added this, i don't actually see a user of the returned EINVAL.
> EOPNOTSUPP would of been better. But changing it now will need quite a
> bit of review work :-(

Yes. Maybe at some point in the future it can be addressed - it will
become an issue if we end up with an implementation of these methods
that returns -EINVAL to really mean failure.

However, it's a non-zero chunk of work to go through every single
caller of numerous methods to make the change. It may be possible to
introduce a new base-helper that returns -EOPNOTSUPP and switch
groups of methods... but given my present backlog, it's not something
I'm going to rush to do!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

