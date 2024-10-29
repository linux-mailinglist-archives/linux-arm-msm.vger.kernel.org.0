Return-Path: <linux-arm-msm+bounces-36262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9FF9B42E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 08:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60B811F23248
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 07:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E999E2022C9;
	Tue, 29 Oct 2024 07:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TL+Et39/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39751FCF77;
	Tue, 29 Oct 2024 07:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730186024; cv=none; b=MjUV87IFiEXoDDULzJdNk/sNJ/dYSF53oEAisGkN2ZRc4y2qW4gsHWnaGDhLZYLj7mUcjjvoeD1j8y8u2FGV07NzbRedcMa29NUU+KhFxKF2XWcA7rHQmktpSMEAm/GHKrieWCzvLRC15JodjqK+R/RgaMU536VS4tN9G1HwrD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730186024; c=relaxed/simple;
	bh=yZacnLzwlmMaPMgCQVc6Cs2tFUW+rgsYqgTbJRGZhDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzCkrsecMcdZAw8ZeQooPVR3nU2h5jGpVCH3AitKjd/mX8+8emTLAW9iJwoS1yONPyg0nyE8MJFj8x7qwVYy2xt9qN2e4/vjlhv8W0QXg2iYE0GMhFlTgjvXRZn20025P2BhcAC9H4gzbyGGRA8fl3c2Zufw/PIKwU7aecdqOyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TL+Et39/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFBFC4CECD;
	Tue, 29 Oct 2024 07:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730186024;
	bh=yZacnLzwlmMaPMgCQVc6Cs2tFUW+rgsYqgTbJRGZhDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TL+Et39/oJkVZmxXRlBodyw+QeDCk90Ru9GXqsC/xpE7MVBpuY+PMpG9PzSBo1Hd4
	 EOX0DUAVQLaPlWzjdih9SCrNDmIdPIEEzPdHTHgop5Y/Ph7fMv5YJnAbDiRTtcL8WC
	 7rUEO2X/zMYuDueryjDhWYjFclRxCx+QUUlyjHyGcIo+ViuHQZZORr8b7ZMKysZ65/
	 aEeBErGoi/NhPwpJPTD0a7ZVPezKt4R4eilcO+qbNAzblgQDi9tKHPI/Y2pM6UpiTl
	 0mcIG6XlpW/yyFMOGTJyMZV+r1mbN7tVEMn/P6wMjlyPnRxdeA8ZzICum+/SlfGDWz
	 XcKZfURViRwsQ==
Date: Tue, 29 Oct 2024 08:13:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Iyappan Subramanian <iyappan@os.amperecomputing.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, 
	Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	NXP S32 Linux Team <s32@nxp.com>
Subject: Re: [PATCH v4 14/16] net: stmmac: dwmac-s32: add basic NXP S32G/S32R
 glue driver
Message-ID: <xanb4j56u2rjwpkyj5gwh6y6t36gpvawph62jw72ksh7jximhr@cjwlp7wsxgp6>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-14-03618f10e3e2@oss.nxp.com>

On Mon, Oct 28, 2024 at 09:24:56PM +0100, Jan Petrous (OSS) wrote:
> +	plat->init = s32_gmac_init;
> +	plat->exit = s32_gmac_exit;
> +	plat->fix_mac_speed = s32_fix_mac_speed;
> +
> +	plat->bsp_priv = gmac;
> +
> +	return stmmac_pltfr_probe(pdev, plat, &res);
> +}
> +
> +static const struct of_device_id s32_dwmac_match[] = {
> +	{ .compatible = "nxp,s32g2-dwmac" },
> +	{ .compatible = "nxp,s32g3-dwmac" },
> +	{ .compatible = "nxp,s32r-dwmac" },

Why do you need three same entries?

Best regards,
Krzysztof


