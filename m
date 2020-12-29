Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B959C2E73CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726560AbgL2US0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:60050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726558AbgL2USZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 51F3E22D58;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=j35rmZ+R1Hjn/apVTuUFulVxVCvPX/itieHUc6bfR/U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RAk6rclzogfTeOnZFvOBwW6FwH82T9Fv2SmP/W4IyKEXbiz/7XB4t++g4oESQ6O9i
         /lT2ThrDq7y8RVtzCkCEVHGJ5fyNRvom/OlUiJl0hPz1f2yYxmq8xYVkiRquxeaWol
         jJe0OdVmIEbpcWRgGICuktwlxFxg14m2slch961On9/RrU4TTFtE8Tp6TDsaPmPLp6
         NwBIPxi2aGlmu9Sr8iUO/C4UT+mnzC7XoJCf1iJ6xZ3wiro4LMUwnWKHDfM7ozclAP
         CRQY53sUAnAOg6QZzya8MJux7Rv+msdFsFDFnfRYdAKr6/w0Yx1V5ywfvGQk+2tF+J
         0iH2j2EQBGgiQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 4D9A860591;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MHI changes for v5.11
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293531.13751.7277698502209751157.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201202165040.GC3033@thinkpad>
In-Reply-To: <20201202165040.GC3033@thinkpad>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This pull request was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 2 Dec 2020 22:20:40 +0530 you wrote:
> Hi Greg,
> 
> Here is the MHI pull request for v5.11 cycle. The reason for doing pull request
> this time is because of the immutable branch which gets merged for handling
> networking and MHI changes.
> 
> Details are in the signed tag, please consider merging!
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MHI changes for v5.11
    https://git.kernel.org/qcom/c/888982a84752

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


