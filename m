Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72FE73292B5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243624AbhCAUuO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:50:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:55416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243668AbhCAUrL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:47:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B6E4B64EE8;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=+ss4p5nVMYgwtaziRSMi8zT1CY6YpOoYoyqDSc+Sx9w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=t+kxrYYHoUZlZDh0tm4h2024IhmR6MGYiwwspv6DYReFB0Eqvw3FK1smALzQtiWhe
         lcdnQpTLQxLV8gHMr+0a7SK2Qr0Iv3dCQTBkAnRcyt2UGIB+s3WAu8KwS1/yBaNdoy
         u+vIRuCaPAiJpnBa2XMpeYQXTZan6WMn7E9j3xQ33cRnLGefSesbFZKy8DH5Pk1pRb
         fEyHbWI1whiaiASYGmR7RhYeRLA9PYfqqA7aWthsco5onRmwtpKXt7AHjPKrxpyoSN
         lvACzlB7BswPMBySQYorbtg1Dp6Lr05txLttTrM6d/NljKdaJf+5ZVpLMoZBfn1see
         4hGkjWrFYqhUg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B374360C27;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/3] drm/msm: fix for "Timeout waiting for GMU OOB set
 GPU_SET: 0x0"
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878373.6187.1748332752540063152.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210128210332.1690609-1-eric@anholt.net>
In-Reply-To: <20210128210332.1690609-1-eric@anholt.net>
To:     Eric Anholt <eric@anholt.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 28 Jan 2021 13:03:29 -0800 you wrote:
> Updated commit messages over v2, no code changes.
> 
> Eric Anholt (3):
>   drm/msm: Fix race of GPU init vs timestamp power management.
>   drm/msm: Fix races managing the OOB state for timestamp vs timestamps.
>   drm/msm: Clean up GMU OOB set/clear handling.
> 
> [...]

Here is the summary with links:
  - [v3,1/3] drm/msm: Fix race of GPU init vs timestamp power management.
    https://git.kernel.org/qcom/c/7a7cbf2a8197
  - [v3,2/3] drm/msm: Fix races managing the OOB state for timestamp vs timestamps.
    https://git.kernel.org/qcom/c/5f98b33b04c0
  - [v3,3/3] drm/msm: Clean up GMU OOB set/clear handling.
    https://git.kernel.org/qcom/c/555c50a4a19b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


