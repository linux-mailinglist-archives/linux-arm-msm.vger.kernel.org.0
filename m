Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F0332928E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235420AbhCAUrk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:47:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:54316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243294AbhCAUoq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:44:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2DF7764EC6;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=8kEIBz0VNvNg1CWUn2jSyyrtqA+3fU9A3e+hoULjgWg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=q4F4nDezsnTI1eR5TGCNWgmueghAiAJy8CIaoMD897cHx1YQqEnZwPCoFT+/3QLEz
         m/e0LfdxqqeWfrAbZm0LSKutB2xF5J8GjhP91K6nK0byRqxUHIjFimVZNFZcMz2avB
         Y7xt+PTDClgEXsg/46pGeTeeYZWHxaPaUszAQFPqVhZRDcpLQ+hmx86nv/dTgIx1u2
         D1aCXvdPov0WDzKYrK6RSSmpOqzpmUPjxGXjxqvD5KzC0uEHxYINsShGeLQyyr5Pbn
         7oKzkPOI4JqnkDqeEOQDsUufLZe7ZGLOkCtDnzFlAn+4V0nO6Hud/I96f2CSmRmmZ5
         8wRuRbe8qt6lw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2A4F660997;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] cpufreq: qcom-hw: drop devm_xxx() calls from init/exit
 hooks
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878316.6187.10719360431050184498.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210119023925.22724-1-shawn.guo@linaro.org>
In-Reply-To: <20210119023925.22724-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 19 Jan 2021 10:39:25 +0800 you wrote:
> Commit f17b3e44320b ("cpufreq: qcom-hw: Use
> devm_platform_ioremap_resource() to simplify code") introduces
> a regression on platforms using the driver, by failing to initialise
> a policy, when one is created post hotplug.
> 
> When all the CPUs of a policy are hoptplugged out, the call to .exit()
> and later to devm_iounmap() does not release the memory region that was
> requested during devm_platform_ioremap_resource().  Therefore,
> a subsequent call to .init() will result in the following error, which
> will prevent a new policy to be initialised:
> 
> [...]

Here is the summary with links:
  - [v2] cpufreq: qcom-hw: drop devm_xxx() calls from init/exit hooks
    https://git.kernel.org/qcom/c/67fc209b527d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


