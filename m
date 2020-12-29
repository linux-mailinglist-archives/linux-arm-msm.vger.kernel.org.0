Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699DB2E738A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726348AbgL2URi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726408AbgL2URi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 741D922A84;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=feHLebwd0/joIDPU8W8YpfvkvyGFcL8HCwQjKwXIims=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=eDQFhsg2usHzDOIYQ7lix1pTvmuH47WwCF/dGaRsXEQvFDySKieFnheSYJCL+cCv0
         fmJjxZ9uKv2emoVbrCTsApU6q6QieL6342w4FDlk18fRu1JbY89mHjo7YCiSRvh9jh
         jrq02dzrtBnpiMrC1HXXy3R6SMqu1LidULAXSyjBGWnGl61vWS3Bw4WUhpPclmGArg
         d4fx6RVMTh3V7ODhsR/fh9240msoTTS2P3/S8Wtanx+BbQ7nQcnz8rYO/3ZRRkrKEf
         ct6UeI75dFtQCAC1Xgbvq7ONJNf0g1p4GuT7lXpsxtEpr83ASl97rFXsrgW0irgynq
         Sbc8rv20F70cA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 7041A600D9;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] interconnect: qcom: msm8974: Don't boost the NoC rate during
 boot
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293245.13751.13820430683865594375.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201109124512.10776-1-georgi.djakov@linaro.org>
In-Reply-To: <20201109124512.10776-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  9 Nov 2020 14:45:12 +0200 you wrote:
> It has been reported that on Fairphone 2 (msm8974-based), increasing
> the clock rate for some of the NoCs during boot may lead to hangs.
> Let's restore the original behavior and not touch the clock rate of
> any of the NoCs to fix the regression.
> 
> Reported-by: Luca Weiss <luca@z3ntu.xyz>
> Fixes: b1d681d8d324 ("interconnect: Add sync state support")
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> 
> [...]

Here is the summary with links:
  - interconnect: qcom: msm8974: Don't boost the NoC rate during boot
    https://git.kernel.org/qcom/c/9caf2d956cfa

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


