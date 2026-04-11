Return-Path: <linux-arm-msm+bounces-102788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q5PQA+VW2mng0QgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102788-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:12:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0743E0439
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 16:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3A81301AD1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 14:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86BB36606E;
	Sat, 11 Apr 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="4eoPeViN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA936606B;
	Sat, 11 Apr 2026 14:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775916635; cv=none; b=Z1jHFpU+vLqhjwRXKJ6nPxzhsQ2zo6HUhTM1bGNwT4ZvrDNbsHZW2C/jVzaZf4tSTgVHwfrHc+Bfb3j1Ed+lkggBp9Mgl87Zhug2y2Tsm/DMtQ2IhAEtFKZ+plFvgCFDKi99IxMzk4ZFcTRDxkEkWDK/P/tpRRuZgVw43k7KUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775916635; c=relaxed/simple;
	bh=og1Zf0xm0Y3R1Knlqb3VZlP4xteh0ENec1rvQw24Uh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kNNA0QjkRT4UcKEMP1pQwt9YuW00w/Ub8OFYA9f/6o05e8NIuo4rJIiZB8qes8KN4B8kuoy0VSEWc+/kQ7iXWPzNCm71J3nwCoJpNtuclGLQzqWEWkOtYSyYI4WAbwZ9II6qxOsxSngZE2yIMDjeyvvtATQfFwwpd0w/BqFzZ2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=4eoPeViN; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=88MTXw8N+31wabs8na0R4CA6hvUcmifz93KduLO3L0c=; b=4eoPeViNm5641Vr1zk2JPfvBsk
	L6hkp9iuueaxE6L6pED1HhLv+UnAjaiH/OnU2Y9lVtllA+yH7xDu2I/jABXo3NwnVGEBjCRikdK1H
	bjRznDcYqqQBdBtEDiqIheMZT6iW/vLKPI9UDAgIFs6Q1dshU7jQr8P5D+IOgAue04xs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wBZ2V-00Fibs-M9; Sat, 11 Apr 2026 16:10:23 +0200
Date: Sat, 11 Apr 2026 16:10:23 +0200
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
Message-ID: <4b386a4a-9743-4e79-8d3d-3576bb9de492@lunn.ch>
References: <20260410171021.1277138-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410171021.1277138-1-maxime.chevallier@bootlin.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102788-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid]
X-Rspamd-Queue-Id: 4A0743E0439
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 07:10:20PM +0200, Maxime Chevallier wrote:
> As noted in the blamed commit, the AR8035 and other PHYs from this
> family advertise the Extended Next Page support by default, which may be
> understood by some partners as this PHY being multi-gig capable.
> 
> The fix is to disable XNP advertising, which is done by setting bit 12
> of the Auto-Negotiation Advertisement Register (MII_ADVERTISE).
> 
> The blamed commit incorrectly uses MDIO_AN_CTRL1_XNP, which is bit 13 as per
> 802.3 : 45.2.7.1 AN control register (Register 7.0)
> 
> BIT 12 in MII_ADVERTISE is wrapped by ADVERTISE_RESV, used by some
> drivers such as the aquantia one. 802.3 Clause 28 defines bit 12 as
> Extended Next Page ability, at least in recent versions of the standard.

> Let's add a define for it and use it in the at803x driver.

I agree with this, it defines the C22 4.12 bit. And this is what the
at803x driver is using it for.

>  static void at803x_link_change_notify(struct phy_device *phydev)
> diff --git a/include/uapi/linux/mii.h b/include/uapi/linux/mii.h
> index 39f7c44baf53..61d6edad4b94 100644
> --- a/include/uapi/linux/mii.h
> +++ b/include/uapi/linux/mii.h
> @@ -82,7 +82,8 @@
>  #define ADVERTISE_100BASE4	0x0200	/* Try for 100mbps 4k packets  */
>  #define ADVERTISE_PAUSE_CAP	0x0400	/* Try for pause               */
>  #define ADVERTISE_PAUSE_ASYM	0x0800	/* Try for asymetric pause     */
> -#define ADVERTISE_RESV		0x1000	/* Unused...                   */
> +#define ADVERTISE_XNP		0x1000  /* Extended Next Page */
> +#define ADVERTISE_RESV		ADVERTISE_XNP /* Used to be reserved */

Should we keep ADVERTISE_RESV?

  45.2.7.6 AN advertisement register

  If the Auto-Negotiation advertisement register (register 4) is
  present, (see 28.2.4.1.3), then this register is a copy of the
  Auto-Negotiation advertisement register (register 4). In this case,
  reads to the AN advertisement register (7.16) report the value of
  the Auto-Negotiation advertisement register (register 4); writes to
  the AN advertisement register (7.16) cause a write to occur to the
  Auto-Negotiation advertisement register.

So MDIO_MMD_AN:MDIO_AN_ADVERTISE is a straight copy of MII_ADVERTISE.

        ef4_mdio_write(efx, MDIO_MMD_AN, MDIO_AN_ADVERTISE, reg);
        ret = phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_ADVERTISE, adv);

So ADVERTISE_XNP is just as valid in the other two drivers using
ADVERTISE_RESV. I think we should change those as well to
ADVERTISE_XNP and remove ADVERTISE_RESV?

	Andrew

