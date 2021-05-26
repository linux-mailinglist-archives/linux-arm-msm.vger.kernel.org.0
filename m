Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29704392047
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235623AbhEZTFj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:41168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235817AbhEZTFN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2B61C6157E;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=jl5vO612I25I8KbGjZGay/Hw5TPYmSuEdgcPddVNyyM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LNOPl0196jYtEKOIqgAxQmcVkKXfuMCJZgw4QbDdWBr/UCxw3KqnS5bZ6c/EfLanZ
         YfjeC9HjWy5ICAUjkD1qRnAZA7y05DjtTWcIP/G3Tl8v9mXby2N52+uo99fK52wPSp
         eDsaB/Lsobr0rkyQysYz/H+2xQmVizyt3BS9x9clDjgzrMNRJ2XYBV4wYp8AsMMSE8
         4tlhNzUJ2SMUwxJ9El92BqnBeuoBiWFrVQ1NJdX3pcX7S5boGLqtaXRe0tSXhLxI3G
         tmDwQ5gHOJdNPzIvE3CHPchZOUIMdrJBoSrwpbnOOLgYvp3KHzxUGjQ4+EvzQOwjVT
         zKUGVqcnM6XSg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 27369609B2;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next v2] remoteproc: qcom: wcss: Fix wrong pointer passed to
 PTR_ERR()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580715.26840.6393061263506936412.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <20210326024741.841267-1-weiyongjun1@huawei.com>
In-Reply-To: <20210326024741.841267-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 26 Mar 2021 02:47:41 +0000 you wrote:
> PTR_ERR should access the value just tested by IS_ERR, otherwise
> the wrong error code will be returned.
> 
> This commit fix it by return 'ret' directly.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next,v2] remoteproc: qcom: wcss: Fix wrong pointer passed to PTR_ERR()
    https://git.kernel.org/qcom/c/ca0e89406ba1

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


