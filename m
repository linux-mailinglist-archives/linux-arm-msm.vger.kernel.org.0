Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6FA1392034
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234987AbhEZTFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:41064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235777AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 815536147E;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=L0XLDIH+HlIUfm//PWgFwebsuUHVvoptAIuz6ohsqIw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JnhvIX0CcKJvjk/h+bi8fmPtQ+HYiGGSTD9mmyQHE/qPKuU2JAfZmNpRtFxeHxupg
         Q/tEU94Uxm15GM3hU7X15WZI+XhTcvgnXLX/5CZs13Lu4vpEXyUBh5qKlrH5ONWaGi
         gM8KctUe/WjO9Jiha3SuhZgEObWWnuwgfXqLoHAoxW42q1uEP6mYt2swOYAnKOBWRp
         WE5YXQpOrqbnA1JwI5PiI+tkzD9c88Ms8h8bS7i1vSbppJyA3tUy1ZICY5c1BP2YUT
         +CjjfuPORdcb0ks9pDNYOKETmyDKnHvo918jfNA470ua5oM2XOQdGeXMQzqnbSxCcR
         5XzRIjR7ajZ1w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7D1F3609B2;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] backlight: qcom-wled: Use sink_addr for sync toggle
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580650.26840.12618233367945079715.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210314101110.48024-1-marijn.suijten@somainline.org>
In-Reply-To: <20210314101110.48024-1-marijn.suijten@somainline.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 14 Mar 2021 11:11:10 +0100 you wrote:
> From: Obeida Shamoun <oshmoun100@googlemail.com>
> 
> WLED3_SINK_REG_SYNC is, as the name implies, a sink register offset.
> Therefore, use the sink address as base instead of the ctrl address.
> 
> This fixes the sync toggle on wled4, which can be observed by the fact
> that adjusting brightness now works.
> 
> [...]

Here is the summary with links:
  - backlight: qcom-wled: Use sink_addr for sync toggle
    https://git.kernel.org/qcom/c/cdfd4c689e2a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


