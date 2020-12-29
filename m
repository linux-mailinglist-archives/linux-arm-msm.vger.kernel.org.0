Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 911042E737C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726317AbgL2URZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:60052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726316AbgL2URX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 485CB22955;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=dTM8dePLSlqJAlwSjjuDLc27LtKKUBywsieeTv8FF88=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=l5kf+aTv6Q0oWh0FAmMMAVDhUt6DukKkI9JgU7fcg6dVKs+1RteSlgzt3vBa7XDo8
         VYmLK9FlYLyVeNM8w8kCj+CYzMjZoIhVw52VeXlXxnk39pTp+Synn/4WCGzHIneTAu
         ITgmNmAcQmOIZXm960MyJoVLVWcnOkCxfD03TpPEHURSre8tCQwZP+4b7BwUtvTnsz
         /VoRmZR9t18nq97ptROobgFs/3I5gwGLhhhbduiXNy7H2kZhoKFgvm4i1CzAWUTo7T
         vQTiMk0aDrQsdRGPzeTfuEqrbs4Qxff7ydb1MmRRywO3fnOE+moj8kORU4Jc6KMeua
         XYkDt8aULozVg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 4308160591;
        Tue, 29 Dec 2020 20:15:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/3] iommu/arm-smmu-qcom: Support maintaining bootloader
 mappings
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293227.13751.5225014611868173747.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:32 +0000
References: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201019182323.3162386-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 19 Oct 2020 11:23:20 -0700 you wrote:
> This is the revised fourth attempt of inheriting the stream mapping for
> the framebuffer on many Qualcomm platforms, in order to not hit
> catastrophic faults during arm-smmu initialization.
> 
> The new approach does, based on Robin's suggestion, take a much more
> direct approach with the allocation of a context bank for bypass
> emulation and use of this context bank pretty much isolated to the
> Qualcomm specific implementation.
> 
> [...]

Here is the summary with links:
  - [v5,1/3] iommu/arm-smmu: Allow implementation specific write_s2cr
    https://git.kernel.org/qcom/c/56b75b51ed6d
  - [v5,2/3] iommu/arm-smmu-qcom: Read back stream mappings
    https://git.kernel.org/qcom/c/07a7f2caaa5a
  - [v5,3/3] iommu/arm-smmu-qcom: Implement S2CR quirk
    https://git.kernel.org/qcom/c/f9081b8ff593

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


