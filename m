Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37C82E73D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgL2USh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:60234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726240AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9156E22D73;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=5WM1OttO+5XFZlLbrJTjgbECGCunsvkgITE5cn37hTw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gy+xyjnL6IH9h8jT6V1K1wes3boLXbamQmkp6pFciaYIfUpJ660OEz1g1Aec7hnW2
         WqxMOcV58yf/+iQC+o931JfMMNkiJNDmKxekgr8pzHnKIxZJb4THy8N9jmAPkYBG4K
         F0wI2FSGFfmWj3pYkUTkQnDYScxYQhrq9qBto7yACUNITEPLcbYbgf5JYeE6JtjpTk
         JWNDZdaevoiH6ZvTpY7oY2PK0GSKw6M+SBtIvU2yOGynBKyaO0OIyLIDdvYb6tLXue
         0GE10zYsf6eWyP1M3U3YHYwTVlCNiQn4VcH8DAM5SidC2UBZqgovPJsqfyniYkNqe/
         ru51p+M9tEYdg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 8DC6260591;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: a5xx: Make preemption reset case reentrant
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293557.13751.2232734254276161201.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201102200227.8876-1-marijn.suijten@somainline.org>
In-Reply-To: <20201102200227.8876-1-marijn.suijten@somainline.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  2 Nov 2020 21:02:25 +0100 you wrote:
> nr_rings is reset to 1, but when this function is called for a second
> (and third!) time nr_rings > 1 is false, thus the else case is entered
> to set up a buffer for the RPTR shadow and consequently written to
> RB_RPTR_ADDR, hanging platforms without WHERE_AM_I firmware support.
> 
> Restructure the condition in such a way that shadow buffer setup only
> ever happens when has_whereami is true; otherwise preemption is only
> finalized when the number of ring buffers has not been reset to 1 yet.
> 
> [...]

Here is the summary with links:
  - drm/msm: a5xx: Make preemption reset case reentrant
    https://git.kernel.org/qcom/c/7cc29fcdfcc8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


