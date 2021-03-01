Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E785E3292D0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243645AbhCAUwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:55188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236461AbhCAUuY (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id AEAE764F12;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=Rc0NJsiAuwfSz7tmPRw/ajBgDrb1K+IFdhd4KP9mcAk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ES6a85opCxh7XCfsC/Zqj6Mepr3E9qLhg8tDeXbuMPTatXPMnYX4gUlsoaOYdvZES
         sGF04C11YuJ0sRalt5hM0/qeZZG6yG5zbkF202cVHGttSgjgJcniQrnppVIFk8XjYF
         lQqobI38POo/v2joXoCIX1EEQ0W1CqYv7cVCz6EyR3UTmRTu94zeAOJp16qJgwJRfc
         1Jsqgmk6TcFbgFIDqGPCRm1ztPGGscv9Qm5LzAbcMQH60wsw2sQhUR2aY5MUcZ+LXX
         Nxz6DOjNRE5xvn4v33v89NUCgIV3b1qsuIpA+0kAOtNZzTzqU1DCqVzg634fTGLseJ
         dTlchRqJdW7og==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AAC9A60C27;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] regulator: core: avoid regulator_resolve_supply() race
 condition
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878469.6187.16660630649236656657.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
In-Reply-To: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
To:     David Collins <collinsd@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  7 Jan 2021 17:16:02 -0800 you wrote:
> The final step in regulator_register() is to call
> regulator_resolve_supply() for each registered regulator
> (including the one in the process of being registered).  The
> regulator_resolve_supply() function first checks if rdev->supply
> is NULL, then it performs various steps to try to find the supply.
> If successful, rdev->supply is set inside of set_supply().
> 
> [...]

Here is the summary with links:
  - regulator: core: avoid regulator_resolve_supply() race condition
    https://git.kernel.org/qcom/c/eaa7995c529b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


