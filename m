Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1C5C3292CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243474AbhCAUwZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:54872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236276AbhCAUsx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6944464F06;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=BkGKq2TDVv1JeHH+q4PdaRiy2/OSInJ/2A9xARnx1gA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=APphgN2Fm7FuP7vXGf0SJgEekrtvfnDwJQfgyWdl/CQgH6Mp6a91PQGhOmWvdK2jG
         AYjS2Hink9VdKzVAF3i8KImyUvWRJJk/sj3xlhj2nijReiTKDmPUPt4rZZTNPsuT0v
         sNJr0Jz08Ls8ODZSgauj4K+NvoKAPV9I4bQkbH6zylBql523zvF+IqX+dYP9qqb9Mz
         JkfHRJDVA8q22jYplDaxctc9YxBeitfRANFovIGaMHT99Sua5ekFHyP8kecx0B0WN4
         6BHwWpYdrDia3fWG/BayqDq1JhceIkVirKkygDosEP32/46X4B4ID0sbRq63lhpFou
         8bsPuIZL5103A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6536560C26;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] dma: qcom: bam_dma: Manage clocks when controlled_remotely
 is set
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878441.6187.7566254509554088332.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210126211859.790892-1-thara.gopinath@linaro.org>
In-Reply-To: <20210126211859.790892-1-thara.gopinath@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 26 Jan 2021 16:18:59 -0500 you wrote:
> When bam dma is "controlled remotely", thus far clocks were not controlled
> from the Linux. In this scenario, Linux was disabling runtime pm in bam dma
> driver and not doing any clock management in suspend/resume hooks.
> 
> With introduction of crypto engine bam dma, the clock is a rpmh resource
> that can be controlled from both Linux and TZ/remote side.  Now bam dma
> clock is getting enabled during probe even though the bam dma can be
> "controlled remotely". But due to clocks not being handled properly,
> bam_suspend generates a unbalanced clk_unprepare warning during system
> suspend.
> 
> [...]

Here is the summary with links:
  - [v2] dma: qcom: bam_dma: Manage clocks when controlled_remotely is set
    https://git.kernel.org/qcom/c/123935a4ca93

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


