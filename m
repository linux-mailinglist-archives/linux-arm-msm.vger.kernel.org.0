Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94D8339203F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234395AbhEZTFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235808AbhEZTFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D6EDB6146D;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=6ARfsY3TuNDXfRhKF4jLk1P7vZ7I1gghpjzG2QrgUN8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WKX3dBcWCb/MQqee2AtOaFsmdB7t7PjfLjmzc40F1cczFglELJ/oi+9Og2HTR4uVJ
         4umsBtJCPq0Xj5zVeydLGcqfh8jnRbptjsJc8dUpxrawDYNdWg0B7ZRZgfutPFHXBb
         EoFpegTg8bcaw2wewOxdZxvE8d2yXfSMT5rA1LcNhZ4nIFcH+OQKgtnjs51c8EDy3m
         nYsZwY9oauPunUhnCGHqTgNPOEKqmG14sPdbhHz9DhgZDYXEEwMAGw3vmGmIHGDTxW
         9u1Nj8+UE2Zgn8BDipFFACLqqG12/8QICERWIQbAtXy/PUZNr6sYTMlXUXBD3Yd6Yd
         wWuz9je+F1POQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D2EC460CFD;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: core: Fix check for syserr at power_up
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580686.26840.6931889673120247326.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <1613165243-23359-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1613165243-23359-1-git-send-email-jhugo@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 12 Feb 2021 14:27:23 -0700 you wrote:
> The check to see if we have reset the device after detecting syserr at
> power_up is inverted.  wait_for_event_timeout() returns 0 on failure,
> and a positive value on success.  The check is looking for non-zero
> as a failure, which is likely to incorrectly cause a device init failure
> if syserr was detected at power_up.  Fix this.
> 
> Fixes: e18d4e9fa79b ("bus: mhi: core: Handle syserr during power_up")
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - bus: mhi: core: Fix check for syserr at power_up
    https://git.kernel.org/qcom/c/6403298c58d4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


