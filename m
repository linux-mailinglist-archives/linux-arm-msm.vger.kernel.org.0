Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED3FD2E73C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgL2USZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbgL2USZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2FA8C22D49;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=mLsdPQfqbC1x4sGKQufRd8YU5fY7emjqYbxUPrOq7SM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pIyaly5Hw3axiCQROsPiyf9ygFBir0Go196tzFfuTP4KdmaKzVzrJ5CC7belyUlH+
         FQGaDeXEebUjjJ/SxgOp467WTbx2IE2kmN+l9vYTmK7ZPrJZkxDk3hupvcTFJubEhf
         Kn0yJ6IWM0lrtNZ1MAGdTuXTQV/VvzB36JgIT7u75tx42M3cNp4ecozHGA5XdjnkNg
         4+TN+GG+0xa3/c/ouMqJrMV5nf/3nhCJCfgY1dWu7NBEuCVeXqW63VaoKxj9UmZBxo
         C8YPuaAjO/tRMFGPMNZDzGypuMjRkhgg5CIcUU73FwN/UhehTRJlasT6mTwYr/xuPF
         FlTZOmEcyrNzQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2C626600D9;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] scsi: ufs: Adjust logic in common ADAPT helper
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293517.13751.8246645448097703657.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201121044810.507288-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201121044810.507288-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 20 Nov 2020 20:48:10 -0800 you wrote:
> The introduction of ufshcd_dme_configure_adapt() refactored out
> duplication from the Mediatek and Qualcomm drivers.
> 
> Both these implementations had the logic of:
>     gear_tx == UFS_HS_G4 => PA_INITIAL_ADAPT
>     gear_tx != UFS_HS_G4 => PA_NO_ADAPT
> 
> [...]

Here is the summary with links:
  - scsi: ufs: Adjust logic in common ADAPT helper
    https://git.kernel.org/qcom/c/66df79ccbc2f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


