Return-Path: <linux-arm-msm+bounces-38985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1BF9D787F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 23:18:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69A5A282041
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 22:18:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 679C5169397;
	Sun, 24 Nov 2024 22:18:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9243B15FD13;
	Sun, 24 Nov 2024 22:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732486731; cv=none; b=E7GQaHQ8MIoxokHf+SsbTW7RyOApNSXFy4zFuqlLPqGztx+2QoflCZETXg8HCwqGzfluX/f+oJFsywMgD7n+Pk/MzkZskO0V6dgcEsyGRcUjpXD3tf9ZXQaW6yzHnZyF2BToHX6YBfsXN0wJzWYOjE7LyPRx2MdVimxq8JDtWTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732486731; c=relaxed/simple;
	bh=u7kQYVP2q/NUDySFecDk5xUiUxBqNf/gjfU1dgYlhRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pZ9L3Aweve03gcBS76NI0z5At+kcKeAS56v29pnvIQ/7ib/Z1fvIo5aCx5rtqxrxhZMhP2+dkJeLhDXlNYLsJecNTFcSgMwO0I/ei78Kr9Y6yzyheAaaMLTssCJzmnZSgQjj1AGurMxmjkn2JJZVBuj/zmZBnjfCnYRGdvTeXXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D40F01A07D4;
	Sun, 24 Nov 2024 23:18:40 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id C192A1A07F5;
	Sun, 24 Nov 2024 23:18:40 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 722BA203B1;
	Sun, 24 Nov 2024 23:18:39 +0100 (CET)
Date: Sun, 24 Nov 2024 23:18:40 +0100
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
Subject: Re: [PATCH v5 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
Message-ID: <Z0OmQI+4sEbA0lFs@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-14-7dcc90fcffef@oss.nxp.com>
 <ZzzDu0tcyixAZ8l1@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzzDu0tcyixAZ8l1@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Nov 19, 2024 at 04:58:35PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 19, 2024 at 04:00:20PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > NXP S32G2xx/S32G3xx and S32R45 are automotive grade SoCs
> > that integrate one or two Synopsys DWMAC 5.10/5.20 IPs.
> > 
> > The basic driver supports only RGMII interface.
> > 
> > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> 
> One thing that stands out to me in this is the duplication of the PHY
> interface mode. I would much prefer if we didn't end up with multiple
> copies, but instead made use of the one already in plat_stmmacenet_data
> maybe by storing a its pointer in struct s32_priv_data?

I missed the struct plat_stmmacenet_data's phy_interface member. I
switch the duplicate member intf_mode in struct s32_priv_data to
pointer.

> 
> > ---
> >  drivers/net/ethernet/stmicro/stmmac/Kconfig     |  12 ++
> >  drivers/net/ethernet/stmicro/stmmac/Makefile    |   1 +
> >  drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 204 ++++++++++++++++++++++++
> >  3 files changed, 217 insertions(+)
> > 
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > index 05cc07b8f48c..a6579377bedb 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
> > @@ -154,6 +154,18 @@ config DWMAC_RZN1
> >  	  the stmmac device driver. This support can make use of a custom MII
> >  	  converter PCS device.
> >  
> > +config DWMAC_S32
> > +	tristate "NXP S32G/S32R GMAC support"
> > +	default ARCH_S32
> > +	depends on OF && (ARCH_S32 || COMPILE_TEST)
> > +	help
> > +	  Support for ethernet controller on NXP S32CC SOCs.
> > +
> > +	  This selects NXP SoC glue layer support for the stmmac
> > +	  device driver. This driver is used for the S32CC series
> > +	  SOCs GMAC ethernet controller, ie. S32G2xx, S32G3xx and
> > +	  S32R45.
> > +
> >  config DWMAC_SOCFPGA
> >  	tristate "SOCFPGA dwmac support"
> >  	default ARCH_INTEL_SOCFPGA
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > index c2f0e91f6bf8..1e87e2652c82 100644
> > --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> > +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> > @@ -22,6 +22,7 @@ obj-$(CONFIG_DWMAC_MESON)	+= dwmac-meson.o dwmac-meson8b.o
> >  obj-$(CONFIG_DWMAC_QCOM_ETHQOS)	+= dwmac-qcom-ethqos.o
> >  obj-$(CONFIG_DWMAC_ROCKCHIP)	+= dwmac-rk.o
> >  obj-$(CONFIG_DWMAC_RZN1)	+= dwmac-rzn1.o
> > +obj-$(CONFIG_DWMAC_S32)		+= dwmac-s32.o
> >  obj-$(CONFIG_DWMAC_SOCFPGA)	+= dwmac-altr-socfpga.o
> >  obj-$(CONFIG_DWMAC_STARFIVE)	+= dwmac-starfive.o
> >  obj-$(CONFIG_DWMAC_STI)		+= dwmac-sti.o
> > diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > new file mode 100644
> > index 000000000000..9af7cd093100
> > --- /dev/null
> > +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> > @@ -0,0 +1,204 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * NXP S32G/R GMAC glue layer
> > + *
> > + * Copyright 2019-2024 NXP
> > + *
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/device.h>
> > +#include <linux/ethtool.h>
> > +#include <linux/io.h>
> > +#include <linux/module.h>
> > +#include <linux/of_mdio.h>
> > +#include <linux/of_address.h>
> > +#include <linux/phy.h>
> > +#include <linux/phylink.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/stmmac.h>
> > +
> > +#include "stmmac_platform.h"
> > +
> > +#define GMAC_TX_RATE_125M	125000000	/* 125MHz */
> > +
> > +/* SoC PHY interface control register */
> > +#define PHY_INTF_SEL_MII	0x00
> > +#define PHY_INTF_SEL_SGMII	0x01
> > +#define PHY_INTF_SEL_RGMII	0x02
> > +#define PHY_INTF_SEL_RMII	0x08
> > +
> > +struct s32_priv_data {
> > +	void __iomem *ioaddr;
> > +	void __iomem *ctrl_sts;
> > +	struct device *dev;
> > +	phy_interface_t intf_mode;
> > +	struct clk *tx_clk;
> > +	struct clk *rx_clk;
> > +};
> > +
> > +static int s32_gmac_write_phy_intf_select(struct s32_priv_data *gmac)
> > +{
> > +	u32 intf_sel;
> > +
> > +	switch (gmac->intf_mode) {
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		intf_sel = PHY_INTF_SEL_RGMII;
> > +		break;
> > +	default:
> > +		dev_err(gmac->dev, "Unsupported PHY interface: %s\n",
> > +			phy_modes(gmac->intf_mode));
> > +		return -EINVAL;
> > +	}
> 
> This can be simplfied to:
> 
> 	if (!phy_interface_mode_is_rgmii(...)) {
> 		dev_err(gmac->dev, "Unsupported PHY interface: %s\n",
> 			phy_modes(...));
> 		return -EINVAL;
> 	}
> 
> Also, would it not be better to validate this in s32_dwmac_probe()?
> 

Thanks, I move the interface mode to s32_dwmac_probe() in v6.

BR.
/Jan

