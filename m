Return-Path: <linux-arm-msm+bounces-40592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E134F9E5C75
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:02:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24E381882C90
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80710221475;
	Thu,  5 Dec 2024 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="ksEiv5H6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D129B21D586;
	Thu,  5 Dec 2024 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733418117; cv=none; b=k76E7cOObn5v0S3XZpL03IE5mwjYzqhBkgFwyKuRH0xlxfxcTEBDyIvYRU1DxiyObf8k86pYGmEHzpo6l38RBPN7r5iBShYzo3sxpUWtHozvLx8zCjX/KMnV85wArjtqN+lY5Hm91RL8gi5fX1LBH6CXqYZePCJ/+k1xw+vtHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733418117; c=relaxed/simple;
	bh=VLPu0veF1Y6ejdAlI9VoNPhLNceajAZiJdEd+I/XxdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AWZ1JNTPb9sXcE2xuhecQ22+DDbmFIg9FwpNWmEw67lq6zNlftaEfwFKiy6cNEgMNZzjKOzrAhxN7KGzhXIeXHCmjAmbzSt8ORFApdDsg2Js9nZ1pqjc9QduGc1mIMAPYbk6R0w1oEtQ1tG9cXh7IS/q229s0ADohYuAJq4bDFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=ksEiv5H6; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p5Iv8mfxtmO9Druz+kkxkhm6XzbPAF2CVdJuZPljSLQ=; b=ksEiv5H68mvOWbi92UT+mbNnPd
	DiReXQWSRrcoZ58Trb1WbGFudxkZGWdZlKJdS4Lb70jm5B3faZfpTS6yZWSwiqqVnC+J4ItKPPjmh
	mpmlhnHOOibAknUuMkSkfyXBbuOn+4RyBFOvBs6H08qE0Ygf2QONsbiYWrbg/+zkCLFMZe8YfcE1i
	JYIsVzWT6XaZME6vhKqlKcXAtEWJYemMxlIRhyOVkDhCSuHlXIl7Jy8un6ry5tBFcXOft2vomZvqe
	lCdNY2Oknzr9gLUV57jBrO/vxpPNrgCoQI/AXvpscQ+QQ+mhT9/4rDhUfLcXVsRJtQfjxXh8sMGQ5
	NBcB1HWQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42758)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tJFEG-0005Er-1R;
	Thu, 05 Dec 2024 17:01:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tJFEC-0006i8-04;
	Thu, 05 Dec 2024 17:01:24 +0000
Date: Thu, 5 Dec 2024 17:01:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jan Petrous <jan.petrous@oss.nxp.com>
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, 0x1207@gmail.com,
	fancer.lancer@gmail.com, Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v8 01/15] net: stmmac: Fix CSR divider comment
Message-ID: <Z1HcYyNG4FfnN84s@shell.armlinux.org.uk>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
 <20241205-upstream_s32cc_gmac-v8-1-ec1d180df815@oss.nxp.com>
 <Z1HaB6hT0QX4Jlyx@shell.armlinux.org.uk>
 <Z1Ha+me4+hbOj9JO@lsv051416.swis.nl-cdc01.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z1Ha+me4+hbOj9JO@lsv051416.swis.nl-cdc01.nxp.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Dec 05, 2024 at 05:55:22PM +0100, Jan Petrous wrote:
> On Thu, Dec 05, 2024 at 04:51:19PM +0000, Russell King (Oracle) wrote:
> > On Thu, Dec 05, 2024 at 05:42:58PM +0100, Jan Petrous via B4 Relay wrote:
> > > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > > 
> > > The comment in declaration of STMMAC_CSR_250_300M
> > > incorrectly describes the constant as '/* MDC = clk_scr_i/122 */'
> > > but the DWC Ether QOS Handbook version 5.20a says it is
> > > CSR clock/124.
> > > 
> > > Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
> > > Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
> > 
> > I gave my reviewed-by for this patch in the previous posting, but you
> > haven't included it.
> > 
> > Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Hi Russell,
> sorry for that, I missed it. Should I resend the v8 series?

Patchwork will add it if this series is merged, so there's no immediate
need to resend. However, please update your series with it in case there
is another reason to send another version.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

