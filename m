Return-Path: <linux-arm-msm+bounces-2418-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF147FD4C7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 11:57:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB7AA1C20F82
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Nov 2023 10:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3EB41BDC9;
	Wed, 29 Nov 2023 10:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="AUbTjfhm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B77618E;
	Wed, 29 Nov 2023 02:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=l+Tefq0nz5EH41YlbLMWvc0l+B0AxxVpnMBag7nlEWA=; b=AUbTjfhmCmKVpyxLLuBUXlxvXC
	ua2ELfzCFUeFc/3SlTg/RWAAGHaTU78jKhIajF99NkVfsOGXf36qzg3iWqVJOwIW8NJBW82C82BmF
	x84ngs+diS2eNKOZLDLNWrTMUQDz8YFYcyYr5UWkN4Y9AG8u17E1iZ+IjFkkJEa7jxFGbA1F+gWs9
	OqNMiHi0P3VrIEl1RJWtrijDGNJsqBQRJNxYE09dma/qxFw5RglxUCGhikVnzp5cSYcxdY6RBhnG1
	MF3S6hLc7wtaCNY1rHhcoMFz8dnOPArVepakRF9rQgxgjpoNsdQZDyZ04SMwVFnx1VnmIlnFpmGAg
	KWdDVjAw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54884)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1r8IFy-0000BN-2I;
	Wed, 29 Nov 2023 10:57:26 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1r8IG0-0003va-8C; Wed, 29 Nov 2023 10:57:28 +0000
Date: Wed, 29 Nov 2023 10:57:28 +0000
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
Subject: Re: [net-next PATCH 08/14] net: phy: at803x: drop specific PHY id
 check from cable test functions
Message-ID: <ZWcZGO1HWxJnzPrk@shell.armlinux.org.uk>
References: <20231129021219.20914-1-ansuelsmth@gmail.com>
 <20231129021219.20914-9-ansuelsmth@gmail.com>
 <ZWcGn7KVSpsN/1Ee@shell.armlinux.org.uk>
 <656708a8.df0a0220.28d76.9307@mx.google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <656708a8.df0a0220.28d76.9307@mx.google.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, Nov 29, 2023 at 10:47:18AM +0100, Christian Marangi wrote:
> On Wed, Nov 29, 2023 at 09:38:39AM +0000, Russell King (Oracle) wrote:
> > On Wed, Nov 29, 2023 at 03:12:13AM +0100, Christian Marangi wrote:
> > > @@ -1310,10 +1302,6 @@ static int at803x_cable_test_start(struct phy_device *phydev)
> > >  	 */
> > >  	phy_write(phydev, MII_BMCR, BMCR_ANENABLE);
> > >  	phy_write(phydev, MII_ADVERTISE, ADVERTISE_CSMA);
> > > -	if (phydev->phy_id != ATH9331_PHY_ID &&
> > > -	    phydev->phy_id != ATH8032_PHY_ID &&
> > > -	    phydev->phy_id != QCA9561_PHY_ID)
> > > -		phy_write(phydev, MII_CTRL1000, 0);
> > ...
> > > +static int at8031_cable_test_start(struct phy_device *phydev)
> > > +{
> > > +	at803x_cable_test_start(phydev);
> > > +	phy_write(phydev, MII_CTRL1000, 0);
> > 
> > I don't think this is a safe change - same reasons as given on a
> > previous patch. You can't randomly reorder register writes like this.
> >
> 
> Actually for this the order is keeped. Generic function is called and
> for at8031 MII_CTRL1000 is called on top of that.

Okay, but I don't like it. I would prefer this to be:

static void at803x_cable_test_autoneg(struct phy_device *phydev)
{
	phy_write(phydev, MII_BMCR, BMCR_ANENABLE);
	phy_write(phydev, MII_ADVERTISE, ADVERTISE_CSMA);
}

static int at803x_cable_test_start(struct phy_device *phydev)
{
	at803x_cable_test_autoneg(phydev);
	return 0;
}

static int at8031_cable_test_start(struct phy_device *phydev)
{
	at803x_cable_test_autoneg(phydev);
	phy_write(phydev, MII_CTRL1000, 0);
	return 0;
}

which makes it more explicit what is going on here. Also a comment
above the function stating that it's for AR8031 _and_ AR8035 would
be useful.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

