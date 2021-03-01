Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C76E3292E9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242381AbhCAUzU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:55:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:55334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232672AbhCAUvA (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:51:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0D02064F21;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=2kU1q3pWX33p2E8/33vlLh8Pvl2XccBMqCdgLCeyo0U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=m5oXKesMTOUzQqlZopef2wapKke8amUAPz20hIkWncySnEVXdtEzHu1YLIcOYUUwZ
         SjZaF/Nbao48EzdvbIs01cgIifSvuI+gshSn6k87PmmmUYK19YPxqGlvf/6r2LDWtm
         S880IjAa05uaajVmh/r6wEdAYnWF3VKGeJJoh9vEVbWvkRC40vSZR6IQZytJIh5pPx
         gn2TlnRXxikqKhNL8HdBi0zJQ+ec1b153fbND+am096aDmFfFizuD2rimIHJj7ORuN
         q25sf+YBdNQ348ueXeawx9sG+6LM85fFMnkSIwHgRqIDZ1EjM1dDR5sMtzznbpsmQw
         SiFNoyp4pxwhg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 09D6560A1B;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dp: reset dp controller only at boot up and pm_resume
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878503.6187.14444980639931401639.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <1612557878-19743-1-git-send-email-khsieh@codeaurora.org>
In-Reply-To: <1612557878-19743-1-git-send-email-khsieh@codeaurora.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Feb 2021 12:44:38 -0800 you wrote:
> DP_SW_RESET is the global SW reset that is used to initialize DP
> controller. If DP_SW_RESET executed during connection setup,
> two HPD related side effects may occurred,
> 1) pending HPD interrupts cleared unexpected
> 2) re start debounce logic which trigger another interrupt
> This patch only issue DP_SW_RESET at boot up and pm_resume.
> This patch also reinit video_comp before configure dp controller
> to avoid missing VIDEO_READY interrupt.
> 
> [...]

Here is the summary with links:
  - drm/msm/dp: reset dp controller only at boot up and pm_resume
    https://git.kernel.org/qcom/c/ea9f337ce81e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


