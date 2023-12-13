Return-Path: <linux-arm-msm+bounces-4517-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFDD810DEB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 11:09:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DBC31F211B0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 10:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75AEA224C3;
	Wed, 13 Dec 2023 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="o1TvX1J7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C581783;
	Wed, 13 Dec 2023 02:08:57 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC77EC0007;
	Wed, 13 Dec 2023 10:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702462136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BkEPmwBo76rZMnhAQd2TljBiXO6wxAjKUlmXUkfuePY=;
	b=o1TvX1J7P4zG7d64wUmm6horPq6/QP0Cau8umau4GIgzX90kjj/oBPz/oTiCVDKMgmkSMB
	SSNUEJM7Odk6FBTt3Atpq/m6U9/t2dhz3l3jax8NSgEGulOn/LQE9axsGEsQXEdvTCEGSq
	4x+cpLUEOCJp1t76t8kIZYaEBrTzxf2QUL9yBF6iKWWlcobzecfU6pzGwsgBonAWdL6S7R
	XOAJMLZpcRdRXoEEQj5vwcvT63cCHmIgVZBls5I5Y3daiSD7uQ0jJSNY+3sHCrDLzatAzn
	Wy2GsboVFaPc5dyMuuvbp8ywgg32TwvsxbVrNEIFh6vmqsa2fgKPrxoVwOKMlg==
Date: Wed, 13 Dec 2023 11:08:53 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: <agross@kernel.org>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
 <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <andrew@lunn.ch>, <hkallweit1@gmail.com>, <linux@armlinux.org.uk>,
 <robert.marko@sartura.hr>, <linux-arm-msm@vger.kernel.org>,
 <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <quic_srichara@quicinc.com>
Subject: Re: [PATCH v2 3/5] net: mdio: ipq4019: configure CMN PLL clock for
 ipq5332
Message-ID: <20231213110853.07f2be7d@device.home>
In-Reply-To: <b7b0ab99-7277-4618-9037-a878d7b899a9@quicinc.com>
References: <20231212115151.20016-1-quic_luoj@quicinc.com>
	<20231212115151.20016-4-quic_luoj@quicinc.com>
	<20231212135417.67ece4d0@device.home>
	<b7b0ab99-7277-4618-9037-a878d7b899a9@quicinc.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com

On Wed, 13 Dec 2023 16:09:53 +0800
Jie Luo <quic_luoj@quicinc.com> wrote:

> On 12/12/2023 8:54 PM, Maxime Chevallier wrote:
> > Hello,
> > 
> > I have some more minor comments for yoi :)
> > 
> > On Tue, 12 Dec 2023 19:51:48 +0800
> > Luo Jie <quic_luoj@quicinc.com> wrote:
> >   
> >> The reference clock of CMN PLL block is selectable, the internal
> >> 48MHZ is used by default.
> >>
> >> The output clock of CMN PLL block is for providing the clock
> >> source of ethernet device(such as qca8084), there are 1 * 25MHZ
> >> and 3 * 50MHZ output clocks available for the ethernet devices.
> >>
> >> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> >> ---  
> > 
> > [...]
> >   
> >> +/* For the CMN PLL block, the reference clock can be configured according to
> >> + * the device tree property "cmn-reference-clock", the internal 48MHZ is used
> >> + * by default on the ipq533 platform.
> >> + *
> >> + * The output clock of CMN PLL block is provided to the ethernet devices,
> >> + * threre are 4 CMN PLL output clocks (1*25MHZ + 3*50MHZ) enabled by default.
> >> + *
> >> + * Such as the output 50M clock for the qca8084 ethernet PHY.
> >> + */
> >> +static int ipq_cmn_clock_config(struct mii_bus *bus)
> >> +{
> >> +	int ret;
> >> +	u32 reg_val, src_sel, ref_clk;
> >> +	struct ipq4019_mdio_data *priv;  
> > 
> > Here you should also use reverse christmas-tree notation  
> 
> Ok, will correct this, thanks.
> 
> > 
> > [...]
> >   
> >> @@ -317,6 +441,17 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
> >>   		}
> >>   	}
> >>   
> >> +	/* The CMN block resource is for providing clock source to ethernet,
> >> +	 * which can be optionally configured on the platform ipq9574 and
> >> +	 * ipq5332.
> >> +	 */
> >> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cmn_blk");
> >> +	if (res) {
> >> +		priv->cmn_membase = devm_ioremap_resource(&pdev->dev, res);
> >> +		if (IS_ERR(priv->cmn_membase))
> >> +			return PTR_ERR(priv->cmn_membase);
> >> +	}
> >> +  
> > 
> > And here you can simplify a bit by using
> > devm_platform_ioremap_resource_byname()
> > 
> > Thanks,
> > 
> > Maxime
> >   
> As Russell mentioned, since this resource is optional,
> so devm_platform_ioremap_resource_byname can't be used here.
> 

Indeed, my bad I missed that point. Sorry for the noise :/

Thanks,

Maxime

