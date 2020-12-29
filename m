Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3902E738E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgL2URj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726422AbgL2URi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 9F0FB22B2C;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=1h/kVpWPKrCgdbnewR+LVogha1Wgvgg9VEAr4ceRuP8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WhaSTuKq35Q1gbJdzaVgGC5Vj4nCQvx3eCqXaRwD40Cp7W0TAX4W8femp5AAi54b0
         ClGNs0Ky7HEWdkCJlpp9JxFfkrEMWfeJoz2cpp19go9cpS3Fq3k+Xd7ELU95xXvoVl
         H8lSjfB+JLOrf0c46xGBqo36mm3gNUDQjlLAygjzys0O0Eba2ZY+HHqwje1a6R7Cvs
         DosbIjkoI7ssI7n6jWApJ5AJun7GmEViY0IV6JKdeVJMG13pBxXb7Jj6lDaxLz8SFd
         tJzEF5y7a+Fv/nksffX9r81Hsasj5Iov+e78s1a1qR56VbvQ0JAM+E3AhCnXc3FhVf
         /g3P/+dcP+H6Q==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 9B28E60626;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] spi: spi-geni-qcom: Use gpio descriptors for CS
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293263.13751.4533589272062670504.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201204193540.3047030-1-swboyd@chromium.org>
In-Reply-To: <20201204193540.3047030-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  4 Dec 2020 11:35:37 -0800 you wrote:
> Collected patches from the two series below and associated tags so they
> can be merged in one pile through the spi tree. Merry December!
> 
> SPI: https://lore.kernel.org/r/20201202214935.1114381-1-swboyd@chromium.org
> cros-ec: https://lore.kernel.org/r/20201203011649.1405292-1-swboyd@chromium.org
> 
> Cc: Akash Asthana <akashast@codeaurora.org>
> Cc: Simon Glass <sjg@chromium.org>
> Cc: Gwendal Grignou <gwendal@chromium.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Alexandru M Stan <amstan@chromium.org>
> 
> [...]

Here is the summary with links:
  - [1/3] platform/chrome: cros_ec_spi: Don't overwrite spi::mode
    https://git.kernel.org/qcom/c/74639cbf51d7
  - [2/3] platform/chrome: cros_ec_spi: Drop bits_per_word assignment
    https://git.kernel.org/qcom/c/7a5172b7990d
  - [3/3] spi: spi-geni-qcom: Use the new method of gpio CS control
    https://git.kernel.org/qcom/c/3b25f337929e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


