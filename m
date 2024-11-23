Return-Path: <linux-arm-msm+bounces-38902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7E49D67E1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 07:54:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFA06281AAC
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2024 06:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F5DB165F01;
	Sat, 23 Nov 2024 06:54:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A9D13BC2F;
	Sat, 23 Nov 2024 06:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732344865; cv=none; b=EZ6aMvaZ+zmvCzrTDokx9kjHOm7qHr1w9L2+oDaIKwVP3ODdVqEPEROJj/yUlK8+h2YU/JpzqSzWuhFTXuU5boblGRjes4HCJ4w2SjGC7hLWrC3ROFY/JDUlFss1bMGnZn0uh4FdbI1fFG8IqlaYCmzYm+Yl/1dcDwseUUvjnNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732344865; c=relaxed/simple;
	bh=hG1Lmguo6Ylsxt9Mwo1Nm5xmwIWSme4uTQPZmWOWCIw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sn3qD0vt9zz1jykrORLeIoULWpPlxqD97ohpCOZ9s8nYiznCwWIyYtjbvSzR1220FILWNqNIQnfL5KEci+D199u1IdAnuazYGCYWQHWRAXwFmxNYYoTRNDvSE55cEKSm+ibz7GbK45aAG+jzumasWk5koAVy54dzkCjgVmQ/61w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8F6B11A137C;
	Sat, 23 Nov 2024 07:54:16 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8194C1A0273;
	Sat, 23 Nov 2024 07:54:16 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D251202AF;
	Sat, 23 Nov 2024 07:54:16 +0100 (CET)
Date: Sat, 23 Nov 2024 07:54:16 +0100
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
Subject: Re: [PATCH v5 07/16] net: dwmac-intel-plat: Use helper rgmii_clock
Message-ID: <Z0F8GL2NnYmUuE/S@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-7-7dcc90fcffef@oss.nxp.com>
 <ZzzAe8s2UgPYHnkv@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzzAe8s2UgPYHnkv@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Nov 19, 2024 at 04:44:43PM +0000, Russell King (Oracle) wrote:
> On Tue, Nov 19, 2024 at 04:00:13PM +0100, Jan Petrous via B4 Relay wrote:
> > @@ -31,27 +31,15 @@ struct intel_dwmac_data {
> >  static void kmb_eth_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
> >  {
> >  	struct intel_dwmac *dwmac = priv;
> > -	unsigned long rate;
> > +	long rate;
> >  	int ret;
> 
> So the following becomes:
> 
> >  
> >  	rate = clk_get_rate(dwmac->tx_clk);
> >  
> > +	rate = rgmii_clock(speed);
> > +	if (rate < 0) {
> >  		dev_err(dwmac->dev, "Invalid speed\n");
> > +		return;
> >  	}
> 
> Now that I've removed the deleted lines, we can see that the
> clk_get_rate() call there is now redundant. Please remove in
> this change.

Funny I didn't notice that, thanks. I will remove it in v6.

Interesting the redundant clk_get_rate() is there from v5.10.0.
I hope that there was no reason for the clock call, like any platform
discrepancy requiring reading the clock before setting.

BTW, I also removed Reviewed-by: Andrew as the patch was changed.

BR.
/Jan

