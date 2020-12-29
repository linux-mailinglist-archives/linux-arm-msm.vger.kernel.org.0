Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D272E7362
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgL2UQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:60050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726261AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id CD26522287;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=NnEXYjtk+7tAK9sZtLk0PhjnV62OncOcNQkitcARwWA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=R+f6mjJxsUw3E9F3Edx/u8YupzWgYEY1mu7zAxdcnSVePIIf30IL80zBBjfiQ/Tet
         gmy2rfI8UtECpMIwgvQn9NrgmVvZsWZ6vfUopm6YOhC70sL8sNuAVi1pjswERNOImy
         7pwHj1FEYFLnwhjB70ibkRLkSuw9uzJFt56ffAxeD6HCK4UASDLp2NrxDKiWKBYmwu
         w0PgeO+FA1ks6V8nqAsx8GwoNPuPqj99xTajC3EH8RFs917qqvgY1DGZSpJ63G/FO5
         Zz/Y0tSR2dZlywXcRtq+UBvC5vUoVrqNBQ8Ood7D6ACRf1raDQgJ5Dpi/mKDTrdsEY
         t6MwTZbl8RO7w==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id C7550604D7;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/2] Modify documentation and machine driver for SC7180
 sound card
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293081.13751.14928881772865219794.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
In-Reply-To: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
To:     Ajye Huang <ajye.huang@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  6 Nov 2020 14:14:31 +0800 you wrote:
> Note:
> - The patch is made by the collaboration of
>  Ajye Huang <ajye_huang@compal.corp-partner.google.com>
>  Cheng-Yi Chiang <cychiang@chromium.org>
> 
> v6:
> - Documentation: Addressed suggestions from Rob Herring.
>   - Define "maxItems: 1" in dmic-gpios property.
>   - Only keep one example and add dmic-gpios property in.
> v5:
> - Machine driver:
>   - Fix a format string warning (Reported-by: kernel test robot <lkp@intel.com>).
>     detailed info at https://lore.kernel.org/patchwork/patch/1331087/
> 
> [...]

Here is the summary with links:
  - [v6,1/2] ASoC: google: dt-bindings: modify machine bindings for two MICs case
    https://git.kernel.org/qcom/c/0e38d93493c7
  - [v6,2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
    https://git.kernel.org/qcom/c/3cfbf07c6d27

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


