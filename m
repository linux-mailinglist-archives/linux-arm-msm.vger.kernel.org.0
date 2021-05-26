Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA04392054
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234480AbhEZTFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235815AbhEZTFN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 22F7E61574;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=EkxA0A/9Af1QM+4WkDR2bCHFlcKbowIDi+20/4VtxnI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Gzwr0wwdBu1TIHGOWUkaWxTSnK1919IzXCd3mku+by66xR8rIA0lgDADguWW8R6w+
         uBgi5D2h2pYFGZUDx6s7eYHiwec3Bc38a7EVXvIxTuepFO/tu40yuE3a5+ty08FWGn
         OclfbJveBjb1t+5792DGkp1BRohwdo2yLoL71aXEHt5EfiM/ZU6J96Niw+KKPtQmhg
         wqK+9+G46SFV0I1REWCAExTNflIIfkPFQhsCmNFZ9cAVgAIGqw6b0HcdJahb1CxEMt
         tby/31cqLHBUkxiTqmcY8D4r4+xlyGB7KnRlkj5VhhWTBri5tvBIsdTAnpH/aABoRq
         nk353TsMyTKUw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1E39C609ED;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: helpers: keep max bandwidth when mbps exceeds the
 supported range
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580711.26840.12636340513424378808.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210331092822.5729-1-vgarodia@codeaurora.org>
In-Reply-To: <20210331092822.5729-1-vgarodia@codeaurora.org>
To:     Vikash Garodia <vgarodia@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 31 Mar 2021 14:58:22 +0530 you wrote:
> When the video usecase have macro blocks per sec which is  more than
> supported, keep the required bus bandwidth as the maximum supported.
> 
> Signed-off-by: Vikash Garodia <vgarodia@codeaurora.org>
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - venus: helpers: keep max bandwidth when mbps exceeds the supported range
    https://git.kernel.org/qcom/c/7bf28a2153ea

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


