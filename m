Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10D922E7394
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726480AbgL2URs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:60230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726419AbgL2URs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D5D4922B43;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=KzC0Vd6FmNdmk5FIi6x4bg2ZOFxvm3FYZK60DavNQE8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Fmne01xWU/dHA5w6ZRqpFa492UC0Dtr9ZWllGj58dFS78G2rdDoIb3Tij3OAjiQvl
         AdmkQiqLJ0FxL1o1C52cXPRk9xoQ7fHEcAKbtcxGhNHpvOgYBtV94R2QTd16+ZvsT5
         UoUfw7PZPKj13If+BkDfBAjg6ZZF3SPH2SUFqLI+rQyHWdA9RSgkxhN8+UzDZ3DiLv
         5+4aX94iYJjHbyaPZWifPlSqMuhzapx+Exrgx9VubNK5YaerdRjnF9WIdo5ihZu/bh
         zxyN7SzX5xCdSqmLr9C6ijnf7HeQPUE8IRnbt73FF+L9Kn+5GAhweVKZhaMdMAb+IA
         63SOH4mcVBwPA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id D259860591;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/2] cherry-pick miised DP related patches
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293285.13751.1543824625465709740.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201103225336.17141-1-khsieh@codeaurora.org>
In-Reply-To: <20201103225336.17141-1-khsieh@codeaurora.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  3 Nov 2020 14:53:34 -0800 you wrote:
> Cherry-pick two missed drm/msm/dp related patches to msm-next-staging
> 
> Kuogee Hsieh (2):
>   drm/msm/dp: return correct connection status after suspend
>   drm/msm/dp: fixes wrong connection state caused by failure of link
>     train
> 
> [...]

Here is the summary with links:
  - [v2,1/2] drm/msm/dp: return correct connection status after suspend
    https://git.kernel.org/qcom/c/19e52bcb27c2
  - [v2,2/2] drm/msm/dp: fixes wrong connection state caused by failure of link train
    https://git.kernel.org/qcom/c/62671d2ef24b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


