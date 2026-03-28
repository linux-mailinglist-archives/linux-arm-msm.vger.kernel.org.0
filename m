Return-Path: <linux-arm-msm+bounces-100528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLrlLOWJx2lRYwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 08:57:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BC34DB77
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 08:57:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95D01301A78A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 07:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3381737187A;
	Sat, 28 Mar 2026 07:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="r644oDVy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EA93F9FB;
	Sat, 28 Mar 2026 07:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774684642; cv=none; b=O4E8nCxZtWVhdFxFuGdC6qqCYGrJq3hWrxBNFxyQrOhSfhGCTzM5cvmXIOCRkVSn56EHjSzaKldZQuvMecAP93XPjg+9h9JBcLvMaD4PIxiwcwvcD2Fn8RosB7EacfrvMaF5aenh+i4s17FqGHb2F2UBg5r7GDJO201iarSst58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774684642; c=relaxed/simple;
	bh=HjeG4oMsPXrMWOovrOV1iD4NE+QRpxLuDyZiFhW+sVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vi5wEg8WuHKEdVsLvuLirlw72QWt2HgtlDN2K5m3FjoK6dU2hqy6/Ryuxe7AxtCitCyd0qsTIQppherv+iwOwHDU6bS7bMJsaI9Mln9x9aTEQrSDYGkF8gO6TKKOTTz+IqE/M9Jl0PjKafee46ApRUefrPnTXSulTfMYjdkZEK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=r644oDVy; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+LoOZn3v94QiOgVjPkKxzDKU/RFUoSB5XRbx6p7b+DQ=; b=r644oDVyLnyUEceUBloN04Wi1i
	HG5BS8wP0wuCbnrBumQgdGPInRO1wusoI+THwSJvbiL/8B+X7SQyb9h3kVY/Fmee67VwJmvguxLNb
	w5ki4vAtVY1x2nBiZrzJIE6X3yUEWjMAXX/Vw0IC/bp+T6Zrj70S+ojLcgcNHzhkesMhmU568udaJ
	PqFIeHFUiqMVYZnbxGVWgJVjFLgfrm73T/1RY88KkX9F5SBZncWAoOdgX+3MBXYx+gFm+udexfpGp
	JdUjZLngZvHiQOr7ojLrpKeBF2KyLXTnbrGEGJEtBxJ/iM/pGPoydZX1E0MYPmzf/0cxQqBrXrzpH
	lpEvAaBg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49052)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w6OXj-0000000072B-1RuQ;
	Sat, 28 Mar 2026 07:57:15 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w6OXg-000000000Ux-0mXz;
	Sat, 28 Mar 2026 07:57:12 +0000
Date: Sat, 28 Mar 2026 07:57:11 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next v2 03/15] net: stmmac: qcom-ethqos: eliminate
 configure_func
Message-ID: <aceJ18UxKMM_PxHk@shell.armlinux.org.uk>
References: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
 <E1w62n4-0000000E3C3-251S@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w62n4-0000000E3C3-251S@rmk-PC.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100528-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.722];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 489BC34DB77
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 08:43:38AM +0000, Russell King (Oracle) wrote:
> @@ -687,7 +683,7 @@ static int ethqos_clks_config(void *priv, bool enabled)
>  		/* Enable functional clock to prevent DMA reset to timeout due
>  		 * to lacking PHY clock after the hardware block has been power
>  		 * cycled. The actual configuration will be adjusted once
> -		 * ethqos_fix_mac_speed() is invoked.
> +		 * ethqos' fix_mac_speed() method is invoked.

...

> -		ethqos->configure_func = ethqos_configure_rgmii;
> +		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
...

> -		ethqos->configure_func = ethqos_configure_sgmii;
> +		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;

AI review of this patch is still complaining about the comment above:

  The comment still references 'fix_mac_speed() method' but the function
  ethqos_fix_mac_speed() was removed in this patch. Should this comment be
  updated to reference either ethqos_fix_mac_speed_rgmii() or
  ethqos_fix_mac_speed_sgmii(), or perhaps just 'the fix_mac_speed callback'
  to remain implementation-agnostic?

Artifical Stupidity at its best! :/

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

