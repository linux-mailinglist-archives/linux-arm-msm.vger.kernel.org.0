Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE7682E7391
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbgL2URk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:60046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726429AbgL2URi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id AB09822B37;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=S0qzu8Vi9Td92bqMJlTDEhFfB0yFxpbA+AWJfcbplBc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=La1l24ecVvk3VnLH4OvzAURfK50GJ75c/OUAND15xJIV+IKJcqrn7KJ3+f5RSAWZS
         r5bSqrrzv7sBR2E44MEfdScvrnuUBg2ooDsDjWbopZDblmBX/7XMxMLmaWaEMi30An
         P6v4+eiF+5/gfX7uhhD7frQ1LpjNq6hDKK+dQ8GCHlgQv0ethhRVaTLjqz6lCNZCx0
         Xw5Z40D6OVOerBa5zg+de2YSQ6siLY7D9sd7GmTn7xaoEKupQkFL9s192pOHsxN89E
         D2zdFV9LcmJ7iM9wPWN3vrPnyfe/GFOBXsfvtMdNpWVSDbDopB96IhJoBkF7rJaLJy
         pzbv6PKKPElZw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id A65DD600D9;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] interconnect: qcom: msm8974: Prevent integer overflow in rate
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293267.13751.12666176215110913377.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201106144847.7726-1-georgi.djakov@linaro.org>
In-Reply-To: <20201106144847.7726-1-georgi.djakov@linaro.org>
To:     Georgi Djakov <georgi.djakov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  6 Nov 2020 16:48:47 +0200 you wrote:
> When sync_state support got introduced recently, by default we try to
> set the NoCs to run initially at maximum rate. But as these values are
> aggregated, we may end with a really big clock rate value, which is
> then converted from "u64" to "long" during the clock rate rounding.
> But on 32bit platforms this may result an overflow. Fix it by making
> sure that the rate is within range.
> 
> [...]

Here is the summary with links:
  - interconnect: qcom: msm8974: Prevent integer overflow in rate
    https://git.kernel.org/qcom/c/7381e27b1e56

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


