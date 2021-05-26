Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6983139201E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235765AbhEZTFY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:41040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235768AbhEZTE7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 84ED4613F9;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=lSGQzQ2Rewx+59nPWE5dtCLMXDo7Gw/27D0RAhLEYVI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IvUaP/9WRwPiB4Lxbrm9Y9hNBi8cvLDnijbfI87Bf2nELX2iObgXmZl53ZNFBQGCQ
         fp3+0UvMkakcDyj7+YcOww0dyTmVDhuTndTgR6KTvz13Cw4PhwpF0iP9Z9PSWb3lVT
         /jegZDPChHqwnzv7LAUYO5l1lHvsAV5RBr7eWRr5ciyRjtfPrRvX2pFsmET1eg/MYd
         fJ+U/X0BPE73sMc4nPKMsLbpvHidGlvBi5qA3xcoRtiVfMVm3GXEErRbZKgNmq2fJW
         DAz1mrOvg4kR1WM6ySGq8yI4UcFmTheIiIp4od8CwQZGyOTleJXzwZPU5gU5VFnV3T
         8PcZAASKbzM3g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 806DB609ED;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: Early MHI resume failure in non M3 state
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580552.26840.13533003418539379157.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <1614960841-20233-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1614960841-20233-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Mar 2021 17:14:01 +0100 you wrote:
> MHI suspend/resume are symmetric and balanced procedures. If device is
> not in M3 state on a resume, that means something happened behind our
> back. In this case resume is aborded and error reported, to let the
> controller handling the situation.
> 
> This is mainly requested for system wide suspend-resume operation in
> PCI context which may lead to power-down/reset of the controller which
> will then lose its MHI context. In such cases, PCI driver is supposed
> to recover and reinitialize the device.
> 
> [...]

Here is the summary with links:
  - bus: mhi: Early MHI resume failure in non M3 state
    https://git.kernel.org/qcom/c/020d3b26c07a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


