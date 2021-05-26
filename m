Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F161D39207D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235242AbhEZTGF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235862AbhEZTFV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4EE1461864;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055809;
        bh=1mNpXy0KNUOk8KD0NF/qQCLQSMMGhJhpwDSl2dBHlL0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RWBRQ1hOYMgK7awxz01hzT1+Fnbgnt+bZLfFWD+JSEXA6Ho9KSeh7vhmO248z4gfo
         DR14zHu4nexnv+dpmrnhlpaIrX0YPmhitfKpWBR6/xP3X6LEdoZvdRqaHGZWFg6Ev4
         Q4mNYH4/PttznTOLgb575JNxCeny2AEheLZMWUMCDgfwJaysdlZ9WNDIAYoTqRaFu7
         qrrJfzHfFchJ17FF5n63wzmCKVGV/6ZRGTw361881FCK9zIrrzc+VkcJJVUsn7drmm
         jrIC1Q+vqlhf7fq9Si2GKdlclKppwyd0Zo5Yftxkz07bvHB7nOt17lVwWkBtWGhgcO
         kDB/WG+7IcjiA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4A4CB60CE1;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [v4] drm/msm/disp/dpu1: turn off vblank irqs aggressively in dpu
 driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580929.26840.3936614772968375397.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:29 +0000
References: <1613651746-12783-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1613651746-12783-1-git-send-email-kalyan_t@codeaurora.org>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 18 Feb 2021 04:35:46 -0800 you wrote:
> Set the flag vblank_disable_immediate = true to turn off vblank irqs
> immediately as soon as drm_vblank_put is requested so that there are
> no irqs triggered during idle state. This will reduce cpu wakeups
> and help in power saving.
> 
> To enable vblank_disable_immediate flag the underlying KMS driver
> needs to support high precision vblank timestamping and also a
> reliable way of providing vblank counter which is incrementing
> at the leading edge of vblank.
> 
> [...]

Here is the summary with links:
  - [v4] drm/msm/disp/dpu1: turn off vblank irqs aggressively in dpu driver
    https://git.kernel.org/qcom/c/73743e72fed4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


