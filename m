Return-Path: <linux-arm-msm+bounces-77587-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C2FBE397C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC5E51886ABE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 13:05:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931E130648D;
	Thu, 16 Oct 2025 13:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="PpMxU/p7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F9E262FE9;
	Thu, 16 Oct 2025 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760619931; cv=none; b=FsnhXH10p/RrNU+imJSgzhkR+tYNRIbXCQlVI/SMaRwDq8pQ7X5yqwrrbiOX5bynTz9Xqt8d8M390XEjmrI0tHLoCjEARzCHYB+jLLc2TfZI4xPpDHGUxGH2BEysx0OHXVdNeZ2XFaKeIec2G5KEMP9iyn7jCqK2lZyU9TqtVec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760619931; c=relaxed/simple;
	bh=Xc+JnWWIVTtBIWG68HCmHHhZPmalnHRd17m0GQ7lgko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jOAKT+KTKS9Jqe96ICID8hZfJpYXaSaZcmfrMyo0ZRBJWk/LDzLaQMvfdOYwzTGPbmNccnkRG4MwqNPEQ+gS6A/3CoNug4cPIoBzXZA7rCW5ZBjFDMM5LPc9Fq5fovEIMc8NkdeLPQ2vKQJ4MFH/4Ct6PavUmbcIV9iIzD0o3N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=PpMxU/p7; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7JL0+bGL0quldkyb9VQbHQdNgKSc3xiY2NepKrKb++8=; b=PpMxU/p7fUKKQlOiZqqqwDSEji
	di6xnJgDpt9A/EQjc6G6lZ21lW1ubDumlrkPQ81fdB7bIgY69YC7xNcceeXX/beuXtk5oiTY20wh8
	fg6X7PzcuVy0PsHdmMJts3ln/HOIspaXYXr+SDGGPX+LsQZJ2Y+OaGTT2J3QFWawmhgo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v9NfH-00B9TY-Rk; Thu, 16 Oct 2025 15:05:07 +0200
Date: Thu, 16 Oct 2025 15:05:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <5f0c7653-30e4-486a-ae5d-9d20d5e7ac43@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92NJ-0000000AmHi-1ZGJ@rmk-PC.armlinux.org.uk>
 <040a2f29-4c95-4561-87c0-2a70308d3f00@lunn.ch>
 <aPAYtHPcF5bes7Xi@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPAYtHPcF5bes7Xi@shell.armlinux.org.uk>

On Wed, Oct 15, 2025 at 10:57:08PM +0100, Russell King (Oracle) wrote:
> On Wed, Oct 15, 2025 at 11:31:37PM +0200, Andrew Lunn wrote:
> > > - create stmmac_pcs.c, which contains the phylink_pcs_ops structure, a
> > >   dummy .pcs_get_state() method which always reports link-down
> > 
> > I've not followed the PCS code too closely. Why always report link
> > down? Why is a dummy method needed?
> 
> If phylink is put into inband mode, and a PCS is supplied to phylink
> where this method left NULL, the kernel will oops.
> 
> As the code stands today in mainline, if phylink were to be put into
> inband mode with the integrated PCS, then there will be no phylink PCS,
> and so phylink_mac_pcs_get_state() will fall into the "else" path of:
> 
>         pcs = pl->pcs;
>         if (pcs)
>                 pcs->ops->pcs_get_state(pcs, pl->pcs_neg_mode, state);
>         else
>                 state->link = 0;
> 
> and force the link down.
> 
> So, adding this method keeps the status quo - not oopsing the kernel
> and not allowing the link to come up. No unintended behavioural
> change in this regard from how it would behave today. :)

O.K. Maybe some of this text could be added to the commit message?

Thanks
	Andrew

