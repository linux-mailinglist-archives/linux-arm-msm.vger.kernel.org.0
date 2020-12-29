Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C9DB2E7383
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726328AbgL2URe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:60238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726330AbgL2URc (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 859DD224D2;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=8LhZQj+xp0MiBfi+b69vhf3cnGBoOGP/DmCLl6C0mzE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=p25mudhs8Y73uCs68AD1m6QdVLw3pOuLLI/XRtYImTIk4+v3DG85zMOJgReYgop/5
         ADknlzb4fGo87RGC46GztvzZggYwdVteW0LPShwxhw6Yw6YW/TWuAvHgQZLjOSA04H
         OSb5EvKJYQoEtR9ywKtSfDMiKxvBk6H0UYs5JccOJojCPk5Pre/lFlrgsLRh3BtHQi
         kmexTmcSnnvXDO3ltIdy8C00Cl/Y0UDt9ICI+D8/dB8mPvC0YPMGb5ESKQfT79RkdT
         9Y372/zkcx0eZz1nE9Ghk8jmzASx+xaDu1rFGPFuK90tzYSBi3VRAyMeiUhPq1ZC+l
         uPfytgNDCxc6w==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 8205C6063B;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RESEND] venus: fix calculating mbps in calculate_inst_freq()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293152.13751.6777618594443277446.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <1604313097-2178-1-git-send-email-mansur@codeaurora.org>
In-Reply-To: <1604313097-2178-1-git-send-email-mansur@codeaurora.org>
To:     Mansur Alisha Shaik <mansur@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  2 Nov 2020 16:01:37 +0530 you wrote:
> Currently in calculate_inst_freq(), video driver is calculating
> macro blocks per frame in stead of macro blocks per second(mpbs).
> Which results frequency is always setting to lower frequency (150MB)
> as per frequency table for sc7180. Hence the playback is not smooth.
> 
> Corrected this by correcting the mbps calculation in calculate_inst_freq().
> 
> [...]

Here is the summary with links:
  - [RESEND] venus: fix calculating mbps in calculate_inst_freq()
    https://git.kernel.org/qcom/c/b57cf6a0a889

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


