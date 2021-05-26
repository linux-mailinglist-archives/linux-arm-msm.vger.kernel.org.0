Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36CE4392067
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234186AbhEZTFv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:41112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235841AbhEZTFS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5AA1261417;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=Dl2m8cWLrDUvKjkoekxet85mvnkXiqAfgX4T7Ixma3Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NZVzNPQyHuV55N4lyBQU5fPCzPOsND3jRl+PW37EJA7TXGGes1icQt2Kg+ARrYX8j
         D70l7nNmV9v8zYRbCovOadZu4mlfQXyvcmR5q942fmUKWArty/zr4J/ibRuc0eplNH
         UVm+k6lOtGnAGt3/Y5LRmzYG195hyd+vo0bGurzUZSSFKP6it8LzeJHUEj5G80aIxi
         GqayUfUYOvtkla3/zLWVrfQ4W2H8/CqGJ5Uq1Z8L9rQkTZvzAdbTvtRuq3ry386fsC
         Y2eecSUJKjW4ms9P8sr0HEd+UaICgE3ZKpS3u/bfMAssnuzNj7o4fiEUCRr9YilGGN
         rF/CmKv57TW1A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5692B60CE1;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580835.26840.16618791179715227314.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210318200544.2244007-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 18 Mar 2021 23:05:44 +0300 you wrote:
> if GPU components have failed to bind, shutdown callback would fail with
> the following backtrace. Add safeguard check to stop that oops from
> happening and allow the board to reboot.
> 
> [   66.617046] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [   66.626066] Mem abort info:
> [   66.628939]   ESR = 0x96000006
> [   66.632088]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   66.637542]   SET = 0, FnV = 0
> [   66.640688]   EA = 0, S1PTW = 0
> [   66.643924] Data abort info:
> [   66.646889]   ISV = 0, ISS = 0x00000006
> [   66.650832]   CM = 0, WnR = 0
> [   66.653890] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107f81000
> [   66.660505] [0000000000000000] pgd=0000000100bb2003, p4d=0000000100bb2003, pud=0000000100897003, pmd=0000000000000000
> [   66.671398] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [   66.677115] Modules linked in:
> [   66.680261] CPU: 6 PID: 352 Comm: reboot Not tainted 5.11.0-rc2-00309-g79e3faa756b2 #38
> [   66.688473] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> [   66.695347] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> [   66.701507] pc : msm_atomic_commit_tail+0x78/0x4e0
> [   66.706437] lr : commit_tail+0xa4/0x184
> [   66.710381] sp : ffff8000108f3af0
> [   66.713791] x29: ffff8000108f3af0 x28: ffff418c44337000
> [   66.719242] x27: 0000000000000000 x26: ffff418c40a24490
> [   66.724693] x25: ffffd3a842a4f1a0 x24: 0000000000000008
> [   66.730146] x23: ffffd3a84313f030 x22: ffff418c444ce000
> [   66.735598] x21: ffff418c408a4980 x20: 0000000000000000
> [   66.741049] x19: 0000000000000000 x18: ffff800010710fbc
> [   66.746500] x17: 000000000000000c x16: 0000000000000001
> [   66.751954] x15: 0000000000010008 x14: 0000000000000068
> [   66.757405] x13: 0000000000000001 x12: 0000000000000000
> [   66.762855] x11: 0000000000000001 x10: 00000000000009b0
> [   66.768306] x9 : ffffd3a843192000 x8 : ffff418c44337000
> [   66.773757] x7 : 0000000000000000 x6 : 00000000a401b34e
> [   66.779210] x5 : 00ffffffffffffff x4 : 0000000000000000
> [   66.784660] x3 : 0000000000000000 x2 : ffff418c444ce000
> [   66.790111] x1 : ffffd3a841dce530 x0 : ffff418c444cf000
> [   66.795563] Call trace:
> [   66.798075]  msm_atomic_commit_tail+0x78/0x4e0
> [   66.802633]  commit_tail+0xa4/0x184
> [   66.806217]  drm_atomic_helper_commit+0x160/0x390
> [   66.811051]  drm_atomic_commit+0x4c/0x60
> [   66.815082]  drm_atomic_helper_disable_all+0x1f4/0x210
> [   66.820355]  drm_atomic_helper_shutdown+0x80/0x130
> [   66.825276]  msm_pdev_shutdown+0x14/0x20
> [   66.829303]  platform_shutdown+0x28/0x40
> [   66.833330]  device_shutdown+0x158/0x330
> [   66.837357]  kernel_restart+0x40/0xa0
> [   66.841122]  __do_sys_reboot+0x228/0x250
> [   66.845148]  __arm64_sys_reboot+0x28/0x34
> [   66.849264]  el0_svc_common.constprop.0+0x74/0x190
> [   66.854187]  do_el0_svc+0x24/0x90
> [   66.857595]  el0_svc+0x14/0x20
> [   66.860739]  el0_sync_handler+0x1a4/0x1b0
> [   66.864858]  el0_sync+0x174/0x180
> [   66.868269] Code: 1ac020a0 2a000273 eb02007f 54ffff01 (f9400285)
> [   66.874525] ---[ end trace 20dedb2a3229fec8 ]---
> 
> [...]

Here is the summary with links:
  - [v2] gpu/drm/msm: fix shutdown hook in case GPU components failed to bind
    https://git.kernel.org/qcom/c/623f279c7781

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


