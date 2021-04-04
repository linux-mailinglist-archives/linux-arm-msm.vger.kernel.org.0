Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153FA353957
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Apr 2021 20:10:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhDDSKU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Apr 2021 14:10:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:37284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230169AbhDDSKQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Apr 2021 14:10:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DFA5C6135F;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617559811;
        bh=IGpnuokRe7agirT5/pMP8f7NBbEcA595W7W7fAMrOh8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Gvo5qMxiPb8x5i/tZeuyioLlTVvisI6tslIP59ChU9qCCa2A4uGn32P6Yy3H2pUq5
         Y+3rDcy8O+oN3bFjigl+AOfrhWqhSKZwYIp2qZ3x+FzgHZqIkuqDKp9t5ppaKfxaEk
         ODXNi/Qy+FEJnKq4+ocXfzYMbpZ0MANHOXFDcoYFuCwxIt5lVmoBjrcvfu5uQcRQH8
         ka4ab+IW3cyWRvAo/SQb2/J0N0dZYUbHV0+OpfsqhIaRGJkBqGJeGWR2+5ZtxFH0aq
         4+dIU6421lpwDZaB5v4ClOhF2X7AnCEPrkTEGuw3wnQEYVxh5jmytcbMS+yCUTPn6f
         GB2JXuWI45yQQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D2CD260A0B;
        Sun,  4 Apr 2021 18:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1] arm64: dts: qcom: sm8350: Add support for PRNG EE
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161755981185.6823.9532450559619792910.git-patchwork-notify@kernel.org>
Date:   Sun, 04 Apr 2021 18:10:11 +0000
References: <20210401101536.1014560-1-robert.foss@linaro.org>
In-Reply-To: <20210401101536.1014560-1-robert.foss@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 12:15:36 +0200 you wrote:
> RNG (Random Number Generator) in SM8350 features PRNG EE (Execution
> Environment), hence add devicetree support for it.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)

Here is the summary with links:
  - [v1] arm64: dts: qcom: sm8350: Add support for PRNG EE
    https://git.kernel.org/qcom/c/24e3eb2e32c6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


