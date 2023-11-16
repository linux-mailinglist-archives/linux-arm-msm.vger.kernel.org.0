Return-Path: <linux-arm-msm+bounces-819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B581A7EE5B8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 18:13:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4FA11C209E9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Nov 2023 17:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F2C348CFC;
	Thu, 16 Nov 2023 17:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="fcIY5Yqm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82600101;
	Thu, 16 Nov 2023 09:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=AR8tidW07BWvnPd6hH5WrFB2sCe8sD6k6E4/XZ64rcg=; b=fcIY5YqmtbOWCIcw+n57lx5crF
	6XlX4opbD49iBF3QArCUltjCMWZotExrqacZIC26KVjnJRkAJXI4y8TGhBP8/CRVrDq59kz4ABLCE
	c8LKmNd48yccc+V2TM6lFtvTipCvgY4QB1agJya1v+TUvrZg5RGQTkDb5mAx8AKwn/B0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r3fv3-000NHs-Ky; Thu, 16 Nov 2023 18:12:45 +0100
Date: Thu, 16 Nov 2023 18:12:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	robert.marko@sartura.hr, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 8/9] net: mdio: ipq4019: add qca8084 configurations
Message-ID: <be36ecb8-8bd7-4756-927e-fa5f266510da@lunn.ch>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-9-quic_luoj@quicinc.com>
 <a1954855-f82d-434b-afd1-aa05c7a1b39b@lunn.ch>
 <2ca3c6eb-93da-4e44-aa6b-c426b8baecb9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ca3c6eb-93da-4e44-aa6b-c426b8baecb9@quicinc.com>

On Thu, Nov 16, 2023 at 06:47:08PM +0800, Jie Luo wrote:
> 
> 
> On 11/16/2023 12:20 AM, Andrew Lunn wrote:
> > On Wed, Nov 15, 2023 at 11:25:14AM +0800, Luo Jie wrote:
> > > The PHY & PCS clocks need to be enabled and the reset
> > > sequence needs to be completed to make qca8084 PHY
> > > probeable by MDIO bus.
> > 
> > Is all this guaranteed to be the same between different boards? Can
> > the board be wired differently and need a different configuration?
> > 
> >      Andrew
> 
> Hi Andrew,
> This configuration sequence is specified to the qca8084 chip,
> not related with the platform(such as ipq5332).
> 
> All these configured registers are located in qca8084 chip, we need
> to complete these configurations to make MDIO bus being able to
> scan the qca8084 PHY(PHY registers can be accessed).

So nothing here has anything to do with the actual PHYs on the bus?
The only clock exposed here is MDC, and that runs at the standard
2.5MHz? All the clock tree configuration is completely internal to the
SOC?

What we don't want is some hard coded configuration which only works
for one specific reference design.

	Andrew

