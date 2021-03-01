Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEB67329271
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241248AbhCAUpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:45:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:53288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243637AbhCAUm7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:42:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B810464E75;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=o1U6oi49yKzxvv1vxQ0vyspOrBW0oaa0hh9kH1DzH2M=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=flRV8r8tinDmjGoisPCmOscVOaCiSAT5NDWnkw03TDGSFLuow9LKcHUBh/CdANVSR
         vkLoPXkDOdE0E3bPKKqZ2LqzPlQIbMvbkA4Pz2cTVEaNigEdTCdzPD5KFf5ipjIXjW
         1wA3jSyq29MaZaVWSM8dgrFhFDqd20ESnNg+O24YdNLYjl7BNOTFfi/hwUayfQtUOD
         qxqU0yW7q7w7LmM/+SQQbQmzVI4X0XvxdDcikeUScgXa2PIQ/re90LTF++KvMJM+ac
         v4D12ey6FkotGVX3o+6CtuPXqPTBWrhqGUtdU4+ik8fF24DOKVRl38kmbOquXqwm48
         aUPpRHoo6AspA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B47D060997;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/7] Add support for Adreno 508/509/512
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878273.6187.15318721751141447493.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
In-Reply-To: <20210113183339.446239-1-angelogioacchino.delregno@somainline.org>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 13 Jan 2021 19:33:32 +0100 you wrote:
> In this patch series, we are adding support for lower end Adreno 5
> series GPUs, such as A508, A509 and A512 that we have found in the
> Qualcomm SDM630, SDM636 and SDM660 SoCs.
> 
> On a note, adding support for these three units, also adds 99% of
> the required "things" for another two GPUs, A505 and A506 but, even
> if adding them requires literally two lines of code, noone of us has
> got any SoC equipped with these ones hence we wouldn't be able to
> test. Even though there is basically no reason for them to not work
> correctly, kernel side, I chose to avoid adding the two "magic" lines.
> 
> [...]

Here is the summary with links:
  - [v3,1/7] drm/msm/a5xx: Remove overwriting A5XX_PC_DBG_ECO_CNTL register
    https://git.kernel.org/qcom/c/8f03c30cb814
  - [v3,2/7] drm/msm/a5xx: Separate A5XX_PC_DBG_ECO_CNTL write from main branch
    https://git.kernel.org/qcom/c/4340b46ad161
  - [v3,3/7] drm/msm/a5xx: Add support for Adreno 508, 509, 512 GPUs
    https://git.kernel.org/qcom/c/1d832ab30ce6
  - [v3,4/7] drm/msm/a5xx: Reset VBIF before PC only on A510 and A530
    https://git.kernel.org/qcom/c/9deba2b8a5b5
  - [v3,5/7] drm/msm/a5xx: Fix VPC protect value in gpu_write()
    https://git.kernel.org/qcom/c/89c1ab960717
  - [v3,6/7] drm/msm/a5xx: Disable flat shading optimization
    https://git.kernel.org/qcom/c/cce212d84415
  - [v3,7/7] drm/msm/a5xx: Disable UCHE global filter
    https://git.kernel.org/qcom/c/3f2bc3856bf1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


