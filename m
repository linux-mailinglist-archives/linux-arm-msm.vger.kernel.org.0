Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5666D2E737F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726322AbgL2URd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:60236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726329AbgL2URc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 669C122482;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=frL45NsIBVfazk/V4ZAfwTXJKKY0nLITsURRCKhsikU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=LJd3d6FQsPnthSIGIdIbdQnKrMrcGlvkFZuGV+Yzv1n5we5YQAwGG8G8kDDnli2jY
         jNQJCOXRZ2u9YG8CbrYz7Qg81rR4bqZXXRhHrwa5ylMwUZ5deGdrhqEXbjCuinq8YX
         /hl7B46gag4N8PpDYCagXKOTa3PamJtNknIskieDUEdVcTbcdoQzYJzHxDoag9d3Qa
         uVOnPG+lDtO0cYKnUUQqbmLUcTvhsRuCXgGo4tZWrxLPgjS+r0x1tmshQrNVscN2jI
         0nBUxxoQBUm704sNYbgW6hJb/QTqPQ2yOQ438Ts9FJWjybl08CEbnBsrwofDOTR94x
         w4s16cLZebp6A==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 62ED560626;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 0/4] Venus - change clk enable,
 disable order and change bw values
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293140.13751.5991483853909238064.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <1603081094-17223-1-git-send-email-mansur@codeaurora.org>
In-Reply-To: <1603081094-17223-1-git-send-email-mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 19 Oct 2020 09:48:10 +0530 you wrote:
> The intention of this patchset is to correct clock enable and disable
> order and vote for venus-ebi and cpucfg paths with average bandwidth
> instad of peak bandwidth since with current implementation we are seeing
> clock related warning during XO-SD and suspend device while video playback
> 
> ---
> Resending v4 series by correcting fixes tag for all patches in series`
> 
> [...]

Here is the summary with links:
  - [v4,1/4] venus: core: change clk enable and disable order in resume and suspend
    https://git.kernel.org/qcom/c/21926d466e3a
  - [v4,2/4] venus: core: vote for video-mem path
    https://git.kernel.org/qcom/c/9e8efdb57879
  - [v4,3/4] venus: core: vote with average bandwidth and peak bandwidth as zero
    https://git.kernel.org/qcom/c/e44fb034b032
  - [v4,4/4] venus: put dummy vote on video-mem path after last session release
    https://git.kernel.org/qcom/c/eff5ce02e170

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


