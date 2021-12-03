Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47F01467AFF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Dec 2021 17:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234404AbhLCQNg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 3 Dec 2021 11:13:36 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:51390 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245403AbhLCQNf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 3 Dec 2021 11:13:35 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0FF81B828AA
        for <linux-arm-msm@vger.kernel.org>; Fri,  3 Dec 2021 16:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C17B3C53FD0;
        Fri,  3 Dec 2021 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638547808;
        bh=QeRmcGrZQGLHrLKb6Wrp8WLN/p5ttKauzWtNT/IG1D8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ARMI6Fd1IRV3FR13ClTIh7w8917jGxbbGvlE4kaQ/b1yJBo3bjo5KXoD8an7dFp0K
         zh8PM324J4s6Adhj14sGSHgt+4cNqpSqymgJ+K7y6VC0+3xeeSvmUbFtz1RCUODc1l
         SclPwFHvTiVeouDpjLAHZuOy1l552HVYd0Wi+Yp06sDBlY4OCue1cfzFKIpSy4/xM0
         UqTpxTL2pp4AaZnwzysEMOCKmFHVX5xWzijGEEoEmWCdc9biIf9s1gyDHTis1bv8EZ
         zvFTME3d5UY11fUcQoNgFi9X1JZmQm+WplNWGKdJ42WL2ZIdFKrK/iJEnxvT6SnJnP
         g7DoVi1evS1mQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AE19D60A7E;
        Fri,  3 Dec 2021 16:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Add entry for Qualcomm clock drivers
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163854780870.10151.17260560939307597918.git-patchwork-notify@kernel.org>
Date:   Fri, 03 Dec 2021 16:10:08 +0000
References: <20211203013901.3460496-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211203013901.3460496-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu,  2 Dec 2021 17:39:01 -0800 you wrote:
> Most SoC specific clock drivers are picked by respective SoC maintainer
> and then sent to the clock maintainers on their way upstream.
> 
> This has however not been the case for the Qualcomm clock drivers -
> which doesn't actually have a maintainer per MAINTAINERS and where the
> framework maintainers have just carried the Qualcomm effort as well,
> presumably as a result of Stephen's history.
> 
> [...]

Here is the summary with links:
  - MAINTAINERS: Add entry for Qualcomm clock drivers
    https://git.kernel.org/qcom/c/e3fd5f632cdd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


