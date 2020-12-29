Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBEF12E73C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbgL2USX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:60232 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726545AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D443422D08;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=CYO8JC5tnlAxrphjc+fN5byKluinEYjcLUKGY1d94BQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jJE3IIjh1ySUistP+kLl5Hld9bd4Xz5GhZkEpI164Ru8RueEt3N6oFdb8zOtdWQNs
         8zSnaH9ulgEsv8asg/dZB2uZINlbAwegnRWqqhGS8VTwn3kcJ/2etlGXjaN+F7sxoa
         bryfS81qVq/hh6vESSX5pF7W1d+yD3g+XyJmsu6tzPxf9jiWUjaunS4ufj3WT8TGVV
         B4Ci3IfM04C7NYhK93RuZ/uH9BpzXgUQGfQ4dmiqM/2Su+dNY2JB3mV1Ds2hiM6hy2
         gGnopPAH+oEhx65W41bVmGpydGA19sr7ME3cOF92CjD1Rn4IjlyarACTYNIzW7WQx3
         pRuf0tizIV7LA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id CFD8E60591;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: Move irq check in controller registration
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293481.13751.17350537154738039268.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <1600762066-25849-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1600762066-25849-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 22 Sep 2020 10:07:46 +0200 you wrote:
> Move irq number check early in mhi_register_controller along
> with other mandatory parameters checking.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  drivers/bus/mhi/core/init.c | 2 +-
>  drivers/bus/mhi/core/pm.c   | 3 ---
>  2 files changed, 1 insertion(+), 4 deletions(-)

Here is the summary with links:
  - bus: mhi: Move irq check in controller registration
    https://git.kernel.org/qcom/c/40c3127187cb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


