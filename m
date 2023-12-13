Return-Path: <linux-arm-msm+bounces-4516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E9810DE9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 11:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBF5AB20CA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Dec 2023 10:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99C9224CE;
	Wed, 13 Dec 2023 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="MewhdTNm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4910A83;
	Wed, 13 Dec 2023 02:07:41 -0800 (PST)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 797076000F;
	Wed, 13 Dec 2023 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702462059;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NNBNl0TQMsl9kyDYCCoCiEJ6n4wPwD+uoJm0c+3lwuY=;
	b=MewhdTNm3jOs2pi3D64QUvQZPkNQ0HPcH3aRaqhy2teQxKwbJVqwXwKAfHep/fpnpTKevP
	9uT3jHCQgEyMVpt8L0D+GqYL9944vOucN+dvsTsYWmMb1tqfDOvegJhwApScWBC9V3KuHw
	O1ZugHSWtvFWXwqF9Et/DSA/ocT3arVyjAf8y4vz8ktb2EF4KVkYhBdiCSgeGQwq0yfIZy
	6km1AVa+Wy/1U6yUGF8MHKNaI9b/tY4KBIVVB3ps4PZtdEvIYtEBZL+9VhXk3sBgApWjWJ
	Vj/drso5e7UJVmQY3Kqq4DsMi0iNud7qKwTU4fiKP1oko/RNmzLxYFDEtRLwBw==
Date: Wed, 13 Dec 2023 11:07:37 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Luo Jie <quic_luoj@quicinc.com>, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 andrew@lunn.ch, hkallweit1@gmail.com, robert.marko@sartura.hr,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_srichara@quicinc.com
Subject: Re: [PATCH v2 1/5] net: mdio: ipq4019: move eth_ldo_rdy before MDIO
 bus register
Message-ID: <20231213110737.6e96dba1@device.home>
In-Reply-To: <ZXiwU7XnIeSY1NG4@shell.armlinux.org.uk>
References: <20231212115151.20016-1-quic_luoj@quicinc.com>
	<20231212115151.20016-2-quic_luoj@quicinc.com>
	<20231212135001.6bf40e4d@device.home>
	<ZXiwU7XnIeSY1NG4@shell.armlinux.org.uk>
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

Hello Russell,

On Tue, 12 Dec 2023 19:11:15 +0000
"Russell King (Oracle)" <linux@armlinux.org.uk> wrote:

> On Tue, Dec 12, 2023 at 01:50:01PM +0100, Maxime Chevallier wrote:
> > Hello,
> > 
> > On Tue, 12 Dec 2023 19:51:46 +0800
> > Luo Jie <quic_luoj@quicinc.com> wrote:  
> > > @@ -252,11 +244,32 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
> > >  	if (IS_ERR(priv->mdio_clk))
> > >  		return PTR_ERR(priv->mdio_clk);
> > >  
> > > -	/* The platform resource is provided on the chipset IPQ5018 */
> > > -	/* This resource is optional */
> > > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > > -	if (res)
> > > -		priv->eth_ldo_rdy = devm_ioremap_resource(&pdev->dev, res);
> > > +	/* These platform resources are provided on the chipset IPQ5018 or
> > > +	 * IPQ5332.
> > > +	 */
> > > +	/* This resource are optional */
> > > +	for (index = 0; index < ETH_LDO_RDY_CNT; index++) {
> > > +		res = platform_get_resource(pdev, IORESOURCE_MEM, index + 1);
> > > +		if (res) {
> > > +			priv->eth_ldo_rdy[index] = devm_ioremap(&pdev->dev,
> > > +								res->start,
> > > +								resource_size(res));  
> > 
> > You can simplify that sequence by using
> > devm_platform_get_and_ioremap_resource(), which will do both the
> > platform_get_resource and the devm_ioremap at once for you.  
> 
> Sadly it can't if resources are optional. __devm_ioremap_resource()
> which will be capped by devm_platform_get_and_ioremap_resource() will
> be passed a NULL 'res', which will lead to:
> 
>         if (!res || resource_type(res) != IORESOURCE_MEM) {
>                 dev_err(dev, "invalid resource %pR\n", res);
>                 return IOMEM_ERR_PTR(-EINVAL);
>         }
> 
> There isn't an "optional" version of
> devm_platform_get_and_ioremap_resource().
> 

Ah right, I missed that part indeed. Sorry for the noise then, and
thanks for double-checking :)

Best regards,

Maxime

