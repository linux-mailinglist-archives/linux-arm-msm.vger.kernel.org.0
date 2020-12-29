Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B51852E7378
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgL2URX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:60042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726305AbgL2URW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F38C02253A;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272932;
        bh=ZexKhqo15NglGFmz8CiWVK2tTc+Q6t1YUIRqhwZJv+s=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=epr8YewJNfcrLj1rk157wEKtBDuU/poDwebm473r1Z1GdUuNkJABNRIg4UsEPcKCZ
         8yl6GvyDS+irdPJnU8gNbcISzoTfZ49/fHxnKB+7trPGhWUda9lJdBmp+pSvK+h35f
         D0K7q98GFzLBrdadho6zc1+X85WyMxjOqfT9K54PdjuqmSAHGNx3j8NZJ8jbgw9VLv
         jaRSYaomqSdccf9wevrvlPgjKRriPHKiTKMEjXBknrtDSMpWoODv7JEISE1EwYmYGJ
         Or2uxMYShc8f2XtCyk3w6JfpknQVNko0CI6jl75KDHXQh85EeLgjYpjlbIRQJRrlNJ
         HZ8E/U5wM7E8Q==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id EF616600D9;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pinctrl: qcom: Fix msm9853 Kconfig entry to depend on,
 not select PINCTRL_MSM
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293197.13751.3570835622073825216.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201110190054.20517-1-john.stultz@linaro.org>
In-Reply-To: <20201110190054.20517-1-john.stultz@linaro.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 10 Nov 2020 19:00:54 +0000 you wrote:
> One fixup following my patch commit be117ca32261 ("pinctrl:
> qcom: Kconfig: Rework PINCTRL_MSM to be a depenency rather then
> a selected config") being queued in LinusW's tree, as a new
> config entry was added for the msm9853 that also needs the
> change.
> 
> Applies to LinusW's pinctrl devel tree.
> 
> [...]

Here is the summary with links:
  - pinctrl: qcom: Fix msm9853 Kconfig entry to depend on, not select PINCTRL_MSM
    https://git.kernel.org/qcom/c/2a984219b534

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


