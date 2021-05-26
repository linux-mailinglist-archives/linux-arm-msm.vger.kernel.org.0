Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D87C2392078
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235798AbhEZTGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235856AbhEZTFU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1217C616EC;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055809;
        bh=hUyXUtuuTd/w/1UD41O1WnSzNsCOPrfR5+GSI2UV9eU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fmIoxR6MqhLgfIuQhHxj9Lfk99QPIt9cjyj9Jkhaen/wEf1xNgNJrCcm+xL59gryu
         ojYvlWn+qYvHn+8qetpd/gJrY2Uu6R3CRi4u2L5LcuF4ZZ9hAaujZEI/dBBSbx43rD
         xp06YishWzdMw0k+3vFpkGfMzwcnPU9Ujm+3mf4kKTzFDLJ5QQW5vCjAgfjpVqU8TG
         kaGs5TPGxmlGCTp6W889qYzRqz6EGk+FVQmPyACBP5LPrKIUBQNHVD8G0Lwkhe2XH1
         MiPTu8Mw6O6tomM4YyKer2G5/bwlXfGdttprLYgpr+AhQSL2SvQfO9nvYJhSORRfnz
         5LEyAlYx/tBng==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0A4E3609B2;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dmaengine: qcom_hidma: remove unused code
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580903.26840.15307879717177853430.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:29 +0000
References: <1617270816-36400-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1617270816-36400-1-git-send-email-jiapeng.chong@linux.alibaba.com>
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 17:53:36 +0800 you wrote:
> Fix the following clang warning:
> 
> drivers/dma/qcom/hidma.c:94:20: warning: unused function 'to_hidma_desc'
> [-Wunused-function].
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> 
> [...]

Here is the summary with links:
  - dmaengine: qcom_hidma: remove unused code
    https://git.kernel.org/qcom/c/ee1bf567c90d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


