Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DCDC3292B9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242827AbhCAUub (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:50:31 -0500
Received: from mail.kernel.org ([198.145.29.99]:54452 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242809AbhCAUro (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:47:44 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E10DF64EF0;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=QobqlVp0qi52PEADA4WydYXAK3P4HBbTFbVieI8H2Ag=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=U6iD8+vGHPW4n6xxlN8lwKSdFzaf8MlBeKjKmfpJNnTq26OenC3oyC6jHoVoE53u5
         imv1do0AXSDwAc8m724XlaTwqQRRiMtETZwC3khIW2+BQqMbUw9sphbP4Qvg7bvSP1
         1G0EK4tKAxFPhoLfShQJAaIJdzn9HEOcUiLdovER9VJ2GDZ51Q9aJizw/lLctFtKUW
         W2rdEYSEwYtCy4EwD7jaW37XEYJwquwYI/bQgsXXG1ZCdqWehpDk6VK1gnpKicQlou
         7ToZK2nH0j3dVXehXzWD7Qk4mxXqjrkVmVvBADEBI7SCx7Q8XQ6oTlZTN+5CAtALfj
         chiSq9Hc4TIbg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DC78560C25;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dp: remove unneeded semicolon
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878389.6187.8238149731110994865.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <1612321727-25156-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1612321727-25156-1-git-send-email-yang.lee@linux.alibaba.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  3 Feb 2021 11:08:47 +0800 you wrote:
> Eliminate the following coccicheck warning:
> ./drivers/gpu/drm/msm/dp/dp_ctrl.c:1161:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - drm/msm/dp: remove unneeded semicolon
    https://git.kernel.org/qcom/c/a014abfec541

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


