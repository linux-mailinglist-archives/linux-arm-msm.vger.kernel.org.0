Return-Path: <linux-arm-msm+bounces-96194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AONlFpCdrmk7GwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:14:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 530BE236DA4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 11:14:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 282553009802
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 10:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA32638E118;
	Mon,  9 Mar 2026 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gjO6nNGZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D1B38E128;
	Mon,  9 Mar 2026 10:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051271; cv=none; b=AxZ4dmvfSrLcoKB9kaypwd1NE60GpPz6b2Dy8IGUH4RgbpPXnrXhp22S42VWeUkLMAzparPbrztkYhxOK701vKyKFvGUpwdt6s1caZN+b5gdKw9q7wP10xwDe08b1dGYFDFDZejUf88O0liICeo51S/5D1l9spuNPuIEzqK0VSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051271; c=relaxed/simple;
	bh=1lP/kjBmNsqQJ31uYFevxonVc4fUtm8RHiROqmdKA1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yt31Ji7ILeH87+wgl8cu3iDmR+RBXMQUJxZ1ozCstjiKBd9lGs/7pYLBx3zYyFvqt3Ks99hI+7cHf7Fx5yK4DeGnmKVfpsbiNYPTBo7H1SokIisu26bu3BcWVi5OSHg6R5ADWHMGe0agf9ax5Hh5wkfofl0jvWtTegE2utZbHfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=gjO6nNGZ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=JQCAnUp7//V84f3pl77t9PEUZW5Z6f4XI9axZUwQSpE=; b=gjO6nNGZJMw2ib+A7rYOZ/Lfp6
	EvWePfBeLy40Gmt3Be9/E1FiJhzGv1F0eJ0HgYLYDU5S+nIkqAZb2kQZ3LBJqIW/58OkWuMIFzgAa
	EOi31iaGawCON0kunT882/6dSCR63dxCIpyoyaMJ3txpgEJEkBht/dcUgg2ZO9hMfXK9/2d9XYg5D
	+DvPE2jSb/LwDpcpab5u9Udece83MQMxKqeme+EQPy6VDfB7KeYNGhN8R2U+BAVE16glZ94qFkhBP
	JxFd4Mke/czOAluzjcBTREAhI1F6gJxMvtpV5KO69y4NGpDjPMR8q+LirGuwA9hXiNw7r2VD4Bv0b
	iR1POeXw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54824)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vzXcw-000000003aa-0iHa;
	Mon, 09 Mar 2026 10:14:18 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vzXct-000000004EK-2MNk;
	Mon, 09 Mar 2026 10:14:15 +0000
Date: Mon, 9 Mar 2026 10:14:15 +0000
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
Message-ID: <aa6dd6vQWex9Kinv@shell.armlinux.org.uk>
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
X-Rspamd-Queue-Id: 530BE236DA4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96194-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_SPAM(0.00)[0.086];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,shell.armlinux.org.uk:mid]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 01:16:47AM +0530, Mohd Ayaan Anwar wrote:
>   - Link up at 2.5G, 1G, and 100M is fine (phylink logs below). The PCS
>     link takes a moment to stabilize, but after that it's stable.
>   - The warning ("PCS configuration changed from phylink by glue;
>     ANE 0 -> 1") is observed when the link comes up at 1G/100M.

Something else to try...

It may avoid some PCS link state bouncing if the writel() came before
the printing of the changes in dwmac_ctrl_ane(), as printing those
changes will be relatively slow.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

