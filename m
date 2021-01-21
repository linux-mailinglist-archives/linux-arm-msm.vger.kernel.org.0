Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 036AD2FE11F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 05:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbhAUEvs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 20 Jan 2021 23:51:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:44344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726204AbhAUEuw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 20 Jan 2021 23:50:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3DA48238E9;
        Thu, 21 Jan 2021 04:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611204609;
        bh=br6m2tTYSdcopOUbFoopjbuwijbHFB7/N1sORWUNTWc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Zp2JrstundbhmAF0xPhmmaFL7OYMREsmji3KpzQNRZfCYfRlvHLI3Wy94kCmW6B1z
         qeInRadrcsGnzDs+Q/EhosmJq5V4STwcuKiTHenVoG2LrnNOFn27oNTCz0aBG8bqRa
         vI7nl7bEXylUAb9axxKiTuu7tjjqAxcLQ3Ya7wAlpAmfr96WI3JJlkfeD8P3pLSbR4
         Y6owbtP4X/V+uo/dIlhdQvBXj0OPzed48uVvnTnFvgy399gViVZvQc6hye7Tdeb/gZ
         RcnGOr7dSVW0al98ook6Wn/wh4J3JFcMfmzq6d0e8BewKY8KLN0XEy+2isNmyhiHsn
         PZki4gFW6NL1w==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2C52560671;
        Thu, 21 Jan 2021 04:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-klte: Fix shdc numbering
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161120460917.18989.6843878058844620568.git-patchwork-notify@kernel.org>
Date:   Thu, 21 Jan 2021 04:50:09 +0000
References: <20210110185835.133059-1-alexeymin@postmarketos.org>
In-Reply-To: <20210110185835.133059-1-alexeymin@postmarketos.org>
To:     Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 10 Jan 2021 21:58:34 +0300 you wrote:
> Since commit fa2d0aa96941 ("mmc: core: Allow setting slot index
> via device tree alias") proper aliases should be named "mmcN".
> 
> Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
> ---
>  arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - ARM: dts: qcom: msm8974-klte: Fix shdc numbering
    https://git.kernel.org/qcom/c/5ccdc931515e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


