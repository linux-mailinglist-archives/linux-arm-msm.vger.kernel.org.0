Return-Path: <linux-arm-msm+bounces-49207-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93663A42FB1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 23:01:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4173B6B98
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Feb 2025 22:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49BBF1EF0B4;
	Mon, 24 Feb 2025 22:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOgJHU6O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1BE1EDA3F;
	Mon, 24 Feb 2025 21:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740434400; cv=none; b=pDnWBFNkmYeUmJb31hI4/SPvOezE3FsQxzPAV6h5Wf3diW/mMmU36eNHdfp6YJ3mX//NG5hpsg5fYPu391zU5Jw7ew88gpEXzI2T/M+0IeqdyV6MRKjWmO65Ti27ApPGR/AQigf4hIXVv9zjaY8tzPHx7z7frqmcagjGg7+7MSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740434400; c=relaxed/simple;
	bh=QJ6yGM33Uq3KSv4SQnLLE1QPSeX+HvMHB5AJdp87OT4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Ej3RpM74fj5J8HASUeeaZOLdL2RLm4BHkXNCnTI0eeqcUvn0mv0d1uAnQ7N25tjkPzJenSvO4KpNv3Uxhs2oObr5gbd6Mwt1lq/glZZ+v2+L070oDqaHg+PZK/lXdmesd99s+Jef/VwNUsOoDf8C/D82k3+qD4gmpitTCPIR+LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOgJHU6O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93592C4CED6;
	Mon, 24 Feb 2025 21:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740434399;
	bh=QJ6yGM33Uq3KSv4SQnLLE1QPSeX+HvMHB5AJdp87OT4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=MOgJHU6OfhBTuNWGYBpN4QLCNtIs17/THkJ+6x6bx8RUfpOh7xdPbjpeENfeDA9Ky
	 uecn4B8DXoySXeGB+nTKrv7bkPZm7h/t1g7fGr1wMu5v1p41AGlAlV+aD6Q+K/h5Q/
	 W/KIkyAMAj9giaakzEasG8fEwLVkP0HDmoL1x9kk6VH1/FaNmfHyZxoI6RAzGlG4C/
	 do2qowMpLI6zNCIhZmJhq71WliEwpbxBFVMtV0ecgHF4qeR7meDTgNhQ+cCEyDnZIB
	 MQsXWK1EuZY29du1OeSjHNkIqmPzME5ejcvoMkbgGHF7utE2P4LTcbEZIoGDLQ/6CM
	 CBz0QvKnTSgyw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D6F380CEDD;
	Mon, 24 Feb 2025 22:00:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] net: stmmac: qcom-ethqos: use rgmii_clock() to set
 the link clock
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174043443104.3623128.840309022243977791.git-patchwork-notify@kernel.org>
Date: Mon, 24 Feb 2025 22:00:31 +0000
References: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
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

On Fri, 21 Feb 2025 11:38:20 +0000 you wrote:
> The link clock operates at twice the RGMII clock rate. Therefore, we
> can use the rgmii_clock() helper to set this clock rate.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++---------------
>  1 file changed, 5 insertions(+), 18 deletions(-)

Here is the summary with links:
  - [net-next] net: stmmac: qcom-ethqos: use rgmii_clock() to set the link clock
    https://git.kernel.org/netdev/net-next/c/98f992884333

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



