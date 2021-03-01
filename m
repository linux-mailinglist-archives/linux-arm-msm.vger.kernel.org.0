Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9163292C3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243772AbhCAUv7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:51:59 -0500
Received: from mail.kernel.org ([198.145.29.99]:55300 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243804AbhCAUsX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 36BB164EFB;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=tpdeyMg/MQwmA1riXrNRKrKDBcqweEyOKTNVyxbky+w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=rZsc2qih4E5ZVOOXYUpJADOkkvp9zYN8KXDMzLkMTAragntMD1kwKL3Mi740NHyWW
         YrSHMz0yU3iTtuvba8FpLN9IE3jGLgbRUZ6fEX9jeNicc9weLM2KGmWyGL8YoHcivA
         kp/gjbdxR+0hz5Yncw2gshqXk0TN84JLS7BjJdjPKGtNH+PPx3kwmXflx1r2TYrjSY
         hW+ZYCIeSwZkSddj+PWYG7QWdsI2pxi5bhEdw1rnOxa/vhTeoHJGsLmV9DnGkHC/Dl
         FixuIS5CVZcCDw7FKF2mnaLuWPlJqGToEftELHAXG+iB1TyHse3A7TisINhBPAjXqt
         0yErOPUOwZuBg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 32B2B60997;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] pinctrl: remove empty lines in pinctrl subsystem
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878420.6187.16472068919367349781.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <X98NP6NFK1Afzrgd@manjaro>
In-Reply-To: <X98NP6NFK1Afzrgd@manjaro>
To:     Zhaoyu Liu <zackary.liu.pro@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 20 Dec 2020 16:37:19 +0800 you wrote:
> Remove all empty lines at the end of functions in pinctrl subsystem,
> and make the code neat.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Zhaoyu Liu <zackaryliu@yeah.net>
> 
> [...]

Here is the summary with links:
  - [v3] pinctrl: remove empty lines in pinctrl subsystem
    https://git.kernel.org/qcom/c/43878eb7c83d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


