Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F19972E739F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgL2URy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:60044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726491AbgL2URy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D59A22B4B;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=+qsgELsIZsRYWWuP/u5/fKkBrh7Bam5MCBUWf3GqglA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Vbp9VjJpTT6qOpKNVH/OH3h5/MzJ5DYcvjyqEuqy8yuDeAzUhlQjIZm5YzjAnktXn
         5P4XNpZl0m0X1EIbycsMiNVrvZNe6yImOyWjqSuqQAIk5UMMV86gqI/C+jis4T+isB
         QG24Esg616d5SOBYqhMlNNSqaAcPmQ85VQMgZxvFGuZdNDB7iWljzc3fsxeqU8hIxx
         RgKDyVSIIxOZLoJBWFVStKFjEqBgZuZLkS1cmZh3BS8s6N7mSR1kS6LygrE0lT2PK8
         hv2Cn8AXozGtXc9zPizldE1CK7whgDsXKFIocMjCb6rqOqhW26VOzoDgm28s4EDBrk
         /+OaWGC7bv9pA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 790BD60591;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: Fix channel close issue on driver remove
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293349.13751.15009485526852193269.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1602234434-924-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  9 Oct 2020 11:07:14 +0200 you wrote:
> Some MHI device drivers need to stop the channels in their driver
> remove callback (e.g. module unloading), but the unprepare function
> is aborted because MHI core moved the channels to suspended state
> prior calling driver remove callback. This prevents the driver to
> send a proper MHI RESET CHAN command to the device. Device is then
> unaware of the stopped state of these channels.
> 
> [...]

Here is the summary with links:
  - bus: mhi: Fix channel close issue on driver remove
    https://git.kernel.org/qcom/c/a7f422f2f89e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


