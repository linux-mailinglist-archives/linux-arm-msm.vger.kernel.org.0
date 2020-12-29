Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DB3F2E739C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgL2URu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:60242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgL2URt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 47D8222BE9;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=JF69+u61+3O/y8S5MkMwF20HTF2R+1RJMaETnD9jkco=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=a+baYl6YNvMuc3loxQX6i5T+oeu93VdjcA1bYjpsstIm33uHgjoA5O5anBt9SppVl
         8oyF6SxoSS+CLLyIOZKbva5yOmF0AyjI3qGKJ2lvMj2mqSi35lqB2fWn5F1451zk4W
         Xt54126WQhXnAOVvaqMPaTIGINY1X5gY2HFwi8z4U5EXa/TTYNA+wTbKRBAuzGoJID
         5Pacl7XPvcJdGil4jsV7TvEpl2DwkMOTJR+nkbWsuQLscbp59OLI7PL52DVHGGUQBU
         xBz7cIAc/2MlBTwwmLAkN2nMOVdm0MVGuAD8V7qBKAf74ya0WDxpfp9HxLsxB/ymbq
         /bhHe5YjeUXfg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 43D9360626;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] drm/msm: Implement shutdown callback for adreno
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293327.13751.12029555301809883319.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <1603895711-23755-1-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1603895711-23755-1-git-send-email-akhilpo@codeaurora.org>
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 28 Oct 2020 20:05:10 +0530 you wrote:
> Implement the shutdown callback for adreno gpu platform device
> to safely shutdown it before a system reboot. This helps to avoid
> futher transactions from gpu after the smmu is moved to bypass mode.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
>  1 file changed, 6 insertions(+)

Here is the summary with links:
  - [v2,1/2] drm/msm: Implement shutdown callback for adreno
    https://git.kernel.org/qcom/c/a04c696c0a54
  - [v2,2/2] drm/msm: Fix duplicate gpu node in icc summary
    https://git.kernel.org/qcom/c/5785dd7a8ef0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


