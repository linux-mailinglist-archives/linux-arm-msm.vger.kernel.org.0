Return-Path: <linux-arm-msm+bounces-1361-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F24F7F3037
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 15:05:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50E6F1C21B2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Nov 2023 14:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA8854F8A;
	Tue, 21 Nov 2023 14:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="shi+sqNb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB83D7E;
	Tue, 21 Nov 2023 06:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=29QJI23zuhCjj0/UknYYHK8lNy2il3wd+lJeqLPpi2w=; b=shi+sqNbqcH0o1rxmet0wTEEeX
	wnzv0o3AP9HgoYWF1/0yt6NcPNaBo9kG/9mdoHUxLZbJbAVts0CSEOivcXuIEIS7o+L7FquvEp5gX
	azpqQFrrk4KtaNOnhTW/HuKsWqSV1gBL5j2/xVT0QZDOdUHEk06yUDbVsO7cQyL7DdGg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1r5RMj-000lKe-Jg; Tue, 21 Nov 2023 15:04:37 +0100
Date: Tue, 21 Nov 2023 15:04:37 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, agross@kernel.org,
	andersson@kernel.org, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	hkallweit1@gmail.com, linux@armlinux.org.uk,
	robert.marko@sartura.hr, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_srichara@quicinc.com
Subject: Re: [PATCH 2/9] net: mdio: ipq4019: Enable the clocks for ipq5332
 platform
Message-ID: <187a148d-39af-4000-825d-63ca3e3a23b1@lunn.ch>
References: <20231115032515.4249-1-quic_luoj@quicinc.com>
 <20231115032515.4249-3-quic_luoj@quicinc.com>
 <10dc0fff-fc00-4c1f-97cf-30c5e5e8f983@linaro.org>
 <9acace07-d758-4d5d-8321-de75ee53355d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9acace07-d758-4d5d-8321-de75ee53355d@quicinc.com>

On Tue, Nov 21, 2023 at 06:28:54PM +0800, Jie Luo wrote:
> 
> 
> On 11/20/2023 10:22 PM, Konrad Dybcio wrote:
> > On 15.11.2023 04:25, Luo Jie wrote:
> > > For the platform ipq5332, the related GCC clocks need to be enabled
> > > to make the GPIO reset of the MDIO slave devices taking effect.
> > > 
> > > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > [...]
> > 
> > >   static int ipq4019_mdio_wait_busy(struct mii_bus *bus)
> > > @@ -212,6 +231,38 @@ static int ipq_mdio_reset(struct mii_bus *bus)
> > >   	u32 val;
> > >   	int ret;
> > > +	/* For the platform ipq5332, there are two uniphy available to connect the
> > > +	 * ethernet devices, the uniphy gcc clock should be enabled for resetting
> > > +	 * the connected device such as qca8386 switch or qca8081 PHY effectively.
> > > +	 */
> > > +	if (of_device_is_compatible(bus->parent->of_node, "qcom,ipq5332-mdio")) {
> > Would that not also be taken care of in the phy driver?
> > 
> > Konrad
> 
> Hi Konrad,
> These clocks are the SOC clocks that is not related to the PHY type.
> no matter what kind of PHY is connected, we also need to configure
> these clocks.

Hi Jie

You can avoid lots of these questions by making your commit message
better. Assume the reader does not know the clock tree for this
device. With a bit of experience, you can guess what reviewers are
going to ask, and answer those questions in the commit message.

      Andrew

