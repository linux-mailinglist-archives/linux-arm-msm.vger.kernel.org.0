Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCBE6396970
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbhEaVvu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:39234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231690AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 4839A61370;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=5f1jke6GCTX73cAMiGRISBsZvR6Bn5x9Wh/GyW8H0uM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=r0PJYFxCsYr+DYEbAcwXegi0Fo6cqnGM6cgmQnU839JTp4+QV5HoEvWFDPUifE8NG
         aJgdwbZQModrRrjB5XCaL3Wpa5lgvb/1+6MFVZWVnfe84G3XZoJh/nIXAQoU4abqWM
         7OG9tR4rYIivs3R0QuUMzKX7bHv0jbl8bxNXOAJxd0vVDH5NTk1mDt69DptIZG/tqc
         OdCFVQg/ZUi0Xu4S/xFNM39PqngaL3nrx7ljQpq+m7DiB/O4cz3v+n6bZ/hrLTyOQs
         4owLFusceROuiA/LjhW9LzD8vN2YZFsLZPG2Ap6tgXiIBT3qP/XP0fUbuhCc2Xby6r
         6+VynZdoZbAPw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 42F6E60A13;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] arch: arm64: dts: msm8996: Rename speedbin node
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780627.3521.2448946851629381690.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210527194455.782108-1-konrad.dybcio@somainline.org>
In-Reply-To: <20210527194455.782108-1-konrad.dybcio@somainline.org>
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 27 May 2021 21:44:54 +0200 you wrote:
> From: Loic Poulain <loic.poulain@linaro.org>
> 
> The speedbin value blown in the efuse is used to determine is used to
> determine the voltage and frequency value for different IPs, including
> GPU, CPUs... So it's really not a gpu specific information.
> 
> This patch simply renames 'gpu_speed_bin' node to 'speedbin'.
> 
> [...]

Here is the summary with links:
  - [1/2] arch: arm64: dts: msm8996: Rename speedbin node
    https://git.kernel.org/qcom/c/af260f1f7dbd
  - [2/2] arch: arm64: dts: msm8996: Add CPU opps
    https://git.kernel.org/qcom/c/90173a954a22

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


