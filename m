Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7318139206D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234146AbhEZTFz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:41040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235826AbhEZTFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8EF0861444;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=AwZ4IaNpslibNWHZn1fLfAokoAo5K9Bh3lQ+dbxSjAw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gaKuC1sjPg1B+1YDyTXcCOXQ/G9S62ZNmJy9TZQBUYACb2dV64rJcq8x804Kyx7Lu
         KcNLCyZPEdqhM0Xfhg9mS+jzAPXpVsj4Iz+o5r68K0/xiH2WjbsIH1PzRxJ45U+rdl
         ICX8W9VbsZQB1g0BWk9RvF5p3fT0kYRu/5gbpe5sZcr+GRBmfxvSKy2ulIGDTrUEN8
         03qfBbt7V9ppvOXbUJlgsNkuPqs0EqEDZPQCzl7dLncLo2CjTkYqKw3O1ECqd+nPLF
         VhdAvYIpTK/dnUQ5pxiqQLHUdbas3Yfth0WJwkzS40tEoFub5n+IIx08CqmL6GFwhW
         VeJ8BppjQSyoQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8A88E60CFD;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/kms: Use nested locking for crtc lock instead of
 custom classes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580856.26840.17470635229981951537.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210211224058.2853809-1-swboyd@chromium.org>
In-Reply-To: <20210211224058.2853809-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Feb 2021 14:40:58 -0800 you wrote:
> We don't need to make up custom lock classes here, we can simply use
> mutex_lock_nested() and pass in the index of the crtc to the locking
> APIs instead. This helps lockdep understand that these are really
> different locks while avoiding having to allocate custom lockdep
> classes.
> 
> Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/kms: Use nested locking for crtc lock instead of custom classes
    https://git.kernel.org/qcom/c/743c97ca9dc9

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


