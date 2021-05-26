Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC2739205B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235782AbhEZTFq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235832AbhEZTFR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E83FD61554;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=/i8lyobAKB2DwwwQS89Vv085YR90vM4x3xKCtUvR5yk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ofgUfxNu2wsTSNO90k6ghlhmnnYX1XyafJwRxUL7WUEb2BVNFF+7LyNAT1TohVs2D
         l5p0sMQLbVs/9aC5Fkf4+VsGbfs87Sv3tEIqnFvS5VM1y9eRBTYySe86v2rRWTZgKf
         vqBJaN6ALIGj3sHYfRaEC0qIco6G+ewGo28nE9Z9NxR8+9ECJZZBxQenNqx1pHkZws
         xOqTkz2uXn3kQbDhJ1UHYNGP3HdZrXbf+hhtpaz91Xv68+VWzyVKcFR2GufKbO94rv
         TGiigRjbCt+bEIOg+2KYZRF9p3qhc/GkJ3N/1KhBAWL3hGfVXKVxEJMwDmA/SNJ0j0
         +Fv8Mw8VIetfQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E411960C29;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] mhi: pci_generic: Add FIREHOSE channels
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580792.26840.8283543829695327630.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <1617784860-32439-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1617784860-32439-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  7 Apr 2021 10:41:00 +0200 you wrote:
> When device enters flash programmer context (FP), it exposes firehose
> protocol through the EDL dedicated channels.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/pci_generic.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)

Here is the summary with links:
  - mhi: pci_generic: Add FIREHOSE channels
    https://git.kernel.org/qcom/c/11134390d742

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


