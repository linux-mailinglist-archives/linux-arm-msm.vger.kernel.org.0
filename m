Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9314329266
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243407AbhCAUow (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:44:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:54062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240066AbhCAUlh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 248CD64E37;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=xW8z2qUm2uP9e8X+3HPeyGEthfyEVYNok7Cn4mM8BVA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=f0LYRsdR70ITjc1tjn4Q3/FG3ElyBba5/AS4EjcL9f+97qS41HgoGqH37pgczajR8
         C6au5NhVLtxGULHuBfJmTjLyFimTqhc8SY85km9hZrA35vMXzgPM/ZYIAcQixx5ZRx
         VBrOjpEif/dMcxphk39h+383TLZlj2yC0S7RGRm0hzY6O9prPy3NaLXXz52BLy3XsJ
         OX6RJgxk/xeFSN7pWCBlEcSu80RdUcLO6ebyRHNZHxrH4v88LG9gHVXCcpASYUVl2u
         rnBZyrELdn6It6uRJuyOv3Nbo6l4o7HsBssdT1vN90MRrN2TXPfoQ04Xn4Tro0ooRY
         aqutViFCgn+Tw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2080760C27;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] ASoC: qcom: Minor code cleanups for lpass-cpu
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878212.6187.906083607879719166.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210115034327.617223-1-swboyd@chromium.org>
In-Reply-To: <20210115034327.617223-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 14 Jan 2021 19:43:23 -0800 you wrote:
> Here's some minor code cleanups for the lpass-cpu driver. I noticed that
> it casts away const from the driver data from DT. That's not great but
> fixing it is a little more involved. I'll get to it later. There's also
> some questionable clk_get() usage that should probably be
> clk_get_optional(). For now this should help a little.
> 
> Cc: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Cc: Srinivasa Rao <srivasam@codeaurora.org>
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Cc: Cheng-Yi Chiang <cychiang@chromium.org>
> 
> [...]

Here is the summary with links:
  - [1/4] ASoC: qcom: Remove useless debug print
    https://git.kernel.org/qcom/c/16117beb16f0
  - [2/4] ASoC: qcom: Add some names to regmap configs
    https://git.kernel.org/qcom/c/03b49bf9a92b
  - [3/4] ASoC: qcom: Stop casting away __iomem for error pointers
    https://git.kernel.org/qcom/c/e697df66876c
  - [4/4] ASoC: qcom: Remove duplicate error messages on ioremap
    https://git.kernel.org/qcom/c/4e15f5060d34

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


