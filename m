Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 412ED2E7390
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgL2URk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726434AbgL2URi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C2D8222B3B;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=ntd4o9xSk5/WY+Q98XmKvULEo0Kh1rzjNOgzshsMNkg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WJvvZ2TCbBv5MhpAWidHGn1YlzUsvjJpzzWVPmTS4KELxjz+dK7VJdvsBnUkbo6Tg
         fBUSbakFwvbpmBXXHdOy3Zsh9n0/gigqLxA9SbGncIr7rS7kXc/QiobABhNrLJf3Zp
         HrZqDYBu+5+qzHSvmHErROCNLAzVFpcLG3kNhS81TnP4LRca5Oc8IxwVDnupBmp4wC
         FA7CcCZo18uVlkRWH/ALFAqUBq5pgrFMByp5tfSc2gdMw8Kh0U9507+dWoF0d0Yb2V
         zI9nM4V3cogdnysbsO1Id1JlgJrs4uMUX8Lw2CwjAWNL0twwn212d2yc1VJ/yWAZ8u
         0RDTUlHfIfi4A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id BCF20604D7;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dmaengine: bam_dma: fix return of bam_dma_irq()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293276.13751.694625128590896663.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <1607322820-7450-1-git-send-email-sparth1292@gmail.com>
In-Reply-To: <1607322820-7450-1-git-send-email-sparth1292@gmail.com>
To:     Parth Y Shah <sparth1292@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  7 Dec 2020 12:03:40 +0530 you wrote:
> While performing suspend/resume, we were getting below kernel crash.
> 
> [   54.541672] [FTS][Info]gesture suspend...
> [   54.605256] [FTS][Error][GESTURE]Enter into gesture(suspend) failed!
> [   54.605256]
> [   58.345850] irq event 10: bogus return value fffffff3
> ......
> 
> [...]

Here is the summary with links:
  - dmaengine: bam_dma: fix return of bam_dma_irq()
    https://git.kernel.org/qcom/c/4421fe533296

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


