Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFDCB3292C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbhCAUwV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:55366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238003AbhCAUsx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6008264EF6;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=78jm51IH/kWh/s42mhw0a2N502lxjcgR3tc9SG4vNCs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=FXz7fFihBElgT7QQhY4xOtHRS5EPxwnV2y27OVpEk01bah0OjPAL3mKYP4nZ1aevl
         2S6npRhurF+IuE7y0pSDezf2W5RbXViaeHKBxnl2Hz+mPxjMzfFMzfhml8QCK7rgoJ
         +vycGHv8bIiVZIhwR241fzb46pJxfT1bW+PetRoybqW/Bg2cZ22RI1o6FbvuQ+zJuU
         af9iG9D0HIp0gJb8X3QaQcGTBQ6lZzAMJbPELLA+ffMG5/vUppC8BJsipY9plOSW+f
         LuE1/WLoeBM7CeQgvSW9p+aD/y4LHuv9/ahBCWYxkNLMsqhrCw/nSaiG+u3mNSq6kr
         zrcJn/LBcp7KA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5C0C260A1B;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [pull] drm/msm: msm-next for 5.12
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878437.6187.12198558421296537509.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <CAF6AEGvh3tvLz_xtk=4x9xUfo2h2s4xkniOvC7HyLO2jrXnXkw@mail.gmail.com>
In-Reply-To: <CAF6AEGvh3tvLz_xtk=4x9xUfo2h2s4xkniOvC7HyLO2jrXnXkw@mail.gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This pull request was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 7 Feb 2021 10:08:38 -0800 you wrote:
> Hi Dave,
> 
> This time around:
> 
> * a6xx speedbin support
> * a508, a509, a512 support
> * various a5xx fixes
> * various dpu fixes
> * qseed3lite support for sm8250
> * dsi fix for msm8994
> * mdp5 fix for framerate bug with cmd mode panels
> * a6xx GMU OOB race fixes that were showing up in CI
> * various addition and removal of semicolons
> * gem submit fix for legacy userspace relocs path
> 
> [...]

Here is the summary with links:
  - [pull] drm/msm: msm-next for 5.12
    https://git.kernel.org/qcom/c/12458e351799

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


