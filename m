Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B0C92E73A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726487AbgL2URz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726503AbgL2URy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A7DD422C7E;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=DIyr9GrxSTaILYFOGW6CORD7tk+ut0aBSDlsNT8E+D8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GZGs8SCl08kiU2RT4onIpDOnlxi9ctcCmEkcuXxYFCw+IDfDlOoFE0aCu/LkDlnXX
         jW6VE9BUsP3J1373EZhOSAFF5DqgfSmEDaw9tUIFbw6+XxJV/0mVsWJU9CFr1pCOKD
         AE18Axz4dWwgPfYXkEyqC71YJ4P0N/Ln5k67akLkp5FrnmT3jNF8Gq1T3wlVovb3Bl
         ZofibhLye0znA9DhSQBTUBA2m5w8xJRxLhL4+/OV7xvnRGGqgdzIPJlo3Fj0WNCqzM
         JiuJP6N1xmf0sM2LlQN49EG8dCYouCax9VeaKdNi1pNwVsTiZn/G4okRo5uF2ntEL1
         ca3U0C3eZ5VtQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id A42D6604D7;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] drm/msm/a6xx: Clear shadow on suspend
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293366.13751.177629542188411248.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201110184401.282982-1-robdclark@gmail.com>
In-Reply-To: <20201110184401.282982-1-robdclark@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 10 Nov 2020 10:43:59 -0800 you wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Clear the shadow rptr on suspend.  Otherwise, when we resume, we can
> have a stale value until CP_WHERE_AM_I executes.  If we suspend near
> the ringbuffer wraparound point, this can lead to a chicken/egg
> situation where we are waiting for ringbuffer space to write the
> CP_WHERE_AM_I (or CP_INIT) packet, because we mistakenly believe that
> the ringbuffer is full (due to stale rptr value in the shadow).
> 
> [...]

Here is the summary with links:
  - [1/2] drm/msm/a6xx: Clear shadow on suspend
    https://git.kernel.org/qcom/c/e8b0b994c3a5
  - [2/2] drm/msm/a5xx: Clear shadow on suspend
    https://git.kernel.org/qcom/c/5771de5d5b3b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


