Return-Path: <linux-arm-msm+bounces-2429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B87FD55F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E5491C20ADA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F7E1C290;
	Wed, 29 Nov 2023 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gtxB7VB/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CDBA19A0;
	Wed, 29 Nov 2023 03:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Q8knBHNUB47p0a/O/J6xt0btYrSCCH1NFcpf4y3y7cY=; b=gtxB7VB/UW1nkc7GLjWcekjVa9
	yu59M9K5jGvQR2fjICCptyi7yDEUl+DT0Bl8Xp2RR3urMxh1gYX0knY2zXkezNO7g4r1yYcl89AFT
	Yg5NBlmAtFdFSAeBwagYO0XLg+aAdIfzhwt9beC3ruuimef+sFFVTWzGpwdSgjGcmWKXyjyPuzgAC
	A5vgkbDZbQ0SFrsFSrnQZk/rOFZUYIFfurnTNYBC2MFdie+wH44jarjJzqqU7maVKj/pAy29HDAhd
	a3IR92vUdX0h9aFjTW1LsPjKRpXO9KJSwqUmR5BP0qu3V/0B/aRMHHf1iAQYA/CBxjcOEGo50GxWl
	sgNvOzjA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53758)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r8IcC-0000GA-19;
	Wed, 29 Nov 2023 11:20:24 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r8IcD-0003wy-TV; Wed, 29 Nov 2023 11:20:25 +0000
Date: Wed, 29 Nov 2023 11:20:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [net-next PATCH 13/14] net: phy: qcom: deatch qca83xx PHY driver
 from at803x
Message-ID: <ZWceeQFBSZD1hzSk@shell.armlinux.org.uk>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-14-ansuelsmth@gmail.com>
 <ZWcJ/OgC1+cbFvhk@shell.armlinux.org.uk>
 <65671487.050a0220.dae78.45f0@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65671487.050a0220.dae78.45f0@mx.google.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 29, 2023 at 11:37:56AM +0100, Christian Marangi wrote:
> On Wed, Nov 29, 2023 at 09:53:00AM +0000, Russell King (Oracle) wrote:
> > On Wed, Nov 29, 2023 at 03:12:18AM +0100, Christian Marangi wrote:
> > > diff --git a/drivers/net/phy/qcom/Makefile b/drivers/net/phy/qcom/Makefile
> > > index 6a68da8aaa7b..43e4d14df8ea 100644
> > > --- a/drivers/net/phy/qcom/Makefile
> > > +++ b/drivers/net/phy/qcom/Makefile
> > > @@ -1,2 +1,3 @@
> > >  # SPDX-License-Identifier: GPL-2.0
> > > -obj-$(CONFIG_AT803X_PHY)	+= at803x.o
> > > +obj-$(CONFIG_AT803X_PHY)	+= at803x.o common.o
> > > +obj-$(CONFIG_QCA83XX_PHY)	+= qca83xx.o common.o
> > 
> > These PHY drivers can be built as modules. You will end up with several
> > modules - at803x.ko, qca83xx.ko and common.ko. You don't mark any
> > functions in common.c as exported, no module license, no author, no
> > description. common.ko is way too generic a name as well.
> > 
> > Please think about this more and test building these drivers as a
> > module.
> >
> 
> Had some fear about this...
> 
> What would be the preferred way for this?
> 
> Having a .ko that EXPORT symbol or making the PHY driver .ko to compile
> the common.o in it?

I think the former, otherwise we end up with common.o duplicated in
each module, which becomes unnecessary bloat. This is how the Broadcom
stuff (which also has a "library") does it.

> Honestly I would like the second option since I would prefer not to
> create a .ko with shared function and EXPORT lots of symbols. On SoC it's
> expected to have only one of the PHY (at max 2 when the qca807x PHY will
> be implemented, with the at808x also present) so the size increase is
> minimal.
> 
> (just to be more clear, talking about this makefile implementation)
> 
> at803x-objs			+= common.o
> obj-$(CONFIG_AT803X_PHY)	+= at803x.o
> qca83xx-objs			+= common.o
> obj-$(CONFIG_QCA83XX_PHY)	+= qca83xx.o
> qca808x-objs			+= common.o
> obj-$(CONFIG_QCA808X_PHY)	+= qca808x.o

That won't work - the -objs needs to list the corresponding .o file
as well, and it needs to be a different name (you can't do this:

qca808x-objs			+= common.o qca808x.o

it has to be something like:

qca808x-phy-objs		+= common.o qca808x.o
obj-$(CONFIG_QCA808X_PHY)	+= qca808x-phy.o

However, I don't like this because it means each module ends up with
a copy of common.o in it.

> For name of common.c, is qcom_ethphy_common.c a better name?

or qcom-phy-lib.c which follows what we have for Broadcom.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

