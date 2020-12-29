Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C37A2E7381
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgL2URd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:60228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726314AbgL2URc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 28190223E4;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=2UkUlh1+5KmCiaRVyYaMGHIJoB4gHUJqdvy6q4ag/gE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZOikYOleJcCRfX0EUiTfdKLh5BPfnhFn82Pm01olrAaFx/tbRyvuulMoBil6c0T8Z
         NT6tmCIlq1AnJhTGpHj9LTWJQKdUu1aEM2PH8EAmmjPox2JDfsUAL72VupI4EDnCxg
         PEr4Hip9mDuYNVbiV3r0q0T1yd0UpLrajWDwzOwKRepTdstLMC97dDY3b9Zf1bEyCj
         zo0xqA2t2PmZmXLSYFHLKm4B45YGMHY/zzHj/jggCX9K9OtzO+SEnm8B6cFTLOelKE
         rIrn86a3PboA6YYeB2kAKhRwdw+J31BVthltRmRdIP6Tur7Kbp8LGNitw/1p962bvW
         VANsLeiyTrQQA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 23784600D9;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] msm/mdp5: Fix some kernel-doc warnings
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293114.13751.6858989809330925232.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201129181243.1091742-1-robdclark@gmail.com>
In-Reply-To: <20201129181243.1091742-1-robdclark@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 29 Nov 2020 10:12:40 -0800 you wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function parameter or member 'enabled' not described in 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess function parameter 'enable' description in 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'ctl' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function parameter or member 'start' not described in 'mdp5_ctl_commit'
> 
> [...]

Here is the summary with links:
  - msm/mdp5: Fix some kernel-doc warnings
    https://git.kernel.org/qcom/c/03b6f2d6204a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


