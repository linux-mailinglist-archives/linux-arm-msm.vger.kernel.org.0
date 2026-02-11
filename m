Return-Path: <linux-arm-msm+bounces-92566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD1IH/4MjGnffQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92566-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 06:00:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C419412147C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 06:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CCB73055D72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 05:00:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69C0B33508E;
	Wed, 11 Feb 2026 05:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KnsPAU6o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478E830F7E8;
	Wed, 11 Feb 2026 05:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770786026; cv=none; b=XktLzyEJ7dwmM3jg8JUJywRm0SzedJdrz+91N4JEtyN4JxUS7MpP0gORuozzzhNRRrbAfbs+t/LhcpuhA68aKoU7abHiZ8jZJqUpss8CF2b4Y/sI0U/E5Qv8FyZLIqJjv7NL7GZCzWWRGRjsaNZpGPhEqJShebxgTCuWwfk9yeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770786026; c=relaxed/simple;
	bh=vcnXj3vz/pQ/LS/vRt2jiE8deQxJ3ugm6aER1Dd89ic=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E12rlXxzZtri8xPTLWZfSlCuyEfQzzxgkP96Za8ZI1U28DMg+a3XuOgCqooa8lMRSEVX983ywqAgtUV8WMPza6PUMBori1I0h96v3Vl36QWO5he9h8PZSNcV4a4Cw3e6kAOJGLnxVpbkYmydpZ+eP9ouJ291oqwfff6npwBy30s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KnsPAU6o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAAC0C4CEF7;
	Wed, 11 Feb 2026 05:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770786026;
	bh=vcnXj3vz/pQ/LS/vRt2jiE8deQxJ3ugm6aER1Dd89ic=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KnsPAU6odC1a4bLLyUedoHUrD7wY3vuDwr6jbK/Vib5ICsvYB+9o9CqV6NyvLeL5a
	 npaaNTVmfbEWh8uD6uM0VrX1WBt6YA8eYJuIrdv6IQzziFQjJrOQH3ItLNxF9Iv3l8
	 1axo7iHvhKekVSF3WShVT4LoTuVZOGpiRnrASi1uk69FcqWRaZ6uYl37PSOuI7cCQr
	 CetX7rgIOL1fAxb3noQ7kdr2GC5YnfcimvqtbSWSqyeaebXaYCGV+F1OVwpc0idAP+
	 ZD5cE1NQnM04kao4DcBn49Xt51nslGL9ON5G9pBbjT8eg9Eq/I66H16nUr08/eqtY5
	 JqCbWBczu9JLw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 48431380AA50;
	Wed, 11 Feb 2026 05:00:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: fix
 qcom_ethqos_serdes_powerup()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177078602107.5556.17371002547331944869.git-patchwork-notify@kernel.org>
Date: Wed, 11 Feb 2026 05:00:21 +0000
References: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1voPUH-000000083ji-25FH@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mohd.anwar@oss.qualcomm.com,
 netdev@vger.kernel.org, pabeni@redhat.com, quic_snehshah@quicinc.com,
 vkoul@kernel.org
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
	TAGGED_FROM(0.00)[bounces-92566-lists,linux-arm-msm=lfdr.de,netdevbpf];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,armlinux.org.uk:email]
X-Rspamd-Queue-Id: C419412147C
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 06 Feb 2026 17:19:21 +0000 you wrote:
> Add cleanup for failure paths in qcom_ethqos_serdes_powerup(). This
> was missing calling phy_exit() and phy_power_off() at appropriate
> failure points.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: fix qcom_ethqos_serdes_powerup()
    https://git.kernel.org/netdev/net-next/c/3a4687366148

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



