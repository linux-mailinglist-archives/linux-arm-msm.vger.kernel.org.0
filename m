Return-Path: <linux-arm-msm+bounces-94474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJqEMoe6oWlhwAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:38:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6E71B9F49
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:38:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7C32309D260
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AFDC329C73;
	Fri, 27 Feb 2026 15:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="oAWAh2Zi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEA0328B78;
	Fri, 27 Feb 2026 15:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772206272; cv=none; b=uWgiW9EPDOyMz0YtPc8UjIGPyqvOOawcK2oYVbGFVay9ZcEwjSGcVPzXREqBcke/87IasDRTVpuijqKS2L5UYeTlpfkTbjULFcbT6tcM/whNXUZHOnr7A5b76HX2r1i1RQ8Bn9cWYkqGDvh789NWltW3fcj0I4rF+TDU/4QQGNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772206272; c=relaxed/simple;
	bh=qTfRubKpkYTZtqck1sHTwItRDcKNALL/wlr3aOAdANY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjz5FOEsQaPX/H1MOykuYRlZ+FhulJjwcHt/AKhfAHgJ9dbB+b141uvR0Frm+hniQo7H3q/LKNZXjNi7V8T//fjVBOldsIYtFPfpYADxNNAM0SNgYVMwBKvS1CLTo8u6sFUhl4aXR6+lbuqsiO9wezngWDgOxIrB3dA6xpKC4Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=oAWAh2Zi; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jQYmtftgY0RX16tXlqwd88/gJleQAzTbD+On33MM1a8=; b=oAWAh2ZiVjiMgVk8Slge/IOIaN
	A0iQ7hBunYzni7w8Ng0FoIrmJ8RE1VIdtUo/FVCZ2X1IfkDN4o6S1IHt4gZH4/V0V6uoOyInUr+pY
	u1Ewmr6fufghZoByBUwkrfeyFL0NP/FgUcfTtJfzTUYjRxatzEjr75ZBomUxHIxMwh1FK0yKC7ugj
	AU/gxAzceHRHqiHlaGJSD6u8YcoKG+f90jJ1XBABWgMtCVX0qKofWWS7b5489g2uas7cnJuogPSJM
	e09RC5oMf6AAhIwphJUFYAxFULfUqIQrc8lYFeGebgE0q9+aB/Wh0xxlwQQM3FBGza5npmdIitNtK
	5vQLIGtg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:53922)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vvznw-0000000010A-2fKv;
	Fri, 27 Feb 2026 15:31:00 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vvzns-000000003B6-2IHF;
	Fri, 27 Feb 2026 15:30:56 +0000
Date: Fri, 27 Feb 2026 15:30:56 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 0/9] net: stmmac: qcom-ethqos: further serdes
 reorganisation
Message-ID: <aaG4sBQysN0Z94E3@shell.armlinux.org.uk>
References: <aZ66OT9scKipRRu2@shell.armlinux.org.uk>
 <aZ66uXCwGgH7B_A-@shell.armlinux.org.uk>
 <aaGgWUpM2A5y11Wh@vaman>
 <20260227152707.k5lobznug3xxxc7h@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260227152707.k5lobznug3xxxc7h@skbuf>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94474-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.078];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,shell.armlinux.org.uk:mid,armlinux.org.uk:url]
X-Rspamd-Queue-Id: 6F6E71B9F49
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 05:27:07PM +0200, Vladimir Oltean wrote:
> Hi Vinod,
> 
> On Fri, Feb 27, 2026 at 07:17:05PM +0530, Vinod Koul wrote:
> > On 25-02-26, 09:02, Russell King (Oracle) wrote:
> > > Note: only 8 patches in this series, not 9 as the subject line says,
> > > as the set_clk_tx_rate() patch became part of the first series.
> > > 
> > > On Wed, Feb 25, 2026 at 09:00:41AM +0000, Russell King (Oracle) wrote:
> > > > This is part 2 of the qcom-ethqos series, part 1 has now been merged.
> > > > 
> > > > This part of the series focuses on the generic PHY driver, but these
> > > > changes have dependencies on the ethernet driver, hence why
> > > > it will need to go via net-next. Furthermore, subsequent changes
> > > > depend on these patches.
> > 
> > This lgtm, can we get signed tag so that we can pull this into phy tree
> > as well
> 
> I think this series is obsolete. It has been superseded in the netdev
> patchwork by:
> 
> [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further serdes reorganisation
> ├─>[PATCH RESEND2 net-next 1/8] net: stmmac: qcom-ethqos: move ethqos_set_serdes_speed()
> ├─>[PATCH RESEND2 net-next 2/8] phy: qcom-sgmii-eth: add .set_mode() and .validate() methods
> ├─>[PATCH RESEND2 net-next 3/8] net: stmmac: qcom-ethqos: convert to use phy_set_mode_ext()
> ├─>[PATCH RESEND2 net-next 4/8] phy: qcom-sgmii-eth: remove .set_speed() implementation
> ├─>[PATCH RESEND2 net-next 5/8] phy: qcom-sgmii-eth: use PHY interface mode for SerDes settings
> ├─>[PATCH RESEND2 net-next 6/8] phy: qcom-sgmii-eth: remove qcom_dwmac_sgmii_phy_interface()
> ├─>[PATCH RESEND2 net-next 7/8] phy: qcom-sgmii-eth: relax order of .power_on() vs .set_mode*()
> └─>[PATCH RESEND2 net-next 8/8] net: stmmac: qcom-ethqos: remove phy_set_mode_ext() after phy_power_on()
> 
> (with which it is only partially overlapping)
> 
> I guess you should give your Acks there as well.

No need. Looking at PW, it seems patch 7 has AI review issues, so will
need to be re-sent - although I can't fathom what the AI found in patch
7. I've already added Vinod's acks (since they were just resends to fix
botched sending, no actual changes in the patches themselves.)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

