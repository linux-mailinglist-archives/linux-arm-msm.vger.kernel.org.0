Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C35662E7382
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgL2URe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:60234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726328AbgL2URc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5D64822475;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=cf/skaA9YEfv5YJ+ab4XugYkR8oPfPsHkSEGVr2pAQU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LIBymhYajdlyS4bFsPylP3BI1jm9EDpO9/keQpbDQ2kjOH6R8quatA9G648HvlkuN
         GdkgkP33mWnnKPjLTuGeuGbwgbSlyfGaQzPz8oYq6qJiFwg5br/3nL6nOJJH1Xc6qY
         5wdFq24VBKnFjFm6GIgsCkcDh/AQo12JbMm2CGf2PKOB7W4yQWBelPnSF34e4SSToO
         JYiwv9M3zRvEHyUa3cHGeV7oGP3+30UR1zXpzlTR7rVhszI32dGaTP2z923Ov0yWYF
         Xs/Q6m5ux9KUL6Z5JGhV12t5WAVkEMDwWVGUf836pofexs9Z5KOaeU5ZH9riZK/3qN
         r90PVj19HI/0A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 59AAE60591;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: q6v5-mss: fix error handling in q6v5_pds_enable
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293136.13751.8824875801895770472.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201102143433.143996-1-zhangqilong3@huawei.com>
In-Reply-To: <20201102143433.143996-1-zhangqilong3@huawei.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 2 Nov 2020 22:34:33 +0800 you wrote:
> If the pm_runtime_get_sync failed in q6v5_pds_enable when
> loop (i), The unroll_pd_votes will start from (i - 1), and
> it will resulted in following problems:
> 
>   1) pm_runtime_get_sync will increment pm usage counter even it
>      failed. Forgetting to pm_runtime_put_noidle will result in
>      reference leak.
> 
> [...]

Here is the summary with links:
  - remoteproc: q6v5-mss: fix error handling in q6v5_pds_enable
    https://git.kernel.org/qcom/c/a24723050037

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


