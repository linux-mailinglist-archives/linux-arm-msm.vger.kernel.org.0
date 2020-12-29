Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91CE02E73A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbgL2UR4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:60048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726486AbgL2URx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 5DDC922BED;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=R9zzTuaCSDqCPGrY7vOEvwhbRUm0GR1+AU5ymguUMBU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ewl+e10e/I8fkODmDPMJA7boImL6kzDnaIjIJAa8TP1y2h6xrp6GPgdgIP3DZo2S4
         PpiWM5PxG/phk19C+q5DJIyGkk0HoycKWtt+1q4B5OYPF8JZxMu34OTJ9WCkzfVpua
         a/wK32k+b/Hub80wC55x9rx/FYms3jfxk/cc1WOBGZ1cG6K7mPkT0j//K6/+fzBdIk
         8uQcgXtx5boNQW15o6IynGnFzKJOfJ2L/aCD/IJxNzsngIjrap/Wi4kJEZoHfKdhXH
         O8KnWVOceQlzoWqGzCinDnKnmydQRyfDmMHYyEkCJaQ+edil+1c757axu1s4u1P8PK
         X8pk624dazu1g==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 5A57E600D9;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: qrtr: Unprepare MHI channels during remove
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293336.13751.9104748303846915832.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1605723625-11206-1-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 18 Nov 2020 10:20:25 -0800 you wrote:
> Reset MHI device channels when driver remove is called due to
> module unload or any crash scenario. This will make sure that
> MHI channels no longer remain enabled for transfers since the
> MHI stack does not take care of this anymore after the auto-start
> channels feature was removed.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - net: qrtr: Unprepare MHI channels during remove
    https://git.kernel.org/qcom/c/2ca7e30d3b1e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


