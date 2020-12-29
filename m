Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C853C2E738F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbgL2URj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgL2URi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B521322B3A;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=5BH0sNG9NHI9oConmv5MQbz4qweVi+wcx5+qU05FZGA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Gs0bJ2uQq9X7yvkpF+qExUa7HiHUs4vEu5LQd0NIeeOxXmf/b4XU57JeiY9MO3WDH
         aK8U5nTO85qiGfeRQOu7h9/5auKTyHZGghoKF/1UpUvWraA3bVFjFTL2Pc28GWg+Qz
         ek+QRzkyUda6Fx9jOAOeWk1HSjcYjgA6vjoq2cmjURgLPzIQMb/vMTjtqQP9HgWrCE
         8QLtNl/jrXhKmAyUmdbKoHCapa8YcnovDFhsMz62QTsmb9f87CBoOSJki74yA7Id4K
         0EIbs+xNVaiiP49VF4mw8WhbnXib0X8jIOcl39iYwRSmYHyUq/a8fM6SJQ5EjQ02m3
         y90BJbrt1VNdA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id B199260591;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Fixes kernel crash generating from bam_dma_irq()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293272.13751.18241433445311574612.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <1607250094-21571-1-git-send-email-sparth1292@gmail.com>
In-Reply-To: <1607250094-21571-1-git-send-email-sparth1292@gmail.com>
To:     Parth Y Shah <sparth1292@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun,  6 Dec 2020 15:51:34 +0530 you wrote:
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
  - Fixes kernel crash generating from bam_dma_irq()
    https://git.kernel.org/qcom/c/4421fe533296

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


