Return-Path: <linux-arm-msm+bounces-102820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ5AOOGz2mkh5ggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 22:49:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 415013E1AF7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 22:49:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 864453010B97
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 20:49:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614963033FD;
	Sat, 11 Apr 2026 20:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="BcaIp8h+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0932E7631;
	Sat, 11 Apr 2026 20:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775940570; cv=none; b=ROhucR8WWwJJiB35aLUVZtMJI+PNQxe/HKI3NMU+Ne5EwV/b0nSiUNb9CK3cFCXWqeLXbldS7ZIYCZ9J7f4s916KWHGK0NGlGBfIv49sjMZYTO8ZaAQDmIptCPiOib9L3qTJ0GDmrba189Siy2kFiOduGrNNKe0Kht5NOEETvS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775940570; c=relaxed/simple;
	bh=IBU08TuGt+sf5gJ0fylYpY6O0lt0iJjIbLbyJfL78IA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQVT4SzCoLhKpkGAj1MQFlrSRbjCRKk63PCS79J9l7x8HzKstcL9qTKUwqYnp0EPH0zkaAAjN4hpnGK2sRauegQ+Z8Zy9Yp4v102BkzGiu+u5pG3dD2ucZFPfbBs8nkssZJRIZbAuOJ31GGO1EhW4rAgtsWrr+h7RNoFHmWXwxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=BcaIp8h+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7jN0LBPnhjydcMAAV9YvvAGefShdhC9kez9yB5nvWOs=; b=BcaIp8h+gOclDjHpSiS65B5Tnk
	TIIhLoRBQutIIR16VTXj5kxTJFefbvHqHmSO39q72pxsCShja3NcZmj0Gm2WaNxCc+NAU6Zx10xtI
	t1gQ+7Lz6sROnNY/6SdfBOtLCLemz5Iq3J74aWI3XYxT61rSCgtKzrqrauGKXb8fU+nk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wBfGb-00FkPY-Nf; Sat, 11 Apr 2026 22:49:21 +0200
Date: Sat, 11 Apr 2026 22:49:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>, thomas.petazzoni@bootlin.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net] net: phy: qcom: at803x: Use the correct bit to
 disable extended next page
Message-ID: <dbd60257-3327-466d-865b-2ca9c6af8370@lunn.ch>
References: <20260410171021.1277138-1-maxime.chevallier@bootlin.com>
 <4b386a4a-9743-4e79-8d3d-3576bb9de492@lunn.ch>
 <c37f182e-cbb4-4f0b-817a-759d39940212@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c37f182e-cbb4-4f0b-817a-759d39940212@bootlin.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102820-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,lunn.ch:dkim,lunn.ch:email,lunn.ch:mid]
X-Rspamd-Queue-Id: 415013E1AF7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

> > Should we keep ADVERTISE_RESV?
> > 
> >   45.2.7.6 AN advertisement register
> > 
> >   If the Auto-Negotiation advertisement register (register 4) is
> >   present, (see 28.2.4.1.3), then this register is a copy of the
> >   Auto-Negotiation advertisement register (register 4). In this case,
> >   reads to the AN advertisement register (7.16) report the value of
> >   the Auto-Negotiation advertisement register (register 4); writes to
> >   the AN advertisement register (7.16) cause a write to occur to the
> >   Auto-Negotiation advertisement register.
> > 
> > So MDIO_MMD_AN:MDIO_AN_ADVERTISE is a straight copy of MII_ADVERTISE.
> > 
> >         ef4_mdio_write(efx, MDIO_MMD_AN, MDIO_AN_ADVERTISE, reg);
> >         ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_ADVERTISE, adv);
> > 
> > So ADVERTISE_XNP is just as valid in the other two drivers using
> > ADVERTISE_RESV. I think we should change those as well to
> > ADVERTISE_XNP and remove ADVERTISE_RESV?
> > 
> > 	Andrew
> 
> I agree with that yes and I've considered converting these drivers once
> we have net merged into net-next should this patch be applied :)

Ah, sorry, missed the patch was targeting net. Please do submit a
cleanup for net-next later on.

> That said, ADVERTISE_RESV is in uapi, is it even possible to remove it ?

Good point. It probably does have to stay.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

