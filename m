Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4765439200B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235718AbhEZTFT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:41174 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235719AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EF1F0613F0;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=0egjPJw8pwlsRzkQIHeeoL3RHzUddD4LPGoU9bRetX4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=g6k2AudoUnp4GXOVVavGEmIRc5Hb0PO85t1+J0dFQwSd7y4abKG1K5LEvdVQMHKS9
         be7N7QziCrhzM0FTAzU0K50W7VttmS3q8pBZJ7NVs5nMdppEFiu5I3pXvcOMjMTg3A
         ylKJ2Cdf47oXGzWhPyr0sTz7P3uZRGMYRjDo+rpJQ6jXYj0GvTJQbeG8yQVogFnv8v
         c6bmRe9fU03Ep41vE1SgGcQvbLUN+lbAbnQTOvaNZhtU5MUyLb7x+RQDU4/iiyhJxt
         pK37/2iuWFEDs0GBMoO/rFFJB5+NH/WbuuKsE7yLr6fZv2Cbs20ZXyqT5kW2xIzaR6
         aWWgZOcOHj3sQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EA99360CE1;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V5 0/2] Fix WLED FSC Sync and brightness Sync settings
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580495.26840.15824067762315798623.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <1616071180-24493-1-git-send-email-kgunda@codeaurora.org>
In-Reply-To: <1616071180-24493-1-git-send-email-kgunda@codeaurora.org>
To:     Kiran Gunda <kgunda@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 18 Mar 2021 18:09:38 +0530 you wrote:
> This patch series has the following two WLED fixes
>  1. As per the current implementation, for WLED5, after
>     the FSC (Full Scale Current) update the driver is incorrectly
>     toggling the MOD_SYNC register instead of toggling the SYNC register.
>     The patch 1/2 fixes this by toggling the SYNC register after
>     FSC update.
> 
> [...]

Here is the summary with links:
  - [V5,1/2] backlight: qcom-wled: Fix FSC update issue for WLED5
    https://git.kernel.org/qcom/c/4d6e9cdff7fb
  - [V5,2/2] backlight: qcom-wled: Correct the sync_toggle sequence
    https://git.kernel.org/qcom/c/5eb622eec92c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


