Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FC4E32929A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233004AbhCAUsn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:48:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:54486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243537AbhCAUpl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:45:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6295C64ED9;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=x9iA0oiazqbbzWcgeHqDVVseRKgSbTt+xaKB3aTPMPE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=X2HISIRMMbtXtFlz5CahkkxJH1G6hVEK+WEZVTXQ2kHmlvLbsZYTNqDkI3BkGwWE6
         2NsSlkOqZ9FXvaN3I0thApLaStnfAs1P61lVkdNwwYPv6zA0z2cqrejvAH4biMjdUB
         jgn8/BweIRP8n1I5FJOA0Lct3Acg+qx7sCtkyB4AzFA3A2d1vaqDeY3uxFFaKK6KOC
         bL6R2XnYfY664NK1AHQC3eHYDMTdftD7FvMVzYD61U+XKXFjV2lLPj4SyonH0p+2h3
         Ni7zyeQEzf2YLarneWoLDqfNsUd7yHK+olpt+KqAlcSg9qBV1zK2IMiWDYYLs3Fs7N
         3LRbKLIOsqGCA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5F21660A1B;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878338.6187.2906278795483077363.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210102202437.1630365-1-iskren.chernev@gmail.com>
In-Reply-To: <20210102202437.1630365-1-iskren.chernev@gmail.com>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  2 Jan 2021 22:24:37 +0200 you wrote:
> The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
> != NULL, because aspace is NULL when using vram carveout.
> 
> Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")
> 
> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
> 
> [...]

Here is the summary with links:
  - drm/msm: Fix MSM_INFO_GET_IOVA with carveout
    https://git.kernel.org/qcom/c/6cefa31e8104

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


