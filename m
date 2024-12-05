Return-Path: <linux-arm-msm+bounces-40629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F86F9E617C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 00:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD7B188459F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 23:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3E31CBE94;
	Thu,  5 Dec 2024 23:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mHVOvvyQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16DB1AC459;
	Thu,  5 Dec 2024 23:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733442360; cv=none; b=d0aqcRtjpNBreLdJCgPDFxEwtvkxC//uo5rtKxxWPaBLrXundJePUi6StpwPfJqf5QSUkga5+Xgqhrz4mIgmmsxMsXyzb4KFF2FlS4G0r0iMcTFqMlYnX467DrG3kxz68xl5c9Az5HYpM3NwQCpFPzERLIz6l543qMrk9Wf77lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733442360; c=relaxed/simple;
	bh=jOvo0RrpW8+5BNR9bNL0qNs7at2KugNqvNpf5VPea9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BOMsrqYjRdUsUklOPTK8AQeWpRrXrt0ho0wqAcmLjIEoxrbhg4iQUSG/zPLMM3+aREirUqSXbqNAy3gmFMiAL/CpTtoutXPkbtf1EQmaLufA/5mFbPIsMSc/0Cmb2zGSDXShgEj6haaIwSFABfB8Z3MK0yTOzFNdutnQ3br/Pkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mHVOvvyQ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nFvZvTOTWkFAKfzfMvGEvGDyWsbLuq+WNKubNabn3ak=; b=mHVOvvyQgCyWfgoPAr3LiGnfz4
	fLb6P1bbHxqjaEFTW1q4clehusxop5BBrefUE1xXna2wpS1cyIHo9ISILDLLanxDO/rMnVJsnER4D
	FXyxm4hEtxxfvWN3tCUFXhvX+UeVGFfhWvMwv8iSgf5nZ9FEGh/TwpaBb3XKo/hzzVtA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tJLXB-00FMhW-Qp; Fri, 06 Dec 2024 00:45:25 +0100
Date: Fri, 6 Dec 2024 00:45:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jan Petrous <jan.petrous@oss.nxp.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
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
Message-ID: <2706b154-737e-467c-8ea4-c9356bdc0720@lunn.ch>
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

b4 is pretty good at handling this, it will find such tags and add
them to your patchset if you are using b4 to manage it.

	Andrew

