Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4343292BA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243724AbhCAUuv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:50:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:54488 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243716AbhCAUr4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:47:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0320164EBD;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=JFjK8c+1wV0mLpO/8kJRbiGOKQphyuTRXuet3BtnUzg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=r6tAU6RtWpgwvS56jYkBHtfe13LqqZXbgySjP1kiOmrR/RYHiAtL6q8NOrNilmIm8
         Vkmbfp9pH4plrEiMX/ZNN89O40E+HJNvpJpfD1CmA0CAc2g1jSGRVTYRxR9ZMYu/ep
         harBrJ1iVU9L875A7cLTG2HSO9qvQJo11JyPQBgkWITih+ixEqjyMFdZ4QckU4nvGN
         dJ4EpRUrsYX8O6XKHHTkzi59lU2f3ycIkgOQDQrNO76adoFOXdU9aAYmz7zYs5DgwR
         meajvBO6HuGE2NxthwkBp6tQiG32CLbHE9oF/u7UycdR0IiQCIoRqLPsdF630nwu5k
         7oUIGF3pPnZRQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F2FEF60C26;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] iommu/arm-smmu-qcom: Initialize SCTLR of the bypass context
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878399.6187.4171644129051562285.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210106005038.4152731-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210106005038.4152731-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  5 Jan 2021 16:50:38 -0800 you wrote:
> On SM8150 it's occasionally observed that the boot hangs in between the
> writing of SMEs and context banks in arm_smmu_device_reset().
> 
> The problem seems to coincide with a display refresh happening after
> updating the stream mapping, but before clearing - and there by
> disabling translation - the context bank picked to emulate translation
> bypass.
> 
> [...]

Here is the summary with links:
  - iommu/arm-smmu-qcom: Initialize SCTLR of the bypass context
    https://git.kernel.org/qcom/c/aded8c7c2b72

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


