Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 840F4392050
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235327AbhEZTFo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235276AbhEZTFP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F965613D4;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=dLSt4sxJU0JK66gE2EbA3sJaQrYUUhqlo287t7zjY1E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lMwDUVk7pN/MIOvxa8C6rzT/rpWx9utWZzF1rgYCbxuaQwxvryFjrJ0nfALfjsrph
         WtZ0A3lussr1uVDdQGe67JVWQrNjEDQjmYpZXOz+rbEMgBPMWYc4439Xj1qpSU+fSE
         aUOYeMnN3pZg9azbP0qrK/florIglv72YUkgBcp0TV6bglLCGrQFbSSt9qI4nWRLM/
         mDu2yN2ZpZ7T2t6fMUhINcMbb18Z/vACnINTWBsL9Wabie9tQg0XnrhabgqiAk45C4
         Y5VpUxLqpoxPZnjYNvFZCczk7KjxVylLtsFW48egl9mcj7P65yTHmJd9Sz3J7owBLB
         Enrevzf9Klp3g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7B665609ED;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] spi: qup: fix PM reference leak in spi_qup_remove()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580750.26840.17957144129758438497.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210409095458.29921-1-wangli74@huawei.com>
In-Reply-To: <20210409095458.29921-1-wangli74@huawei.com>
To:     Wang Li <wangli74@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 9 Apr 2021 09:54:58 +0000 you wrote:
> pm_runtime_get_sync will increment pm usage counter even it failed.
> Forgetting to putting operation will result in reference leak here.
> Fix it by replacing it with pm_runtime_resume_and_get to keep usage
> counter balanced.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wang Li <wangli74@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] spi: qup: fix PM reference leak in spi_qup_remove()
    https://git.kernel.org/qcom/c/cec77e0a2498

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


