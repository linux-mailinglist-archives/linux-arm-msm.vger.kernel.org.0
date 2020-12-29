Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA882E73B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgL2USK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgL2USJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:09 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3FB9E22CE3;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=iCeE1rgxpsnAnop5ev5ofM4mkncpdK8S9i5uCVAUqyI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Uyg4skcR8Jm9/RznKowI0ZVyEWq3hAYdj0mGC0BmDATCAtpBfth/2+uLMnZxjDq1b
         dkAjlf5kA/pU/nP8IE91Pw71RyhiZg8SLM8pqu7VsRB4+MIEEg7m7QHATtfbEO4OTB
         /3tUPqMjGfr3xigNFXxcYt9f3smltgLGimfmoqj6eA2yrsJUfKvezb+o6sy860Ow+y
         711R1etU4BoMkLVF+Y90pEP0IJRwRo2yNx2LHKkpXvt+DuvranNQgd/Wxv/fqupe7h
         3+mvc+pxjB9Hh5I5oj0gtqK4ZJrQVTNyUYujBhTY0yGp+d/rthmZ1hxcgS3y+NLp8X
         F9bMWM+XSv3dg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 3C541600D9;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Asoc: qcom: sc7180: Register shutdown handler for lpass
 platform
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293424.13751.15030810246928417463.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <1605292702-25046-1-git-send-email-srivasam@codeaurora.org>
In-Reply-To: <1605292702-25046-1-git-send-email-srivasam@codeaurora.org>
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 14 Nov 2020 00:08:22 +0530 you wrote:
> From: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> 
> Register shutdown handler to stop sc7180 lpass platform driver
> and to disable audio clocks.
> 
> Signed-off-by: V Sujith Kumar Reddy <vsujithk@codeaurora.org>
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - Asoc: qcom: sc7180: Register shutdown handler for lpass platform
    https://git.kernel.org/qcom/c/60a973862f3c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


