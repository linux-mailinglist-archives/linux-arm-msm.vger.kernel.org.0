Return-Path: <linux-arm-msm+bounces-94208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHxTA028n2ktdgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:21:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B754A1A078A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 04:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 80CB6306A837
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 03:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E6A387596;
	Thu, 26 Feb 2026 03:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sDW5aBqD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232BA387591;
	Thu, 26 Feb 2026 03:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772076011; cv=none; b=JSQG5v+RFnGCTDFNoMxi5B3PEyyJv5Y99/Id4UhjSMuyd5hRi7iWLvGc/wPG0Vlupgrjg6TsNLx6Sx0psR+UWt/KE1Uan7b7x0fm/pdwaNUHVNNA0/MgFJehJ7dDPpzPSpvA8AFOJvLiFCxTcrt925oJgk7+o10r34FHHqnKQLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772076011; c=relaxed/simple;
	bh=WtRU1/cRaO2s8GzsA9VtEY2PQaschyD60erBK06fE+0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ToiUKBYYQ/bjSftp8Dj0qRrx2ytopdHv+/0IfEu8nnqsf82rlrKop5mzFFgUprAlt6H6ccQyonMrIZd4A9n2dLtVxrNgFej4/AqbatAl3K/YJNjzLlvD3nZDXJ4lB3y/Gb7otRU7lqbAsy/wJVwafV0zWnGzmymKESle5544LsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sDW5aBqD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2C8C116D0;
	Thu, 26 Feb 2026 03:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772076010;
	bh=WtRU1/cRaO2s8GzsA9VtEY2PQaschyD60erBK06fE+0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sDW5aBqDm3BeJo4KASF6bs0GOlF5BIm07yJdAEFBEy3hUKpuYlAeR4bWcntxBoAQl
	 xlnI1rtMWiIdePbOG3vGMpLxNGHVXuD6oDzyefsGCmGTondk/Nnkn6PThVOTJ6JeNH
	 CPiqPJ0bZHHPjm8BCVS/1GiV9JELs0eQqbAl0GGzHBbmJ/R+r87j26+C/eVLdXNV7t
	 nVHRV1C+5QjSOeK06jgaSLrn9+Ua2QZWKj3NI8FfqDyJWIgU/G7+kN4bAntigG3RIm
	 KzWY8/Y/zDOJDQmAGaIatunfYmybwbk+ofm0U7sMR7vMXl4ZeqQF2YPujo3VV2mI5o
	 Ekm/RMcwly93w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F3C380A94B;
	Thu, 26 Feb 2026 03:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] MAINTAINERS: Update maintainer entry for
 QUALCOMM
 ETHQOS ETHERNET DRIVER
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177207601554.1018003.6224176217701309243.git-patchwork-notify@kernel.org>
Date: Thu, 26 Feb 2026 03:20:15 +0000
References: 
 <20260224-qcom_ethqos_maintainer-v1-1-24e02701ea52@oss.qualcomm.com>
In-Reply-To: 
 <20260224-qcom_ethqos_maintainer-v1-1-24e02701ea52@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: kuba@kernel.org, vkoul@kernel.org, netdev@vger.kernel.org,
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[bounces-94208-lists,linux-arm-msm=lfdr.de,netdevbpf];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:email,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B754A1A078A
X-Rspamd-Action: no action

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 24 Feb 2026 17:58:47 +0530 you wrote:
> Replace Vinod Koul with Mohd Ayaan Anwar as the maintainer of the
> QUALCOMM ETHQOS ETHERNET DRIVER. Vinod confirmed he is no longer
> active in this area and agreed to be removed.
> 
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Suggested-by: Russell King (Oracle) <linux@armlinux.org.uk>
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> 
> [...]

Here is the summary with links:
  - [net-next] MAINTAINERS: Update maintainer entry for QUALCOMM ETHQOS ETHERNET DRIVER
    https://git.kernel.org/netdev/net/c/916864e5eda0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



