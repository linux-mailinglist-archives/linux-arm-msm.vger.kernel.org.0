Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D2533292EA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242765AbhCAUzZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:55:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:56518 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236705AbhCAUvF (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:51:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D8C4864F1B;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=zqh4LRyN9SXn3WdY7lJfxUZY8pHNxGQjFur75IYNWPM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gfEWQBHwhGprpuzfil5UKNuE3FVzx6PQ0Vr0iXsLHXS45DpUHEhBAdMhPwKCfFsj7
         MaJYT0TgMz3ll1qvAtD8SAx3yekbZgGyODihLFHVcVANxK0biYCPuIrKOHvg8kEH5e
         To101VJL0iTZ7qJqlFyWAyhB6zH4zK4OZHzrb+FgirS1HYhXlARLxUfF7VS786Y5ks
         MQA2ymqWdvAK4C/XZy27xZyDnKgu2s+SLenksc9cdLxt2feZy/g1rdXp/IQ8tNu168
         owUP1ImlVfVakLgKv3FBrLSnzvcio9VwaCtBzluxUs89c8eRQaKneIWCKgksGyq29N
         56jMdlpBZI8pw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D518160C25;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dp: postpone irq_hpd event during connection pending
 state
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878486.6187.7435554831870144764.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <1608314020-26791-1-git-send-email-khsieh@codeaurora.org>
In-Reply-To: <1608314020-26791-1-git-send-email-khsieh@codeaurora.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 18 Dec 2020 09:53:40 -0800 you wrote:
> irq_hpd event can only be executed at connected state. Therefore
> irq_hpd event should be postponed if it happened at connection
> pending state. This patch also make sure both link rate and lane
> are valid before start link training.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/dp: postpone irq_hpd event during connection pending state
    https://git.kernel.org/qcom/c/2b5f09cadfc5

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


