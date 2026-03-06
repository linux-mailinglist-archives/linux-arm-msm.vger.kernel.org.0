Return-Path: <linux-arm-msm+bounces-95920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIf7KZ5Lq2kOcAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 22:48:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 150D522818A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Mar 2026 22:48:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD00530180AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Mar 2026 21:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584AE346772;
	Fri,  6 Mar 2026 21:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="OsEZbJgd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF8834676F;
	Fri,  6 Mar 2026 21:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772833692; cv=none; b=QvbVdR/iBSyrM62qRQSzvp7x86JZ3Dlpd8ZO6mJDM9a5JZ92PHFlsP/7N7UT3GiSj8e7KwCqxHHLw0RGXQuyK+AJlGLwJToxFFXyTtAsO2olgKBbT6VDvJm301vYZC6iXdislLwdwBfTkWpu0ai+tVgzf+nkBHGNg3TQ9qBvdgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772833692; c=relaxed/simple;
	bh=qo111MQQb5LXpK46bHQeFI70poKoUHB65PmC5p5reyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=liRGW1Z7Xd3pU2khh5S9IOU6ZPA+PGIC67IT/V51K2cN2W5lVuTTQ88Fp9+dhvFnraGYcLnqaHJWcywWDk/X2BEyWDr+FK89+iNnkIWXHcC9pOHpBsr18rGDt+v+/rwbpTKsz+OBTWGd1pIdtO4wgTC5bRARa34tti2RhptCDv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=OsEZbJgd; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ddvZqQUFySIge6sJv5iAA04y8EBt1MEUfEfFLzy/f/A=; b=OsEZbJgdwKor4BpsKgEBLvh6Qh
	oEWSsMJ7pRpJBZmx8r05OzzaqEImRSo2uCsqNeOdsJVxI76RAA5mJ9f4TmSOzRQSQtVG3rAMFNMFO
	Yq2tfLG/mLXy1HG7D7i1FaG9htuCiSsNG3Ow61YfpA7SvOpP78ILzQHWdgXpSuMLij3D8adwAQX8s
	gPVtqFRdo01hOh7kKPVCSUIcSVPVnF9GEaydXiAF4zQ/SzhMzPX5v5U+Im6yKqbFtlGMmCxT5Grvh
	Ve5SnB4YYd+rCb3guzM2LzNXwPe6Dhvpcvs8r5Repa15QMe+wC7GcPk0ml0Xm4UYGBFMnpGqGjFER
	Y46i+AQA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52808)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vyd1d-000000001aV-1ocF;
	Fri, 06 Mar 2026 21:48:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vyd1Z-000000001kc-2mAV;
	Fri, 06 Mar 2026 21:47:57 +0000
Date: Fri, 6 Mar 2026 21:47:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aatLjarGu_qdRkP2@shell.armlinux.org.uk>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <aandp3FYSJbwoZxo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aandp3FYSJbwoZxo@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Queue-Id: 150D522818A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95920-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.037];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,armlinux.org.uk:url]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 01:16:47AM +0530, Mohd Ayaan Anwar wrote:
> Hi Russell,
> On Wed, Mar 04, 2026 at 08:47:36AM +0000, Russell King (Oracle) wrote:
> > Resending this as the original RFC now conflicts with net-next.
> > 
> > This series is the next of the three part series sorting out the PCS
> > support in stmmac, building on part 2, which was posted yesterday:
> > 
> > 	net: stmmac: qcom-ethqos: further serdes reorganisation
> > 
> > Similar patches have been posted previously. This series does away with
> > the common SerDes PHY support, instead using a flag to indicate whether
> > 2500Mbps mode is supported (STMMAC_FLAG_SERDES_SUPPORTS_2500M.) At this
> > time, I have no plans to resurect the common SerDes PHY support - the
> > generic PHY layer implementations are just too random to consider that,
> > and I certainly do not want the extra work of fixing that.
> > 
> > I've also changed the last patch which prints warnings when qcom-ethqos
> > changes the PCS state - this will now indicate in a readable form
> > whether the ANE or SGMRAL bits have changed state, rather than having
> > to refer back to the definitions in the code or the databook.
> > 
> > I am hoping that - subject to this working for qcom-ethqos - we can
> > drop this last patch in the final submission, along with the
> > dwmac_ctrl_ane() and ethqos_pcs_set_inband() functions and associated
> > definitions. This will also mean that stmmac will finally be driving
> > the PCS correctly from a phylink point of view.
> > 
> 
> Apologies for the delay in sharing test results. I had some board issues
> to work through.
> 
> I applied your previous RFC series on top of the two qcom-ethqos/serdes
> cleanup series and have the following results to report for the QCS9100
> Ride R3 board (AQR115C PHY):
> 
>   - Link up at 2.5G, 1G, and 100M is fine (phylink logs below). The PCS
>     link takes a moment to stabilize, but after that it's stable.

Has it always taken a moment to stabilise? Note that the ANE changes
will trigger a re-exchange of SGMII in-band, which is why you see
the PCS link go down and back up after the "ANE 0->1" message.

I do notice:

	qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter

which is a symptom that a clock is missing. There's been some recent
patches merged into net-next which changes this:

2cd70e3968f5 net: stmmac: Defer VLAN HW configuration when interface is down
bd7ad51253a7 net: stmmac: Fix VLAN HW state restore
e38200e361cb net: stmmac: Improve double VLAN handling
35dfedce442c net: stmmac: Fix error handling in VLAN add and delete paths

please indicate whether you have these applied.

>   - No data path issues at these speeds either.

Great.

>   - The warning ("PCS configuration changed from phylink by glue;
>     ANE 0 -> 1") is observed when the link comes up at 1G/100M.

That's currently expected, because phylink thinks we're using PHY
mode (where it's in charge of reading the PHY and telling the MAC
what's going on) rather than using inband. This is something that
will need to be addressed later.

>   - I did find one issue: the data path breaks when the link speed
>     changes from 2.5G to 1G or 100M. Notably, this is not consistently
>     reproducible, and the issue persists even after *dropping* this
>     series and the two qcom-ethqos/serdes cleanup series, so it appears
>     to be pre-existing. I am trying to debug this separately.

I think you added some debug between the logs that you've provided
below, which I'll take as not significant.

I think what's happening is the PHY's SGMII exchange times out, but
because you're enabling SGMII with AN at the PCS, the PCS is wanting
that to complete, and that never happens. I suspect if you unplug and
replug the cable after its switched into 1G mode, it may work. However,
I need to check whether AQR115C does this "AN bypass" thing.

That said, as we're using outband mode, phylink will call
phy_config_inband() with LINK_INBAND_DISABLE. This should disable
inband mode at the PHY, but from your logs I see evidence that it
hasn't. I think that may be because the AQR needs something more than
writing the VEND1_GLOBAL_CFG_* registers for that to take effect.

One of the hacks I have locally for an AQR113C on a SFP module which
uses 10GBASE-R with rate matching is the following in
aqr_gen4_config_init() to allow it to work with MACs that only support
up to 2.5G:

        phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MDIO_CTRL1, MDIO_CTRL1_LPOWER);
        mdelay(10);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x31a, 2);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CFG_10M,
                      VEND1_GLOBAL_CFG_AUTONEG_ENA |
                      VEND1_GLOBAL_CFG_SERDES_MODE_SGMII);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CFG_100M,
                      VEND1_GLOBAL_CFG_AUTONEG_ENA |
                      VEND1_GLOBAL_CFG_SERDES_MODE_SGMII);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CFG_1G,
                      VEND1_GLOBAL_CFG_AUTONEG_ENA |
                      VEND1_GLOBAL_CFG_SERDES_MODE_SGMII);
        phy_write_mmd(phydev, MDIO_MMD_VEND1, VEND1_GLOBAL_CFG_2_5G,
                      VEND1_GLOBAL_CFG_AUTONEG_ENA |
                      VEND1_GLOBAL_CFG_SERDES_MODE_OCSGMII);
        phy_clear_bits_mmd(phydev, MDIO_MMD_VEND1, MDIO_CTRL1,
                           MDIO_CTRL1_LPOWER);

I have this immediately after "priv->wait_on_global_cfg = true;"

This reprograms the vendor provisioning so that we use 2500BASE-X
for 2.5G and SGMII for 1G and below with AN enabled. Note placing
the PHY into low-power mode while doing this - this causes firmware
to re-read when exiting low-power mode. I wonder if that's required
in aqr_gen2_config_inband() - but that will cause the link to go
down.

Note that VEND1_GLOBAL_CFG_AUTONEG_ENA enables inband signalling on
the link.

With the above, you should be able to test various scenarios with
the PHY - and changing your provisioned 10M configuration will likely
get 10M speeds working.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

