Return-Path: <linux-arm-msm+bounces-95031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFTJA/cjpmlrLAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 00:57:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CFE1E6DF9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 00:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72668302D094
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 23:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C92C359A97;
	Mon,  2 Mar 2026 23:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oRrec1jl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDEB631E833;
	Mon,  2 Mar 2026 23:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772495858; cv=none; b=mQm3vA4/GHkmm6aB/YIqhP0flPXkO0LxBCLq8ARUjWGmKanzT+lgHqWlo9C6w4X5zlEgnGWmpHb/MabkfmZwofv4CLCb9Cw8A6kkBJ3Bm9kupIAlrpUiUMAOtJi2QTYZ+ihDQuhQ9e6a8ZTmqRIMJ4aaWZ2NfVQuC0znvlH4vyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772495858; c=relaxed/simple;
	bh=IubmTnHFo+goc2jOm+xUKkKIOIMV2WE1IuL5F2YSGnA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=anA3Y8rAa6Xpdhy2mL2IBs+w0HhSGiB3QW1sBaMR7dTCKmZ7wptY/b2t96CZUaOKZIJetVeeGEqx8I9lDNFG57AYWtD+Eyn6W/UdxSotHKg+4rKCHh/E2D3EGSZZjncs+wxckl7xAXlu8v0WLtOtJEFkS1678YEZ0O08pm9cEAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oRrec1jl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF81C19423;
	Mon,  2 Mar 2026 23:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772495858;
	bh=IubmTnHFo+goc2jOm+xUKkKIOIMV2WE1IuL5F2YSGnA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oRrec1jlC7VP17kgin4gOxh8gT2N4YTIjFvXSK8bee1hl7mDmrDck+QcBuuEpckES
	 cvydx8LeRwdpHrCDNNXSAzUM04+uaYn5/3XJRnZ2jXEw0jRAeKS+BGS1lfz6/V7V+n
	 mrHaijq/06TMyEU4xL2IMbUkBG0VJXeYzbjmlQc9Fe02I6bjNO4hfeZc4ulNXkytUb
	 8fRV+qVISvI5qrbS9fawBe52+rHkY7IJuYyGiFlNVMci2VXGUMK5yid2T2JEZ3+La1
	 QBQWtyW9kDJVb8/WrK1ZiW7Zo+jbA2XUVzDFrTmpIx5wafFzIhV96RCjJCy5G9hRHJ
	 Vt/N6Mx+lgGbA==
Date: Mon, 2 Mar 2026 15:57:36 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RESEND2 net-next 0/8] net: stmmac: qcom-ethqos: further
 serdes reorganisation
Message-ID: <20260302155736.1fd2980e@kernel.org>
In-Reply-To: <aaRBjWhP4-7Kru9D@shell.armlinux.org.uk>
References: <aaDSJAc-x2-klvHJ@shell.armlinux.org.uk>
	<aaIysVxy-WxbiJz9@shell.armlinux.org.uk>
	<20260227165556.5cf9e844@kernel.org>
	<20260228083111.5df8550c@kernel.org>
	<aaRBjWhP4-7Kru9D@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 80CFE1E6DF9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-95031-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, 1 Mar 2026 13:39:25 +0000 Russell King (Oracle) wrote:
> On Sat, Feb 28, 2026 at 08:31:11AM -0800, Jakub Kicinski wrote:
> > On Fri, 27 Feb 2026 16:55:56 -0800 Jakub Kicinski wrote:  
> > > Yes, that's what I thought but then I saw the other thread..  
> > 
> > Trying to apply this now but stmmac parts don't apply on Linus's tree,
> > and Vinod wants a tag :( What do we do?   
> 
> The problem will be that this series has dependencies on the first
> batch of qcom-ethqos patches, particularly:
> cd0aa6515350 ("net: stmmac: pass interface mode into fix_mac_speed()
> method")
> b560938163db ("net: stmmac: qcom-ethqos: pass phy interface mode to
> configs")
> fb42f19e671f ("net: stmmac: qcom-ethqos: move SerDes speed
> configuration")
> 
> which enables the change in the third patch of this series - and
> without the third patch, none of the following patches in this series
> can be applied.
> 
> I'm not sure what to suggest either.

Alright, I think the best we can do here is to merge patch 2 
in a "stable tag" way. The rest will have to go via net-next.

I applied patch 2, Russell please rebase the rest on net-next 
and repost. Patch 2 should disappear. I don't want to merge it
now as is without an explicit nod from Vinod. He did ask for 
a tag and we won't provide one.

Vinod / Vladimir, to merge the "stable tag" of patch 2:

tag_name=phy-qcom-sgmii-eth-add-set_mode-and-validate-methods
git fetch https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
git tag $tag_name 0e8147f4da00
git merge $tag_name
git tag -d $tag_name

I think this should work.

