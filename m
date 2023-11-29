Return-Path: <linux-arm-msm+bounces-2437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B097FD5C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 12:31:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BAAA28253C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 874EA1CAA3;
	Wed, 29 Nov 2023 11:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="uIiqYbFM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 660A084;
	Wed, 29 Nov 2023 03:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=c3DkZiIiHeIko94vKAHq7MQFE5NcpqvB9Qqxuui6sEk=; b=uIiqYbFMyOtg3Fhj61zUU1cjTY
	Cu4KEJkcFrtllhkmXB6Bl2m0r366YY8bkaVXNvNG+03MpCCfcEeGg32qsCPo6r+eSQqAO/Ej6mte/
	QgyVL6JUXYt5PnumSaKevmsObHRtsIxMmUIRyWXxeWsyYhIsxQf2QnnB1CUEOYrmICxS8Kx1QaziO
	NXX25pFM/j+K6GXHPCf83x85/CIrRSz6nSlWbcVPJkOVYZWUv2QAlEsslhVNnP9+fxwlIq7IOO/PX
	3vWncMZC3ZPv9p4fbBJhH2jIdsuhv+UxgVpo/RsY/cE3OrRZhKG0FyoGjvAOeDQciG66mRHtNU6Pi
	BHpZ5kdA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45066)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r8Imu-0000IK-05;
	Wed, 29 Nov 2023 11:31:28 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r8Imv-0003xF-DN; Wed, 29 Nov 2023 11:31:29 +0000
Date: Wed, 29 Nov 2023 11:31:29 +0000
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
Subject: Re: [net-next PATCH 06/14] net: phy: at803x: move at8031 specific
 data out of generic at803x_priv
Message-ID: <ZWchEWJf0MsCPKc8@shell.armlinux.org.uk>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-7-ansuelsmth@gmail.com>
 <ZWcF6b/Py2gMmwmZ@shell.armlinux.org.uk>
 <65671bc7.050a0220.35082.4ae4@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65671bc7.050a0220.35082.4ae4@mx.google.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 29, 2023 at 12:08:52PM +0100, Christian Marangi wrote:
> On Wed, Nov 29, 2023 at 09:35:37AM +0000, Russell King (Oracle) wrote:
> > On Wed, Nov 29, 2023 at 03:12:11AM +0100, Christian Marangi wrote:
> > > Rework everything related to specific at8031 function to specific
> > > function and allocate the 2 bool, is_1000basex and is_fiber and the
> > > regulator structs to a dedicated qca8031_data struct.
> > > 
> > > This is needed to keep at803x functions more generic and detach them
> > > from specific check of at8031/33 PHY.
> > > 
> > > Out of all the reworked functions, only config_aneg required some code
> > > duplication with how the mdix config is handled.
> > > 
> > > This also reduces the generic at803x_priv struct by removing variables
> > > only used by at8031 PHY.
> > 
> > You are changing the order that register writes happen, e.g. for the
> > set_wol() method. at803x_set_wol() very clearly does stuff like
> > configuring the ethernet MAC address _before_ enabling WoL, and that
> > can fail. Your new code enables WoL and then calls at803x_set_wol().
> > If at803x_set_wol() fails (e.g. because of an invalid MAC address)
> > you leave WoL enabled. This is a change of behaviour.
> >
> 
> Have to think about it, changing the order of the WoL module enable and
> setting the MAC should not change anything as the real enablement is the
> WoL interrupt. (I guess this is why the WoL module is enabled by default
> as the interrupt is disabled by default resulting in the module doing
> nothing)

The AR8031 has two hardware pins for signalling WoL. One of them is the
main INT pin, which is controlled by register 0x12 bit 0. This is an
interrupt enable bit, and it only affects the INT pin.

The second is the WOL_INT pin, which is _not_ controlled by register
0x12 bit 0. This can only be controlled via the AT803X_WOL_EN in the
1588 register.

You have moved the control of AT803X_WOL_EN before the setup of the MAC,
setting and clearing it before calling the other function. This means
that if the MAC is invalid, AT803X_WOL_EN can be set, but the MAC
address has not been programmed, which can leave the machine vulnerable
to spurious wakeups if the WOL_INT pin is used for that purpose.

The original code gets the order correct. Your replacement code breaks
this ordering, thus making it less correct.

> Would it be better to split this in more smaller commit? One for moving
> the at8031 function and the other for refactor of some function? 

Given how big the series already is, you're in danger of going over the
15 patch limit for netdev submissions, so I think careful thought on
that would be needed (e.g. possibly splitting this series.) Wait until
Andrew has also reviewed the series before you decide on that though.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

