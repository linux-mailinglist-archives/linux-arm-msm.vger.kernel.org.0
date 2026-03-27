Return-Path: <linux-arm-msm+bounces-100209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 7mOJNiVDxmmgIAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100209-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:43:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D58E53412AA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F41433012237
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 08:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BD433D7D97;
	Fri, 27 Mar 2026 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="CqIo8RuG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D363D170E;
	Fri, 27 Mar 2026 08:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600992; cv=none; b=I0doVWR8lCSa/gC7C09Pu13ZMbj7P+qTiz5AclDjPwy5PlPm+kNJ849MCYKB6rvIPCfmkPkx6HcNR/O/X/aysZmZ3uIraYoc7xpw9gJp6iDy6kYaVRK7BCy6/GHN5YgEzk+Eb9mNW5eg7QxuEWuVyh2AG+1yTTs/0Jvslm5++es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600992; c=relaxed/simple;
	bh=39peiktsaFZkLRaKBapHI9tqo7o5pirrhYY5lGEIyus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oz8RZN2MzWP70/gB1OGrpc1Dilo5RRmofvuA87fTqtW0YahKE5kdoYR8URzj0NxuwXvDTmzNhcwMnj2NrySOBfAl2K/V+WYagES8dJAGGKviDsaGNG75z3/thIOntnJY94c01/KVGEAJxEzJYPZvdcmq0NsTIjQJVqzgEKZczCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=CqIo8RuG; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bs5JFlI0fqgJR6o0K6Prq9ED/CcnFGO8oBoULAy4wJM=; b=CqIo8RuGIP+k5XqO3bGvU9yQrk
	LNaluosJn0UhU0kRJP3NvqxWMcK7RllkIT8LVRIRR5lTiKwKLpYmWm/jf7OIGox62mPibeoaQ74CP
	h/9iIudbeTytF4KlhsUUQGpM/eF9zZa3ENxIt/rGrAJ5DOjTofbwVtWXgSoiYtzSuV7Z7X9A/hL30
	AniE2poGYTRgvFKR+mkl2dUfs9/aL2f83hRzlfaf3j+nKiClfQqZ/27mK57AvxDm30e94V5Tqs0fu
	53b5YmcdNk9VWCnYrwOTmCy25B0iH6/e68SX8ZWrsPbGTO/IWN9gPjb0+ZU5ac+7MIr7kmv7unRIe
	HuLO+s8A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:45852)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w62mT-000000005o4-2GVA;
	Fri, 27 Mar 2026 08:43:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w62mQ-000000007uQ-12rM;
	Fri, 27 Mar 2026 08:42:58 +0000
Date: Fri, 27 Mar 2026 08:42:58 +0000
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
Subject: [PATCH net-next v2 00/15] net: stmmac: qcom-ethqos: more cleanups
Message-ID: <acZDEg9wdjhBTHlL@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100209-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.755];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D58E53412AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Further cleanups to qcom-ethqos, mainly concentrating on the RGMII
code, making it clearer what the differences are for each speed, thus
making the code more readable.

I'm still not really happy with this. The speed specific configuration
remains split between ethqos_fix_mac_speed_rgmii() and
ethqos_rgmii_macro_init(), where the latter is only ever called from
the former. So, I think further work is needed here - maybe it needs
restructuring into the various componenet parts of the RGMII block?

v2:
- patch 2: fix typo in commit message
- patch 3: fix ethqos_fix_mac_speed() comment

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 220 ++++++++-------------
 1 file changed, 87 insertions(+), 133 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

