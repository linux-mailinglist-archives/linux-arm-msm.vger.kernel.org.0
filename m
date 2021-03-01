Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5173292DE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:54:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235256AbhCAUyW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:54:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:55300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243682AbhCAUup (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E44EC64F1C;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=4aZAdcYbYknOguy/+684DgW5sgDKmShy1uRUzvfnp1c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pQ7fMD+3SmN00UIo4pgB9R8Lb9+wjf5GMswWi4k6Z8JXIE0bt2z+looOUbg5Iq3J7
         JgpJk7fSyv5ALehBHKtYz+lyID1lXG+fDcyvSayEGARDONDetD/PaC+kIaOH0zguzr
         sZRjvHS4DQFMBW3WE38nSD3BIU9wZQVjQgmb2it/PzYQEa50PtctStEsBRRwwHVAlb
         nVLgxKakFfMt5mc3Ggk+WUtqGdPwGfyl/QG2Ek/5XApJy6WKklt7PS1j/FhDF9mfo6
         T127zFijsKBykafS5nE+vYAaoO3+gXWoz5NSXVcvJ6q0/7CgWESdkLcjC7lsyeqck6
         4XS//VC1LlFZA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DF3CF60A1B;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: gcc-sm8350: add gdsc
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878491.6187.9923500746756366403.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210210161649.431741-1-vkoul@kernel.org>
In-Reply-To: <20210210161649.431741-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 10 Feb 2021 21:46:49 +0530 you wrote:
> Add the GDSC found in GCC for SM8350 SoC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/clk/qcom/gcc-sm8350.c               | 100 ++++++++++++++++++++
>  include/dt-bindings/clock/qcom,gcc-sm8350.h |  12 +++
>  2 files changed, 112 insertions(+)

Here is the summary with links:
  - clk: qcom: gcc-sm8350: add gdsc
    https://git.kernel.org/qcom/c/3fade948fbb3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


