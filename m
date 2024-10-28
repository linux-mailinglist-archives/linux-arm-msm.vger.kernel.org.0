Return-Path: <linux-arm-msm+bounces-36209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1E79B3B47
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E04EB21EB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:22:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30B11DFE06;
	Mon, 28 Oct 2024 20:22:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303351DEFCF;
	Mon, 28 Oct 2024 20:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730146933; cv=none; b=F7IqwNLnQMvphvQyJYUqO3sL5tzVD3RoASDgulr6Y3GJM+ps5hNpHQ3Ap36WXUaUVUOGrqE4jC+cqA3Qq+P+rsP/BKzym/9qcLFobs/9OQAKtIgjJaiJKYgNLmhVlIQRPu61v2Eho72BCPv2kofXrUopS96xKIlMFoYTL+9ANAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730146933; c=relaxed/simple;
	bh=CHCbmADrldFg8+CkaQwy/6aOCUZ1BikaPLszOv7Ix0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9EPgQ8t+zP7A57K7i8Xgki88EOHL727THuAe3+TSaimbipMRu7/ge/1pIZC1+sEIlniVuhtNcultLDcNuw+iFm58BwVATdTT4L6cTI721ujvujjm/aqpan9+PELZuiDkhpYTQMh+gRKbJGR5zv5xFGpr7JnYbywss+oX0cYoqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2726D1A02CA;
	Mon, 28 Oct 2024 21:12:33 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0F99D1A12AE;
	Mon, 28 Oct 2024 21:12:33 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 498682039A;
	Mon, 28 Oct 2024 21:12:32 +0100 (CET)
Date: Mon, 28 Oct 2024 21:12:32 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
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
	NXP S32 Linux Team <s32@nxp.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH v3 04/16] net: phy: Add helper for mapping RGMII link
 speed to clock rate
Message-ID: <Zx/wMO0YjJ+QK7qT@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
 <20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com>
 <4686019c-f6f1-4248-9555-c736813417b7@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4686019c-f6f1-4248-9555-c736813417b7@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Oct 14, 2024 at 03:40:51PM +0200, Andrew Lunn wrote:
> On Sun, Oct 13, 2024 at 11:27:39PM +0200, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The helper rgmii_clock() implemented Russel's hint during stmmac
> > glue driver review:
> > 
> >   > We seem to have multiple cases of very similar logic in lots of stmmac
> >   > platform drivers, and I think it's about time we said no more to this.
> >   > So, what I think we should do is as follows:
> >   >
> >   > add the following helper - either in stmmac, or more generically
> >   > (phylib? - in which case its name will need changing.)
> >   >
> >   > static long stmmac_get_rgmii_clock(int speed)
> >   > {
> >   >        switch (speed) {
> >   >        case SPEED_10:
> >   >                return 2500000;
> >   >
> >   >        case SPEED_100:
> >   >                return 25000000;
> >   >
> >   >        case SPEED_1000:
> >   >                return 125000000;
> >   >
> >   >        default:
> >   >                return -ENVAL;
> >   >        }
> >   > }
> >   >
> >   > Then, this can become:
> >   >
> >   >        long tx_clk_rate;
> >   >
> >   >        ...
> >   >
> >   >        tx_clk_rate = stmmac_get_rgmii_clock(speed);
> >   >        if (tx_clk_rate < 0) {
> >   >                dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> >   >                return;
> >   >        }
> >   >
> >   >        ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
> > 
> > Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> But of an unusual commit message, but it does explain the "Why?".

I will reformulate description in v4.

> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 

Thanks.

> >  
> > +/**
> > + * rgmii_clock - map link speed to the clock rate
> > + * @speed: link speed value
> > + *
> > + * Description: maps RGMII supported link speeds
> > + * into the clock rates.
> > + */
> 
> A Returns: line would be nice. 

 will add it in v4.

Thanks
/Jan

