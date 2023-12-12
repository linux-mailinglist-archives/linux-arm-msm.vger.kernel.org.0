Return-Path: <linux-arm-msm+bounces-4451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B780F642
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 20:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AF047B20DD8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Dec 2023 19:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0C181E20;
	Tue, 12 Dec 2023 19:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="zxKdCh8u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECB4127;
	Tue, 12 Dec 2023 11:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qpEUckSGc7ggePcRYae27HGr8y3eNljZxImsxdDOJIM=; b=zxKdCh8uTLT2S58p+CI+1L4rla
	qhxaieC+LkURfKvqOsW533AvoCBQudLWklzyAQjmzt72gaNJlIlJDzml6Eakm57Izb7tbm7ADejfu
	DJK8mFr6OC+uhPsqG1JIwX2LlmVvFhNwwL94MIAlO0rlpXC+uUJQffyHGMdVq+Yd7Ng86NWPUZWau
	lb2Jh+iAfbYC+qchT4gxwL5UP61hYUHYzt1SwxjY+oNPhIfLW1rofLsdf21Dhun2XEk8lYbGuiXiC
	V0Rz7vhyoP9G9cG7a54bRODE/bWXZXXGse+dcRlM+Up9GMTDRPkH9/z6epERJTl2188PkBlM0abG4
	bepoJFdg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:51180)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rD8BW-0007Ib-0t;
	Tue, 12 Dec 2023 19:12:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rD8BX-0000hC-Kq; Tue, 12 Dec 2023 19:12:51 +0000
Date: Tue, 12 Dec 2023 19:12:51 +0000
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
Subject: Re: [PATCH v2 3/5] net: mdio: ipq4019: configure CMN PLL clock for
 ipq5332
Message-ID: <ZXiws6Tka5ENm6gA@shell.armlinux.org.uk>
References: <20231212115151.20016-1-quic_luoj@quicinc.com>
 <20231212115151.20016-4-quic_luoj@quicinc.com>
 <20231212135417.67ece4d0@device.home>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231212135417.67ece4d0@device.home>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Dec 12, 2023 at 01:54:17PM +0100, Maxime Chevallier wrote:
> Hello,
> 
> I have some more minor comments for yoi :)
> 
> On Tue, 12 Dec 2023 19:51:48 +0800
> Luo Jie <quic_luoj@quicinc.com> wrote:
> > +	/* The CMN block resource is for providing clock source to ethernet,
> > +	 * which can be optionally configured on the platform ipq9574 and
> > +	 * ipq5332.
> > +	 */
> > +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cmn_blk");
> > +	if (res) {
> > +		priv->cmn_membase = devm_ioremap_resource(&pdev->dev, res);
> > +		if (IS_ERR(priv->cmn_membase))
> > +			return PTR_ERR(priv->cmn_membase);
> > +	}
> > +
> 
> And here you can simplify a bit by using
> devm_platform_ioremap_resource_byname()

Not if the resource is optional.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

