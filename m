Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEEED2E7376
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbgL2URX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbgL2URW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1C32922573;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=3fYVYS2Ei2br1O+RSm/7GiTTxp96zmRZ+e5beh2eUfo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=d47vU9y4xJe0nbxXLPANenRiI0xnbFnBzGifEhEm1RhG9NAHFbh51wK7NXf0rfrHZ
         fAYaS46sUZ5tFOlUw+k5bkO4afhOiOsfK+2ifmnesDga7XFS3zba5cG/w6rMFMVHiq
         zi6Y/d6NyovvFTk/FimyKSSib/4mEPtpqC7goZmY7q+1kMIzb1uWOQYyGiAsnweB7P
         01DUPpLGmD2ZnEtwKZuwwbfHDgvsvyMS1MtVWhAPiK6NlY/x4jyRIE4nOUbPHMDiVh
         LGdN8dtkw2UazurZEPhWBsen/+9NdCKBbcK05ElcSYefcQC5lG9F7RGEk/RIrEfcEK
         jI976USqH6lWQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 15FF3604D7;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dp: DisplayPort PHY compliance tests fixup
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293208.13751.17350376903713649948.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20200926045048.16175-1-tanmay@codeaurora.org>
In-Reply-To: <20200926045048.16175-1-tanmay@codeaurora.org>
To:     Tanmay Shah <tanmay@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 25 Sep 2020 21:50:48 -0700 you wrote:
> Bandwidth code was being used as test link rate. Fix this by converting
> bandwidth code to test link rate
> 
> Do not reset voltage and pre-emphasis level during IRQ HPD attention
> interrupt. Also fix pre-emphasis parsing during test link status process
> 
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/dp: DisplayPort PHY compliance tests fixup
    https://git.kernel.org/qcom/c/6625e2637d93

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


