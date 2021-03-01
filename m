Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CDAA3292C0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235634AbhCAUvr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:51:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:55772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243760AbhCAUsE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D2F4B64EE1;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=reRuP2IB0DKtlQo/O8bwZwoWyN7OQE0mf3SXyKqL3wA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cwOw1lFayd38wRxEOWsHwWyZMQ2Y3Q+JW+q7pcmmqbxCbkhu+reCuSqTQo96SgzTK
         OC0GBuy3ES8IuZQ8ErSYrqLjnH1GY82LBkw3nhXjU20oS9IMp4glA6kzC8LzV+mm0a
         M6GWXNC681a8uaPU4gYUlkGQ6HQlRPZRaJw+BOFz8kQHDGwmFaudICRekMlNADNb7n
         xiIgJLh+54115faPzxBnkGjEncbUTI8ZelHjlHG056+WJFM8ic42A06zN6H1tU/1a7
         4Uto+L6RJUuBxqbAfS65a2Qzfk9TM/jwcXL6rg8nX6BcGe48usBRxwhx7hmNO/loES
         wYdf4EQn0Y/qQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id CC9F060A1B;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dp: Add a missing semi-colon
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878383.6187.85563575723121248.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210207041858.3317171-1-swboyd@chromium.org>
In-Reply-To: <20210207041858.3317171-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  6 Feb 2021 20:18:58 -0800 you wrote:
> A missing semicolon here causes my external display to stop working.
> Indeed, missing the semicolon on the return statement leads to
> dp_panel_update_tu_timings() not existing because the compiler thinks
> it's part of the return statement of a void function, so it must not be
> important.
> 
>   $ ./scripts/bloat-o-meter before.o after.o
>   add/remove: 1/1 grow/shrink: 0/1 up/down: 7400/-7540 (-140)
>   Function                                     old     new   delta
>   dp_panel_update_tu_timings                     -    7400   +7400
>   _dp_ctrl_calc_tu.constprop                 18024   17900    -124
>   dp_panel_update_tu_timings.constprop        7416       -   -7416
>   Total: Before=54440, After=54300, chg -0.26%
> 
> [...]

Here is the summary with links:
  - drm/msm/dp: Add a missing semi-colon
    https://git.kernel.org/qcom/c/182b4a2d2513

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


