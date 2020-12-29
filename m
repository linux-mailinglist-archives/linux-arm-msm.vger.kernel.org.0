Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 482572E7377
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgL2URX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:60050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726313AbgL2URW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 278C722582;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=0849UQmh3pECEuE+itmed4HUWjKCXdN6ncquom0Tw6E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nRBI33WHYlgyY3STBASrwoah3DR/OzO1YjmtDYnZ3ulA3D8M6sdq1/pOpyrq8EBJF
         bQeQFNDTxbHlEQUKvvw9glHHa+E4maoPM7/G2yB0bEBA6R8rGf77jv6H16Ch7hYo1N
         byQ/uNZoHJj8OGrbv/JyHsqU0IXecbhIStZOmJ2j63DBbldTdOU8LA8qin/f+IDQ29
         Oo3DHqQj6//BFAUprjK8fLc+D6wsVLYE4siUMdRPU3QiXAcfB3/xID33Q+LN+K/USv
         zVIOCJaqxiRB+pjiMTrerPBftXMRkGveV7pObnTfM7cMWKYJqLL6dIo13flHh+vSmg
         A5owk5D6J9QcQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2131660591;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ASoC: qcom: sm8250: fix HDMI audio playback
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293213.13751.17800277017027945167.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201119123145.709891-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 19 Nov 2020 15:31:45 +0300 you wrote:
> Current code does not setup CPU dai (causing -EIO errors on playback)
> and does not pass SND_SOC_DAIFMT_I2S to codec fmt (causing i2s-hifi
> errors). Fix both errors to enable HDMI audio playback on SM8250. Tested
> on RB5 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: aa2e2785545a ("ASoC: qcom: sm8250: add sound card qrb5165-rb5 support")
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> 
> [...]

Here is the summary with links:
  - ASoC: qcom: sm8250: fix HDMI audio playback
    https://git.kernel.org/qcom/c/ddf1c4b3944a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


