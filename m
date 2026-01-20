Return-Path: <linux-arm-msm+bounces-89776-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA71D3C270
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 09:46:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ED2AA605613
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 08:27:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E7863ACEEC;
	Tue, 20 Jan 2026 08:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNkYY7XN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 110923BBA18
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 08:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768897132; cv=none; b=Gi9boYlD186z90aH7gEAERPktV4oFU9ZYnYuiWJUswqH85AU84K8s8IkJyDMRemL+NKlOzba9Q+PGhjL2kqd7OyrH/T3RVrOo5it2d80rgK5iykakwBeNmxnY1rLyyb7aAxUZ14N48wgc2i0G80n9iQJkgj/RiOXpeqj3t7Xbl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768897132; c=relaxed/simple;
	bh=qyvzLqcm1Y8bkz0o1wMAZLeFnBMWPFkiUHTVVHF4rys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTscaOB1tOv66x13Y7PBJBi02MLXd8WEDPGiF3FTGFawAXa9LjikHS88WaTkyxy11Nkxgy2171Js1J+iBa1hY/kGCfZPuweNIb0Oqx+/RmtK8iNprhXu+Bl+vBY8rNwVj0TT3Rzgp3qyNIeXaMKpIBqpNIZYno3MB8h17HGSYNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNkYY7XN; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8712506a3eso33920566b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 00:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768897128; x=1769501928; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJbdw+xcDYuOTpLf6yNuSRnoYdJpj1gSQsdBtW0Vq6o=;
        b=PNkYY7XNtNYF0GzHt0GUf83gwU2vahRqOJ3chslV0fwZ9/xNzFF8D/XjJ/5EsDPEC1
         ThQu+tgt6xp0UQezP9N5esqpd/WR1WiheRm3okKBtsUsFYR6MPSDekmA+lIlss/vP97q
         yBvgf0pxKWwtarDcRLGrBP5trdfASoW/aYoivJZzaALNfTXbaXEU6CbrwgFPlKfl580m
         DddFKFc7aPYfrk3vL870STFs5iDc92C674MnVvvMwZhBgYfeuPijyiIwbFm0wyPzdOeA
         SrUQI9j+Vrr5GABQS2REWBPzIOQW3e5vd8YKmSnCLLggLvQxyYtDXqf/btBAaV+deGes
         G7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768897128; x=1769501928;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJbdw+xcDYuOTpLf6yNuSRnoYdJpj1gSQsdBtW0Vq6o=;
        b=odSYRZNoNihyRqCmE0Qr9qgaP8WISbMuZ6sc4N1zvyspeGDceEinn4s/gxCTk+l5An
         RwBp16UlyPTGmxtM32TtAJTeRy8h5n8mX+fOL00Ekd3ZQoo8tfSe9LLDnc9F1169sGmM
         UDDcFtfQvWtrgoafnbAHMTi2Ttt2hdLz2lnQjXZAt0WCrC8Kr0YWazwAOLmJTGX8CYUk
         65iD3kyJr2PghOB8KPZ6DcwytIJoAQJWUfUIc/HOv55xX1uL6CwCG5TSXiiExhkHvpxR
         aLHWAWEd14ZTYaFD1FPc+IHuEGt14UBGzcPV9gPBrZlJYWFTB0I33U4uoBoNgPxwTscS
         +CTA==
X-Forwarded-Encrypted: i=1; AJvYcCU2sObRNyQIWk0nvDXu+pyjuB5R70r2d/W9g3a4PJQaI0qeIKrZQAI27nuSq/JD8NRF9zUT4/jiEm4iJzcS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/XJWh7jQIYr/G+ZJ7ddCAdNRLfB1HkzNyHE03K84VJW7kZm8H
	0GFij/vPYOV4jilaEAEg37/92S9VCuBXWgz2xf3zzIqAuXi+7eoFv0po
X-Gm-Gg: AY/fxX6qMM2M8ajSF2SbgbbAAbDxdVzeHXTYTPWkkfddw82jINXZVgWYmFLRGkzR4yS
	QIjDyi5qWwdcXfKpCW1j9HEF0sxdoPpSvf+Wv1EP8R9stuyuB7IO/9eGzZolYFsyQGdyYc8kreS
	WvZcSZiYqQ4DEU37u4CaAOSe3F8f71H/J6+LwhvRdmlvV5Hu3xdhjo+kSmtlj+AztlAl3a7pEpj
	gUr4w+0todXEOcg29sLP0fB6dc9C3u+CN7IwdpedfdwDzCRhk/ZLxva+PM/LNBPtBLlE0RAXdsc
	QPeDvYzNKSnbSlKgPlT9X70kAB12VJ2qVNxgYLnWyaclQAxGA6ghDtCUy+nbj/8RAZr2K9gd0pL
	1X1KmS4ywzyACOiCLju1HNq6EEUGw5mW/z1jf/GWeHVs+r1Escrs+EXFOOrfWhMVxRMOUhVKRyH
	r5wLE=
X-Received: by 2002:a17:907:3c8a:b0:b87:6f58:a844 with SMTP id a640c23a62f3a-b8792b3a359mr743051066b.0.1768897127986;
        Tue, 20 Jan 2026 00:18:47 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:619a:24df:1726:f869])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795c38208sm1344223966b.71.2026.01.20.00.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 00:18:47 -0800 (PST)
Date: Tue, 20 Jan 2026 10:18:44 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, linux-phy@lists.infradead.org,
	davem@davemloft.net, maxime.chevallier@bootlin.com,
	alexandre.torgue@foss.st.com, mohd.anwar@oss.qualcomm.com,
	neil.armstrong@linaro.org, hkallweit1@gmail.com,
	mcoquelin.stm32@gmail.com, netdev@vger.kernel.org,
	edumazet@google.com, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, vkoul@kernel.org,
	andrew@lunn.ch, pabeni@redhat.com, andrew+netdev@lunn.ch,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [net-next,05/14] net: stmmac: add stmmac core serdes support
Message-ID: <20260120081844.7e6aq2urhxrylywi@skbuf>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>

On Tue, Jan 20, 2026 at 05:04:53AM +0000, Russell King (Oracle) wrote:
> On Mon, Jan 19, 2026 at 11:21:25AM -0800, Jakub Kicinski wrote:
> > This is an AI-generated review of your patch. The human sending this
> > email has considered the AI review valid, or at least plausible.
> > 
> > For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
> > ---
> > net: stmmac: add stmmac core serdes support
> > 
> > This commit adds SerDes PHY support to the stmmac core driver, moving it
> > from platform glue into the integrated PCS driver. The SerDes is managed
> > through phy_init/phy_exit for lifecycle and phy_power_on/phy_power_off
> > for the power state.
> > 
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > index 2f826fe7229b..4d1902f3a58f 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> > 
> > [ ... ]
> > 
> > > static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
> > > {
> > > 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> > > +	struct stmmac_priv *priv = spcs->priv;
> > > +	int ret;
> > >
> > > -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> > > +	ret = dwmac_serdes_power_on(priv);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> > > +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> > > +		if (ret)
> > > +			return ret;
> >                         ^^^^^^^^^^
> > 
> > If dwmac_serdes_set_mode() fails here, doesn't this leave the SerDes in
> > a powered-on state? dwmac_serdes_power_on() succeeded at this point but
> > there's no corresponding dwmac_serdes_power_off() call before returning
> > the error.
> > 
> > Looking at phylink_major_config(), it appears to discard the return
> > value from phylink_pcs_enable(), so the caller won't know to call
> > pcs_disable() to clean up the power state.
> 
> This AI analysis is incorrect.
> 
> By the time phylink_pcs_enable() has been called, the PCS is already
> plumbed in to phylink. It _will_ have phylink_pcs_disable() called on
> it at some point in the future, either by having the PCS displaced
> by another in a subsequent phylink_major_config(), or by a driver
> calling phylink_stop().
> 
> If we clean up here, then we will call dwmac_serdes_power_off() twice.
> 
> Yes, it's not "nice" but that's the way phylink is right now, and
> without reworking phylink to record that pcs_enable() has failed
> to avoid a subsequent pcs_disable(), and to stop the major config
> (which then potentially causes a whole bunch of other issues). I
> don't even want to think about that horrid scenario at the moment.

Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
after calling pcs_disable(), though?

I had to deal with the same issue when preparing patches that integrate
SerDes support into the Lynx PCS.

I had these patches (please pardon the unadapted commit messages for the
present situation):

-- >8 --
Subject: [PATCH] net: phylink: handle return code from phylink_pcs_enable()

I am trying to make phylink_pcs_ops :: pcs_enable() something that is
handled sufficiently carefully by phylink, such that we can expect that
when we return an error code here, no other phylink_pcs_ops call is
being made. This way, the API can be considered sufficiently reliable to
allocate memory in pcs_enable() which is freed in pcs_disable().

Currently this does not take place. The pcs_enable() method has an int
return code, which is ignored. If the PCS returns an error, the
initialization of the phylink instance is not stopped, but continues on
like a train, most likely triggering faults somewhere else.

Like this:

$ ip link set endpmac2 up
fsl_dpaa2_eth dpni.1 endpmac2: configuring for c73/10gbase-kr link mode
fsl_dpaa2_eth dpni.1 endpmac2: pcs_enable() failed: -ENOMEM // added by me
Unable to handle kernel paging request at virtual address fffffffffffffff4
Call trace:
 mtip_backplane_get_state+0x34/0x2b4
 lynx_pcs_get_state+0x30/0x180
 phylink_resolve+0x2c0/0x764
 process_scheduled_works+0x228/0x330
 worker_thread+0x28c/0x450

Do a minimal handling of the error by clearing pl->pcs, so that we lose
access to its ops, and thus are unable to call anything else (which
would be invalid anyway).

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/phy/phylink.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 32ffa4f9e5b2..a8459116b701 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -1315,8 +1315,15 @@ static void phylink_major_config(struct phylink *pl, bool restart,
 		}
 	}
 
-	if (pl->pcs_state == PCS_STATE_STARTING || pcs_changed)
-		phylink_pcs_enable(pl->pcs);
+	if (pl->pcs_state == PCS_STATE_STARTING || pcs_changed) {
+		err = phylink_pcs_enable(pl->pcs);
+		if (err < 0) {
+			phylink_err(pl, "pcs_enable() failed: %pe\n",
+				    ERR_PTR(err));
+			pl->pcs = NULL;
+			return;
+		}
+	}
 
 	err = phylink_pcs_config(pl->pcs, pl->pcs_neg_mode, state,
 				 !!(pl->link_config.pause & MLO_PAUSE_AN));
-- >8 --

-- >8 --
Subject: [PATCH] net: phylink: suppress pcs->ops->pcs_get_state() calls after
 phylink_stop()

I am attempting to make phylink_pcs_ops :: pcs_disable() treated
sufficiently carefully by phylink so as to be able to free memory
allocations from this PCS callback, and do not suffer from faults
attempting to access that memory later from other phylink_pcs callbacks.

Currently, nothing prevents this situation from happening:

$ ip link set endpmac2 up
$ ip link set endpmac2 down
$ ethtool endpmac2
Unable to handle kernel paging request at virtual address 0000100000000034
Call trace:
 __mutex_lock+0xb8/0x574
 __mutex_lock_slowpath+0x14/0x20
 mutex_lock+0x24/0x58
 mtip_backplane_get_state+0x44/0x24c
 lynx_pcs_get_state+0x30/0x180
 phylink_ethtool_ksettings_get+0x178/0x218
 dpaa2_eth_get_link_ksettings+0x54/0xa4
 __ethtool_get_link_ksettings+0x68/0xa8
 linkmodes_prepare_data+0x44/0xc4
 ethnl_default_doit+0x118/0x39c
 genl_rcv_msg+0x29c/0x314
 netlink_rcv_skb+0x11c/0x134
 genl_rcv+0x34/0x4c

However, the case where "ethtool endpmac2" is executed as the first
thing (before the interface is brought up) does not crash. What's
different is that second situation is that phylink_major_config() did
not run yet, so pl->pcs is still NULL inside phylink_mac_pcs_get_state().
In plain English, "as long as the PCS is disabled, the link is naturally
down, no need to ask".

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/phy/phylink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a8459116b701..f78d0e0f7cfb 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -2527,6 +2527,7 @@ void phylink_stop(struct phylink *pl)
 	pl->pcs_state = PCS_STATE_DOWN;

 	phylink_pcs_disable(pl->pcs);
+	pl->pcs = NULL;
 }
 EXPORT_SYMBOL_GPL(phylink_stop);

-- >8 --

