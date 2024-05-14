Return-Path: <linux-arm-msm+bounces-19811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7368C4AF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 03:40:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 325861F23253
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 01:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7114A2F;
	Tue, 14 May 2024 01:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I+R10dN4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5159C17FF;
	Tue, 14 May 2024 01:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715650832; cv=none; b=eyi/jI/Z/9anVQFw4RmuS0xPBDJpPSN2LDaaoLBd/XhVONIbAoTG48Z6jlIJP9gdfj1jpCfcjE8eVfEFOrNAvuRsOLSn7BMNwXoDcMADTz2ZIYOSj85Umc0l5VbI9m0ZFShJcJjHTyEx31uTLU7Di94Yg9SNRwSqU5NptPH8fEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715650832; c=relaxed/simple;
	bh=NPPLWwHKK+o1dvMKLSpZBAc9RGS/TjCm4zTP58RyxbQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MfrM34L39bUokV6tq8Gv7jXak6P4mwGI0L/ZNxv8Lzr6rblxrB6FWxIt4BQyfYtkspfRibtIO+3EwRhwwhNb1dxDE/0qtG18/t7m/SGYG2I2z3Ph1sWADZX2bTqd2LsrPKKX6pXAiDmKTHXKwS8NA7jhMlYVqgc01Gej/AOs0X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I+R10dN4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1456C4AF08;
	Tue, 14 May 2024 01:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715650830;
	bh=NPPLWwHKK+o1dvMKLSpZBAc9RGS/TjCm4zTP58RyxbQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=I+R10dN4ICrjqaQvVfov4y/CBtDzv9PjUZvT9hwGcAJME9RR1RKij6qTN3xytJLL4
	 RM5hxvdU+eVGHgj9fYK1Ib/xewiAVrNzirLv7BDLk5sWRooVhFyGtrgZMWEBsF1g2H
	 esQYC9R8KbOE1zhCCRFypSsD/6XZjfw9pQN/qn4JYJLp9ck0LmSXZG/eFH9Ka2V6yX
	 1s2pZdLUvzlg+8rgNEaDjVumxoKoLQkjuInR6R+GOQ7tbCCQRBaSMU4i1Sb5LboIY8
	 WQarnNT4/9SPClxXG2tcRz+dwvyE88Ujaf4E5SVZtvZmrTM48+lPgGQMy5uVpgi5wi
	 S2HIn6LXoNqug==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AB5BEC43443;
	Tue, 14 May 2024 01:40:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: revert partially applied PHY topology series
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171565083069.25298.16627421214125916788.git-patchwork-notify@kernel.org>
Date: Tue, 14 May 2024 01:40:30 +0000
References: <20240513154156.104281-1-kuba@kernel.org>
In-Reply-To: <20240513154156.104281-1-kuba@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, kabel@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, maxime.chevallier@bootlin.com,
 kory.maincent@bootlin.com, hayatake396@gmail.com,
 linux-arm-msm@vger.kernel.org, christophe.leroy@csgroup.eu,
 herve.codina@bootlin.com, f.fainelli@gmail.com, vladimir.oltean@nxp.com,
 o.rempel@pengutronix.de, nicveronese@gmail.com, mwojtas@chromium.org,
 nathan@kernel.org, atenart@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 13 May 2024 08:41:55 -0700 you wrote:
> The series is causing issues with PHY drivers built as modules.
> Since it was only partially applied and the merge window has
> opened let's revert and try again for v6.11.
> 
> Revert 6916e461e793 ("net: phy: Introduce ethernet link topology representation")
> Revert 0ec5ed6c130e ("net: sfp: pass the phy_device when disconnecting an sfp module's PHY")
> Revert e75e4e074c44 ("net: phy: add helpers to handle sfp phy connect/disconnect")
> Revert fdd353965b52 ("net: sfp: Add helper to return the SFP bus name")
> Revert 841942bc6212 ("net: ethtool: Allow passing a phy index for some commands")
> 
> [...]

Here is the summary with links:
  - [net-next] net: revert partially applied PHY topology series
    https://git.kernel.org/netdev/net-next/c/5c1672705a1a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



