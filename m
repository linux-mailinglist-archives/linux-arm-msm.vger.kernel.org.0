Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8E4E41A37A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 01:00:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237909AbhI0XBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 19:01:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237903AbhI0XBq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 19:01:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D43B861058;
        Mon, 27 Sep 2021 23:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632783607;
        bh=pcYx9M/LJ20OAehGzzaYKqNyFU0ka+P5TepaE1E7aKg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GkMKRdJT+J1zx28/qwWPdBu1UzuoVGBqFIOUyunhlgG+3Wo0/JFqJd2YxPooUfrtd
         QX7y422vNXC3bCKVZuzb+IMuebJnu2BKhfcWXD9wmZzlOLs2cC6AtnLkhdzYt9y+to
         BtPFHsws5zdCT+pUPcGp2O7HjEOksle7bRTIpXYjX+oARzUZihReBdkv5GYpzvdVZS
         H0mlMYqv8MS72yjaF5coFNx+YBCC81i5eT/yDtO5mJ7feclp+TQ9v2lyjsNbnzc7d9
         ENBV9oyT1XTBjObwQ1G1LVIFK0Yy6NbsQ0cLOJXJZpKig9WsH9HcZJ+B9AEfc83nbz
         TJ8J5fxyeksHw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C8F6360A69;
        Mon, 27 Sep 2021 23:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Fix Secondary MI2S bit clock
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163278360781.4723.13409230876953128767.git-patchwork-notify@kernel.org>
Date:   Mon, 27 Sep 2021 23:00:07 +0000
References: <20210816181810.2242-1-stephan@gerhold.net>
In-Reply-To: <20210816181810.2242-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 16 Aug 2021 20:18:10 +0200 you wrote:
> At the moment, playing audio on Secondary MI2S will just end up getting
> stuck, without actually playing any audio. This happens because the wrong
> bit clock is configured when playing audio on Secondary MI2S.
> 
> The PRI_I2S_CLK (better name: SPKR_I2S_CLK) is used by the SPKR audio mux
> block that provides both Primary and Secondary MI2S.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: msm8916: Fix Secondary MI2S bit clock
    https://git.kernel.org/qcom/c/8199a0b31e76

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


