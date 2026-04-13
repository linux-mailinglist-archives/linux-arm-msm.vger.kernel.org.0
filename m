Return-Path: <linux-arm-msm+bounces-103014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aC5EEaFn3WnsdgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 00:01:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BFA3F3AED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 00:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78D213018AC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 22:00:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CACD539479F;
	Mon, 13 Apr 2026 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jTVfCIXE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72B934A795;
	Mon, 13 Apr 2026 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776117634; cv=none; b=Tq7S3x7WvlOvg6B2it5igoozURCVDZJO+x5VwS36RYt0HNhH3Pmq/q6eg+l2GwIPSOAcYodHnipHS0/6ZO3KTck9BCZz0G//ageWuY1iFvrTiE5yK/3xLcpNKpGHWxXGlCUgWllQtzBhTsBkV+8TEKJm86aEptCagsPmWSHWBzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776117634; c=relaxed/simple;
	bh=ijE24X/kUki5oJeGVH3Ht4hUAfy77dDbpEaHriRF3Ug=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=J3v/CTtW/dqHigBm9CieoVkkrXrQF7HzGRPIlZCUMM6vlnSQVVEzcYFqWLlqGdBwq3/HIpoizNrnwVCNE8iDqxpaLCWiH6jmelpTByyF/w1XS4Ohi2DEEzjE04LAE6E8dRCJF+5tYWH+85FDqGqD05jY0DlNUzHXmv9mZzs3ZOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jTVfCIXE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D429C2BCAF;
	Mon, 13 Apr 2026 22:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776117634;
	bh=ijE24X/kUki5oJeGVH3Ht4hUAfy77dDbpEaHriRF3Ug=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jTVfCIXEmjh+5wwNUiifNPxU/OQbJc+nOlW0rtSkAYzQ1IcvH4FHT0lG/zGFsdYST
	 uX1N7qtLRK0vfmy7FdUXdWi2TpkWLVe+uLiSVRvwvlW3eCoc3a9BTHU2Sqw/9uRMsE
	 zQ+NYBIV2fxo1CVQLaki4DrcSLGquWCIWeUXpUPmCr1dFsn5eBPCBLNbq9Y2WtDo2Z
	 0TmCfdM2lm8FTgM3AjYvl9nzCOh1vJ9J7GxEGkG4z6XqHEx7/8OJYvOybxbMQLAaeZ
	 FZkrYqc2d44LA8YfmQx0XmJoVRPWNJ0HJxmkfDV0Mfs6MeU6VLtjAYz2iVkY20Y+mC
	 lnuCU/D7Km+JQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EF43809A0C;
	Mon, 13 Apr 2026 22:00:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net] net: phy: qcom: at803x: Use the correct bit to
 disable
 extended next page
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177611760554.563263.13531672738495714536.git-patchwork-notify@kernel.org>
Date: Mon, 13 Apr 2026 22:00:05 +0000
References: <20260410171021.1277138-1-maxime.chevallier@bootlin.com>
In-Reply-To: <20260410171021.1277138-1-maxime.chevallier@bootlin.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: andrew@lunn.ch, kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, horms@kernel.org, linux@armlinux.org.uk,
 thomas.petazzoni@bootlin.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103014-lists,linux-arm-msm=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 99BFA3F3AED
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 10 Apr 2026 19:10:20 +0200 you wrote:
> As noted in the blamed commit, the AR8035 and other PHYs from this
> family advertise the Extended Next Page support by default, which may be
> understood by some partners as this PHY being multi-gig capable.
> 
> The fix is to disable XNP advertising, which is done by setting bit 12
> of the Auto-Negotiation Advertisement Register (MII_ADVERTISE).
> 
> [...]

Here is the summary with links:
  - [net] net: phy: qcom: at803x: Use the correct bit to disable extended next page
    https://git.kernel.org/netdev/net/c/e7a62edd34b1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



