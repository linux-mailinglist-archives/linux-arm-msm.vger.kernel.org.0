Return-Path: <linux-arm-msm+bounces-54283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A802A890E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 02:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 209C317C514
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Apr 2025 00:50:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8CC3CF58;
	Tue, 15 Apr 2025 00:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XCIWK2vp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815186FC5;
	Tue, 15 Apr 2025 00:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744678200; cv=none; b=WZ0jaQyW5lRUsav2w8TglATB4ynwMtoa7cXITTc/tGEqLQagKMM/q+HaXYN0q9mEtJatZj2D0cjYnHQQBndJdD4jNdeAKgAf74hJUqsJZCH/saJMGOH8T6WbNdyyQI5CSmM8o+X2PjYe7jWSjckWpDhyqbUpL9OhdxlGpMRfS18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744678200; c=relaxed/simple;
	bh=W6GdVISjXNNNfTPg1VWXU+iBRCd39F1D5CkWm+qTSxg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LZbx6Ldys7kLz7/ej8tPvVS8v1LWfoBeo6BO/tUOsFvWsglVIu9IfSMiaA63BxwOa6EulE/Os7oeP+dw55H/tsg6nK9kiCoNckM7i/JfpfMLd3S/87MD1uVHTBcZH4sejz1oGDtb2TyFIlvxd5g+ZFeosNfUPPs9mGY3sVA8/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XCIWK2vp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564C8C4CEE2;
	Tue, 15 Apr 2025 00:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744678200;
	bh=W6GdVISjXNNNfTPg1VWXU+iBRCd39F1D5CkWm+qTSxg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=XCIWK2vpFxsGuS6nbZfIV3V5Zki+V3bEKonR5gV06bw4Brn33H/4cM3d4ZHJ+POek
	 l8qS8aLAtwqgL4DBCAVcwGzGCZh/Kx/ZdIGS+pagwNwnM3St0uwGzOBUK5o5f4AwEU
	 Blgm3fghvpvjiWX7bRcjFVQgTqadKlZIHEU0tsFFReZhzstP/cCdZfCrrYODT985kZ
	 +7SSFYs81XyKdRCOKMwVi1VGGk4qBCLg5ZVFkkneBTv5leOPAWNRhYXJu5WlP6H+QL
	 4bsbIk+gLsr3lP278fIP9yUwQkr2xmss814Mb8b2DjoybfbJzngL5FIa/k+gO6gtbt
	 ejj+GoH6/RW+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C623822D1A;
	Tue, 15 Apr 2025 00:50:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next 0/4] net: stmmac: qcom-ethqos: simplifications
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174467823825.2089736.3756695494399689904.git-patchwork-notify@kernel.org>
Date: Tue, 15 Apr 2025 00:50:38 +0000
References: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
In-Reply-To: <Z_p0LzY2_HFupWK0@shell.armlinux.org.uk>
To: Russell King (Oracle) <linux@armlinux.org.uk>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, alexandre.torgue@foss.st.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, pabeni@redhat.com,
 vkoul@kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Sat, 12 Apr 2025 15:09:51 +0100 you wrote:
> Remove unnecessary code from the qcom-ethqos glue driver.
> 
> Start by consistently using -> serdes_speed to set the speed of the
> serdes PHY rather than sometimes using ->serdes_speed and sometimes
> using ->speed.
> 
> This then allows the removal of ->speed in the second patch.
> 
> [...]

Here is the summary with links:
  - [net-next,1/4] net: stmmac: qcom-ethqos: set serdes speed using serdes_speed
    https://git.kernel.org/netdev/net-next/c/b4589810082a
  - [net-next,2/4] net: stmmac: qcom-ethqos: remove ethqos->speed
    https://git.kernel.org/netdev/net-next/c/a3d54648ada2
  - [net-next,3/4] net: stmmac: qcom-ethqos: remove unnecessary setting max_speed
    https://git.kernel.org/netdev/net-next/c/4c30093f784e
  - [net-next,4/4] net: stmmac: qcom-ethqos: remove speed_mode_2500() method
    https://git.kernel.org/netdev/net-next/c/0d1c18a10dd1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



