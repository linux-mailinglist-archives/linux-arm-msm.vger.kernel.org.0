Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7392539204D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234558AbhEZTFm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:41026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235336AbhEZTFO (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 762DF613EC;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=v5qUcDFuPj39FwnUyem/pp2vIwGt9TaRJ/2tuki+mbY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=MexJ4erDJOSjZDr8WizwSQDWhhnq3ONzh1Pvg5FPqSZOeNeg8MQULmoKHaO/tZwOB
         03t6T1Dxscrg9L4lf9SmixEzYD+mP+uCL1slvgOihST+6fsFKVcAKbtPP+fwHBMJVj
         VIiwP0kbfJdQyIYU23bZ8PiozKEplmD+/wZ7C80ZyQ4/9/0theFJfiW9Ns87QbcM6L
         fMmK11B7353MpksUPwf9qtNAxdA5hrbQmkhP8UGBPQnyatxePn29oW5dmiyaxZlMbv
         bcnBGH9r2d3j3j+2VPByuv6lRkMtBzihUlF6yAItHaN1ZkkJRwDsoaFWDKZwK/uaLH
         myMFC+lLKv/Fg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7270A609B2;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: a6xx: fix version check for the A650 SQE microcode
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580746.26840.1545971111393758815.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210331140223.3771449-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 31 Mar 2021 17:02:23 +0300 you wrote:
> I suppose the microcode version check for a650 is incorrect. It checks
> for the version 1.95, while the firmware released have major version of 0:
> 0.91 (vulnerable), 0.99 (fixing the issue).
> 
> Lower version requirements to accept firmware 0.99.
> 
> Fixes: 8490f02a3ca4 ("drm/msm: a6xx: Make sure the SQE microcode is safe")
> Cc: Akhil P Oommen <akhilpo@codeaurora.org>
> Cc: Jordan Crouse <jcrouse@codeaurora.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> [...]

Here is the summary with links:
  - drm/msm: a6xx: fix version check for the A650 SQE microcode
    https://git.kernel.org/qcom/c/6ddbfa1f5adb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


