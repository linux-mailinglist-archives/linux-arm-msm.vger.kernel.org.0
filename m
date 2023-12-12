Return-Path: <linux-arm-msm+bounces-4450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACEE80F629
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 20:11:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04B02B20E7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 19:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FF780058;
	Tue, 12 Dec 2023 19:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="AB8mY2O5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93C9B9F;
	Tue, 12 Dec 2023 11:11:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zu77ILlFi8UZdCwbbdfAli/r3ogJZ+gYD8KfnKz3Xto=; b=AB8mY2O5mM4iFFqvSp5DxuKAuA
	3UDwlqlPYgVWn6YxS3AaRoWtBp9CQ68IQ0DuFL02tdbw+EX/7Q9AaDDztULKReD7U0zeTHDb2SiAB
	Xg7P+/CZ2c9W/af8rDdr8aPb8tjeOcQmIxUL942L/03Y9eh5FOY9CVSHSflzZ1KrEGb2POHKc1+dM
	2lpJJUYMMtLR9A2lEnef9sftipoOsK6cfi21cm1GJaxExy53Xap7TF+mAgbvnuc9PMVdBb7VQpEK+
	ofcLhNWqlIRrRXqDQJXBC4Je4I14PQRM4wA1HEEiN50g5f21yZ40gweyU+u3kXzwIDQoZRw3CcnRu
	bSHtO2jQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:41348)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rD89y-0007IH-0F;
	Tue, 12 Dec 2023 19:11:14 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rD89z-0000h5-Ik; Tue, 12 Dec 2023 19:11:15 +0000
Date: Tue, 12 Dec 2023 19:11:15 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Luo Jie <quic_luoj@quicinc.com>, agross@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
	robert.marko@sartura.hr, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH v2 1/5] net: mdio: ipq4019: move eth_ldo_rdy before MDIO
 bus register
Message-ID: <ZXiwU7XnIeSY1NG4@shell.armlinux.org.uk>
References: <20231212115151.20016-1-quic_luoj@quicinc.com>
 <20231212115151.20016-2-quic_luoj@quicinc.com>
 <20231212135001.6bf40e4d@device.home>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212135001.6bf40e4d@device.home>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Dec 12, 2023 at 01:50:01PM +0100, Maxime Chevallier wrote:
> Hello,
> 
> On Tue, 12 Dec 2023 19:51:46 +0800
> Luo Jie <quic_luoj@quicinc.com> wrote:
> > @@ -252,11 +244,32 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
> >  	if (IS_ERR(priv->mdio_clk))
> >  		return PTR_ERR(priv->mdio_clk);
> >  
> > -	/* The platform resource is provided on the chipset IPQ5018 */
> > -	/* This resource is optional */
> > -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > -	if (res)
> > -		priv->eth_ldo_rdy = devm_ioremap_resource(&pdev->dev, res);
> > +	/* These platform resources are provided on the chipset IPQ5018 or
> > +	 * IPQ5332.
> > +	 */
> > +	/* This resource are optional */
> > +	for (index = 0; index < ETH_LDO_RDY_CNT; index++) {
> > +		res = platform_get_resource(pdev, IORESOURCE_MEM, index + 1);
> > +		if (res) {
> > +			priv->eth_ldo_rdy[index] = devm_ioremap(&pdev->dev,
> > +								res->start,
> > +								resource_size(res));
> 
> You can simplify that sequence by using
> devm_platform_get_and_ioremap_resource(), which will do both the
> platform_get_resource and the devm_ioremap at once for you.

Sadly it can't if resources are optional. __devm_ioremap_resource()
which will be capped by devm_platform_get_and_ioremap_resource() will
be passed a NULL 'res', which will lead to:

        if (!res || resource_type(res) != IORESOURCE_MEM) {
                dev_err(dev, "invalid resource %pR\n", res);
                return IOMEM_ERR_PTR(-EINVAL);
        }

There isn't an "optional" version of
devm_platform_get_and_ioremap_resource().

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

