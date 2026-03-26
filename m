Return-Path: <linux-arm-msm+bounces-100145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDxEMy15xWnw+QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100145-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:21:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DD5339FC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 19:21:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA2B8312496B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 18:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E18C138D692;
	Thu, 26 Mar 2026 18:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="mAWrfpvO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ADA224B05;
	Thu, 26 Mar 2026 18:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774548735; cv=none; b=Lg9FQGLhrKKZBGru4dbte68JNzAw/QJlsOy7wu78x1hG+Snk8TxRthpvPFUgVX/m8pkeVdKEG6oQkMQuExAMvLTGRdNiq8Nuby85F0YSAYhlyifn0j/WiVAn7A0UqODCQTFcjvYqjnA3I/xfUhF52UbMQU8IPUDIx5dSahh3wTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774548735; c=relaxed/simple;
	bh=sxAmqw1lLIBgSH7InHiLoA7p1BK5TNUSniY9DyPN35E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJcis83NT9vjMXRuF6h+W8QoyfssXVsse4UCbX5xi3JgoZsu0W/3utVehHaMOOBrs7tFw8Yr3C/Sq8yLuWRFwysYRONfffFf/xH5xs8ORNT2zglvwfRxbGpvv0bWGva1JoyIjj0M988+fI3/Q4uKi+dwlnGHiIfv05ZnGkXZ7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=mAWrfpvO; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ji45NUWbwmYmtJWis87trG6dXs16U0uRXqDBTnsy5d4=; b=mAWrfpvOlFfajgP5bFr/ohHOiA
	1QPBL3YZnDhT3I0lLAI2A8ejzh1khwXIIIlePLo6ivYWUVBAGAQy6A2GU1zBq5zM1kgnU1ILI/7aT
	6+bckNXZKZfbJrK+n5XOCoOxHpWJwkcBYCUd8Py71xIDe2hKglU2ktIDZA62zvZq4GzIFu+Z42HZf
	4tD/jRwlnJmeiVEMZbzZDyxj2F3YdFmBbLa9BCXi3otIaZb1H+xuGGgTjvazJhCCtIbuLplgyZwGm
	zOMVqdlpSrwJxH6wuXq+dbMDonDyugML57jeQwYfois/7z+HMwrPJM4W3foKfQI8eEMy3WOE3WilH
	SXgUClFw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53576)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w5pBg-0000000059C-218X;
	Thu, 26 Mar 2026 18:12:08 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w5pBe-000000007Fq-2PgA;
	Thu, 26 Mar 2026 18:12:06 +0000
Date: Thu, 26 Mar 2026 18:12:06 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 03/15] net: stmmac: qcom-ethqos: eliminate
 configure_func
Message-ID: <acV29ruRVy_fcwDq@shell.armlinux.org.uk>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
 <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
 <20260326180453.GU111839@horms.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326180453.GU111839@horms.kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100145-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.975];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[shell.armlinux.org.uk:mid,armlinux.org.uk:email,armlinux.org.uk:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29DD5339FC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 06:04:53PM +0000, Simon Horman wrote:
> On Tue, Mar 24, 2026 at 01:11:44PM +0000, Russell King (Oracle) wrote:
> > Since ethqos_fix_mac_speed() is called via a function pointer, and only
> > indirects via the configure_func function pointer, eliminate this
> > unnecessary indirection.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> ...
> 
> > @@ -623,14 +627,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
> >  	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
> >  }
> >  
> > -static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
> > -				 int speed, unsigned int mode)
> > -{
> > -	struct qcom_ethqos *ethqos = priv;
> > -
> > -	ethqos->configure_func(ethqos, interface, speed);
> > -}
> > -
> >  static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
> >  {
> >  	struct qcom_ethqos *ethqos = priv;
> 
> Hi Russell,
> 
> FYI, AI generated review reports that the comment in ethqos_clks_config()
> that references ethqos_fix_mac_speed() should also be updated.

Also already noted (yesterday).

I do keep an eye on patchwork for my own patches - I have a firefox tab
permanently open for my patches in patchwork:

https://patchwork.kernel.org/project/netdevbpf/list/?submitter=165511

Thanks anyway.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

