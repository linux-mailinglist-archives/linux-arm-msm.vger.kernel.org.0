Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E41C9392049
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235365AbhEZTFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:41062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235819AbhEZTFN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3CF7C61443;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=9pWSR21RsQzwLDdibn3vD/kC7THfAe3Wk1B2WV1M8nc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TZll1YYZq66zCi9yKZOeLW0Qpj62hBYC9Kmzmn56ULjwWYp9KJnMkkJkcue7ybZo/
         iVZBiOgLsZArg20e3sPNyHRjKnRQr5Q61HWAoSc7cdWGMzHAx8LPG1hJs5TTW2jf8d
         +ddlQ+BT0ssZA9W5ubkH3Grpm64jZW+Q7Zo5m0uGQHjAmbNr0DBligNqfY0YVKMog0
         ph/AEHAOR2jJ0jI7+JrkGciAxJpn80B1HhyRpXQ8vQr20D6JYDCBaQ/4gMltz4dE2C
         IcuSaU86Q0fTVJ0XhHqcbEYgZf47kaCd0WGJFT2rikCU/qUAPGV2fl0E+0J8veMZAa
         wLwsmHcZvz96Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 38D66609ED;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] pinctrl: qcom: sc7280: Fix SDC_QDSD_PINGROUP and
 UFS_RESET offsets
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580722.26840.17599143450505911809.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
In-Reply-To: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  2 Mar 2021 10:51:50 +0530 you wrote:
> The offsets for SDC_QDSD_PINGROUP and UFS_RESET were off by 0x100000
> due to an issue in the scripts generating the data.
> 
> Fixes: ecb454594c43: ("pinctrl: qcom: Add sc7280 pinctrl driver")
> 
> Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [1/2] pinctrl: qcom: sc7280: Fix SDC_QDSD_PINGROUP and UFS_RESET offsets
    https://git.kernel.org/qcom/c/07abd8db9358
  - [2/2] pinctrl: qcom: sc7280: Fix SDC1_RCLK configurations
    https://git.kernel.org/qcom/c/d0f9f47c07fe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


