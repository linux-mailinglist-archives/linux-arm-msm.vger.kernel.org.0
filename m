Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 729D832928F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242401AbhCAUrm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:47:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:54430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243511AbhCAUpV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:45:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 43BF564ED5;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=v+yvvRQgacqEoUBXjvSUoaER75yzmREINu3WOQtgaN4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YpA7Qj9dGIiUMoqQylv9CNtcK7NppZH7GhuVIPOiKhAaL/3qVTuktt8ACBGc0gwln
         yZNBLgyRX2R4rEhm2eW+gHC/FjEPzTyt6se8k1UW6Mw8c7WvHHJ+iTixCbNNdpUP0v
         GmdyEXZive9zAngK9mxEncgjIM4wNFofDRZhWYaB3D3ytwlk1reB6fLnpW6kuR8SZF
         bcyZe2GA5r9d0xSto2rixEfNqDKHgkUNzj60i9V+ybex53H1KtV0r2b6vmZ6ywA2a1
         1lI8cZxiU6HpeoL53etUDOXIpW7Ivh3pjZC5CLrvQpe8TZgf1fBPuZD17d79JfWsAE
         pdZXOt7nMkKOQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4058860C25;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dp: trigger unplug event in msm_dp_display_disable
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878326.6187.83656661784029759.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210128021753.2560931-1-judyhsiao@google.com>
In-Reply-To: <20210128021753.2560931-1-judyhsiao@google.com>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 28 Jan 2021 10:17:53 +0800 you wrote:
> 1. Trigger the unplug event in msm_dp_display_disable() to shutdown
>    audio properly.
> 2. Reset the completion before signal the disconnect event.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Here is the summary with links:
  - drm/msm/dp: trigger unplug event in msm_dp_display_disable
    https://git.kernel.org/qcom/c/c703d5789590

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


