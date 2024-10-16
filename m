Return-Path: <linux-arm-msm+bounces-34573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C139A06BE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 12:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 97975286129
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2024 10:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D3B3206978;
	Wed, 16 Oct 2024 10:11:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0ABC20694A;
	Wed, 16 Oct 2024 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.121.34.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729073512; cv=none; b=OwZZjmiN9fWq4AmW34LStBWxTgnyel/iY8jdA9N0eOyM8lUkZ+ccVz7ZKHf+0cCYm6M/4Vyt54EtHWk3tQdO17HAKBrsGEJQoiX5FhdL44Gq+do9kMMhwAjIghcuYRpIxlDA5tf7lhCwY6HtP5bqaiR0nytnnuvR16CdqVQNHPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729073512; c=relaxed/simple;
	bh=XgjoL1JGKiRYyCSWTxkTF2OWBUtB9joLuVL77iOB5jk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJncaPafDdNlFN205YEqH0uXT7gPyg5vA7nMqaRwG3a2yHxji5xu8srZTs2XUxRPFQaJWVReV2WkIQLFkQU5dRv2SXLlqydnZiXK/lzBOF05jkk3akwRSNCZvBhmsL0gkU2EDAEkKXr3whlo8FyodaZNHd+9k42+019+Udg+8yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; arc=none smtp.client-ip=92.121.34.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 37C6A201F78;
	Wed, 16 Oct 2024 12:11:49 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 27BD7201F6F;
	Wed, 16 Oct 2024 12:11:49 +0200 (CEST)
Received: from lsv051416.swis.nl-cdc01.nxp.com (lsv051416.swis.nl-cdc01.nxp.com [10.168.48.122])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 53259203E0;
	Wed, 16 Oct 2024 12:11:49 +0200 (CEST)
Date: Wed, 16 Oct 2024 12:11:49 +0200
From: Jan Petrous <jan.petrous@oss.nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
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
Subject: Re: [PATCH v3 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
Message-ID: <Zw+RZQDt4lopPqFW@lsv051416.swis.nl-cdc01.nxp.com>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
 <20241013-upstream_s32cc_gmac-v3-14-d84b5a67b930@oss.nxp.com>
 <urxfash5qmvahjubhk5knrt53j2tw7hje35qyst3x3ltg4mpgo@dw73m73o36b3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <urxfash5qmvahjubhk5knrt53j2tw7hje35qyst3x3ltg4mpgo@dw73m73o36b3>
X-Virus-Scanned: ClamAV using ClamSMTP

On Wed, Oct 16, 2024 at 11:37:27AM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Sun, Oct 13, 2024 at 11:27:49PM +0200, Jan Petrous via B4 Relay wrote:
> > +static struct platform_driver s32_dwmac_driver = {
> > +	.probe		= s32_dwmac_probe,
> > +	.remove_new	= stmmac_pltfr_remove,
> > +	.driver		= {
> > +			    .name		= "s32-dwmac",
> > +			    .pm		= &stmmac_pltfr_pm_ops,
> > +			    .of_match_table = s32_dwmac_match,
> > +	},
> > +};
> > +module_platform_driver(s32_dwmac_driver);
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers. Please just drop "_new".
> 

Thank you, I was not aware of it. Will be included in v4.

/Jan


