Return-Path: <linux-arm-msm+bounces-77479-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BECABE0B58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 22:54:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 552FE427D19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B79E2C3244;
	Wed, 15 Oct 2025 20:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Iqtpg+9F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0090F2046BA;
	Wed, 15 Oct 2025 20:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760561654; cv=none; b=iQgAxtqSkDkh/o2TgP4hDXfGkiUaesm+JyPXOTpNGHxG3xB4WMEHnN0op5VoZ+41hjbkPwI6CmN6nzNFTKw6h+pWhYn6bsf0W4RSml0V4+ac5upie4IAR2fKmVOwp/pIaVyDa+/hY7f18y94GV6Eq//qT7jLKI8xYOZKVh5l90I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760561654; c=relaxed/simple;
	bh=3ipCMTUG3vpapmxPE0I0Bl/RqW6w2gV0eMLg4uC0ddo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXUgWgQJ8B1Q63hnX9FnR/bFokWkAx4JSd8v9iSQsuG2k1FhM/UKmr1vx0H6tWf8BdT7Ed4S4WHJZ9Bnk/0pE8W151QLuvKE7v9CEVOTbvA5KJ9IdcqLgPiIBW5leayx4Q4hIpxorhGq8YMXrqCJp/yEqUogETtG8N8gVYngus0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Iqtpg+9F; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+y6negsGs/imAQMRkRWgBlJ91wY7jx6h3f2XOctfhN4=; b=Iqtpg+9FC4m5b8n70PZNXvaQMY
	209mCUQKjNwLOn4BXnBHq4M8JDA0SakH4v/BqfJWc+LR6AFx7U3ZsTj+BoHLJuqsli+zaUshw7vCA
	TDAmYNQaF39qZ2UPbizhCmVLSsTKrdX98YqRZazm/ehuN49QuurpHGp0S0WRakB0LwEI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98VL-00B4fo-En; Wed, 15 Oct 2025 22:53:51 +0200
Date: Wed, 15 Oct 2025 22:53:51 +0200
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
Subject: Re: [PATCH net-next 07/14] net: stmmac: remove RGMII "pcs" mode
Message-ID: <574d5b07-02c9-460d-b968-7d894c597ccc@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92Mj-0000000AmH2-1LHZ@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92Mj-0000000AmH2-1LHZ@rmk-PC.armlinux.org.uk>

On Wed, Oct 15, 2025 at 03:20:33PM +0100, Russell King (Oracle) wrote:
> Remove the RGMII "pcs" code in stmmac_check_pcs_mode() due to:
> 
> 1) This should never have been conditional on a PCS being present, as
>    when a core is synthesised using only RGMII, the PCS won't be present
>    and priv->dma_cap.pcs will be false. Only multi-interface cores which
>    have a PCS present would have detected RGMII.
> 
> 2) STMMAC_PCS_RGMII has no effect since the broken netif_carrier and
>    ethtool code was removed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

