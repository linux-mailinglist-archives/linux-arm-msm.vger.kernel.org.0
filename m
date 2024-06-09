Return-Path: <linux-arm-msm+bounces-22143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 59AE5901667
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jun 2024 17:00:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 98F7DB20BD5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Jun 2024 15:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9B1142A89;
	Sun,  9 Jun 2024 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o7Wu94en"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA086210E4;
	Sun,  9 Jun 2024 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717945231; cv=none; b=IIJUNECuvegDShWiwshslLrL0f+AkNmQvjEwwkaXM1dTGRPN86PIGh9vn3QSWEwbUtQv0e8G3BIUJVYK/5oBz2PH6YZPUBIcCGfgAWh2wR3IiEnPAAOy+0Srdv5y5aI7WfLRwvmGsCEIo9sgVemN/Ne4SD9ollM1JrAnzWai5oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717945231; c=relaxed/simple;
	bh=sEvuJelJntixemBHKj20oqZhgwHOot8BPhwBUz8Va0I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=I4WZwozdA/o9Eneut5tks/SW62f2F2DL+0viyoTxkBvDxnpxEjvCnbH/P1uCyjpJjPz7rJ2BFdFWcWzGiQZpy8Hps6CoMuDyWgBHiWXq82aS1Nlta1aG3FnXgXn17Xo1PrA1ahfKvPoWplyalgyUQV+hF/ALRNv8JrPYVMCSKxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o7Wu94en; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CAA9C4AF1D;
	Sun,  9 Jun 2024 15:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717945231;
	bh=sEvuJelJntixemBHKj20oqZhgwHOot8BPhwBUz8Va0I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o7Wu94engqJPD62reFT6OXz+oNclILQNOIe2LJ5yD2OtKS1skqbvsJqPK+6zE6TrJ
	 yE9gWVCo6sEIpnsSomPs63Ux8EaJpp7YM3RJgj6EnKQINA5+qU1wCojX052/HRC46j
	 XpDT8GCoQCkDXSeU1SOn6nt6dhFxheb3hkJMYjstRfsJdq//lIH9l+0ac99riW/G23
	 +JMuRfKZEiF4pMIJc9o0R9382sGe2Sc7Ajf/o+fIt7UAEOx6RovCjYCClMLGkT2j3i
	 MNwM7HJ/k5yfPfTTkW73m+SFhWFFElMDV3VTDuQX79+Trk6YBkL/+r5S0LK4BtX68Y
	 MBVIKVLEzQCPg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 18321CF3BA5;
	Sun,  9 Jun 2024 15:00:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v2] net: stmmac: dwmac-qcom-ethqos: Configure host DMA
 width
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171794523109.27019.808801880558550935.git-patchwork-notify@kernel.org>
Date: Sun, 09 Jun 2024 15:00:31 +0000
References: <20240605-configure_ethernet_host_dma_width-v2-1-4cc34edfa388@quicinc.com>
In-Reply-To: <20240605-configure_ethernet_host_dma_width-v2-1-4cc34edfa388@quicinc.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: vkoul@kernel.org, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, jh@henneberg-systemdesign.com,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andrew@lunn.ch, ahalaney@redhat.com

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 5 Jun 2024 11:57:18 -0700 you wrote:
> Commit 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA
> address width") added support in the stmmac driver for platform drivers
> to indicate the host DMA width, but left it up to authors of the
> specific platforms to indicate if their width differed from the addr64
> register read from the MAC itself.
> 
> Qualcomm's EMAC4 integration supports only up to 36 bit width (as
> opposed to the addr64 register indicating 40 bit width). Let's indicate
> that in the platform driver to avoid a scenario where the driver will
> allocate descriptors of size that is supported by the CPU which in our
> case is 36 bit, but as the addr64 register is still capable of 40 bits
> the device will use two descriptors as one address.
> 
> [...]

Here is the summary with links:
  - [net,v2] net: stmmac: dwmac-qcom-ethqos: Configure host DMA width
    https://git.kernel.org/netdev/net/c/0579f2724904

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



