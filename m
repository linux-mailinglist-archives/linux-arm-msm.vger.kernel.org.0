Return-Path: <linux-arm-msm+bounces-96399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADIDDA5dr2lKWAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96399-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:51:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 795C0242C0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 00:51:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F22C63033512
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 23:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00E528689B;
	Mon,  9 Mar 2026 23:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWqoBoPb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC22A3D544;
	Mon,  9 Mar 2026 23:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773100291; cv=none; b=dlhWVKmW0TUnaayXn3zP5QDcqG55bDzhcBDlkalXSYk/a2SnOUkRe4SUneRWAX0mg9UiqkuwBKrI6xUtbJtCHam0NzB5SihnSDAFpHn3HMws+RPNK2tmdW2yHh2zC8vuhKJ8egUgT0QDqWJPIKSAorqWz/TqI8VhAsicfzomKGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773100291; c=relaxed/simple;
	bh=AnnEM0AEOjnmbxyb5EEXI/jarl/KqCoDW6tKbthKBzI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtE7qUebfi/bQ4MeC/Q5cOJrGOp1aEoq2MyjnQoThzw2fN0QjxQlDcvV+KnvXNpLQOZgw1uwn9wtsbbkTu7b2UGbKu2K1vOlbYopRU/n5Ou3GBDLuGr89zLIVvqdHwglcVCwKMCh9J98ipTHIxT8tjnot4VYYuTSNAEGsfo1uBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWqoBoPb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15ACC4CEF7;
	Mon,  9 Mar 2026 23:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773100291;
	bh=AnnEM0AEOjnmbxyb5EEXI/jarl/KqCoDW6tKbthKBzI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OWqoBoPbJ/5DcO1AV6iEqZmg6nt85hulv2RU0E+PcvElbhF323SzKwlItX3PiQ4LL
	 vPGKR1akbwYB+pqE3Hz9f8cnHLGNkIGwbsMEN5KtbhdxEnOl+SWtMm23ab6Bn4om2J
	 m2/8afU5ehT8Um47o0q6lzRZw1ypUPWpRXjHuFb9TnZm4VaZwwF0jyLAFud+E5TkeQ
	 9zxDTRlRIyIDR8Bjdh9RfvqQd5KlmYOvlKmwmgGPVmUraqDf/gELZyZaZUTVrQefre
	 jlV0++9qBD9A/NM6O44+SCIE9cIiYsPewUW01e3jb6m+VfDLAg2TyWFeMn19b4GSU/
	 TXwHFj/PFrlKw==
Date: Mon, 9 Mar 2026 16:51:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Andrew Lunn
 <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Mohd Ayaan Anwar
 <mohd.anwar@oss.qualcomm.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Vinod Koul
 <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260309165129.78d656c1@kernel.org>
In-Reply-To: <20260309154432.b3dbantow3e3tkry@skbuf>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
	<aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
	<20260227165556.5cf9e844@kernel.org>
	<20260228083111.5df8550c@kernel.org>
	<aaRBjWhP4-7Kru9D@shell.armlinux.org.uk>
	<20260302155736.1fd2980e@kernel.org>
	<20260309154432.b3dbantow3e3tkry@skbuf>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 795C0242C0D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96399-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Mon, 9 Mar 2026 17:44:32 +0200 Vladimir Oltean wrote:
> On Mon, Mar 02, 2026 at 03:57:36PM -0800, Jakub Kicinski wrote:
> > Alright, I think the best we can do here is to merge patch 2 
> > in a "stable tag" way. The rest will have to go via net-next.
> > 
> > I applied patch 2, Russell please rebase the rest on net-next 
> > and repost. Patch 2 should disappear. I don't want to merge it
> > now as is without an explicit nod from Vinod. He did ask for 
> > a tag and we won't provide one.
> > 
> > Vinod / Vladimir, to merge the "stable tag" of patch 2:
> > 
> > tag_name=phy-qcom-sgmii-eth-add-set_mode-and-validate-methods
> > git fetch https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
> > git tag $tag_name 0e8147f4da00
> > git merge $tag_name
> > git tag -d $tag_name
> > 
> > I think this should work.  
> 
> Thanks for the anonymous tag. I think you mean sha1sum
> 4ff5801f45b494ad8251a16ec06c9f303ed3b9a0, not 0e8147f4da00.

Ah, I guess I misunderstood what Linus once told me.
I thought the signed tag remain in the history once
merged even if no longer named.

Anyway, I pushed the tag to kuba/linux.git
phy-qcom-sgmii-eth-add-set_mode-and-validate-methods
if you prefer the real / signed thing. I don't like
having these random tags in netdev trees.

