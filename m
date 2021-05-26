Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4290C39203A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235386AbhEZTFd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:40988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235804AbhEZTFL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A346761483;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=gnS/95ZpPCZ/i8gWGGZOJ5EwT6ys9YHMNFAC07m8+jY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nRGByk5NX5URBcKJ3y7MMbwTcjMZ4p78fxmSAXWVJKnKQPMVncltzKtxMagyBMTpR
         1WW5/biO2119UjgK1SfIZ8qs96Vpbo8a8lEX7riRJA5860rxDssYnDhC2Feas7EyA3
         N3kBhuYd/Cnyqm8cJdncyRd2VjOpLS4qIDdemKiM1pSIr6gr+6nciMsP5JIomsq8CG
         ir5Bw6S6Oh9mZAHkf+hlTN1uRZWYR1GhT/QoQaQ8T1ZJxQ+9/bJSKwYXS734sru6eT
         iD3Yu7FmOpG8m9lfUBasLUYmZCcK7PYLQewtSEozrDmFr+7CbhtX84lU6J1fNoIphD
         PoL3572tCG5ag==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9ED5960CFD;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits
 assignment
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580664.26840.18078207072764046546.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210224230143.1216118-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210224230143.1216118-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 25 Feb 2021 02:01:43 +0300 you wrote:
> The number of fractional registers bits is known and already set in
> the frac_bits variable of the dsi_pll_config struct here in 7nm:
> remove the TODO by simply using that variable. This is a copy of
> 196145eb1af1 ("drm/msm/dsi_pll_10nm: Solve TODO for multiplier frac_bits
> assignment").
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits assignment
    https://git.kernel.org/qcom/c/19f4a055abf2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


