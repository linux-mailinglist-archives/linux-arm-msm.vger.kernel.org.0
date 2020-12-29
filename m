Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B0442E737A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgL2URY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726322AbgL2URX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5ECA9229EF;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=uxKRLDy1W0yO7L1eUuEUO6d3N4akAV9LGZk652Q3krg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iSeVG1P+DUOGr0HgCcrQ6c4viZ9ex84TwcCkE+D7QWFRVJxZ/sDBEfkvVvmjaNiKi
         jMnA+wmEY331tOQHiwW41JUckW3gq2t+QZpQBd8kPxUfyt2ujipAQ+u9OmrQcED8iW
         iuF5zwnaDpjk+ZUTycQQXgLCAUbJ+VZ+1AIiv5OEuBj2shYdQF0rPJG3Q0Vexaqys5
         HLq/FKhxhTvT2B/W8avk/r8v5EyQw+xBYvBFx6ZQXv+ToZHf3iNazRPwdrs4uK30Oi
         qAB+f/Tn4OJG02SboKb38x6ewHSJLITG3fvOAbsxD/SFC6sJfSJv54ctcod2uWre2o
         11oAJlMHB8zHA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 59CC060626;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [pull] drm/msm: msm-next for 5.11
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293236.13751.10060430681860344755.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <CAF6AEGt0G=H3_RbF_GAQv838z5uujSmFd+7fYhL6Yg=23LwZ=g@mail.gmail.com>
In-Reply-To: <CAF6AEGt0G=H3_RbF_GAQv838z5uujSmFd+7fYhL6Yg=23LwZ=g@mail.gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This pull request was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 7 Dec 2020 13:48:39 -0800 you wrote:
> Hi Dave,
> 
> This time around:
> 
>  * Shutdown hook for GPU (to ensure GPU is idle before iommu goes away)
>  * GPU cooling device support
>  * DSI 7nm and 10nm phy/pll updates
>  * Additional sm8150/sm8250 DPU support (merge_3d and DSPP color
>    processing)
>  * Various DP fixes
>  * A whole bunch of W=1 fixes from Lee Jones
>  * GEM locking re-work (no more trylock_recursive in shrinker!)
>  * LLCC (system cache) support
>  * Various other fixes/cleanups
> 
> [...]

Here is the summary with links:
  - [pull] drm/msm: msm-next for 5.11
    https://git.kernel.org/qcom/c/60f2f74978e6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


