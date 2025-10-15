Return-Path: <linux-arm-msm+bounces-77485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD49BE0C37
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 23:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AB5D4E4107
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 21:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91542EBDD0;
	Wed, 15 Oct 2025 21:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="II9+KuIH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4212D7DDD;
	Wed, 15 Oct 2025 21:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760562704; cv=none; b=EO/vME3yA98cgnEnEYik0Ds0Lyf+WhJ0DOg83PZl/icCJWPzTNfiFUBtHEIVXaalczT1FTgr9YDh+3Po64bcRHkV2o1hVMAWKjA5AAAAZsQge9/hdXPTEpM0h/qRq8/Ze0f7kt9C9kKyDrspJVQDOL9STNacXOy39iyvc67U1Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760562704; c=relaxed/simple;
	bh=qBLSwv+yCCOqYdSP/9odJfd9AbbK2v4pcqe6JTmq4eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YpDpjw0xc3MYUW3dWNEvmf9vCfvXk94FmWO7sjiZ6PR+z4XyzNp7Bm3q2zd8cBF33eQatkW5kR1/NQLRmn+qVr/Qa5C6wxqzTYAEjrJvubygTmxDc+8djTzpIxsOQw1gG6u0n0HA/lCUD8lkSVCox4Gk5Z9irzJBz92OyD6xIac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=II9+KuIH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lU7P2fdQo33lU9CWhezw41R+YVngVYZZxsfcPjczaD8=; b=II9+KuIHljJ6JNDxMUJKU01/u3
	uxihvz7A22UHG+HrN8nFhiN08qiIE2YtWRxywh6a75ozBXd4Vw3LIgxhASL1ia9K6gG/GS+vhow8h
	RK362b8jZiT2G1M5x86ohZlL4jW0+caGkcN9BbcCHHUEZIAzIc5392OGlZ1ytEfoTDJo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v98mI-00B4sb-D1; Wed, 15 Oct 2025 23:11:22 +0200
Date: Wed, 15 Oct 2025 23:11:22 +0200
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
Subject: Re: [PATCH net-next 13/14] net: stmmac: provide PCS initialisation
 hook
Message-ID: <96842284-8d92-46b8-8b28-2b20755c3523@lunn.ch>
References: <aO-tbQCVu47R3izM@shell.armlinux.org.uk>
 <E1v92NE-0000000AmHd-15fv@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1v92NE-0000000AmHd-15fv@rmk-PC.armlinux.org.uk>

> +	/* Unimplemented PCS init (as indicated by stmmac_do_callback()
> +	 * perversely returning -EINVAL) is non-fatal.
> +	 */
> +	ret = stmmac_mac_pcs_init(priv);
> +	if (ret != -EINVAL)
> +		return ret;

Oh, that's ugly.

Looking back at

commit 42de047d60bc5d87e369c36115058b9dacc5683c
Author: Jose Abreu <Jose.Abreu@synopsys.com>
Date:   Mon Apr 16 16:08:12 2018 +0100

    net: stmmac: Switch stmmac_desc_ops to generic HW Interface Helpers

which added this, i don't actually see a user of the returned EINVAL.
EOPNOTSUPP would of been better. But changing it now will need quite a
bit of review work :-(

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

