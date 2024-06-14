Return-Path: <linux-arm-msm+bounces-22730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66630908AD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 13:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 10F921F23FED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2024 11:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33EF114B96A;
	Fri, 14 Jun 2024 11:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OQFTM64h"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0296D78C90;
	Fri, 14 Jun 2024 11:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718364632; cv=none; b=HfYKnvstb+82UyzLCXhMliN72S0Dgoxy04NucrMel6JZj69jfVpcWOKZWj9ynYA1f1PFXqFK1A9+dPC5uODteJG/ilVrk7O1YhSnMec7tIyrJxzVyINT2aLQ7+6zHGuREgj8eX8fI4+IOnAPwIPOElgg7qgCE984OBJRxAQxnwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718364632; c=relaxed/simple;
	bh=lfRCLHPC8Ch+I0PcReVwhlTRxiD9uf5JH4scsOMzT+A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hRqROMxMqtIhrlOq26TobRvgVyB3H8NQ33k2GGMd2ybJznnK2jcgsbW+Z36jb6g62QNjPaC8yQ6McjHY3oo9Mq6XvtUFEeIakbS0ip6zWj9k+zyRdwj7KENLrQ3Mcick1ns3OHEGm26T5Mb3P4DIEGTCQqLp///GRP/Mx5RGooQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OQFTM64h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7802C4AF1C;
	Fri, 14 Jun 2024 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718364631;
	bh=lfRCLHPC8Ch+I0PcReVwhlTRxiD9uf5JH4scsOMzT+A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OQFTM64hcf6EdmMTMzW250pNQbG8uVZnoZqQjBetPDqDwctfpfO+GQVAdqm4UpTFk
	 PGCZRMyvPiIOUOuuwPqYgcdA4ezKWKI2RL5QBwtwg0AomwmMxLvNgslDVEfMoOMwkt
	 stBTrkE92SrwQ5Ymqh/6bL2FjX9zDcimxYoGQPfvvKaRvr5ALU7dvGn4m6UQKdDyJq
	 1ig2I9Rpi73LXjmaMTr+yaCmdyd7nUic4Xc5NvGjqpFV7mDWXnMIcq6QPiD5dK3QyL
	 hCtZksP9Lmgji9VDQ5MooTNtiOKIha8Iix/HK2o3XnuYdnocp0rW20eh46YrbZdw+5
	 FHpdlITrJzL9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B1FEFC43612;
	Fri, 14 Jun 2024 11:30:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V2] net: qrtr: ns: Ignore ENODEV failures in ns
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <171836463172.3341.2623972340502158266.git-patchwork-notify@kernel.org>
Date: Fri, 14 Jun 2024 11:30:31 +0000
References: <20240612063156.1377210-1-quic_sarannya@quicinc.com>
In-Reply-To: <20240612063156.1377210-1-quic_sarannya@quicinc.com>
To: Sarannya S <quic_sarannya@quicinc.com>
Cc: quic_bjorande@quicinc.com, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 quic_clew@quicinc.com, horms@kernel.org, manivannan.sadhasivam@linaro.org,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 12 Jun 2024 12:01:56 +0530 you wrote:
> From: Chris Lew <quic_clew@quicinc.com>
> 
> Ignore the ENODEV failures returned by kernel_sendmsg(). These errors
> indicate that either the local port has been closed or the remote has
> gone down. Neither of these scenarios are fatal and will eventually be
> handled through packets that are later queued on the control port.
> 
> [...]

Here is the summary with links:
  - [V2] net: qrtr: ns: Ignore ENODEV failures in ns
    https://git.kernel.org/netdev/net-next/c/404dbd26322f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



