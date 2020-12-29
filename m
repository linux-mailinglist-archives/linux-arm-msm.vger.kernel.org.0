Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF8772E73B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726523AbgL2USL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:60044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726525AbgL2USJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6DF3822CF8;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=bi2CTh4Mr42Sm1+Jz3N1QtvgBII5hQBPQORbDX2IHm0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Y+1E/7h2BAOZDj0lwpKIFvHQOm/HA3RB1KloFZW8fWsz4Aa/IZh5o+aH//Y1ddnvB
         GKaSceee8cIlaLOlmDhL5CQwf2W8X6itR1AMXyifi7HQ5TMOgE8yLPFa/j/Chulxra
         wXORht3jMyRKa406L6KK/j0cz9y2OsOlTibwAXvlJJbT0gYQLl3cntjSlL+EGXD5nZ
         6YhCXHQyxrTkG43bm1v4Q97bSu9BdABvISG3p3PiXuG1c1HLdYG3DkVfsClcgJqlR4
         clgQNNGuOGOyD9yCDkUzMq79lT2NKfCG4GN0haSx1fKEEZ3ReLVB679p/Wk+u4pwUd
         BW8Lssfj6eqwg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 69A7360626;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] venus: venc: Fix setting of profile and level
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293442.13751.9633605041719219509.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <20201027091936.14478-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201027091936.14478-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 27 Oct 2020 11:19:36 +0200 you wrote:
> The profile and level in op_set_ctrl was recently changed but during
> v4l2_ctrl_handler_setup profile and level control values are mangled.
> 
> Fixes: 435c53c3698f ("media: venus: venc: Use helper to set profile and level")
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
> 
> [...]

Here is the summary with links:
  - [v2] venus: venc: Fix setting of profile and level
    https://git.kernel.org/qcom/c/a7a20f721e81

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


