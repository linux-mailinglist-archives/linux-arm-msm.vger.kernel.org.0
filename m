Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076FA2E7366
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgL2UQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D8FFE2229C;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=oLNF8ZIV4sjvCHdq/CZyfv5HOjIpLFzFpH7bPtkv7oI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=m24G+quzssnh0rFCNTLBpYkoBUu7cHB7JTESF2LVCssFMetS0KgA4qN2zsv9W+L5u
         wKXuXe6gfp4pMJBmRYq3rGP1ShUnhIm1eOg0b5ofcLDpzrWOpz4rBRQxgmHnwF8d1r
         UTXpUQ+FEX0U2VBKlLWmq4wjVXqwLpn+sQ8j11YUYRE094gxb8KtWeXAg+Hpkt0j2n
         AQG17tHuUN3ovvdl2WFIaPkS4WwfjdrVIZRWq0Yzxl7VQZtKA8CAkBYQObO5ywGDHA
         5X7/au1AGXwJLLxSWnYaoTQtU9xuBcjiTXFOlJipFo6jflAr1C9l6O6HYFD6qP8vP7
         KzVHvWGejxwFw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id D2EBC60626;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Asoc: qcom: lpass-platform: Fix memory leak
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293085.13751.15216901353993654350.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
In-Reply-To: <1605416210-14530-1-git-send-email-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 15 Nov 2020 10:26:50 +0530 you wrote:
> lpass_pcm_data is not freed in error paths. Free it in
> error paths to avoid memory leak.
> 
> Fixes: 022d00ee0b55 ("ASoC: lpass-platform: Fix broken pcm data usage")
> 
> Signed-off-by: Pavel Machek <pavel@ucw.cz>
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - Asoc: qcom: lpass-platform: Fix memory leak
    https://git.kernel.org/qcom/c/bd6327fda2f3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


