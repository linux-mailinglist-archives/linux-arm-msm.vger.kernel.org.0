Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D93639202F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234576AbhEZTFa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235374AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 38A246145E;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=v+U1SxBQ/Zb3SVd6UZ2ym9NdIxAT7BwhOE33ucz18ig=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pA4zYo1alVdAurjaz1gAYMr0ijk73kXIUiQS5525hZEtrXMzIv2MU6qoJnADwmxHj
         aTVdHFSiCftmXQvEoksAG0QhuDA0fyOyLYIHCqm2P57+dGwWyKJ+ayLvbKfjdcAIsJ
         7eTiYQDpwA5Q3EKlxkYJaaAtaMeN/9wFd39OGdKvsC+9WGxm8XKweU6Fgcg8qEu9ga
         0OKMWjbf1F4VzALljlKuB7hrgNxodIdbyu4dNC31WBT6/nvZl+asffn7oCLB9TpINq
         c7ngEIOHSZARe2D3s9d4oa+wJkW5MxzvRYB5ROYzdwH2Jj3/MZiRjHc5cjIyhoeNsk
         K1CXJixy+qMSA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 34191609ED;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Add co-maintainer for Qualcomm tsens thermal
 drivers
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580620.26840.8701164505667357309.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210319153711.2836652-1-thara.gopinath@linaro.org>
In-Reply-To: <20210319153711.2836652-1-thara.gopinath@linaro.org>
To:     Thara Gopinath <thara.gopinath@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 19 Mar 2021 11:37:11 -0400 you wrote:
> Add myself as the maintainer for Qualcomm tsens drivers so that I
> can help Daniel by taking care of/reviewing changes to these drivers.
> 
> Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - MAINTAINERS: Add co-maintainer for Qualcomm tsens thermal drivers
    https://git.kernel.org/qcom/c/ef6e01af398a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


