Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 395AB391FEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235761AbhEZTE6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:04:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:40990 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235313AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E8FC4613F0;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055803;
        bh=3Vq0P/rsYDcXZHlUJT3XFloeqahhyIDQ47KgJKlQtf0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=n0/fMY8NaqmObb3c9jGS7iwRxjI5np8l9NXUPI61Fus3lzeq7lzFkPTc/mLI8HscK
         YG4wfMHuV8CP5qbI4Mj5zV8DDJaR8/hBy3FtYcYAJU9FT4nod66gFKyxCsZTgZ1fMU
         qyW6PDOvux79CocVJjtH/ikNwnaqUBeIfCfrnk1j3a7dzNk88pk/M9cmpKUmotJ/AI
         tprlKztfLDZp3sK2/wHC7TGxHdy6G4Sl3IvE1c1IzoEp3hamUHlEteprrwx5h+qI74
         8WUfgadzd7R05fii+4flXTUnneZaL1y3zFvHno89J8f1LRuBLkzhpFYvNbBK4D+e5M
         66yAsTGybpe1Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E4A7F609ED;
        Wed, 26 May 2021 19:03:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 1/6] mhi: pci_generic: Parametrable element count for
 events
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580393.26840.8862813453547088673.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:23 +0000
References: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1614971808-22156-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Mar 2021 20:16:43 +0100 you wrote:
> Not all hardwares need to use the same number of event ring elements.
> This change makes this parametrable.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  v2: no change
>  v3: no change
> 
> [...]

Here is the summary with links:
  - [v3,1/6] mhi: pci_generic: Parametrable element count for events
    https://git.kernel.org/qcom/c/9ea48efdc528
  - [v3,2/6] mhi: pci_generic: Introduce quectel EM1XXGR-L support
    https://git.kernel.org/qcom/c/ac4bf60bbaa0
  - [v3,3/6] mhi: pci_generic: Add SDX24 based modem support
    https://git.kernel.org/qcom/c/59d05b71729b
  - [v3,4/6] mhi: pci_generic: No-Op for device_wake operations
    https://git.kernel.org/qcom/c/e3e5e6508fc1
  - [v3,5/6] mhi: pci_generic: Use generic PCI power management
    https://git.kernel.org/qcom/c/e89878aa4b79
  - [v3,6/6] mhi: pci_generic: Add support for runtime PM
    https://git.kernel.org/qcom/c/d3800c1dce24

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


