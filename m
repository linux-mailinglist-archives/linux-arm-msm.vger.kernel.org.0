Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C92A392043
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233954AbhEZTFi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235623AbhEZTFN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 10FCD61482;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=BX5F6MUrNZMEHvE4TF65iZzYu7C4cUGPAG9q+DMzqwg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UQKTuJajCrquJVreI62yOvWlFky4MDkOUAwPmRZPac7vm/XHz0OtZcAOacHY63ZPu
         mSIhA5IgwbrsRISorxIgjAMJFi9JqQ7RydsJ35XJ4e8Zr1UQmr76Q1M8Ar08+wAlFz
         3l8+OTtkag6IOS8GRvTF/Flz8btLkAKZzhNuJgleaocCZelUeocH+2XXDL/eCtxlP6
         g3txNPxyUEaDUkn9kEVxtZFoatMvNyA1v9zoR1ZKYhG5Zc++m8vGUYWGCJb9CFRrmV
         O1Ie2BAxF6C98noR5p00H9l1lLiEqRR7Xp+c/eBhwV6yBdLjimIFF4l55SHytwLBkT
         rpujuDRXN919w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0C690609B2;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: fix a6xx_gmu_clear_oob
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580704.26840.524142581027735998.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210208185557.15703-1-jonathan@marek.ca>
In-Reply-To: <20210208185557.15703-1-jonathan@marek.ca>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  8 Feb 2021 13:55:54 -0500 you wrote:
> The cleanup patch broke a6xx_gmu_clear_oob, fix it by adding the missing
> bitshift operation.
> 
> Fixes: 555c50a4a19b ("drm/msm: Clean up GMU OOB set/clear handling")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - drm/msm: fix a6xx_gmu_clear_oob
    https://git.kernel.org/qcom/c/65aee407a0f5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


