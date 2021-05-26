Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CED439206B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235683AbhEZTFy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:41156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235668AbhEZTFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F0BC61629;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=aRsWGdYrfMviifS1D5UkZBJZjQFNgzyGwUmM2TqKU5Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UFWhItWkmrvXWL1ML0vZb8fSYKEj5IKL27emOhm+DXdSrlG2NYgyQNNY1tjZZG5LJ
         MsXDw44u2KWJdHR+rF9VkQuDoTkeTDps8F2rnGs4XNaTg6ffAsZR3o1dlejA+kaklq
         Ecx3eWGles4Mozd1UWTinETSmzV6mjCdMpgnL6G0YraW3TmkVQrlBQaA4e0XjtPAUA
         IpKn+1FUm39lH3Ic6BLMbQ5B6yMaZDVXRJI7B9aEO1of0jvN4FnnNXIjpoavjpBaHa
         DUU8mya+hBeW3VGpsU2BAHGzlgKkAT2LFVqM76w+v+HkUwDl95qOh0AYEG/Slb1vOz
         d9uAJyYVKqGZQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 78529609ED;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] media: venus: core: correct firmware name for sm8250
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580848.26840.11087920627947029035.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210409003355.1129672-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210409003355.1129672-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  9 Apr 2021 03:33:55 +0300 you wrote:
> Firmware name for venus should be qcom/vpu-1.0/venus.mdt, not
> qcom/sm8250/venus.mdt.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - media: venus: core: correct firmware name for sm8250
    https://git.kernel.org/qcom/c/fb2b008b00fe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


