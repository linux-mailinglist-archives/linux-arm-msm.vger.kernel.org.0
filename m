Return-Path: <linux-arm-msm+bounces-38496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8109D3BC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 14:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D59DA2846D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:02:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25F071C4A14;
	Wed, 20 Nov 2024 13:00:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500701B0105;
	Wed, 20 Nov 2024 12:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732107601; cv=none; b=WNXKqC7oliJKZ+eMqc6GgzqR9z7udp4qEFIbq1nSFIQhFFWX0r9rYogaNAv6rucFZzCmqPisc+jXQ9uOqAUGzvbpdradCfpx0HPPo7gvCISEUenQIUoMwEiiRLUZlT82VqR/UTvwxnGhhSjtfr0kYtj/GgVVqFxafPpQ25Cdgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732107601; c=relaxed/simple;
	bh=/n7gnJWEqYQ37oWV1G2OFU/d148o/DHtkgUWto8DNjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rq/Iil2sSgl+7k8VcZyEQtOlEWNIeBvMfpCuH2bAnco35nkIYQ0Hu5n+IehmRdAieGHS2Kc8lJiijxoDRTi4q6k9fH8ddUfrMJqIo+X/6bG3QJgbVsR/hW8n4u+TcFkiVZ9XietTkDflUOlIgomUrlhCbjBWNTxU3D8EtVQD9RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id BC7771A01D3;
	Wed, 20 Nov 2024 13:59:56 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AF1A01A01C6;
	Wed, 20 Nov 2024 13:59:56 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 6EBB3202E4;
	Wed, 20 Nov 2024 13:59:56 +0100 (CET)
Date: Wed, 20 Nov 2024 13:59:56 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Subject: Re: [PATCH v5 16/16] net: stmmac: platform: Fix PTP clock rate
 reading
Message-ID: <Zz3dTNCb2/I0iDXV@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
 <ZzzGO5zgDvIK6JJ_@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzzGO5zgDvIK6JJ_@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Nov 19, 2024 at 05:09:15PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 19, 2024 at 04:00:22PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The stmmac driver supports many vendors SoCs using Synopsys-licensed
> > Ethernet controller IP. Most of these vendors reuse the stmmac_platform
> > codebase, which has a potential PTP clock initialization issue.
> > The PTP clock rate reading might require ungating what is not provided.
> > 
> > Fix the PTP clock initialization by enabling it immediately.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > index b1e4df1a86a0..db3e8ef4fc3a 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> > @@ -632,7 +632,7 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >  	clk_prepare_enable(plat->pclk);
> >  
> >  	/* Fall-back to main clock in case of no PTP ref is passed */
> > -	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
> > +	plat->clk_ptp_ref = devm_clk_get_enabled(&pdev->dev, "ptp_ref");
> >  	if (IS_ERR(plat->clk_ptp_ref)) {
> >  		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
> >  		plat->clk_ptp_ref = NULL;
> 
> Looking at where the driver makes use of clk_ptp_ref, it currently
> prepares and enables this clock via stmmac_open(), disables and
> unprepares via stmmac_release().
> 
> There could be a platform where this is being used as a power saving
> measure, and replacing devm_clk_get() with devm_clk_get_enabled() will
> defeat that.
> 
> I would suggest that if you need the clock to be enabled in order to
> get its rate, then the call to clk_get_rate() should have the
> enable/disable around it to allow these other sites to work as they
> have done.
> 
> Alternatively, we may take the view that the power saving is not
> necessary, or stopping the clock is not a good idea (loss of time
> in the 1588 block?) so the above changed would be sensible but only
> if the clk_prepare_enable() and clk_disable_unprepare() calls on
> this particular clock are also removed.
> 
> I can't say which is the correct way forward.
> 

For me it looks more conservative way to use first option = enclose
the clk_get_rate() with clk_prepare_enable() and clk_disable_unprepare()
as this don't change the PTP clock status for other glue drivers.

BR.
/Jan

