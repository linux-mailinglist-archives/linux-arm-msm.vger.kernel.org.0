Return-Path: <linux-arm-msm+bounces-78435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8344ABFF0A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 05:47:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A59A43A7DE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 03:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13FB32DFF33;
	Thu, 23 Oct 2025 03:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mMicCGIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1802BE643;
	Thu, 23 Oct 2025 03:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761191195; cv=none; b=R6x5teCulTCTY271+9maJHRFdNj6SPSDQtRDY2oBt/aY7D88bmiPFdXmW6S8zMiMBh3sYTHxgSPhkvHQi3IMKTui6ut0BLABGNCk7oB1tqXkqs86+u6LdlVZZ/n5n9NWVvTEv0COcVjvQnWchMZewHvRdQbTVjPbUB8lZ9TSpR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761191195; c=relaxed/simple;
	bh=l86IeJ3vP3EDYi7bu42IQQyF94BwHyCQ8KT6skv5odE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=olzOGTUkcH4odK0Nv0Wt9YqjAom3aP7xJG9Djt22354FIytpdloc1VLeBaCBSc8eTs6lDSDDDDcRbygtFdqQnqrERA4biSZgiTsU7QuzbogETiPeWJfwXAnVnmSvLGl0tLHiLAZNvxpOYHf5NEmtFNQTk2KItQX7pKMdgD6hU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mMicCGIf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B955CC4CEF7;
	Thu, 23 Oct 2025 03:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761191194;
	bh=l86IeJ3vP3EDYi7bu42IQQyF94BwHyCQ8KT6skv5odE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=mMicCGIf+QkaQtTnDkGmUECePcMi76oudIsDNdOWs9wSC89J1wqCNlt8QfDhr4o+v
	 r/q1OPBk4qp+W553BOuwowDQoD5nADevx8RcJCnc58r8t72gF5XeZ5SDqLDo6H32XO
	 98Pvy6eVXIfh+lDC3IcwO4F7/IgIdl/8mWHJJXiXtevGqnN6SD0FeLStfSPyqz3VFX
	 jB2zS1ehXFLEgm8zzOLFhuvUsEx1gz+hzEBj3LcPTw193b0eqWP0MgoHo6EwPdfG66
	 DhHCesjq6Mi4QQd16114mp3zEwozN2jReaaSXjKcP0eGEqFNkvbewL0X78J+41bltD
	 cTbKVxgCwm4tw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3BF3809A04;
	Thu, 23 Oct 2025 03:46:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v2] net: stmmac: replace has_xxxx with core_type
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176119117525.2145463.932539356241719482.git-patchwork-notify@kernel.org>
Date: Thu, 23 Oct 2025 03:46:15 +0000
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
To: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, wens@csie.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, jan.petrous@oss.nxp.com,
 jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 richardcochran@gmail.com, s32@nxp.com, samuel@sholland.org,
 thierry.reding@gmail.com, vkoul@kernel.org, vz@mleia.com

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 21 Oct 2025 08:26:49 +0100 you wrote:
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
> 
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> [...]

Here is the summary with links:
  - [net-next,v2] net: stmmac: replace has_xxxx with core_type
    https://git.kernel.org/netdev/net-next/c/26ab9830beab

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



