Return-Path: <linux-arm-msm+bounces-4732-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 723FF812D5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 11:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ECC3DB20AE6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D3C3C484;
	Thu, 14 Dec 2023 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PMs44FOK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3776D2576E;
	Thu, 14 Dec 2023 10:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A038C433C9;
	Thu, 14 Dec 2023 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702551027;
	bh=SXb2V+uKEU2n7t6G6weVcddYl7DHNgyGn9EjuAISZ7Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=PMs44FOKJKKcMWG467I+UZQgz3KFimsU98HZCl35q+mJO5LR67yFuO82gv1ydWkez
	 De5Nc9B950jcxgWtUGAbw4AXWLCRYDmTg3cckGFSKJV84PbaaFJrl85B+OZ4FYR2gW
	 fJYj3gg9/cmcYZtmKOfI11348XmFmE4VL6Pv4sfBDbKw8eNWiEfrW/e7BbizKNsYTw
	 7lrotZL3Lp/6ciGzPs/O/+wGHtX7D+mwyBdSNJ6mymn9I/bs+rYUy92kYSlcmD2tH8
	 qKsGvLpap5Vo9be4H8AA1VYxT2t3bW0oOtF0oxLiClwGX/W1etEdfoLuPyEHYQeY22
	 nQe5z3zxtHx0Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E93C1DD4EFA;
	Thu, 14 Dec 2023 10:50:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net v4] net: stmmac: dwmac-qcom-ethqos: Fix drops in 10M SGMII
 RX
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170255102695.29358.13778143091773009121.git-patchwork-notify@kernel.org>
Date: Thu, 14 Dec 2023 10:50:26 +0000
References: <20231212092208.22393-1-quic_snehshah@quicinc.com>
In-Reply-To: <20231212092208.22393-1-quic_snehshah@quicinc.com>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: vkoul@kernel.org, bhupesh.sharma@linaro.org, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@quicinc.com, ahalaney@redhat.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Tue, 12 Dec 2023 14:52:08 +0530 you wrote:
> In 10M SGMII mode all the packets are being dropped due to wrong Rx clock.
> SGMII 10MBPS mode needs RX clock divider programmed to avoid drops in Rx.
> Update configure SGMII function with Rx clk divider programming.
> 
> Fixes: 463120c31c58 ("net: stmmac: dwmac-qcom-ethqos: add support for SGMII")
> Tested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sneh Shah <quic_snehshah@quicinc.com>
> 
> [...]

Here is the summary with links:
  - [net,v4] net: stmmac: dwmac-qcom-ethqos: Fix drops in 10M SGMII RX
    https://git.kernel.org/netdev/net/c/981d947bcd38

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



