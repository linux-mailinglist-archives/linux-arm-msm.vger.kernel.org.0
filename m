Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A12E9329268
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235853AbhCAUpD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:45:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:54076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243474AbhCAUln (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3F7C464E40;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=+CWDQ+gmqZo6Xl9V2gxYp3RzpPA9Mh+UKe2rqqBlSlE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ma4WUdZP40MiKVYTgJ4DpxbbBtWFkhokQKY3OHXIDNwkHk3XkLddXel3tv70p3teG
         OIb4qweGwl6U3NvaqZV2Gs6+R3+7sGlonNl6d2vYFNwJZwkjtQuwY93oukkkFicdb2
         vHLvQyp/n867n6XTA48/Tyqh4I2TCd2kDgFC1PTUBTm4g3JqwmhNClq7sTWSy01LV6
         RLwlqcJDpxvQKiyv6h0VZmxzKvwYgw6+VIuYaEb/bnvsRc4OpFgqboI3WYyFR4fidO
         kCaZGK1yzFajlaGG0vMKrheRF6XX0SquzGwPq+ffS/o8bXMUIIPdDuXRvAYLzKFusQ
         vHJ2BNqrpO1dw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3BE6B60C25;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCHv2] drm/msm/kms: Make a lock_class_key for each crtc mutex
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878224.6187.17151030485023808382.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210128170929.3339941-1-swboyd@chromium.org>
In-Reply-To: <20210128170929.3339941-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 28 Jan 2021 09:09:29 -0800 you wrote:
> Lockdep complains about an AA deadlock when rebooting the device.
> 
> ============================================
> WARNING: possible recursive locking detected
> 5.4.91 #1 Not tainted
> --------------------------------------------
> reboot/5213 is trying to acquire lock:
> ffffff80d13391b0 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
> 
> [...]

Here is the summary with links:
  - [PATCHv2] drm/msm/kms: Make a lock_class_key for each crtc mutex
    https://git.kernel.org/qcom/c/6ec935180961

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


