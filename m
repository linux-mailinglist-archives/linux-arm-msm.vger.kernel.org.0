Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 977D93292A3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241032AbhCAUtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:49:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:54740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242495AbhCAUqe (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B061764EEA;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=Np3bNSVIRBRWXXjW0xVP5gV51xrZPPe5aVbVr2BePFY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ktUWhDABXB++DHYank1l89q3xLjKpnKNPcDRex8CxSA2HM9FpamSpSm1tYfZOPLUV
         BHLBgDz33Jb+va7fm3DG84optlUnuL4/eXh79wK4dovtXk+bSvf1qJWfnEBqii+4PA
         8u6csG8ynNu+l8BWea10cipJlFcZ1nFhENEpDOkVJz80jZZt3qEzRqX6e6KbCANOSc
         O83JD/fAf/iL6NCMwSGsRMQTzsKQndBVnxh3l86lDk8L3OY+NebeAOk9+U8y2Xj3S8
         OIoHHKHUYbvaQpKxX57w+VP0rm7enxU/1/0yC8TdKV0wVyMOpkyQFgy87YijMPzRwd
         yiUkjwMbABZuw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id ACA2160A1B;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH][next] thermal: qcom: Fix comparison with uninitialized
 variable channels_available
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878370.6187.17593566565754405283.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210216151626.162996-1-colin.king@canonical.com>
In-Reply-To: <20210216151626.162996-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 16 Feb 2021 15:16:26 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check of chip->channels[i].channel is against an the
> uninitialized variable channels_available.  I believe the variable
> channels_available needs to be fetched first by the call to adc_tm5_read
> before the channels check. Fix the issue swapping the order of the
> channels check loop with the call to adc_tm5_read.
> 
> [...]

Here is the summary with links:
  - [next] thermal: qcom: Fix comparison with uninitialized variable channels_available
    https://git.kernel.org/qcom/c/74369d041a0a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


