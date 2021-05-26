Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EF0B39201A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235854AbhEZTFX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:41058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235766AbhEZTE7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 730F161455;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=OWYH0Yspvc6myK/nTxweuY6RrIsA2tJ4RIlaOTfSkKA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KZPbR++T6pC5LrE2fsDZfmZkjacJI7eIbNtYvbasn+OryLT20EtyT9TTa226eJm07
         M2lIVyOiI0Jb4WwAh6Peq589Tjffk255jP4g2w+IWPxpPYy6WsaG6g8zpctEVwIceM
         XQ/5G6l9+sD7y1RvgUieCzWWhhGR3JZc2X9F/HpzXcrAx+onxav8NjfaemXzou2lCe
         1eApmBV3uYsKc+uwrjSYw/7mpgtwa2nCoS6a9xEyviSOxAr8Ht8s6ZhzAsYTMalSiR
         Bc2Ttvt+dLaqjNqb2vJgMLXpK30dKSyeip7kwPilJRitO7LzgnvcGiBHSe8LkqJPx2
         Dw5tE4VpEWAGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6E92C60CFD;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [v1] drm/msm/disp/dpu1: icc path needs to be set before dpu runtime
 resume
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580544.26840.8038214536426071558.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1616404632-13693-1-git-send-email-kalyan_t@codeaurora.org>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 22 Mar 2021 02:17:12 -0700 you wrote:
> From: Kalyan Thota <kalyant@codeaurora.org>
> 
> DPU runtime resume will request for a min vote on the AXI bus as
> it is a necessary step before turning ON the AXI clock.
> 
> The change does below
> 1) Move the icc path set before requesting runtime get_sync.
> 2) remove the dependency of hw catalog for min ib vote
> as it is initialized at a later point.
> 
> [...]

Here is the summary with links:
  - [v1] drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume
    https://git.kernel.org/qcom/c/627dc55c273d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


