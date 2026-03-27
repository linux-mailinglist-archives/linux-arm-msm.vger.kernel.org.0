Return-Path: <linux-arm-msm+bounces-100232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPjKIZhMxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:23:36 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C469341A57
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:23:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9983230255F4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F763DB653;
	Fri, 27 Mar 2026 09:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkxF6S0B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA40A3DA7F6;
	Fri, 27 Mar 2026 09:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603412; cv=none; b=r1u1esGyZbsa/gqIgvVYy3LkCSmLs1UWzXwpcgqgXbwhoFgro828vH32Anh7AzWnKr706BjoxF3xcrEtPOZY1K8IqxPgFEzQ7+Bbeo4IQR4N/An6Jst64TtVk7olkLZg6CTa/fBUhwhz3xVR23mnxDvakT7r442FPHia9mkO1OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603412; c=relaxed/simple;
	bh=UUG2DpyL+eUgewSKD3Yd9/PcZ1TPr1oUxFvTW/dSkKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yu9dhBeplIs5A4b6H6uvPCDMiRcvn6ZI5Pi6qOktANOSp6v3DhXsirHwZeWE7cTT/fZt1sqqi6W0yAw+3wzfTTYS1kfBtSWrTQJKkQGBQTP8AWYMs/Erh5lB29OJrW+8l7Lb2/nBioreChJ5jEs3v8t1hnwZhHDDReDErxmRQts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkxF6S0B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C0EC19423;
	Fri, 27 Mar 2026 09:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774603412;
	bh=UUG2DpyL+eUgewSKD3Yd9/PcZ1TPr1oUxFvTW/dSkKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkxF6S0BiL0pUMCoaFi5uLzUqKys1/B/6mt3ukZHPLBa5qEd7hdlLFCxl+Gl75d4a
	 Q6SmC/Vi4JBGKgSYfu/rgGMW0d+oawHZ0jiCn1gdZ1F365s5z4nko5D6qYe4S3Iwcd
	 IQxsqx4hhrYj/h/eYjDeRpi4tWnh01zkzqLoOfbJm3xT0hgNoY/ld1VKopZv9ZdgSz
	 f0ieMUCtFrO2RgZ7tA2E+VSm16BxnaOdxlHNuyR4YWVKbr9pxd6bHP8fNq0b24No7N
	 siyHOR6Zpd82Q1sWqO6bVxxMganoTMAAzr0OA75MU3GkWqiZ2lSeUxD5XnXAj4W8W8
	 sEdoTraxOBzKg==
Date: Fri, 27 Mar 2026 09:23:27 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Message-ID: <20260327092327.GA111839@horms.kernel.org>
References: <acKNcX5PqtWYf8m3@shell.armlinux.org.uk>
 <E1w51Xs-0000000DwVV-2bnh@rmk-PC.armlinux.org.uk>
 <20260326180453.GU111839@horms.kernel.org>
 <acV29ruRVy_fcwDq@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acV29ruRVy_fcwDq@shell.armlinux.org.uk>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-100232-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[horms@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3C469341A57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 06:12:06PM +0000, Russell King (Oracle) wrote:
> On Thu, Mar 26, 2026 at 06:04:53PM +0000, Simon Horman wrote:
> > On Tue, Mar 24, 2026 at 01:11:44PM +0000, Russell King (Oracle) wrote:
> > > Since ethqos_fix_mac_speed() is called via a function pointer, and only
> > > indirects via the configure_func function pointer, eliminate this
> > > unnecessary indirection.
> > > 
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > 
> > ...
> > 
> > > @@ -623,14 +627,6 @@ static void ethqos_configure_sgmii(struct qcom_ethqos *ethqos,
> > >  	ethqos_pcs_set_inband(ethqos, interface == PHY_INTERFACE_MODE_SGMII);
> > >  }
> > >  
> > > -static void ethqos_fix_mac_speed(void *priv, phy_interface_t interface,
> > > -				 int speed, unsigned int mode)
> > > -{
> > > -	struct qcom_ethqos *ethqos = priv;
> > > -
> > > -	ethqos->configure_func(ethqos, interface, speed);
> > > -}
> > > -
> > >  static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
> > >  {
> > >  	struct qcom_ethqos *ethqos = priv;
> > 
> > Hi Russell,
> > 
> > FYI, AI generated review reports that the comment in ethqos_clks_config()
> > that references ethqos_fix_mac_speed() should also be updated.
> 
> Also already noted (yesterday).
> 
> I do keep an eye on patchwork for my own patches - I have a firefox tab
> permanently open for my patches in patchwork:
> 
> https://patchwork.kernel.org/project/netdevbpf/list/?submitter=165511
> 
> Thanks anyway.

Thanks, and sorry if you told me this before.
I'll try to remember and not spam you with these things going forward.

