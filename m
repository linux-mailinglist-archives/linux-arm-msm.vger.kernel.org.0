Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB60391FED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235411AbhEZTE5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:04:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:40950 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235285AbhEZTEz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C2B75613DD;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055803;
        bh=eheamsQv3ESx3UiDBiZ1Q0hObmtTURNNwczbUrVHJTk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VzHcUyra7aEcBMM/eTGdVWoJohyuqAu6OAPbBxjiHRJejWUhBaEnBcvULYJ1Uj12x
         LiSt8JjIpPN3z+WC0JzuSV0vQiKTmkr5hU3sd69JSMAg89AMmNXsrHtCEQGNwZIzTR
         f2jw7YaavQ55FJdLOmp0qra0Y1H+4lGFGxUSt0jLleR29qKTw4HYlkaG1C+DdjlPLI
         sMO33YmCfhjR7rrBz3SimfBoVh4nkF8lNA8hCl68UB2xQ7tQfjDb0EWhFWUi2cjCOP
         h30fNTY2pylcIYEp3pcoyqHvLTneWgGtATc7/FUP4y0YU2WzizxVROcXQ8XUk/UscY
         tbONIIEhwVH9w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B938860C29;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v8 1/9] bus: mhi: core: Allow sending the STOP channel command
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580375.26840.2835966300995354376.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:23 +0000
References: <1617311778-1254-2-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617311778-1254-2-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 14:16:10 -0700 you wrote:
> Add support to allow sending the STOP channel command. If a
> client driver would like to STOP a channel and have the device
> retain the channel context instead of issuing a RESET to it and
> clearing the context, this would provide support for it after
> the ability to send this command is exposed to clients.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v8,1/9] bus: mhi: core: Allow sending the STOP channel command
    https://git.kernel.org/qcom/c/5a62e39b45b5
  - [v8,2/9] bus: mhi: core: Clear context for stopped channels from remove()
    https://git.kernel.org/qcom/c/4e44ae3d6d9c
  - [v8,3/9] bus: mhi: core: Improvements to the channel handling state machine
    https://git.kernel.org/qcom/c/3317dc6cea29
  - [v8,4/9] bus: mhi: core: Update debug messages to use client device
    https://git.kernel.org/qcom/c/cde61bb0470d
  - [v8,5/9] bus: mhi: core: Hold device wake for channel update commands
    https://git.kernel.org/qcom/c/73b7aebcc8cb
  - [v8,6/9] bus: mhi: core: Clear configuration from channel context during reset
    https://git.kernel.org/qcom/c/47705c084659
  - [v8,7/9] bus: mhi: core: Check channel execution environment before issuing reset
    https://git.kernel.org/qcom/c/8e06e9fb9909
  - [v8,8/9] bus: mhi: core: Remove __ prefix for MHI channel unprepare function
    https://git.kernel.org/qcom/c/8aaa288f709e
  - [v8,9/9] bus: mhi: Improve documentation on channel transfer setup APIs
    https://git.kernel.org/qcom/c/6731fefd9567

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


