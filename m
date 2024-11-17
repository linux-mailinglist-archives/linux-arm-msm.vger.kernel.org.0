Return-Path: <linux-arm-msm+bounces-38129-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F13C9D0485
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 16:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFE531F21C5D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Nov 2024 15:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE661CB51F;
	Sun, 17 Nov 2024 15:39:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AD7CA64;
	Sun, 17 Nov 2024 15:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731857955; cv=none; b=OU2fpQloBxerJjvh7W2SlZQln96/3r1XJEBGZl0b9NbvynbkqJoIR2PiCXkXaEqrSCA2J2R35DG2YXUbuzWtlRN/ySDkPDbqSqQrEeeWmbjcBCcBh/WNHTBLqZ+nyryM/NsrqoH3wB/8SYqRKZpURNm705tE11hRPI+EoQdkm38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731857955; c=relaxed/simple;
	bh=vfJw0C9mvbKaRPxQRr3ddRzBrn5U8By/saKIXyh4gys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W0JjdrCOyY5NMfxW2uBorss6KLzpbKFxzMTU3bi2+yv0K8ftgg1urvOtWK6rHxFev84brz+f6DfgO6P60Qj+1B54EHh/ixwkeLxPao0pcXxyRnOjBxO05/RbcAbLERNHbhLVmYypkEDLHsD5k7S6DRhMwgBiSRy4jXHDD5mx0Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 604521A033D;
	Sun, 17 Nov 2024 16:39:05 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5302A1A0018;
	Sun, 17 Nov 2024 16:39:05 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 0CBCC203CE;
	Sun, 17 Nov 2024 16:39:05 +0100 (CET)
Date: Sun, 17 Nov 2024 16:39:05 +0100
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
	Andrei Botila <andrei.botila@nxp.org>,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH v4 16/16] net: stmmac: dwmac-s32: Read PTP clock rate
 when ready
Message-ID: <ZzoOGdlbQXQVxPkv@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-16-03618f10e3e2@oss.nxp.com>
 <9154cc5f-a330-4f6d-b161-827e64231e35@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9154cc5f-a330-4f6d-b161-827e64231e35@lunn.ch>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Oct 29, 2024 at 01:18:43PM +0100, Andrew Lunn wrote:
> On Mon, Oct 28, 2024 at 09:24:58PM +0100, Jan Petrous via B4 Relay wrote:
> > From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> > 
> > The PTP clock is read by stmmac_platform during DT parse.
> > On S32G/R the clock is not ready and returns 0. Postpone
> > reading of the clock on PTP init.
> 
> This needs more explanation as to why this is a feature, not a bug,
> for the PTP clock.
> 

Thanks for comment. I did a homework and found out the root cause is
using PTP clocks before they are properly enabled. As I understand,
the clocks, especially the composite variant, require preparation and/or
enabling them, what is not managed correctly for PTP clocks when
stmmac_platform is used. In this case, the PTP clock value is read this way:

   stmmac_probe_config_dt:
   // https://github.com/torvalds/linux/blob/4a5df37964673effcd9f84041f7423206a5ae5f2/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c#L634

	/* Fall-back to main clock in case of no PTP ref is passed */
	plat->clk_ptp_ref = devm_clk_get(&pdev->dev, "ptp_ref");
	if (IS_ERR(plat->clk_ptp_ref)) {
		plat->clk_ptp_rate = clk_get_rate(plat->stmmac_clk);
		plat->clk_ptp_ref = NULL;
		dev_info(&pdev->dev, "PTP uses main clock\n");
	} else {
		plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
	}

If I change getter to enabled getter:
	plat->clk_ptp_ref = devm_clk_get_enabled(&pdev->dev, "ptp_ref");

The driver got valid rate and the patch is not needed anymore.

So, if I didn't miss something, it seems like I have to replace the current
patch with one fixing clk getter.

BR.
/Jan

