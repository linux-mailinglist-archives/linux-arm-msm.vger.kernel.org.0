Return-Path: <linux-arm-msm+bounces-38685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 749FA9D5169
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 18:13:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A75D284BB8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 17:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D85719E960;
	Thu, 21 Nov 2024 17:13:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792DB1487C8;
	Thu, 21 Nov 2024 17:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732209187; cv=none; b=hxYWFaT649NiXWVKJMeiUigGt0kibCavhonAwWxffs+Q35LsvH8lOF19K3B3xuk/WyHZsvzE1jG3i3EB75nplp4OsMcNZhUew/G+qYhroMeyMMGeBRaOePBxCc2iEcq4HDxfSQysMiNhVO1xopYKERndXFOgEYen8OQT1HNHa2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732209187; c=relaxed/simple;
	bh=GcWWyOMvMcHfUlznL29VswDqfZ4aK48pVXyV1KQ6Bw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdE/FUlsm1lwfr7h8Q0dRwvYVg2mNyGdVfvulYhDdagvSEZ5ma1kUIFQ53UgMfc+XiwRWPpaRGnC+AJHD2PFcKcwjQWKNyYPENIM9EIyoGSzo0kPodM7FSzYjeQ/xc5xtxnuqAV29OKVWD/xymjQXiXaxa55VJ0FMof7oSZ4NO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4748B1A063E;
	Thu, 21 Nov 2024 18:12:58 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4441B1A063A;
	Thu, 21 Nov 2024 18:12:58 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 7BFFC2026C;
	Thu, 21 Nov 2024 18:12:57 +0100 (CET)
Date: Thu, 21 Nov 2024 18:12:58 +0100
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
Subject: Re: [PATCH v5 16/16] net: stmmac: platform: Fix PTP clock rate
 reading
Message-ID: <Zz9qGvb9v9+SXSev@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <20241119-upstream_s32cc_gmac-v5-16-7dcc90fcffef@oss.nxp.com>
 <d6794550-07f2-46df-aa4f-c728b06d50bd@redhat.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6794550-07f2-46df-aa4f-c728b06d50bd@redhat.com>
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, Nov 21, 2024 at 08:45:20AM +0100, Paolo Abeni wrote:
> On 11/19/24 16:00, Jan Petrous (OSS) wrote:
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
> 
> Side, process-related note: it would be great if you could trim the
> patch series below 16 (currently off-by-one):
> 
> https://elixir.bootlin.com/linux/v6.11.8/source/Documentation/process/maintainer-netdev.rst#L14
> 
> This patch looks like an independent fix, possibly worth the 'net' tree.
> If so, please submit this patch separately, including a suitable fixes
> tag and including the 'net' keyword in the patch subj prefix.
> 

Yeh, I also was a bit worried about patchwork fail check on patch series
size. Thanks for your hint, I will remove this PTP clock rate patch from
the series and resend it to the 'net' tree with fixes tag.

BR.
/Jan

