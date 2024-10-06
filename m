Return-Path: <linux-arm-msm+bounces-33268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2FF9920DF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 21:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6BCF1C20A02
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Oct 2024 19:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A865818B482;
	Sun,  6 Oct 2024 19:47:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E359188907;
	Sun,  6 Oct 2024 19:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728244022; cv=none; b=ksnA7SQ+Po30Y58UPjOjdwlGh/u33OJXeBQ8f/sGHil7IZjkO/NLtZsEzhRHdrZAWIbMCWmel5TK3l6si5Ax9kpCiAxLKlqyyXEetmN2jVgMvRZKaUujnMJ1/nvKdW1Sbd7r3YXIoUnpXYah9BVUo0zAngVbZ681vG+uJ3UpktY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728244022; c=relaxed/simple;
	bh=/5+qwFumjf/F5w49XogsExrwXrqnypx6YvGQF3Zl1Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYBKbUghKqA5Tlyy/rW/4JTMzm4FLNgcOPbR+CgUNfnXHR1SfR9aBJDwZLCGVN1nc3aXMSIAoJlzXjVoROrc1z+zw1rpbXH7YGEzGW9DO8jZeREC5a6hZFCc6eWWutUycI3ahtZXBzRkl6egsHsvVbngIi6dh9N7RWXoz0Ooui0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B5DC1A0B7C;
	Sun,  6 Oct 2024 21:46:59 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6486A1A074D;
	Sun,  6 Oct 2024 21:46:59 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 37236202E3;
	Sun,  6 Oct 2024 21:47:00 +0200 (CEST)
Date: Sun, 6 Oct 2024 21:46:59 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Jacob Keller <jacob.e.keller@intel.com>
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
Subject: Re: [PATCH v2 5/7] net: stmmac: dwmac-s32cc: add basic NXP S32G/S32R
 glue driver
Message-ID: <ZwLpMylhr/mHgV3Y@lsv051416.swis.nl-cdc01.nxp.com>
References: <AM9PR04MB8506DECD381225ACFB311329E2832@AM9PR04MB8506.eurprd04.prod.outlook.com>
 <0104f251-f032-4082-835f-01ca2279c1b1@intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0104f251-f032-4082-835f-01ca2279c1b1@intel.com>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Aug 20, 2024 at 02:15:46PM -0700, Jacob Keller wrote:
> 
> 
> On 8/18/2024 2:50 PM, Jan Petrous (OSS) wrote:
> > NXP S32G2xx/S32G3xx and S32R45 are automotive grade SoCs
> > that integrate one or two Synopsys DWMAC 5.10/5.20 IPs.
> > 
> > The basic driver supports only RGMII interface.
> > 
> 
> You mention that it only supports RGMII.. so...
> 
> > +static int s32cc_gmac_write_phy_intf_select(struct s32cc_priv_data *gmac)
> > +{
> > +	u32 intf_sel;
> > +
> > +	switch (gmac->intf_mode) {
> > +	case PHY_INTERFACE_MODE_SGMII:
> > +		intf_sel = PHY_INTF_SEL_SGMII;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RGMII:
> > +	case PHY_INTERFACE_MODE_RGMII_ID:
> > +	case PHY_INTERFACE_MODE_RGMII_TXID:
> > +	case PHY_INTERFACE_MODE_RGMII_RXID:
> > +		intf_sel = PHY_INTF_SEL_RGMII;
> > +		break;
> > +	case PHY_INTERFACE_MODE_RMII:
> > +		intf_sel = PHY_INTF_SEL_RMII;
> > +		break;
> > +	case PHY_INTERFACE_MODE_MII:
> > +		intf_sel = PHY_INTF_SEL_MII;
> > +		break;
> > +	default:
> > +		dev_err(gmac->dev, "Unsupported PHY interface: %s\n",
> > +			phy_modes(gmac->intf_mode));
> > +		return -EINVAL;
> > +	}
> > +
> > +	writel(intf_sel, gmac->ctrl_sts);
> > +
> > +	dev_dbg(gmac->dev, "PHY mode set to %s\n", phy_modes(gmac->intf_mode));
> > +
> 
> Why does this code seem to support others?
> 
> Is that support just not yet fully baked?

Exactly. I have more functionality already implemented, but I started
from very basic driver to simplify review process.

I will remove all occurence of other interfaces but RGMII in v3.

BR.
/Jan

