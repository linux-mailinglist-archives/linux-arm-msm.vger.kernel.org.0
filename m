Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3DF2329287
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236218AbhCAUqz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:54540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240252AbhCAUnx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C926E64E7A;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=FInuMC0UNTI5p+AaeS5B88CtRy0S3t/09E1cn4xMFjc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ex4plFP2/GSQEFkGki7o0EDiDryjf6WH7ldXoGTmRkMxscuWj/OJJKz7O8nt+krtA
         1Qcv/sbt/m1vIP/SyfJZV4xk+RGsKcON/bUWJ823+Go+lZRESTFo0eRa2FHwF2jcKp
         Dh6b5Bpox8A+jUDOmSCeNOVvDTKO3BB/kpN0ul6jjWytlBM2rd7a3Ywg8fco07yyIt
         iK0FLKnxaigQ1roNwsHYK869X6JZwY/3cfy5z7Osorct0DnemctoqCCJ0ISQmVXyoE
         SeQd4x0qoZE1JT1AieL1+TWdzjbfSeJiyqU5AVbKa0wiTQCIwx3wFr/HgH1DGKDOTI
         Z4/6Oy7oav8bQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C58E260C26;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] qcom: bam_dma: Delete useless kfree code
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878280.6187.6800213380019263678.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20201216130649.13979-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201216130649.13979-1-zhengyongjun3@huawei.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 16 Dec 2020 21:06:49 +0800 you wrote:
> The parameter of kfree function is NULL, so kfree code is useless, delete it.
> Therefore, goto expression is no longer needed, so simplify it.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/dma/qcom/bam_dma.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Here is the summary with links:
  - [-next] qcom: bam_dma: Delete useless kfree code
    https://git.kernel.org/qcom/c/ba42f61b3612

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


