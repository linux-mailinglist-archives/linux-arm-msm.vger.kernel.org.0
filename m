Return-Path: <linux-arm-msm+bounces-90042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJECEf7ycGk+awAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:38:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A632259526
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 16:38:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9308DA6DF0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 14:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF644A33FC;
	Wed, 21 Jan 2026 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="e9bH30Xy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB394A2E3F;
	Wed, 21 Jan 2026 14:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006824; cv=none; b=YhBBRoK51OB+uCreJSDfOItN4CCWEH2NuswbfxJ3SEHZdUzOsBai8AvlModjtlK05tTuUkJlmR3sjYJq8bIUskt9bkBrQMBfhHASszLpYgAQVdZZ19M+ULrb+Y9XEHeTmxuiSi6hnUX4lHvU7Aau6YWkKYU7td4x75rZ/FSjOKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006824; c=relaxed/simple;
	bh=gxrQhTzqiEfgykGYtFJd73MPaMjNwkc3LNo3263Q0sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BrRsBvWeABrMOZade+CJHh56+zK0JQqHlplbbItV+dkSy0jHuO2wyrUuGd1r6dqseS62Ipv4S9t6BOBXgEbhFo6algKuQt64cIJ7s2J+uf+wmqmGP2lDkBOFv8byoLXAYWA9oztinSVv225OYbQAFnT2TGgJ4SJ6my3yOjAIkxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=e9bH30Xy; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iStF1+0UpaSNBxFtH2LAPTY4dVGLGH3AvGpTjjJnIHU=; b=e9bH30XyD6pkMJHTgoZwJ7SBsQ
	0CLCJyQaHxcYuc61vX87CjlwIjH755e5RfCQJ0Wfv4lNRlzSX2yX9k/kwo8QWMtpWhfVnPgANvDB9
	kl123aZe/rSEj8KpIBeh0lPIAMVOWTc19dGF+NdztKgvvnA+5BX7opil0piY56CwJO20tSmz1Xlko
	pzBMbMVUUyaGXSsIrFSc5JdeRIYiwiAV1GpaVlXdZ0VTRxn+jcebBR5roWfde62EU7wcfzvg9tR3Q
	9GmdzF0i47FizmPYPrE1/KUuNR/fwPn0E/d24rqa7i7R6bhkesWWIr0GN+RCRzFGiFUEkdThXAtTj
	trX0GOiA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36082)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1viZTt-000000007c8-10Ub;
	Wed, 21 Jan 2026 14:46:49 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1viZTm-0000000005o-2xDz;
	Wed, 21 Jan 2026 14:46:42 +0000
Date: Wed, 21 Jan 2026 14:46:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Vladimir Oltean <olteanv@gmail.com>
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
Message-ID: <aXDm0jVOYOZ9l6Wu@shell.armlinux.org.uk>
References: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
 <20260119192125.1245102-1-kuba@kernel.org>
 <aW8M9ZiiftGBQIRM@shell.armlinux.org.uk>
 <20260120081844.7e6aq2urhxrylywi@skbuf>
 <aW9VHt6meEJFxV0I@shell.armlinux.org.uk>
 <20260120121114.2aedgu42i2wax3yp@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120121114.2aedgu42i2wax3yp@skbuf>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : No valid SPF,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90042-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[kernel.org,lists.infradead.org,davemloft.net,bootlin.com,foss.st.com,oss.qualcomm.com,linaro.org,gmail.com,vger.kernel.org,google.com,lunn.ch,redhat.com,st-md-mailman.stormreply.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: A632259526
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Jan 20, 2026 at 02:11:14PM +0200, Vladimir Oltean wrote:
> On Tue, Jan 20, 2026 at 10:12:46AM +0000, Russell King (Oracle) wrote:
> > First, I'll say I'm on a very short fuse today; no dinner last night,
> > at the hospital up until 5:30am, and a fucking cold caller rang the door
> > bell at 10am this morning. Just fucking our luck.
> 
> Sorry to hear that.
> 
> > On Tue, Jan 20, 2026 at 10:18:44AM +0200, Vladimir Oltean wrote:
> > > Isn't it sufficient to set pl->pcs to NULL when pcs_enable() fails and
> > > after calling pcs_disable(), though?
> >
> > No. We've already called mac_prepare(), pcs_pre_config(),
> > pcs_post_config() by this time, we're past the point of being able to
> > unwind.
> 
> I'm set out to resolve a much smaller problem.
> 
> Calling it a full "unwind" is perhaps a bit much, because pcs_pre_config()
> and pcs_post_config() don't have unwinding equivalents, unlike how
> pcs_enable() has pcs_disable(). I don't see what API convention would be
> violated if phylink decided to drop a PCS whose enable() returned an error.

While pcs_pre_config() and pcs_post_config() do not have unwinding
equivalents (what would they be?) the issue here is that these could
have changed any state that isn't simply undone by calling
pcs_disable().

For example, pcs_pre_config() could have reprogrammed signal routing,
clocking, or power supplies to blocks.

This already applies to Marvell DSA pcs-639x.c, where the pre/post
config hooks change the power state of the PCS block (for errata
handling), and the only way that gets undone is via a call to
pcs_disable() which explicitly disables IRQs and power for the PCS. Its
pcs_disable() isn't a strict reversal of pcs_enable(), it does more.

We already declare the interface to be dead on pcs_post_config()
failure, but we don't do that for pcs_enable() failure.

Maybe I need to explicitly state that pcs_disable() does not directly
balance pcs_enable(), but that _and_ the effects of pcs_pre_config()
and pcs_post_config(). However, that itself will add to the problems.
What if pcs_pre_config() and pcs_post_config() succeed but not
pcs_enable()? pcs-639x needs pcs_disable() to be called, but if we
require pcs_disable() to be balanced with a successful call to
pcs_enable(), that messes up that driver, and pretty much makes it
impossible to work around the errata.

If you feel strongly about this, then the only thing I can think of
doing is to move this SerDes support out of stmmac and into phylink
(which is a point I already raised in the cover message) so that
its failure can be dealt with at the higher level, where we can
ensure that phy_power_off() is balaced with phy_power_on(). However,
that means pushing even more of the stmmac specific "we need the
clocks running to access registers XYZ or reset" weirdness into
phylink.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

