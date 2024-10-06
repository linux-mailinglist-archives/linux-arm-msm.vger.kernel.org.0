Return-Path: <linux-arm-msm+bounces-33259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5231E9920B3
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:30:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13E8A281C25
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:30:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E08249F9;
	Sun,  6 Oct 2024 19:30:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F46A189BA0;
	Sun,  6 Oct 2024 19:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728243036; cv=none; b=O0LlHbyY3PiFJvVhtwP83c5E8HsHq5t0dui0zNfxEFbYitkF6o9guBrxkT7qtchMHL71qskhheCzXEbW2KY5SQFlCW0jJZAOr7oif4BNuNZ/d4VbMj5/MLTw7YJZ/DcJru2KtQD1HaMud71RnObBrb8C7vAeMm8V9HHLGkJ86xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728243036; c=relaxed/simple;
	bh=kCwCv7I9VkWoWNUuK0/3ofNvIi0uygQdxbg3ADO0Qys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ETP0jlakcDk2Q7TPEAz+PV2iysz2uBr+Fbz1zel8MNffy/rtjNnNW255x6c2rBvb0HNDfFSGMnP9usRHD4ZGv3/493Wc3YLOAkDQhWSP6ISjtYInFgnqnQigmgc9dnP+svCmTCBmEULPTtqg5ZMLOUydlz4tyiKFU99XZUf/OnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 102E41A1065;
	Sun,  6 Oct 2024 21:30:33 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 02E881A0FEC;
	Sun,  6 Oct 2024 21:30:33 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id C9F4C202E3;
	Sun,  6 Oct 2024 21:30:33 +0200 (CEST)
Date: Sun, 6 Oct 2024 21:30:32 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Simon Horman <horms@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	dl-S32 <S32@nxp.com>
Subject: Re: [PATCH v2 4/7] net: phy: add helper for mapping RGMII link speed
 to clock rate
Message-ID: <ZwLlWN3dlEROXjQy@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB85062E3A66BA92EF8D996513E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <20240819141541.GE11472@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819141541.GE11472@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Mon, Aug 19, 2024 at 03:15:41PM +0100, Simon Horman wrote:
> On Sun, Aug 18, 2024 at 09:50:46PM +0000, Jan Petrous (OSS) wrote:
> > The helper rgmii_clock() implemented Russel's hint during stmmac
> > glue driver review:
> > 
> > ---
> > We seem to have multiple cases of very similar logic in lots of stmmac
> > platform drivers, and I think it's about time we said no more to this.
> > So, what I think we should do is as follows:
> > 
> > add the following helper - either in stmmac, or more generically
> > (phylib? - in which case its name will need changing.)
> > 
> > static long stmmac_get_rgmii_clock(int speed)
> > {
> > 	switch (speed) {
> > 	case SPEED_10:
> > 		return 2500000;
> > 
> > 	case SPEED_100:
> > 		return 25000000;
> > 
> > 	case SPEED_1000:
> > 		return 125000000;
> > 
> > 	default:
> > 		return -ENVAL;
> > 	}
> > }
> > 
> > Then, this can become:
> > 
> > 	long tx_clk_rate;
> > 
> > 	...
> > 
> > 	tx_clk_rate = stmmac_get_rgmii_clock(speed);
> > 	if (tx_clk_rate < 0) {
> > 		dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
> > 		return;
> > 	}
> > 
> > 	ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
> > ---
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  include/linux/phy.h | 21 +++++++++++++++++++++
> >  1 file changed, 21 insertions(+)
> > 
> > diff --git a/include/linux/phy.h b/include/linux/phy.h
> > index 6b7d40d49129..bb797364d91c 100644
> > --- a/include/linux/phy.h
> > +++ b/include/linux/phy.h
> > @@ -298,6 +298,27 @@ static inline const char *phy_modes(phy_interface_t interface)
> >  	}
> >  }
> >  
> > +/**
> > + * rgmi_clock - map link speed to the clock rate
> 
> nit: rgmii_clock
> 
>      Flagged by ./scripts/kernel-doc -none
> 

Thanks. Fixed in v3.

BR.
/Jan

