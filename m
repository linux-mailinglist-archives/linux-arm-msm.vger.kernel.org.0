Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817482F7ED4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:02:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731779AbhAOPAz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:00:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:38624 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732816AbhAOPAy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:00:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 667AE23877;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610722810;
        bh=F+OaU6TOk8/GBw/b8vP2KI8GEr4SWjcQ7x353KN/JUA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bnInklaxIyPygGwJ/ephoZhbR0D1/LyC5xPj/WmwoxItwXnf/vIml2HKWPQdUn74i
         1qlOxuV6waA0AMjloiL6D87qIAtdd+S3BStbhSoepDhvHjyuot8HuDjpxFrymuLbAh
         lfTFSxa239NA4IUwvZXlqNckkh8MjfsW24qDP0mPgG1v3QQxSwWH0+4JhvNWgtdF2K
         D+SbXUvYNvQIgRTHAprnj/fHm8TAnN1lVuQ14SwvrG/C5ZSPBGXJmLy4JFK4BDuvkD
         21K2Ps0yLGRPhW3Rr74B6x5M/G/B6cqqUqo9zUYpM3ZmQg+B8nreTymjhzDh56I94M
         m6VMR+dnsTzfw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 60F9F6017C;
        Fri, 15 Jan 2021 15:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RESEND] arm64: dts: sdm850: Add OPP tables for 2.84 and
 2.96GHz
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072281039.19141.6563422986282231192.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:00:10 +0000
References: <20210112090640.20062-1-shawn.guo@linaro.org>
In-Reply-To: <20210112090640.20062-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 12 Jan 2021 17:06:40 +0800 you wrote:
> From: Steev Klimaszewski <steev@kali.org>
> 
> Running cpufreq-hw driver on Lenovo Yoga C630 laptop, the following
> warning messages will be seen.
> 
> [    3.415340] cpu cpu4: Voltage update failed freq=2841600
> [    3.418755] cpu cpu4: failed to update OPP for freq=2841600
> [    3.422949] cpu cpu4: Voltage update failed freq=2956800
> [    3.427086] cpu cpu4: failed to update OPP for freq=2956800
> 
> [...]

Here is the summary with links:
  - [RESEND] arm64: dts: sdm850: Add OPP tables for 2.84 and 2.96GHz
    https://git.kernel.org/qcom/c/6be4ba5467be

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


