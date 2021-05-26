Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62694392016
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234052AbhEZTFW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235765AbhEZTE6 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A35161451;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=DFJ1hFuVTpXS4zw+6ifj2TbcZs0j6XmaAfBuJ/FHRUw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=UTXri8KlWoxnLr4PW/SwqoS8iINlmedrdcPbVLBUiGIBvsE1rXiNpNFgPrcBCC0vY
         uOz0AVFJLYzD8yD7WfrAFLbxjeTS6m9r4H0ibjVU0m+HhP1rFcc+RACI2KB1ZGoU4s
         dIziTD5liJKrRfh9ru2q2vStiItbx7sNBBHtnPuZ1oFGjTS/l7mxDtfTLniQ+REWsN
         kWlmGgCvXfH36m/7FMLQmcx5XC2nH0rEx3NJTqdsGkaRr5ygqxHlF1qyh870yLA+dD
         gLaXoxO3QZ0w12QIXG7lJYi/IhGr2FDSiMeCXHkDOaCuwV8hdYNolJ1Kvis+9RNglC
         /FlZNtpuoY8bw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 661A0609B2;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND PATCH] bus: mhi: core: Remove pre_init flag used for power
 purposes
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580541.26840.11429975106793551258.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <1617313309-24035-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1617313309-24035-1-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  1 Apr 2021 14:41:49 -0700 you wrote:
> Some controllers can choose to skip preparation for power up.
> In that case, device context is initialized based on the pre_init
> flag not being set during mhi_prepare_for_power_up(). There is no
> reason MHI host driver should maintain and provide controllers
> with two separate paths for preparing MHI.
> 
> Going forward, all controllers will be required to call the
> mhi_prepare_for_power_up() API followed by their choice of sync
> or async power up. This allows MHI host driver to get rid of the
> pre_init flag and sets up a common way for all controllers to use
> MHI. This also helps controllers fail early on during preparation
> phase in some failure cases.
> 
> [...]

Here is the summary with links:
  - [RESEND] bus: mhi: core: Remove pre_init flag used for power purposes
    https://git.kernel.org/qcom/c/eee87072e2fb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


