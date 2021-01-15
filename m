Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D34AB2F7E05
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 15:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731926AbhAOOUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 09:20:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:55488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730837AbhAOOUt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 09:20:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 31B5323884;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610720409;
        bh=mBfxgsOjTJ9ZbfQXY9Rg0UJEAzpEOdQYQNBD5vEDb6Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uFI5NOVemEqhiBfYdfU1cgLe+FDcCBLJqhCZKP8iQektQp1XeX+0Wop6/zOf8vLn8
         xVyc/xe1cT9sj3tcEk6ZWQQFKAjhVAx6CkAaz/D/1ur/0Fh0eb7hqtum9SNg2exufr
         xJftE574yNMxc4HUq6T6W/gHWAG7+kRBLVLUtxcGS8SVji1XWZLZkkYrlEGzgOlUn1
         J2SBycXRFLZ3qASncLIrP156Atn5BpCgLZOJZC/QjjsR3TgKkeVKhFVVtMeNTfmY3y
         /wxffctqWvy6glWPNDfPfMaJa9SUqHbXQUc5yg9cyCM/pwhC01FQvuPCkRvF23bFel
         ZUnEKhBM7QO8A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2637560593;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sm8150: Add support for deep CPU cluster
 idle
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072040915.1237.17937572469038414369.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 14:20:09 +0000
References: <20210105201000.913183-1-danny@kdrag0n.dev>
In-Reply-To: <20210105201000.913183-1-danny@kdrag0n.dev>
To:     Danny Lin <danny@kdrag0n.dev>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  5 Jan 2021 12:10:00 -0800 you wrote:
> This commit adds support for deep idling of the entire unified DynamIQ
> CPU cluster on sm8150. In this idle state, the LLCC (Last-Level Cache
> Controller) is powered off and the AOP (Always-On Processor) enters a
> low-power sleep state.
> 
> I'm not sure what the per-CPU 0x400000f4 idle state previously
> contributed by Qualcomm as the "cluster sleep" state is, but the
> downstream kernel has no such state. The real deep cluster idle state
> is 0x41000c244, composed of:
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sm8150: Add support for deep CPU cluster idle
    https://git.kernel.org/qcom/c/b2e3f897684c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


