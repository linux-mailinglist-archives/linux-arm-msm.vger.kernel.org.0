Return-Path: <linux-arm-msm+bounces-61296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72873AD9F31
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:00:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBAB87A8EF6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 18:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C99E01EF37C;
	Sat, 14 Jun 2025 19:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnlc372Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1751A2545;
	Sat, 14 Jun 2025 19:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749927600; cv=none; b=gFO+U606arO6n4i89zP2ApanTdW5dZT6ojJXE1Ett1MUF4J9liQw2+h4eP0tCEs7X6IoXV1RHoIe32GvPH9PHn6yJPtRl4zmVeX4onSYRFkGsBITREGW/9bua/CuT+clAlrs+fbIDh3w4SO9mdhmTFrC6A11WMYKhEkNHYk84wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749927600; c=relaxed/simple;
	bh=F7RYQQPryT0sa7wJgAyW69unFWlPTHeaut9xJUVW0wM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HKU3y9MPPaIq2KVPj3TBbOeJWRwopjCEtADsBh+rYphS9P4AB8j5D+e11R4i3/crhG+v25acZbxKEtutQWGREzIeUlDHzEHbSJIvEpjHGadUYnPKwql/xkHTokoC71KFoIC6bS5vSrjYpMiLI6ehMfceQixqqDYAf1P0vKQTmh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnlc372Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200AFC4CEEB;
	Sat, 14 Jun 2025 19:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749927600;
	bh=F7RYQQPryT0sa7wJgAyW69unFWlPTHeaut9xJUVW0wM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=qnlc372Z6yk1pMCbnqRBUd4RD6u5uW8MWJwHtHtdqFEDB7NVXIHMvFzql4S+JrQQU
	 Z+RH5eEVTCfhiB/Il2PUiggLYnORmrTJLj1TjucJsu0Tg/PIAasC7fF1EA29avMJu6
	 4DFrMBE/pLz4MPlqY1DvD9ewXj2UaF7T+S/Cr27kTHJhS3atzryHDx8MBACANxJQlj
	 c7EZ3n79AIHSfmsNTFK0gsWzOasdjJNmLMM4Nemi154EJdsKv6StYECkIU8xemmvOM
	 ZtEuyX/KBP5f19IeXQ5M98Kd7DD/QYC+22ZLNSsOOgDU55L8Z+mi/7VwZnGAQozUzS
	 tg0cNNkZUmzvw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD64380AAD0;
	Sat, 14 Jun 2025 19:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: add
 ethqos_pcs_set_inband()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174992762950.1151198.11331620801417396933.git-patchwork-notify@kernel.org>
Date: Sat, 14 Jun 2025 19:00:29 +0000
References: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1uPkbO-004EyA-EU@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 12 Jun 2025 17:16:30 +0100 you wrote:
> Add ethqos_pcs_set_inband() to improve readability, and to allow future
> changes when phylink PCS support is properly merged.
> 
> Reviewed-by: Andrew Halaney <ahalaney@redhat.com>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org> # sa8775p-ride-r3
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: add ethqos_pcs_set_inband()
    https://git.kernel.org/netdev/net-next/c/8909f5f4ecd5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



