Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E969392070
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234661AbhEZTF4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:41128 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234230AbhEZTFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A82A76162B;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=TXsXg3azeazBwzeR4B5qPD83nAzNgUc3wdBEFAOHqHg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ooz/BZHldiLl0wjbvfLzPAnUXNpCFSqUkkVlJicspRqGmcfWOMQQ4FCJ/Or9RS3uh
         66I03S2nmhXyAsdvz1pqMJtp0gquMton5Xyn0/yHzRZl8VCkWpI5MHEcUTC3VK3t2a
         IylkDRnog2KlY8F/McrvAoScXqbpSkY7F8PwS5iAQDTakKKlQE7e+2IsQcxSQgFEUC
         j9psk3kwZsQH6giQzs1awpmfzq8vaGNtEPtETM0Qdf7qkWEI6MCEAmHsH2waqJX0iM
         EEVapDZc+NppdITkBTq+xHwEBKe3QH/ZR5WuoYR08B+4iJfh5Dv2a9+bk1lEQ4BppO
         OxsywLxqbzXrA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A3DA4609B2;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dp: Restore aux retry tuning logic
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580866.26840.16757376322647316708.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210226210821.682107-1-swboyd@chromium.org>
In-Reply-To: <20210226210821.682107-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 26 Feb 2021 13:08:21 -0800 you wrote:
> In commit 9fc418430c65 ("drm/msm/dp: unplug interrupt missed after
> irq_hpd handler") we dropped a reset of the aux phy during aux transfers
> because resetting the phy during active communication caused us to miss
> an hpd irq in some cases. Unfortunately, we also dropped the part of the
> code that changes the aux phy tuning when an aux transfer fails due to a
> timeout. That part of the code was calling into the phy driver to
> reconfigure the aux TX swing controls, working around poor channel
> quality. Let's restore this phy setting code so that aux channel
> communication is more reliable.
> 
> [...]

Here is the summary with links:
  - drm/msm/dp: Restore aux retry tuning logic
    https://git.kernel.org/qcom/c/413b7a320e23

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


