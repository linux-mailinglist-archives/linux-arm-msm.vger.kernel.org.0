Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA0C82E73D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbgL2USi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726579AbgL2USh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:37 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BD69822DCC;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=NhfSUJa4dLB7woZ5bLd6GE6WwcIJ01ruS+UtT+2ngd0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YW7eeQq62C6Q4WTsOdvtpUyhwiPTjtGTQfmv2D3Q5JH9Xqbp2O5owyz8mq2YgN0rH
         aRnMkaJULxoaNHbH613c4aJvVH0rgnjyW7azRFXQpOFLrgB6QVnWaWcH7G1ahoG50L
         pM1eKEjWTNSxuvDN5eYZbbBByvnMz66QGSk3CjP7eZSuIIdVAe/spuMPNwy2ZrKMKl
         /v4nvA9rwrdJAsZ9VphfDd1DQL4v1oCHUIox5i/50VvV8LX60ta12b71f1tzHmoozJ
         tq0em7sGZs9xvNm6SuXLLtpDPYPMrh2J0Pz88nUFhV0xhipFp0bDm8z+4PkKCi0VHt
         0MKFwCnY29yyg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id B86DA60591;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] slimbus: qcom-ngd-ctrl: Avoid sending power requests without
 QMI
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293575.13751.14604066478494704968.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201125054255.137067-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201125054255.137067-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 24 Nov 2020 21:42:55 -0800 you wrote:
> Attempting to send a power request during PM operations, when the QMI
> handle isn't initialized results in a NULL pointer dereference. So check
> if the QMI handle has been initialized before attempting to post the
> power requests.
> 
> Fixes: 917809e2280b ("slimbus: ngd: Add qcom SLIMBus NGD driver")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - slimbus: qcom-ngd-ctrl: Avoid sending power requests without QMI
    https://git.kernel.org/qcom/c/39014ce6d602

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


