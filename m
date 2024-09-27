Return-Path: <linux-arm-msm+bounces-32664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52016988368
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 13:40:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04600282986
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Sep 2024 11:40:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2591898FF;
	Fri, 27 Sep 2024 11:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RtXXZ560"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8F329B0;
	Fri, 27 Sep 2024 11:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727437229; cv=none; b=Q6tdUpINwZnyr3+Gf0GgsNQPJN3+6Kf8nVhS1MJemoxYubia0mX866xhTBZ0TDqYLnUPY3Yn7DmJUQg1ScGV/PNuPJphkIpkwxEnHMDRRBZsVv6+Xclnz5yqeitFYGj9MmZuTyfK66ncpBTvNYbFUvuAVstrOeZux9Jj0wzunrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727437229; c=relaxed/simple;
	bh=+p5kaVpOnwFVuUCrs+KPwrAE0W9NA+0wEHrYwH2KrTE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RwPmeV1GGXfAVA3QtrZ5MYizDjw8AyeDT38qsQSLJd9UtNF4+sI73w0bd3QHlgxdkAP31WY27Ai3Da+b8HTrYOaJOiUhXtDR8z1reHIykAHWb1HuR3+0gVCPmwApIDZHDlL2u3NhHO+uv5hcdLhFkd1T4wSkOmpS4Hcu4SlB9SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RtXXZ560; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54057C4CEC4;
	Fri, 27 Sep 2024 11:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727437228;
	bh=+p5kaVpOnwFVuUCrs+KPwrAE0W9NA+0wEHrYwH2KrTE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RtXXZ560pNIiLSkEkLSCy2QrnZbhp+uPRfg+APR3Kj7W7zxwULPj21Nqf3Pmxq0eL
	 PWPJ5F0TH+B8rSIvRq2n0zJD3GEh3yquZV26R6Rcw+CyjKqF8dj+MpYmPh6Tbq9scM
	 oGUPoLH1tOBpDzIlk+YFQngD4PR9c/UhN1Ibs9t5UQNJwvq/PnQ/E615bIeqa0p1i+
	 TFb0/xzNDcvnXMHVKfaJdBx9b7VrZ5BD2LljeYUj/F9nF217pa2p+XoQj+GR1qvDJQ
	 BXj07qTDMI8hAI7wWdVLKSrFbXQTBatOySoFuDYmWyjpsLhFsoRhy27aOLA1VNRF7m
	 3tlCCIYGK41Cg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 354CC3809A80;
	Fri, 27 Sep 2024 11:40:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] net: wwan: qcom_bam_dmux: Fix missing pm_runtime_disable()
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <172743723073.1930223.10533462862376551133.git-patchwork-notify@kernel.org>
Date: Fri, 27 Sep 2024 11:40:30 +0000
References: <20240923115743.3563079-1-ruanjinjie@huawei.com>
In-Reply-To: <20240923115743.3563079-1-ruanjinjie@huawei.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: stephan@gerhold.net, loic.poulain@linaro.org, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, linux-arm-msm@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by David S. Miller <davem@davemloft.net>:

On Mon, 23 Sep 2024 19:57:43 +0800 you wrote:
> It's important to undo pm_runtime_use_autosuspend() with
> pm_runtime_dont_use_autosuspend() at driver exit time.
> 
> But the pm_runtime_disable() and pm_runtime_dont_use_autosuspend()
> is missing in the error path for bam_dmux_probe(). So add it.
> 
> Found by code review. Compile-tested only.
> 
> [...]

Here is the summary with links:
  - [v2] net: wwan: qcom_bam_dmux: Fix missing pm_runtime_disable()
    https://git.kernel.org/netdev/net/c/d505d3593b52

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



