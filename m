Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 649D12C8D8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 20:00:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728670AbgK3TAw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 14:00:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:42414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728727AbgK3TAr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 14:00:47 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606762807;
        bh=OGAIP8ku4WL3LrM0EqNpHio0OgPwzuivY/urXttWt+U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=tEXpdk6s0pUG3mEFuaOTCR/tiTZS1SHMB3aPh2ekQcKeJ4tWeBvp6gp4iDwMZSpEq
         cLklsGgre8JncVyj3q0pHjaK15nfdz3ll53tDlDBAcD/wzzjmfeSxCG64zWYcffb4z
         xus4t4HLjeV4u2mUCW7k/DJsnbqQffIE1ynGiGbY=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V3 0/1] Add QPIC NAND support for IPQ6018
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160676280696.32741.1493375261233308367.git-patchwork-notify@kernel.org>
Date:   Mon, 30 Nov 2020 19:00:06 +0000
References: <1606734105-12414-1-git-send-email-kathirav@codeaurora.org>
In-Reply-To: <1606734105-12414-1-git-send-email-kathirav@codeaurora.org>
To:     Kathiravan T <kathirav@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 30 Nov 2020 16:31:44 +0530 you wrote:
> IPQ6018 has the QPIC NAND controller of version 1.5.0, which
> uses the BAM DMA. Add support for the QPIC BAM, QPIC NAND and
> enable the same in the board DTS file.
> 
> [V3]:
> 	- Rebased on v5.10-rc6
> 	- Renamed the qpic bam dma node name from 'dma' to 'dma-controller'
> 	- Update the device register space to 64bit format
> 
> [...]

Here is the summary with links:
  - [V3,1/1] arm64: dts: ipq6018: Add the QPIC peripheral nodes
    https://git.kernel.org/qcom/c/74ab8ccfb8f3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


