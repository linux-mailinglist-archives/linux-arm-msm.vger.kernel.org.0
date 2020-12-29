Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E88E2E737B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726308AbgL2URY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgL2URX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 52079229C6;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=NyAMvyyippTGGNVasdc5wROWj7h3EyE9s/PyZXYfODo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=H8Sqn7cY8ComwsuXlc1zgD67QJ0lQgwSOgN6QyfyBaFqcVD4T2McixQpVF2LlHHRY
         9L54ptVCnrc2MMqOAWjm0XVQ+XW1wBw1rOTEHyPWsdH+NfVPzO6M2EO1Fp8J2AMNbH
         WdjfBRv4fiMp+cQKFfw9o+13KbXba/RIR3AV3a2SxfkOWcwJPVEnuWMzx5fbz5NZIj
         auZigB9af/x9yo9RhB6Ndfk+OcZ77KM1s64C3YUgon1ShpdnInLZUhI1gxq45RNQGR
         SujeW2Mr1LrPsAwGdtiL1w0O6T199XCnj0MzgCSp/L5j1+GUrGInHA96aK6M+7YneD
         3L1s+QgVml+Ew==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 4E542604D7;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dsi: do not try reading 28nm vco rate if it's not
 enabled
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293231.13751.11593864499707977959.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201030151207.766857-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201030151207.766857-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 30 Oct 2020 18:12:07 +0300 you wrote:
> Reading VCO rate for this PLL can cause boot stalls, if it is not
> enabled. Guard clk_hw_get_rate with a call to
> dsi_pll_28nm_clk_is_enabled().
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Here is the summary with links:
  - drm/msm/dsi: do not try reading 28nm vco rate if it's not enabled
    https://git.kernel.org/qcom/c/0e720ea8de07

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


