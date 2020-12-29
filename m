Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5252E7371
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgL2URJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:60058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726264AbgL2URH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BD9CD22517;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=BW5iX2G+UOrvW2AC5woPGiKIcZNAp+hWDFlwCjhdqmM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Krs42mtYD9Fkhy8elRx6AvO2DdOaN1SPHQMp0OGx/632JhIeDkZ8MLvj7IOXdwvVP
         kUev5KYb3X1iexltjWACH/4p2fqldO5URmnoOf/a/XRNP7qj6hi/AloCaO9eiEt9BH
         23idYAY+cPUZtUWH3klVfSsyUenOCpCLj3Adt2kzZFfODjaGJ/s+6aNRicpXu5LThX
         w7BREKpqbheigcq582/JznJYJhEBVp52Onx/S+FOfd0R9VP70w3DJVM8ZGH2ioS4TG
         t2karoug7H6IfYHD2n7q5nG/+lUPe/jbDRoNop3l7gWpnsLX+AJz2vFi0/yfLGvG9H
         Y8ASTWmxZCzww==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id B962160591;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dpu: Add newline to printks
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293175.13751.13639624966579352609.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20200928191657.1193583-1-swboyd@chromium.org>
In-Reply-To: <20200928191657.1193583-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 28 Sep 2020 12:16:57 -0700 you wrote:
> Printk messages need newlines. Add it here.
> 
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - drm/msm/dpu: Add newline to printks
    https://git.kernel.org/qcom/c/91693cbc13c2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


