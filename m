Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AAFC32926E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243521AbhCAUpZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:45:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:54316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238883AbhCAUmb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:42:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 81B8A64E54;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=BrxrtrkYWYsrIKH00zjz3nAb6FC4anh9i+leJ0DxoQw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Q//ibM2VFlW1zHwSWXo237IEnX45vhYwmmpAnZEVlZnFWIbGsbhJfBhZpVnbiTYI7
         FkPMP0m837zuEj9GNPILH3D4eCaA9JYHHz5lgCl5YyhANPtsKNkDkPMLbUoYf0RzbT
         DYRHJKgiOv0Tn0fLP5yL0R2ZTinJ6GS6TDkTGeJjDYnPQa0MAY7tW0sv4HEf9Ve35v
         J/+NI9fjwTUAb6ydEuprACUl8kCmh2USDmOe9aY3nWyw19hIK/FCDfnWkoiYc0yaIE
         T6GE/hRpqzAXtb4tgO0/gwuT9TLmDrYzvx+312ShxIgNEeCSrRZE9Kik1j8phgDKUg
         c3RyhBjUSH/1w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7E20060A1B;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dpu: remove unneeded semicolon
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878251.6187.1972748904023536264.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <1612316746-66494-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1612316746-66494-1-git-send-email-yang.lee@linux.alibaba.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  3 Feb 2021 09:45:46 +0800 you wrote:
> Eliminate the following coccicheck warning:
> ./drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:752:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - drm/msm/dpu: remove unneeded semicolon
    https://git.kernel.org/qcom/c/0ac892451143

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


