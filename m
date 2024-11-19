Return-Path: <linux-arm-msm+bounces-38326-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 51BA29D28C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:59:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D96A31F236C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 14:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53FC1CF5E7;
	Tue, 19 Nov 2024 14:59:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1491CEABA;
	Tue, 19 Nov 2024 14:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028385; cv=none; b=RRqc+tHYjHtcRZk30sWU6D7Ov9Q6SA+SC1KZ3WbtzQevgd6/U0zcxRjPT17POR3s87fUOpX8loivrHB4eRVtc1EuGJ+U0Tzz3akltw2oukc/k6EhK9sY/Gs2SUiyTV4F1LvW75AHDckyx2smvKx+ErJgPJJ/F6fYmJSX4J3JNQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028385; c=relaxed/simple;
	bh=jLbles4+yT3+MXOfnSEudDLKvptgFiWTDvyagS1hn0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZJKp73hjgJCmWfxJ+XI9EmpOXPQYYF0GdpJTwmGgUNwEuUHzeXq0F+NwbCCRgsGji+hEADdeJ3eu84DE00SPyrYooTFLIpyk7lDEW8s1nb56imwZX80xqns1p6OkeaDhkfnL6eWzW7/x7965stsWX/K5EXnrc4WrbR7hEOg9qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A8AA9201A7C;
	Tue, 19 Nov 2024 15:51:06 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8CBF0200A3E;
	Tue, 19 Nov 2024 15:51:06 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7ACB32037C;
	Tue, 19 Nov 2024 15:51:05 +0100 (CET)
Date: Tue, 19 Nov 2024 15:51:06 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH v4 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
Message-ID: <Zzyl2q7D1GIA1vUG@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
 <xanb4j56u2rjwpkyj5gwh6y6t36gpvawph62jw72ksh7jximhr@cjwlp7wsxgp6>
 <ZyOXgdqUgg2qlCah@lsv051416.swis.nl-cdc01.nxp.com>
 <b9aefcf2-8f0d-431c-865b-34c9b8e69c4d@kernel.org>
 <ZyO7fn3NWULA9bGG@lsv051416.swis.nl-cdc01.nxp.com>
 <ZyO9Mfq+znZdJJrJ@lsv051416.swis.nl-cdc01.nxp.com>
 <9e876379-c555-45e6-8a8a-752d90fdc8ed@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9e876379-c555-45e6-8a8a-752d90fdc8ed@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Fri, Nov 01, 2024 at 04:40:50PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2024 18:24, Jan Petrous wrote:
> > On Thu, Oct 31, 2024 at 06:16:46PM +0100, Jan Petrous wrote:
> >> On Thu, Oct 31, 2024 at 04:44:45PM +0100, Krzysztof Kozlowski wrote:
> >>> On 31/10/2024 15:43, Jan Petrous wrote:
> >>>> On Tue, Oct 29, 2024 at 08:13:40AM +0100, Krzysztof Kozlowski wrote:
> >>>>> On Mon, Oct 28, 2024 at 09:24:56PM +0100, Jan Petrous (OSS) wrote:
> >>>>>> +	plat->init = s32_gmac_init;
> >>>>>> +	plat->exit = s32_gmac_exit;
> >>>>>> +	plat->fix_mac_speed = s32_fix_mac_speed;
> >>>>>> +
> >>>>>> +	plat->bsp_priv = gmac;
> >>>>>> +
> >>>>>> +	return stmmac_pltfr_probe(pdev, plat, &res);
> >>>>>> +}
> >>>>>> +
> >>>>>> +static const struct of_device_id s32_dwmac_match[] = {
> >>>>>> +	{ .compatible = "nxp,s32g2-dwmac" },
> >>>>>> +	{ .compatible = "nxp,s32g3-dwmac" },
> >>>>>> +	{ .compatible = "nxp,s32r-dwmac" },
> >>>>>
> >>>>> Why do you need three same entries?
> >>>>>
> >>>>
> >>>> We have three different SoCs and in v3 review you told me
> >>>> to return all back:
> >>>> https://patchwork.kernel.org/comment/26067257/
> >>>
> >>> It was about binding, not driver.
> >>>
> >>> I also asked there: use proper fallback and compatibility. Both comments
> >>> of course affect your driver, but why choosing only first part?
> >>>
> >>
> >> Does it mean I should remove first two (G2/G3) members from match array
> >> and use "nxp,s32r-dwmac" as fallback for G2/G3? And similarly change
> >> the bindings to:
> >>
> >>   compatible:
> >>     oneOf:
> >>       - const: nxp,s32r-dwmac
> >>       - items:
> >> 	  - enum:
> >> 	      - nxp,s32g2-dwmac
> >> 	      - nxp,s32g3-dwmac
> >>           - const: nxp,s32r-dwmac
> >>
> >> And add here, into the driver, those members back when some device
> >> specific feature will be needed? Am I understand your hints right?
> >>
> > 
> > Sorry, it's not correct. This way I'm not able to detect S32R which is
> > the only one with higher speed.
> > 
> > Then I could use the G2 as fallback I think, Ie.:
> > 
> >   compatible:
> >     oneOf:
> >       - const: nxp,s32g2-dwmac
> >       - items:
> > 	  - enum:
> >               - nxp,s32g3-dwmac
> >               - nxp,s32r-dwmac
> >            - const: nxp,s32g2-dwmac
> 
> I don't understand. In both cases you can 'detect r', if by this you
> meant match and bind. I don't care which one is the fallback, but if one
> does not work it points to different issues with your code.
> 

I see. I will use the last variant (with s32g2 as fallback) in v5.

BR.
/Jan

