Return-Path: <linux-arm-msm+bounces-77482-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8BCBE0B91
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 22:58:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB80C1A22F0D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F072D061B;
	Wed, 15 Oct 2025 20:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="zVHiGGVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D83254BB;
	Wed, 15 Oct 2025 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760561878; cv=none; b=Q06r3hKlpF4Sp0sVOYyS8w1kievCqwY6IkoMCVsfU2llGQl13jg5aKKBOIMeo77/tzJpRzFg5ZQEP2qixnIzTaxVVgMKsBDe3ohRJKtikh82Ui8+YAe6LIs65k5ZrmpEMibqliPp/QrHC/HLnfAiHbTWozTCP3P7uxMQvZ+Su08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760561878; c=relaxed/simple;
	bh=A2EmM14UgIybkpDAhtPGzwAIrkqTt8Bkgh5dENUO8BM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WLCZh2uiEf3SYIK0qBssE5w0sHxtGR1JhXnzqmmAVP6BRpWXZSGq+yJEnWciIm+rgxcy1IFxzqgWZFRlllm8CYlGlTgsoWwX8aiTorRb+RlufLF1v2nAKXIczLwESupOEnvkeEY0NU93cFD0R3T+krCBvG7ByS5U01CS6FHsbUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=zVHiGGVy; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=rYViK2r1T71M2+Mis9SxRUmDdzKfk6SqvpEWpgz3kvo=; b=zVHiGGVy0h3E/jEQbeDIh6RSqN
	90BHubtm5Z/mgcH8PheoZp3NsoVzWp1atu16K3T917zee7OvdjkD3yE+3NMVj0+QMnaQ4o0KRLSwr
	ug5KHEXooK6EKbrGPbLNhhlS8+R6izPxhgsVsG0JHGy8PHJJJMYRLeYe7nno4tg3nhyk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98Z0-00B4kS-2a; Wed, 15 Oct 2025 22:57:38 +0200
Date: Wed, 15 Oct 2025 22:57:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
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
Subject: Re: [PATCH net-next 10/14] net: stmmac: hw->ps becomes
 hw->reverse_sgmii_enable
Message-ID: <7a935c07-4e1b-40c8-bf9f-00576fb465e7@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92My-0000000AmHJ-3chv@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92My-0000000AmHJ-3chv@rmk-PC.armlinux.org.uk>

On Wed, Oct 15, 2025 at 03:20:48PM +0100, Russell King (Oracle) wrote:
> After a lot of digging, it seems that the oddly named hw->ps member
> is all about setting the core into reverse SGMII speed. When set to
> a non-zero value, it:
> 
> 1. Configures the MAC at initialisation time to operate at a specific
>    speed.
> 2. It _incorrectly_ enables the transmitter (GMAC_CONFIG_TE) which
>    makes no sense, rather than enabling the "transmit configuration"
>    bit (GMAC_CONFIG_TC).
> 3. It configures the SGMII rate adapter layer to retrieve its speed
>    setting from the MAC configuration register rather than the PHY.
> 
> In the previous commit, we removed (1) and (2) as phylink overwrites
> the configuration set at that step.
> 
> Thus, the only functional aspect is (3), which is a boolean operation.
> This means there is no need to store the actual speed, and just have a
> boolean flag.
> 
> Convert the priv->ps member to a boolean, and rename it to
> priv->reverse_sgmii_enable to make it more understandable.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

