Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A8E62E7392
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726434AbgL2URk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:60056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726452AbgL2URj (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:39 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id CDA8322B40;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=0NrrTfaETYMRVSg4TpS7lJrl0RliOC2RM6FIE+ENyAU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=O21ZDYpwiX5tv8H6U5xSGSE4oMHDDQIy9FFz4yOh4eN5u1mTSZtouyNttt20GNC6Q
         2c6/yEVBDYRS4FZ2NyVhqH3NTlgN4zxi9rtB2ftp6aJ5OBI6wWNv/GIp6sb1p1kyzy
         zxkeap6hZNamXikM4+vMNHlEf0a5U8YmJ0HdXwha5TfbQZcHxLzM47/X6HUyF9OFmn
         IGntBVcPPjB+5QY1OrBqV1qE1OPQwSuo0yIcCv35jfh5+dsqz2U9DS5q65iX9g22PV
         dfsd6OWaTzXLvZ65KnoFd+tvcaZF3lEHlTb5Zg5lSNcv3/unmEKilhwD9m4sDNJgGb
         MJyoN2UKqC/hQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id C919660626;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] drm/msm/dp: fixes wrong connection state caused by failure
 of link train
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293281.13751.6596749650713786792.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201014171123.30167-1-khsieh@codeaurora.org>
In-Reply-To: <20201014171123.30167-1-khsieh@codeaurora.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 14 Oct 2020 10:11:23 -0700 you wrote:
> Connection state is not set correctly happen when either failure of link
> train due to cable unplugged in the middle of aux channel reading or
> cable plugged in while in suspended state. This patch fixes these problems.
> This patch also replace ST_SUSPEND_PENDING with ST_DISPLAY_OFF.
> 
> Changes in V2:
> -- Add more information to commit message.
> 
> [...]

Here is the summary with links:
  - [v4] drm/msm/dp: fixes wrong connection state caused by failure of link train
    https://git.kernel.org/qcom/c/62671d2ef24b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


