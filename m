Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E406D3CF221
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jul 2021 04:42:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344653AbhGTCBb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jul 2021 22:01:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:34108 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344652AbhGTBuS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jul 2021 21:50:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 884FA61165;
        Tue, 20 Jul 2021 02:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626748250;
        bh=/IQ5+PkT1Aw2Qq9Yo0IErG0NY0DK3SjAk38kmfVe28Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kKTQwLfKXvJjGM+nN+SidG3zilABH0kYUcarievVfNRps5+qMZylDxFqN8Bjjt6gu
         iwcXmL9BV6XAEggL07TDKo8NCu7l6pwFoYuNuPA/3Dkvu4LdAcmecvCda9+SzwRKaq
         E+zGPLbPYk1LLzvScWyMIAPQj1BHutORdqnUzNQeWi1hNsDofnMrxlcWvTg3V3Zp5Y
         EgcJTf1n8V0DiS7ZbKxEry7trzsWwEmnof+TKWERlkfZJmmnAJyzcKuVvZvGCnpuCR
         OJjAeP60TDY9ETr2JE5ZNU6Gd2DMlNPydrn6EydhUUc8XRpIbM3anGGKFtPBClKOfl
         Nrr6rDKKRAYnw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7C7E660A0B;
        Tue, 20 Jul 2021 02:30:50 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162674825050.10695.7400409279065733194.git-patchwork-notify@kernel.org>
Date:   Tue, 20 Jul 2021 02:30:50 +0000
References: <20210326231303.3071950-1-eric@anholt.net>
In-Reply-To: <20210326231303.3071950-1-eric@anholt.net>
To:     Eric Anholt <eric@anholt.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 26 Mar 2021 16:13:02 -0700 you wrote:
> db820c wants to use the qcom smmu path to get HUPCF set (which keeps
> the GPU from wedging and then sometimes wedging the kernel after a
> page fault), but it doesn't have separate pagetables support yet in
> drm/msm so we can't go all the way to the TTBR1 path.
> 
> Signed-off-by: Eric Anholt <eric@anholt.net>
> 
> [...]

Here is the summary with links:
  - [1/2] iommu/arm-smmu-qcom: Skip the TTBR1 quirk for db820c.
    https://git.kernel.org/qcom/c/a242f4297cfe
  - [2/2] arm64: dts: msm8996: Mark the GPU's SMMU as an adreno one.
    https://git.kernel.org/qcom/c/19c07b91f85d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


