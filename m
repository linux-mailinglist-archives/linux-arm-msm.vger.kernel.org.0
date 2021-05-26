Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EB6392064
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235796AbhEZTFt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:41026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235839AbhEZTFS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3474761622;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=xcHjmWmqM7aZd30ipW37xe1LRwOu9+w/GBW0eZjJG0Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=otd2rz4FplufAxyb3+TwJjs7ipFjvc7NrCXvghmCB7PfxMlGPu7bTreOLpMQeK+xQ
         VC31RLOXq0v472uAG8qM4vI2YJiLPPwIgBThJXYtzU4IkpGOpH6xmK2njkeFRoOgz1
         kYHaareDRrw7IbvlKT+J3JRHYnG5xCFh6G7djUFl1Y/t8ZWqoIZ5eHJe15c1/tgI5i
         MgTgHN7U7WsSZIYVHTvEU/NysIyWTrE8zMin++n62RVEHOTOq35AH4Af2GADFVo3V9
         SexucxZv5E4mkBKgcLOTde/PkaMg6tvsv8tn12F4wrXKqVDwv2lO9MextFyS7/248S
         cB5WRJoOofGuA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3056E609B2;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Ratelimit invalid-fence message
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580819.26840.2405280481340139310.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210317164239.1007776-1-robdclark@gmail.com>
In-Reply-To: <20210317164239.1007776-1-robdclark@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 17 Mar 2021 09:42:39 -0700 you wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We have seen a couple cases where low memory situations cause something
> bad to happen, followed by a flood of these messages obscuring the root
> cause.  Lets ratelimit the dmesg spam so that next time it happens we
> don't loose the kernel traces leading up to this.
> 
> [...]

Here is the summary with links:
  - drm/msm: Ratelimit invalid-fence message
    https://git.kernel.org/qcom/c/7ad48d27a284

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


