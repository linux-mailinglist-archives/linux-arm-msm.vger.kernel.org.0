Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70772329305
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:58:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243805AbhCAU5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:57:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:56914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243873AbhCAUxI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 43BEC64F2B;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=H60K1nZunVTMPv8rHSluhgszb2xU2WQ3XeE+zoh3IMY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SnxyJAAZWHNDoQjH5lEc5bPpmRj3VCEOxaL3BEHYiVWgDhuVrfXn2hc9Hs1xACMp8
         Py4fIdzMqZEVj0n5qO08kvDFo4nYaWcKcVFb/dzIFoEVoCu1Cb0BLanf+B8dyncdDN
         wIUjyOMN6KXQo2QjWS7AMDnlkbpXiHKq5HRheykLy2M3iTR+J60xnT1zlmygu7qx0F
         /047ZxloYjjU3hyhY8zg1f8DDtye3gtgF0Xg+etzgHzlXn353zU5EAsQFON8p1LOUR
         IKi5L5nkdmPJF4qp8PbZBlqOi0lEXttgpmQa1ZIB6vfkXmtS4WsKJdi2OT7w+CMpOf
         gLNXOB6bFluQA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4083560C25;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] mhi: pci_generic: Print warning in case of firmware crash
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878526.6187.1577690332258140339.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <1612370382-21643-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1612370382-21643-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  3 Feb 2021 17:39:42 +0100 you wrote:
> Print warning when MHI detects sys error.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: remove useless fallthough & unused mhi_pdev variable
> 
>  drivers/bus/mhi/pci_generic.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Here is the summary with links:
  - [v2] mhi: pci_generic: Print warning in case of firmware crash
    https://git.kernel.org/qcom/c/1e2f29ba83c5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


