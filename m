Return-Path: <linux-arm-msm+bounces-36561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3065C9B7D25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 15:43:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEFB11F22A28
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2024 14:43:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DF471A08B6;
	Thu, 31 Oct 2024 14:43:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C04742AA5;
	Thu, 31 Oct 2024 14:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730385804; cv=none; b=F6bX11ipumbPIWX7JKXCgcz6DUwn3d5I0rOIcuy2V0pR5m2bew5qr5qm9ZaV+qD1nhnH+Aj7ZuWfb39JTulLRkKd0aGXjUj4jDe3YYHk3jjCo7B78QjrIHPDc+g56B+dexLo7NFFzaPDd2v5wKnDifODFRslAsilUqdW5s3L8uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730385804; c=relaxed/simple;
	bh=+fEjFkpn0K/hzvDNkuVd7TQd5eDuuY7AlrXCWDM26JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0UJ8CJWpFCRYOIyX3RKFEXmGkWOxQhFAsjLkG20clXiz2rGa+xhcMJsdwyHY9sYC2sjvw3GfPE0YwTRLzr5MuU3Lx0WCwjM5IvMCTBs6Pn87R96Ihu/RR/7urNA/WJGjxfR6Xttxff8tk4eqm91NYxpeoHdpkG5Hklp/hAcjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4DCAB20187D;
	Thu, 31 Oct 2024 15:43:20 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 1ED58201879;
	Thu, 31 Oct 2024 15:43:20 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6181020579;
	Thu, 31 Oct 2024 15:43:13 +0100 (CET)
Date: Thu, 31 Oct 2024 15:43:13 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Minda Chen <minda.chen@starfivetech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Iyappan Subramanian <iyappan@os.amperecomputing.com>,
	Keyur Chudgar <keyur@os.amperecomputing.com>,
	Quan Nguyen <quan@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v4 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
Message-ID: <ZyOXgdqUgg2qlCah@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
 <xanb4j56u2rjwpkyj5gwh6y6t36gpvawph62jw72ksh7jximhr@cjwlp7wsxgp6>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xanb4j56u2rjwpkyj5gwh6y6t36gpvawph62jw72ksh7jximhr@cjwlp7wsxgp6>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Oct 29, 2024 at 08:13:40AM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 28, 2024 at 09:24:56PM +0100, Jan Petrous (OSS) wrote:
> > +	plat->init = s32_gmac_init;
> > +	plat->exit = s32_gmac_exit;
> > +	plat->fix_mac_speed = s32_fix_mac_speed;
> > +
> > +	plat->bsp_priv = gmac;
> > +
> > +	return stmmac_pltfr_probe(pdev, plat, &res);
> > +}
> > +
> > +static const struct of_device_id s32_dwmac_match[] = {
> > +	{ .compatible = "nxp,s32g2-dwmac" },
> > +	{ .compatible = "nxp,s32g3-dwmac" },
> > +	{ .compatible = "nxp,s32r-dwmac" },
> 
> Why do you need three same entries?
> 

We have three different SoCs and in v3 review you told me
to return all back:
https://patchwork.kernel.org/comment/26067257/

I'm not sure if we need s32g3 variant, it should depend on
changes between s32g2 and s32g3, but s32r will definitely
carry the interface max-speed value when SGMII support will
be added.

BR.
/Jan

