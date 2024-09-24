Return-Path: <linux-arm-msm+bounces-32242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8841C984197
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 11:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F3F1DB2542C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 09:05:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99DF4155C96;
	Tue, 24 Sep 2024 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZhGY7wEh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF04155A34;
	Tue, 24 Sep 2024 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727168540; cv=none; b=HfvyiVnQUcm4oGoQPa9+Q7D4G4PP0AfIbQF/jInlVfRABA0F3OSUKYg3Oq4xIs3nGM417iV8LxWAFmJedBj6WTHw1mR+vIRgeQBCln/OoMqm75BFXyV76s8JSgzkIdK+ghUz3tKPd5zjXm4cOt633N07PvDij+C6U3U2aN6tTS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727168540; c=relaxed/simple;
	bh=fM+u/t/6a3mV6WxVt/zrrnuaIozB+1kUkIDm2ol0xI4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DhDZuJqSL6M8eOeE6+IPqNnlb6Kl93QJsJH7imYgFybtQ+Ulj0vUxacvhHQUGimMse//ceCbgC26DfnAG4Rr/BCHDCo8BF50+c1i01OrsFLzOiVjnbAR8bNOhhxqt6z47QCh+NHKfGvCUqmOBGvXZoUAlNpwohwiBzu+6HoPgc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZhGY7wEh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C85C4CEF8;
	Tue, 24 Sep 2024 09:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727168540;
	bh=fM+u/t/6a3mV6WxVt/zrrnuaIozB+1kUkIDm2ol0xI4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZhGY7wEhFjNzbukQ2jeX+7jpe4aNqqL2JqT+DQUB4QUzfPT1VgV3luuvxHdPLJD3Y
	 fr8C3CP5AjJNNxO5TsYvsD8c9/vOe6/HM1NNpB+fy9qNEP699LsN5jE240CRK8EniR
	 O6wpU15TgpRm4g4sJH03HeAN6zkUiFyeHSB8sPOVceJHT9hDh9XOjmKjA6fJ/F+8FW
	 16R9wLXIWwEfrW3KFdUpKAzjACy3UT+aHO8ahO6VnUsUxaye3/qllbOBbKIPai8qm1
	 3dypByMfmHq+iouT0nv9iZds9WYkYMSUFSHKIRsOjhgF6FY0uiTUsMcnuLVaB8YHtV
	 /y7UYYdkmDvtg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 711193806655;
	Tue, 24 Sep 2024 09:02:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: qrtr: Update packets cloning when broadcasting
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172716854226.3946404.5015813879745947837.git-patchwork-notify@kernel.org>
Date: Tue, 24 Sep 2024 09:02:22 +0000
References: <20240916170858.2382247-1-quic_yabdulra@quicinc.com>
In-Reply-To: <20240916170858.2382247-1-quic_yabdulra@quicinc.com>
To: Youssef Samir <quic_yabdulra@quicinc.com>
Cc: mani@kernel.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, andersson@kernel.org,
 quic_clew@quicinc.com, quic_jhugo@quicinc.com, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, quic_carlv@quicinc.com

Hello:

This patch was applied to netdev/net.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Mon, 16 Sep 2024 19:08:58 +0200 you wrote:
> When broadcasting data to multiple nodes via MHI, using skb_clone()
> causes all nodes to receive the same header data. This can result in
> packets being discarded by endpoints, leading to lost data.
> 
> This issue occurs when a socket is closed, and a QRTR_TYPE_DEL_CLIENT
> packet is broadcasted. All nodes receive the same destination node ID,
> causing the node connected to the client to discard the packet and
> remain unaware of the client's deletion.
> 
> [...]

Here is the summary with links:
  - net: qrtr: Update packets cloning when broadcasting
    https://git.kernel.org/netdev/net/c/f011b313e8eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



