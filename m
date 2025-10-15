Return-Path: <linux-arm-msm+bounces-77433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36081BDF4A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 17:13:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41E8C3AC011
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6872D0631;
	Wed, 15 Oct 2025 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="O9P3uEZD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C2263F3C;
	Wed, 15 Oct 2025 15:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760541097; cv=none; b=tLGl4a2YW69O67XKWpqqPgctNDLznwWjrKWgicVHyUDwyyUSR9CUBh3t1sbrotQVslwDxyEko4tXjnFyyX8sXvvS3y/n8oUCu/AknIt+cE4ON/TIxJJtfkfqXYIz/cklSHgGju5o+kIBBEK/4dyTlCkOJG+qsxTwyA+A0tWQlM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760541097; c=relaxed/simple;
	bh=hmp/gAn65IFbpGywLQ9zHPSvAnD9BWyKWsm7ITD8Tyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qnXg/3o7ZFp4GE0aoreTFk15taAZSG84XtG2LuJgyD7bSvg22fHoI2/Rdtoq3tlmT7FNlo0vrtXFzTNMmPcLpFoVGNOn6E9JEcYwrtG9vFI8hhfJyekLqC8Igvyetfrv4ldvqsjtTsEmKH7GGKCeZUkYqkhMOiWfWy5SNGUvXoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=O9P3uEZD; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6dUT2aqA1jAvoeooAc2ZpehL8Qek8bypoSCOPoN+1y8=; b=O9P3uEZDSbhAxPmFpIlgHjg83i
	FMzJkqmt2nbJ7Gjjw0Lzr2XfcDpUItAhPTIxfq2Ugm/HOwAxpOMq8VyBl7gyJkFrbcFS5zpPI7xbi
	GOZtS0TXl+skDQcp3esrKHleiI/XNyoJkAGqrGFSeQ/KFtf51G6mE5h/Lj9B72i+epQyvl00m1LvG
	a6wFwulnPrvh8gMGF9j8mjEXahKXpnmKPov2c0PTcWxolwJTLFgr5M8jjNQA8g5VjuGzeQ9AwhbGr
	EMzpvDGZUhhQ6HmmrpJECbQ08YQI56mR5UseCDov+U5I0PCYyC0hlLEA24biynd4ZgJBPFZwVngtb
	KoQgsyxA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42702)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1v939e-000000004ww-0mbL;
	Wed, 15 Oct 2025 16:11:06 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1v939V-000000002Mf-1caB;
	Wed, 15 Oct 2025 16:10:57 +0100
Date: Wed, 15 Oct 2025 16:10:57 +0100
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
Subject: Re: [PATCH net-next 00/14] net: stmmac: phylink PCS conversion
Message-ID: <aO-5gVqBV-2Nl7lr@shell.armlinux.org.uk>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Oct 15, 2025 at 03:19:25PM +0100, Russell King (Oracle) wrote:
> Changes since RFC:
> - new patch (7) to remove RGMII "pcs" mode
> - new patch (8) to move reverse "pcs" mode to stmmac_check_pcs_mode()
> - new patch (9) to simplify the code moved in the previous patch
> - new patch (10) to rename the confusing hw->ps to something more
>   understandable.
> - new patch (11) to shut up inappropriate complaints about
>   "snps,ps-speed" being invalid.
> - new patch (13) to add a MAC .pcs_init method, which will only be
>   called when core has PCS present.
> - modify patch 14 to use this new pcs_init method.

I've just noticed I sent out RFC v2.. completely forgot about that,
sorry. This is a subset of RFC v2, but with patches 13 and 14
reversed.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

