Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 618B82E7375
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbgL2URX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726290AbgL2URW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E840322472;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=m3IJdgoSjElNNkCwK9JmDCVzpEe6dvoJoPzw5sxtlSI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ropnraY1Xgt6SvJLAJXshOsF6LmfFPc46AhyfutT8+4QTFWSu7056mh8au6bSprGu
         hz1iKhzJ2ivFSWQrGh6Qbhg3iH/IjSH3tgRM3RoFijEKv277Ij/Q7U/hLuMMkyCnXb
         qt2XSmX4rWAOUwtB9DmwPpoSlAONHXeoUB6uid4Kg/KwzfT41Ycs5xoPJiAX9L+KiJ
         2G5Xq40aXC/OVlwZkoe+QH6YzXirwLIDhayPR43VRz9uCCkz/nJBUbMHbBvXr75keu
         8fVaGZQgnbJ13Gsu7Ose0xkaA3Rjn630ZuTJ5orixotrPbwYejoN9la4sKWSe9Bg60
         sJvu426D1o9Jw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id E4632604D7;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/1] Fix 32 bit format for adau7002
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293192.13751.1781783783457995837.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
In-Reply-To: <20201118005858.123013-1-xuyuqing@huaqin.corp-partner.google.com>
To:     xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 18 Nov 2020 08:58:57 +0800 you wrote:
> the microphone is attached to external codec(adau7002)
> instead of rt5682.We need to always use 32 bit format on sc7180
> to meet the clock requirement of adau7002:
> The ADAU7002 requires a BCLK rate
> that is a minimum of 64× the LRCLK sample rate
> 
> xuyuqing (1):
>   ASoC: qcom: sc7180: fix 32 bit format for adau7002
> 
> [...]

Here is the summary with links:
  - [v1,1/1] ASoC: qcom: sc7180: fix 32 bit format for adau7002
    https://git.kernel.org/qcom/c/7f2c63d6ae07

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


