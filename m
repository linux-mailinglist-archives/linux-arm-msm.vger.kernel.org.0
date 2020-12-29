Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD0462E738D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726412AbgL2URj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:60044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726420AbgL2URi (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:38 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 964E022B2A;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=8Fzbr2ba6t5C2AAqrxC6TmcFxKLPb7uTMCXV+zdNM4w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=F0M5o7GoUKOr6AdT3RzitQ/ZcS6H2XhepYMy6cvLp5QL18reF6EZm9TkRqUSrJEjS
         IIar1q4vylY1cShavI5vFMWZ39AGvAtuMIRuqmhB24O8xnWSTPUgpOCHMBbak4grW4
         al8mMwobqUymlHsCz54s1tWrMZYKhlH0TVnXQjAAMtCZxbShvulgZCYagy98Ud1arO
         5aQF2YYkHJqbjWwh4sLjM8J0IbIHBW8S1zUo+OBcFy8cdBtDe4KIjwMSAYU3V+ff6U
         xBv1gD9OOVhURHqXWULVo2jZs8fGBOmgxEcQHtI/AjgX+EmtmRNKro5NydVCyMmZrD
         jVa532gU8xLqg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 9211F60591;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] spi: spi-geni-qcom: Use the new method of gpio CS control
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293259.13751.5969035907984819673.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201202214935.1114381-1-swboyd@chromium.org>
In-Reply-To: <20201202214935.1114381-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  2 Dec 2020 13:49:35 -0800 you wrote:
> Let's set the 'use_gpio_descriptors' field so that we use the new way of
> requesting the CS GPIOs in the core. This allows us to avoid having to
> configure the CS pins in "output" mode with an 'output-enable' pinctrl
> setting.
> 
> Cc: Akash Asthana <akashast@codeaurora.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> Acked-by: Alexandru M Stan <amstan@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - spi: spi-geni-qcom: Use the new method of gpio CS control
    https://git.kernel.org/qcom/c/3b25f337929e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


