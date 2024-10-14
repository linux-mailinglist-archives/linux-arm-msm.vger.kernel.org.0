Return-Path: <linux-arm-msm+bounces-34339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB37499CBB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 15:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2230E1C22130
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 13:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1251AA7AA;
	Mon, 14 Oct 2024 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="A1kWSnBt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3821514CB;
	Mon, 14 Oct 2024 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728913282; cv=none; b=O4kFelpfc3bWZGwLrcdC4CPJwdvDsqj8Wu/UJcEko2lF/6SkzcYx2mfnOrohRbSxl7amwBK31sX+azYeo7dOHJerOb+W8pRa2tOzY6fm5qVh/gRuXewH9BEqZpu4/+q9ui+8/HaQ15wKvSxkh6ImxjoPgTZ04zhe5SeTnhvfhOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728913282; c=relaxed/simple;
	bh=NILg4tqzsVL0wLhELbKghHTZAqAzPu7Mn94ypvVJycI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ww+NWTWfCv/cIEWY6VlICasMTSg9OUSTGGIC+8arMQNf+tRAtSVSp1CgcWORKI/cVfV3jLJl/rs52FNSGkcMlcuHmbl4sDY+0a9S4CtBHe6rm7ImNtgaFrk8SS4Qxn9Ld95mTcncSqKLe/HVgVGxyQ/7iOmzaOWfyJy1ApCGOIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=A1kWSnBt; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=O/yDHelZkZbEyouxYDEGSFyuC5vdHTQjMNQBxEU6cxs=; b=A1kWSnBtnNvgq117bQonvW7NGB
	ivzTefIRpDZr5RKxS59WshY6ydHPOP70BVMfmFz/UrESTk+lj5+ylhVB9+pu2Vz+nBJmC8M4t4TV4
	jqrfgqU+Ku4heNIzvZz7Glq1kZzRhooGJW5zrDPXqIzwMjIoqqVHk+350Z2xMISLyduQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t0LJb-009vh1-Sn; Mon, 14 Oct 2024 15:40:51 +0200
Date: Mon, 14 Oct 2024 15:40:51 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
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
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: Re: [PATCH v3 04/16] net: phy: Add helper for mapping RGMII link
 speed to clock rate
Message-ID: <4686019c-f6f1-4248-9555-c736813417b7@lunn.ch>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
 <20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013-upstream_s32cc_gmac-v3-4-d84b5a67b930@oss.nxp.com>

On Sun, Oct 13, 2024 at 11:27:39PM +0200, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> The helper rgmii_clock() implemented Russel's hint during stmmac
> glue driver review:
> 
>   > We seem to have multiple cases of very similar logic in lots of stmmac
>   > platform drivers, and I think it's about time we said no more to this.
>   > So, what I think we should do is as follows:
>   >
>   > add the following helper - either in stmmac, or more generically
>   > (phylib? - in which case its name will need changing.)
>   >
>   > static long stmmac_get_rgmii_clock(int speed)
>   > {
>   >        switch (speed) {
>   >        case SPEED_10:
>   >                return 2500000;
>   >
>   >        case SPEED_100:
>   >                return 25000000;
>   >
>   >        case SPEED_1000:
>   >                return 125000000;
>   >
>   >        default:
>   >                return -ENVAL;
>   >        }
>   > }
>   >
>   > Then, this can become:
>   >
>   >        long tx_clk_rate;
>   >
>   >        ...
>   >
>   >        tx_clk_rate = stmmac_get_rgmii_clock(speed);
>   >        if (tx_clk_rate < 0) {
>   >                dev_err(gmac->dev, "Unsupported/Invalid speed: %d\n", speed);
>   >                return;
>   >        }
>   >
>   >        ret = clk_set_rate(gmac->tx_clk, tx_clk_rate);
> 
> Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

But of an unusual commit message, but it does explain the "Why?".

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

>  
> +/**
> + * rgmii_clock - map link speed to the clock rate
> + * @speed: link speed value
> + *
> + * Description: maps RGMII supported link speeds
> + * into the clock rates.
> + */

A Returns: line would be nice. 

	Andrew

