Return-Path: <linux-arm-msm+bounces-102427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNU6Ocdd12kCNAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:05:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4CA3C7737
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 10:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 511C0304698D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 08:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C95B38C2A2;
	Thu,  9 Apr 2026 08:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q14kSXwU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7F235DA44;
	Thu,  9 Apr 2026 08:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775721630; cv=none; b=qBiw0trfstwPwA6doKtSdVEkaSl/Q5eHTZpPrm00Cf26zU70fJpJs/OczJ1CwW8lFEpaFp+I+0Btj92Y/wYaQNgk5zFH0oy254da419JH4R+qygk+00JEVClx5MNVK3lFeUXUQeri+5Buargkiue1kSCYXddEeGRJgTtuPhkf78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775721630; c=relaxed/simple;
	bh=vWhJwvXJLo5iz6DRP2dmGFaGe9c+eA5slOqT30o7uIQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gk7Wlm+RWonjERjTXUF32Cvih/dKDP1JI1ERXoKD3VH6/suzf9AR3pLcwtpRxMBNQ6w5urxFhRtJeWkI/7HMfrN44APfPcHALwuPd/geATbALPGiOmLff2CRt/W1D4gI6VxC9Hk58tUc4DgUlRnl0vjqe5hZP79t21FRnSBl5OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q14kSXwU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8469CC4CEF7;
	Thu,  9 Apr 2026 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775721630;
	bh=vWhJwvXJLo5iz6DRP2dmGFaGe9c+eA5slOqT30o7uIQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Q14kSXwUk1N02mrzc5h+DXMR1JKBV8ri8A8HQu6QKwvwTpjk6yemVIQCBCnuu0wtg
	 03ch1CrsNlA/nnrnov5P0ZADVJ8jcDNeQV3KaLGvKHWibJm8bkJclafpIimh8MF1Zt
	 1sS6OqMXbN03e0xlnxZtShbdEGk5FGMDQTxZeO5Lw0OQ16/41rTCM/ZnrRm5sItk/t
	 D/eveuaZ6mF6ELfiMpv6amrT/arwxCtYt9Hya3GRIBzRRHVFOIzM8BdDvLYslgLIfb
	 VMqzGKdKiu2QiS5gYJhpaRSIuUY/geXct/P4swixqAZW2g4aYXBiqb49lbaH0jAi0J
	 MLxubjzDddVrw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E0239307A6;
	Thu,  9 Apr 2026 08:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/6] IPA v5.2 support for Milos and Fairphone (Gen. 6)
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177572160654.1053850.6904532011284602186.git-patchwork-notify@kernel.org>
Date: Thu, 09 Apr 2026 08:00:06 +0000
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
In-Reply-To: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
 konradybcio@kernel.org, akoskovich@pm.me,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102427-lists,linux-arm-msm=lfdr.de,netdevbpf];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D4CA3C7737
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello:

This series was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Fri, 03 Apr 2026 18:43:46 +0200 you wrote:
> First, two fixes that unbreak IPA v5.0+, which can be applied
> independently.
> 
> Then add support for IPA v5.2 which can be found in the Milos SoC. And
> finally enable it on Fairphone (Gen. 6) so that mobile data (4G/5G/..)
> starts working.
> 
> [...]

Here is the summary with links:
  - [1/6] net: ipa: fix GENERIC_CMD register field masks for IPA v5.0+
    https://git.kernel.org/netdev/net/c/9709b56d908a
  - [2/6] net: ipa: fix event ring index not programmed for IPA v5.0+
    https://git.kernel.org/netdev/net/c/56007972c0b1
  - [3/6] dt-bindings: net: qcom,ipa: add Milos compatible
    (no matching commit)
  - [4/6] net: ipa: add IPA v5.2 configuration data
    (no matching commit)
  - [5/6] arm64: dts: qcom: milos: Add IPA node
    (no matching commit)
  - [6/6] arm64: dts: qcom: milos-fairphone-fp6: Enable IPA
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



