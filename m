Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D94F391FF0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235767AbhEZTE7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:04:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:40988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235293AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D8AF4613E6;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055803;
        bh=fQPas12/x+0sPSmUziolA9oE65RdGHCYFP1EcBp7kmU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hpoN7A4zynE9DDcFhKlaC20RVBu2zyZ9mPR4q7qprHA5P9hXSxOukANdLuNtHVc8o
         EdZR4MPnYgKyn/EzgC8T5uAr+9l0myG2uuU8qX67R2qrAmPdjuMyM+2M7soWE5AakI
         XbxP+kFsXVIODVO9yhY8xvs8FlfEddaDKfcwQoFq3HOUfWCjNn8EhT85/VDp1siLUp
         wVsbRprAGOB3XY8K5yfflHsBIXacZzxahiLx37om2vWqOO6FfGNh9wKL98d0gxqLbl
         UN4fKAgdVKeonfxK7/35RHZlsKPhaiKGQHOpEwoIKHoVw3hbOVEktoguAaEV0+K/wm
         G8YZvFdyZp8xw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D2A3B60CFD;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] drm/msm/dpu: fill missing details in hw catalog for
 sdm845 and sm8[12]50
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580385.26840.17016810459146685880.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:23 +0000
References: <20210401020533.3956787-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210401020533.3956787-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 05:05:32 +0300 you wrote:
> Fill clk_inefficiency_factor, bw_inefficiency_factor and
> min_prefill_lines in hw catalog data for sdm845 and sm8[12]50.
> 
> Efficiency factors are blindly copied from sc7180 data, while
> min_prefill_lines is based on downstream display driver.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [...]

Here is the summary with links:
  - [1/2] drm/msm/dpu: fill missing details in hw catalog for sdm845 and sm8[12]50
    https://git.kernel.org/qcom/c/4f2c98383fcc
  - [2/2] drm/msm/dpu: always use mdp device to scale bandwidth
    https://git.kernel.org/qcom/c/a670ff578f1f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


