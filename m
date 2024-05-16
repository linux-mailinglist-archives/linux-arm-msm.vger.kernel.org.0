Return-Path: <linux-arm-msm+bounces-19928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9176C8C7335
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 10:50:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EB230B214EC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 May 2024 08:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F08A142E94;
	Thu, 16 May 2024 08:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r+VhujnR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0E32D054;
	Thu, 16 May 2024 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715849430; cv=none; b=LT1Xgoz1DmyyCb2Nyo0McSyL+2827R8kF5ULN6rqgaeDwtOYNrw54DRrKiuz5ayNAWU9UTwsIPQLA2taAdkLLwc5+N+Krnup0DxoJtFxqDzcg6EoqXTZ02BsCAfg5M5ncYkonkGit4nR9ijts9V0vdkwNexZX2z05ee0QhPzk2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715849430; c=relaxed/simple;
	bh=y5h+7pOsf2LQAzv1rpEJ5kQwncPFKnUuGd6tyQje25k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HUV5EcE8VUAd8KwMeNGNSwdeKhnMggcQ/uCL3tax+YRSo6UfH4Xz87KHpH4j5q6ZuVpe2RrRWqQwUz9S+b/kH6UakTzrSZJ26Irsmt4K+ui/tw+Bbck8fEdpRxH12fWl+Q+DNC264cUg7cICo3VNidW+SuyDUo/amDV7Qa9POtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r+VhujnR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4039C32789;
	Thu, 16 May 2024 08:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715849429;
	bh=y5h+7pOsf2LQAzv1rpEJ5kQwncPFKnUuGd6tyQje25k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=r+VhujnRujmUBpv/ObSVS+c1hQ43UOiplppyQ3Mv7lVVG15ED2HXXp8DSLMhlz2/5
	 yQepyVjcbY4Yxrj3eqUqc91iz+4kt25zhnyOrEXji/LxCfjc5yRNuR+LhXEmGRNttW
	 5XLtk91iNpG3jyVbWDgldy7z9urqI1ij/Lu1Sjp5ibjovCQUUOb5CMZFrkmYUNA3m/
	 R4lsyrfc+uiHq7NIHFpQVZ9DVM62Q15bBKsXJVMnRN5CTkC2AQuZLNW4yB11VTTGLk
	 /ngPjmNo0xqE39LPOrDM0pSY/5vPiVpNRu9bbwG7Y2fWik8s+azxc1VurfTUgXgt+3
	 0sUZyo0EZJZiw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92E73C54BB6;
	Thu, 16 May 2024 08:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: qrtr: ns: Fix module refcnt
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171584942959.27746.10698605172964484112.git-patchwork-notify@kernel.org>
Date: Thu, 16 May 2024 08:50:29 +0000
References: <20240513-fix-qrtr-rmmod-v1-1-312a7cd2d571@quicinc.com>
In-Reply-To: <20240513-fix-qrtr-rmmod-v1-1-312a7cd2d571@quicinc.com>
To: Chris Lew <quic_clew@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 andersson@kernel.org, luca@z3ntu.xyz, mani@kernel.org,
 linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jhugo@quicinc.com

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 13 May 2024 10:31:46 -0700 you wrote:
> The qrtr protocol core logic and the qrtr nameservice are combined into
> a single module. Neither the core logic or nameservice provide much
> functionality by themselves; combining the two into a single module also
> prevents any possible issues that may stem from client modules loading
> inbetween qrtr and the ns.
> 
> Creating a socket takes two references to the module that owns the
> socket protocol. Since the ns needs to create the control socket, this
> creates a scenario where there are always two references to the qrtr
> module. This prevents the execution of 'rmmod' for qrtr.
> 
> [...]

Here is the summary with links:
  - net: qrtr: ns: Fix module refcnt
    https://git.kernel.org/netdev/net/c/fd76e5ccc48f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



