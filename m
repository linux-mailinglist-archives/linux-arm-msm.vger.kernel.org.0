Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 793803292FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243681AbhCAU4i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:56:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:56478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243835AbhCAUwu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:52:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5FEA564F30;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=v+BYdMlB8XtxTcokC59r3845kQkZgOqTwmnhTau3jfQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XMF2KTq3TxoKeGziI/C2thi0jVcUnyYUkq8QWbUm/B9dySumNu3sg3UC/HMtj7Cw4
         SkleLz/qK2dFE/NFIGDIcT84w7yN8/fObb1KVcQ5uvPUPTN50BB5UESyo92Tt9wITJ
         Pg2KPr9jNjsSXt0MrlCa5uAm2MrY9p5vA82G9a0IAX0j24D0S8R66kD9oHuBEx43L0
         t87RYx/qZhF0nhJca2opAbWKzZrNaFTqMGCn06iee5RSVROORnFvIadUA3F/23QwfU
         cA/DMDNPUtYeqVWuhRYj1KLEfV9xEygH6VH1TH7PhXihJ+Ge7QxqUSiPvkmClQZgna
         D4f1HD7ohyfsg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5C9EE60C25;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ASoC: max98373: Fixes a typo max98373_feedback_get
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878537.6187.5075401215401636055.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210127134847.1143535-1-judyhsiao@chromium.org>
In-Reply-To: <20210127134847.1143535-1-judyhsiao@chromium.org>
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 27 Jan 2021 21:48:47 +0800 you wrote:
> From: Judy Hsiao <judyhsiao@google.com>
> 
> The snd_soc_put_volsw in max98373_feedback_get is a typo, change it
> to snd_soc_gut_volsw.
> 
> Signed-off-by: Judy Hsiao <judyhsiao@google.com>
> 
> [...]

Here is the summary with links:
  - ASoC: max98373: Fixes a typo max98373_feedback_get
    https://git.kernel.org/qcom/c/ded055eea679

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


