Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF1A33292C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243764AbhCAUvy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:51:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:55270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243770AbhCAUsM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:12 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 24BF064EE7;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=sNT4uvdLpPgs49AOr3EbWoLzD2MqItT3qHmFhjnbkn8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bU8TAe8hVAsk0N0nG/O+1OIEJGOpNFhbXgrkMPyKW4/DA5y4vS9i1HLAZS4jPp5o7
         JJLcUxPEc7RpblWbhfULK8Frvq3ofajhXDM7wKoE4IwpfCvhsAdBe8GlbpFEiXw+UD
         T4D/5cBCBBv0F1UBg9HfpSJtUztKzcW3vCpLhQr39yOSSgc0S1F2hjjZ2IL8V2PIfL
         Qykkxinf1mbSPTiUaVj2rC8KGGUg3ILDFhbIB+fUj5A7DXstHIXUDhN/HmylnseEB9
         AHUqS/c5h2Z+xPIOjlIWntFkZRdXeHq1YLi1WBiuDs5Gg1Y6GPXsi0mt0kwv4F2BSh
         QDpRkgo2rQfmw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 20CE460C26;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [pull] drm/msm: drm-msm-fixes-2021-01-07
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878413.6187.13406085495596089068.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <CAF6AEGtWMhzyD6kejmViZeZ+zfJxRvfq-R2t_zA+DcDiTxsYRQ@mail.gmail.com>
In-Reply-To: <CAF6AEGtWMhzyD6kejmViZeZ+zfJxRvfq-R2t_zA+DcDiTxsYRQ@mail.gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This pull request was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 7 Jan 2021 13:54:59 -0800 you wrote:
> Hi Dave,
> 
> A few misc fixes
> 
> The following changes since commit e319a1b956f785f618611857cd946dca2bb68542:
> 
>   drm/msm: add IOMMU_SUPPORT dependency (2020-12-05 08:25:52 -0800)
> 
> [...]

Here is the summary with links:
  - [pull] drm/msm: drm-msm-fixes-2021-01-07
    https://git.kernel.org/qcom/c/25ea8ecf4d93

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


