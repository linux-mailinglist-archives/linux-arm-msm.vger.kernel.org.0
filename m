Return-Path: <linux-arm-msm+bounces-97615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ++K6tatGklmQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97615-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:42:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B243C288DAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 19:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB31B300C381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 18:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 190753DF005;
	Fri, 13 Mar 2026 18:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="k0QvlEX9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414E93DEFE0;
	Fri, 13 Mar 2026 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773427347; cv=none; b=X6ZtADEy2NR8P4/uiiW0cwS33uXuCEnMzelzHWb6UIlOqae55JfrvlClPl8+gGFFrZ66MwSAnLBThiGt2xb7Xm2arAiIQDh3YfoP7UQWcQGky9bxB8UsEiQHLmyD+1Ser3mwIaGXpFvvPgbvk7q1c0C6pOrakqtxhxMFFK5F3gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773427347; c=relaxed/simple;
	bh=1hBR7tyfafcC4/nQN+G4eGQznYpRC+Kh+gvdChubNv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FK8snrxW2FIdK/V4N5l/Zx63HTIuFYcmQ4SuRymulQy9TFZSKVh6V4AAoAY+9Z9csjPqy5FlRCwlm4PLJCIin8X4sGfhdUNwmOSUgi8+Ob/0isjCELB/etxPl4wPnWBnmpOt8YdRGV2xDnIcVUBeLOTcNaAJGWSBxu5FqxQa29I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=k0QvlEX9; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6tdpzCjfd9Ry9f1CUsXXFtWyu0Swm3ZLAk7lZVu01fo=; b=k0QvlEX9IYsfeTo+hPcc2ovRdk
	E3ERkxj1kciouvsK0NuqjZC2XrplYyqUqMJakrTRYFPPB5s21rLvjoN5A+I+hhrLvk+iCJo6QdfWp
	tPAiSpAdnyzYKnClPN/vQzFaswO01+mHVby6ji+Tww2Rx2lbhVQlNTXAPKV7IqRNhkHk7YtUHJsec
	w2gwBldUXZYtBFnXXzqfSwL4UlI7iuFDKdNbGKOm4Qq9roL++w/Sn8TodY+0H0q9kbi1gQePDeUhN
	jNEKg4FpGInqMpWjyH4sP4cD39rBbcY9I3d3BSaidaM+dSDXhitpMEb9XQnngRAKTuIwHCELdlSFz
	29NWMItA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54202)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w17Sk-000000001PR-2lDL;
	Fri, 13 Mar 2026 18:42:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w17Si-000000008RT-2T8o;
	Fri, 13 Mar 2026 18:42:16 +0000
Date: Fri, 13 Mar 2026 18:42:16 +0000
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
Subject: Re: [PATCH net-next 8/8] net: stmmac: report PCS configuration
 changes
Message-ID: <abRaiCW9oJ8IfFcy@shell.armlinux.org.uk>
References: <abQC7r38QLhSeadl@shell.armlinux.org.uk>
 <E1w11dz-0000000DEie-3fyA@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1w11dz-0000000DEie-3fyA@rmk-PC.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97615-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.850];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: B243C288DAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 13, 2026 at 12:29:31PM +0000, Russell King (Oracle) wrote:
> +#define REPORT_BIT(x) \
> +		if (diff & GMAC_AN_CTRL_##x) \
> +			pr_warn("dwmac: %8s %u -> %u\n", #x, \
> +				!!(old & GMAC_AN_CTRL_##x), \
> +				!!(value & GMAC_AN_CTRL_##x))
> +		REPORT_BIT(ANE);
> +		REPORT_BIT(SGMRAL);
> +#undef REPORT_BIT

I see checkpatch wants the if() inside the macro to be wrapped in a
do-while loop, which is overkill for this - this is not a macro that
is used throughout the kernel, it's only used in the next two lines
where we can plainly see that this is safe. There is no need to make
this unnecessarily more complex - and thus less readable.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

