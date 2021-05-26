Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954DB392001
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234024AbhEZTFP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:41112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235327AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8AA54613DA;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=WQulJZX8Lt/zYPuYzUMKQbU3G/eKZt7GanzBJqZAZ3E=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=F8/LhVEC8ejJiRwSdc6UrUfrheIK7FOxmg67k4moa2aKkClHTnUlcJX/fWkLy+HSZ
         O+7EvhuvfJvSZ8mddJDhR+N0GmqAawcyEAqWUp06g2piTbIo2NMP2s/5wG201OaKsL
         hZZe+EalJfXttv/1ehaNuR1er9tWpcjb/mu5ypEf73Q995i31TqcMXOPkN1Lb42+0F
         O1HwVJt+348+vQLgE+Xysvvf7dwNkuVIwzH7iAZtg6IhTOKov4f1MBAAEp17PTvzTb
         j633bOc4hmfab0n2nHqWqADDbocxfChMWVIn/abrcjkHZ8vLwnzY+HwoL/GfXVPXAg
         hOM6BRw85jSCQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 84E3C609ED;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] gpu/drm/msm: remove redundant when devm_kzalloc failed
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580454.26840.14231156749604377521.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210202120552.14744-1-bernard@vivo.com>
In-Reply-To: <20210202120552.14744-1-bernard@vivo.com>
To:     Bernard Zhao <bernard@vivo.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Feb 2021 04:05:49 -0800 you wrote:
> Line 1826 pr_err is redundant because memory alloc already
> prints an error when failed.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 --
>  1 file changed, 2 deletions(-)

Here is the summary with links:
  - gpu/drm/msm: remove redundant when devm_kzalloc failed
    https://git.kernel.org/qcom/c/8c64a945a614

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


