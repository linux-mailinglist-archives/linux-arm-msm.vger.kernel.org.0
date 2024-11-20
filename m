Return-Path: <linux-arm-msm+bounces-38481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 328A79D3A69
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 13:14:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11A5EB2E36D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 11:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C73B21A08CA;
	Wed, 20 Nov 2024 11:58:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE871A071C;
	Wed, 20 Nov 2024 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732103895; cv=none; b=H4cL2FnQPbmiHT9AxOkS2D4e+A3vwxGQeAXIGX7y6M83DRwMz/jjfxvfAtjqmvyqTlgDGiE5PZHEPaearz000mlVTHnGF/w1Y4O7Y7EfidKn+DHauVcT1TNGwem3V/QGTKnJ1x/RRuIA9xRGhmcOJI06d6F+sho8DziAumLMSyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732103895; c=relaxed/simple;
	bh=9QeksiC2PdFwVn1Lq/BJQD8NNfp16CVxjBa/typJEww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+UiIJ5lw0OyZsfkFRPUyYqo7zRNewCcWeEdOsCf2oIiXVmJFBeE7ADPaubcmE92XWiov/iSWgrRji7nBkmXaYqJOkViDBWwVpL71l6MfnIab/LuuhOjrgX/ZiaAJ+PT7yoM7ehmSghxi8z7ypwq+72tm6voqFHVudGrMVicOiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A66E21A0134;
	Wed, 20 Nov 2024 12:58:07 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A2B3C1A010C;
	Wed, 20 Nov 2024 12:58:07 +0100 (CET)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 65FE420358;
	Wed, 20 Nov 2024 12:58:07 +0100 (CET)
Date: Wed, 20 Nov 2024 12:58:07 +0100
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
	NXP S32 Linux Team <s32@nxp.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v5 00/16] Add support for Synopsis DWMAC IP on NXP
 Automotive SoCs S32G2xx/S32G3xx/S32R45
Message-ID: <Zz3Oz3JiRLyD1qKx@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
 <Zzy_enX2VyS0YUl3@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zzy_enX2VyS0YUl3@shell.armlinux.org.uk>
X-Virus-Scanned: ClamAV using ClamSMTP

On Tue, Nov 19, 2024 at 04:40:26PM +0000, Russell King (Oracle) wrote:
> Hi,
> 
> On Tue, Nov 19, 2024 at 04:00:06PM +0100, Jan Petrous via B4 Relay wrote:
> > The SoC series S32G2xx and S32G3xx feature one DWMAC instance,
> > the SoC S32R45 has two instances. The devices can use RGMII/RMII/MII
> > interface over Pinctrl device or the output can be routed
> > to the embedded SerDes for SGMII connectivity.
> > 
> > The provided stmmac glue code implements only basic functionality,
> > interface support is restricted to RGMII only. More, including
> > SGMII/SerDes support will come later.
> > 
> > This patchset adds stmmac glue driver based on downstream NXP git [0].
> 
> A few things for the overall series:
> 
> 1. Note that net-next is closed due to the merge window, so patches should
>    be sent as RFC.
> 
> 2. The formatting of the subject line should include the tree to which
>    you wish the patches to be applied - that being net-next for
>    development work.
> 
> For more information, see:
> 
> https://kernel.org/doc/html/v6.12/process/maintainer-netdev.html#netdev-faq
> 

Hi Russell,

thanks for review and hints with series proper targeting. I will
reformulate series to 'RFC net-next v6 x/y' for v6.

BR.
/Jan

