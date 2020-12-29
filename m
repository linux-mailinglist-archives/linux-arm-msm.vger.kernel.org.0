Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0330A2E736F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgL2URJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726281AbgL2URI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D2C542251F;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=ThTPUxZCkYnmtbSY2+HFsjtAtlf2AZjsRE0GM4ixgYk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XFERJg2RtBV61bTbYujLf7nH8TanvcsIrle8cM6vGVtEYPgMpMLdN5tcfe1TB+2ft
         SIKa54JIXqTZC+/HRXMhuwtotngolD/dX3aB7MEJf6hIOUT7fce6ZwBi0u+IdN9G3U
         s1UT2CWpRGImWsEbkbK4Mk7uGv7djvlWD3yVwcGKc+umdzcIEDAXCuOB5e47Nh/xMD
         5YE+O3KJ69Oq0/DwJ100RivpXOS13+2I9/FR4ZtBaqTmOA+SjxsN9bzhfxsfwTiWga
         tlRjTESLGgxJvXtNtb05FcdvaLV1TbBJ+Ei5Eu1GOSmZBPG72lw1NOZgTsMHgjBkhs
         JRq6AqErYK+jA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id CE328600D9;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] drm/msm: Shrinker fixes and opts
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293184.13751.14272439129941355890.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201116174851.878426-1-robdclark@gmail.com>
In-Reply-To: <20201116174851.878426-1-robdclark@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 16 Nov 2020 09:48:48 -0800 you wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The last patch is the main thing, motivated by some cases where we would
> spend a lot of time in msm_gem_shrinker_count().  First two are fixes I
> noticed along the way.
> 
> Rob Clark (3):
>   drm/msm: Protect obj->active_count under obj lock
>   drm/msm/shrinker: We can vmap shrink active_list too
>   drm/msm/shrinker: Only iterate dontneed objs
> 
> [...]

Here is the summary with links:
  - [v2,1/3] drm/msm: Protect obj->active_count under obj lock
    https://git.kernel.org/qcom/c/ab5c54cb8835
  - [v2,2/3] drm/msm/shrinker: We can vmap shrink active_list too
    https://git.kernel.org/qcom/c/fcd371c23c3a
  - [v2,3/3] drm/msm/shrinker: Only iterate dontneed objs
    https://git.kernel.org/qcom/c/3edfa30f2340

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


