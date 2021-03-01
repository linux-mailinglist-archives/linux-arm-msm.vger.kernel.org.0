Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B3F3292CE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242648AbhCAUw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:55056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243645AbhCAUtv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:49:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 833F864F0B;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=srqFy8umXIC1u5mctRqZX70s6SyS53XBEkV29ibjMO8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bDtVCLKc86UYF/5MPtLWukCKrtyU8Dw2+Jk2omMovLkaIq7qqgr/BJqJhOVdVW66k
         gg1zBi6SGJPRnd2/eylR++aUiCPNSMySynrcbFTMdKqqtlH7I4JOUkC8uSb54fD/qP
         TQhlk9pZl/s10zMNxG5SjbZfZy5VBeeDTa6gLPfRfr0ZY52v6FzGKAHOkGzq/b6gPk
         aW3lVv1JZFYlIlHWoaMpz6QXtPKLzq9NFThEQXifdxEjfdpEjdMOJLqPtFP7nSJsiF
         8g87SP9cWE8LeumYzl4efmwibPWnS5J3YAB8NRCxBjGb9mmx4rLPvbaolb6qco1IU5
         RqMwXG5C4T89w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7FAFC60C25;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: gcc-sm250: Use floor ops for sdcc clks
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878451.6187.4028597072374178819.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210109013314.3443134-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210109013314.3443134-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  9 Jan 2021 04:33:14 +0300 you wrote:
> Followup to the commits 5e4b7e82d497 ("clk: qcom: gcc-sdm845: Use floor
> ops for sdcc clks") and 6d37a8d19283 ("clk: qcom: gcc-sc7180: Use floor ops
> for sdcc clks"). Use floor ops for sdcc clocks on sm8250.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver
> for SM8250")
> 
> [...]

Here is the summary with links:
  - clk: qcom: gcc-sm250: Use floor ops for sdcc clks
    https://git.kernel.org/qcom/c/fd2383093593

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


