Return-Path: <linux-arm-msm+bounces-12323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB1E860FF5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 12:00:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4BAC28153B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Feb 2024 11:00:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C766310E;
	Fri, 23 Feb 2024 11:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdawGJ3z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2D2D533;
	Fri, 23 Feb 2024 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708686029; cv=none; b=tj03XEMy2VdvIV9zO+8ccHF7j2AQ3GmxAvlDCVjKEEG1LkU5NnHNjWnIxUI2r3nCX2wB1ASUcLSpkMSAsAtrwobdjYUgAWXQ1ANtQ9bKhlX64vVXPzDy4KF972F/zqEgfYIkB4S7czYajmDLpSs6/5lDMzDRybnoUBOS3QREHBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708686029; c=relaxed/simple;
	bh=tuWmInSI6DkM2n3WzR2QPwKPQKk5MUUQvzBdHLanhIs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=cdFh4EXwMvjS+jgG1eIUdnGhQKugheWIRoqE6+31jDVca3qWxlxDkANXDiGeNkw1IbrQVgjBFIZG7JVX4D7yP86H6wFS/4HnkwWZWrMGP+X1VjZTkD3Cvikw2uVjNpyhEgDXvRGrxIAuwduS9DRLuxOueFnJFFS5H7ug8S6eS8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdawGJ3z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCE31C43390;
	Fri, 23 Feb 2024 11:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708686028;
	bh=tuWmInSI6DkM2n3WzR2QPwKPQKk5MUUQvzBdHLanhIs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tdawGJ3z8z4VGpT/T+HOvULfSvcojHhWkXf8gj8Kn97b/jcTvAlAsTveAyfpPRByP
	 peECZ2HGXzFrU6HZ1ioQWKXp6o4S289n5LNcNJLDKISqShBCZCBWrqYh4QEybDqP43
	 +JV2QDenbAHKXSyKlElElu5GVpdcMeWxKemSqeN11F4TBxObEmGpUzY8TkCbjTdNkE
	 fa/YYqGQcFH30yyzJ8fKpmAmjfcRwIMrau41FfGHfGAbx6k9L6/WB/hZsNvMtHX0eZ
	 BmMZiMKUqzkuVbDi+Ll2RYdSExnooPgbxEgXqQYCji6gqygQOg5eDJQIy2PDDYgHQy
	 vvQZlD1PfLqkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1D42D990CB;
	Fri, 23 Feb 2024 11:00:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v5] net: stmmac: dwmac-qcom-ethqos: Add support for
 2.5G SGMII
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170868602872.17679.14029425242387308539.git-patchwork-notify@kernel.org>
Date: Fri, 23 Feb 2024 11:00:28 +0000
References: <20240220050735.29507-1-quic_snehshah@quicinc.com>
In-Reply-To: <20240220050735.29507-1-quic_snehshah@quicinc.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, ahalaney@redhat.com

Hello:

This patch was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Tue, 20 Feb 2024 10:37:35 +0530 you wrote:
> Serdes phy needs to operate at 2500 mode for 2.5G speed and 1000
> mode for 1G/100M/10M speed.
> Added changes to configure serdes phy and mac based on link speed.
> Changing serdes phy speed involves multiple register writes for
> serdes block. To avoid redundant write operations only update serdes
> phy when new speed is different.
> For 2500 speed MAC PCS autoneg needs to disabled. Added changes to
> disable MAC PCS autoneg if ANE parameter is not set.
> 
> [...]

Here is the summary with links:
  - [net-next,v5] net: stmmac: dwmac-qcom-ethqos: Add support for 2.5G SGMII
    https://git.kernel.org/netdev/net-next/c/a818bd12538c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



