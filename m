Return-Path: <linux-arm-msm+bounces-37469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F8A9C4008
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 14:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF48B1C21B49
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 13:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F63419E98A;
	Mon, 11 Nov 2024 13:59:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6BD19E826;
	Mon, 11 Nov 2024 13:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731333587; cv=none; b=UogAxzXCOc0ob1Drq42m8j6t6PWPILG3HikzexGUyeHiggx85ym7l0vm9SjV7TyuRIpbY/JlyrYLN5xJlp5gbSKB0QIOouzEb4Rh3Oi+Pe1alAqXama/lLrsKbFRILSMwRQOD8AHh7JrFq317HGXAEG/iL8tR/rdVi8JfGEiLiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731333587; c=relaxed/simple;
	bh=ls6xR7OPifllcfidwmSCJFTPyb+sk+NFmXo7wqIxFt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJ4tNnSdgOSMJcknfa5XirHjWj4BAq90DS8mA3+GIABGD41I5oJ6Y9VUTSVa7W+icbO5V9brWAEJuMOx4LwbRQVSKKopyV1O8WxfgLAbQCWj/2khg+5kIowGKZK3Vq4UJlVOP5uAeKBNCn3BImQvN7qNTmBWOOnFeIz9GUgl0+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 58C102010CF;
	Mon, 11 Nov 2024 14:50:35 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 52B662010C6;
	Mon, 11 Nov 2024 14:50:35 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 10FFE20326;
	Mon, 11 Nov 2024 14:50:35 +0100 (CET)
Date: Mon, 11 Nov 2024 14:50:35 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Simon Horman <horms@kernel.org>
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
Subject: Re: [PATCH v4 05/16] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
Message-ID: <ZzILq99H/Zj4I/6Q@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
 <20241105134206.GE4507@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105134206.GE4507@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Nov 05, 2024 at 01:42:06PM +0000, Simon Horman wrote:
> On Mon, Oct 28, 2024 at 09:24:47PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > Utilize a new helper function rgmii_clock().
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 11 +++--------
> >  1 file changed, 3 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> > index ec924c6c76c6..5080891c33e0 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
> > @@ -181,24 +181,19 @@ static void dwc_qos_remove(struct platform_device *pdev)
> >  static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
> >  {
> >  	struct tegra_eqos *eqos = priv;
> > -	unsigned long rate = 125000000;
> > +	long rate = 125000000;
> >  	bool needs_calibration = false;
> >  	u32 value;
> >  	int err;
> 
> Hi Jan,
> 
> As it seems that there will be another revision anyway,
> please update the above so that the local variable declarations
> are in reverse xmas tree order - longest line to shortest.
> 
> Likewise in s32_dwmac_probe() in the patch
> "net: stmmac: dwmac-s32: add basic NXP S32G/S32R glue driver".
> 

Hi Simon,
thanks for review, I will add those formating fixes in v5.

BR.
/Jan

