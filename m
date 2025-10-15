Return-Path: <linux-arm-msm+bounces-77475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 479F9BE0AE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 22:45:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F201A21BF8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D75824E4D4;
	Wed, 15 Oct 2025 20:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Ra5umN6R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F30D3254BB;
	Wed, 15 Oct 2025 20:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760561144; cv=none; b=Cl+a6JkBdoDBW+ao1cacikZ7/Mj7DZ0At8bwMnPH1EX2Gj6GLWXex/uZTfftrVNCPZbKh1UpS/41PFRC7OOaQRTcBwX/WU2DYNcFYRF0oXVQ0/547DM1F2zv6lEVRmZwfYfEl26y1zYL4Dcr7XWw3Lg2uJ2yIEkSC22aKsh18uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760561144; c=relaxed/simple;
	bh=W3m+OVSrt7jP6m2rKCygOJUAR2HWXyjPbwzm+1Ghw5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7qenGU6iUFRIzIYUx/Ko5o31u4nfb23c6hDR+KAKhY3Zw26V1L/S1K4gqwdT03f6pejeCwoCyrCd2lnVZZuWyZWxW0CTOJGrDnZoL/a0Q/NwJ+j9imWnM9LEKoHf9y30p7xzzKurxo3p+tvOdYb2Ma6rpx14nkFaxC7OJSuh3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Ra5umN6R; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wI7TUoxCRst6U98JOjlyLeiEdogSVj2q++Jpknya3bU=; b=Ra5umN6R2WMjjIruFvqj9qPQys
	gKdeSQLsaCJvBknXy+qBtiIAIN+k9ApfFHP0lgLnRHqBWw+vOS5mVnimqe9eRphMIpQe4tx3codvv
	kGuwW4YF1VcT3W+Eym+GPUyWCWTBgvLOT8aJVkZz+gjJG9/oZlgbQc1jK3OGaBTYiX+0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98NA-00B4Yr-Rz; Wed, 15 Oct 2025 22:45:24 +0200
Date: Wed, 15 Oct 2025 22:45:24 +0200
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
Subject: Re: [PATCH net-next 02/14] net: stmmac: remove xstats.pcs_* members
Message-ID: <e8584094-a4c7-42c6-9162-3ec181a6ab16@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92MJ-0000000AmGJ-29wO@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92MJ-0000000AmGJ-29wO@rmk-PC.armlinux.org.uk>

On Wed, Oct 15, 2025 at 03:20:07PM +0100, Russell King (Oracle) wrote:
> As a result of the previous commit, the pcs_link, pcs_duplex and
> pcs_speed members are not used outside of the interrupt handling code,
> and are only used to print their status using the misleading "Link is"
> messages that bear no relation to the actual status of the link.
> 
> Remove the printing of these messages, these members, and the code
> that decodes them from the hardware.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

