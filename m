Return-Path: <linux-arm-msm+bounces-1722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 976087F6228
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 15:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED3D7B2142E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 14:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4511A26AF1;
	Thu, 23 Nov 2023 14:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Y/2HyafF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81903A4;
	Thu, 23 Nov 2023 06:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=kfGgqTUyQW3nytRqECKvTmNuGYaEc5iawnb0wTmFF4A=; b=Y/2HyafF1/CBVlx6o7AHGy62st
	Gm9gu1nVAEutBUdDIjHMwfkLNLqbI1m1VHolp8rQW+6gOHdjpnNNuGyYCG8HuIBzE4tOLIju+dUfs
	0WMLyF7NHK2zIwS60kgXpFYwVnCE6tvex1Kf1Sxx7/N19xriJ+1Ewj/Y6SQgBieBOK8c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r6B9S-0010J5-97; Thu, 23 Nov 2023 15:57:58 +0100
Date: Thu, 23 Nov 2023 15:57:58 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Jie Luo <quic_luoj@quicinc.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
Message-ID: <e32d5c84-7a88-4d9f-868f-98514deae6e9@lunn.ch>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
 <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
 <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>

On Thu, Nov 23, 2023 at 02:35:31PM +0000, Russell King (Oracle) wrote:
> On Thu, Nov 23, 2023 at 03:27:05PM +0100, Andrew Lunn wrote:
> > > Just to be more precise qca807x can operate in 3 different mode:
> > > (this is controlled by the MODE_CFG bits)
> > 
> > > - QSGMII: 5 copper port
> > 
> > 4 slots over QSGMII, plus the second SERDES is connected to the MAC
> > using SGMII/1000BaseX?
> > 
> > > - PSGMII: 5 copper port
> > 
> > 5 slots over QSGMII, the second SERDES is idle?
> > 
> > > - PSGMII: 4 copper port + 1 combo (that can be both fiber or copper)
> > 
> > 5 slots over QSGMII, with the second SERDES connected to an SFP cage.
> > 
> > Are ports 1-4 always connected to the P/Q SGMII. Its only port 5 which
> > can use the second SERDES?
> 
> I think what would really help here is if there was an ascii table to
> describe the configurations, rather than trying to put it into words.

Yes.

And also for ipq4019. We need to merge these two threads of
conversation, since in the end they are probably the same driver, same
device tree etc.

       Andrew

