Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 428512EE9B3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 00:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbhAGXUt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 18:20:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:54554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727722AbhAGXUt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 18:20:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C0F72360D;
        Thu,  7 Jan 2021 23:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610061608;
        bh=ESczGCMhpOPzTkF2yFsAW7cPCIw52V7MlE5rWb1Yj/0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=TVDaKMychT4oS007RK3qcXagdgGAU5/274BYp7Ons6XUmmqVdnq6soVBcgegdtHg/
         4J2vwG5zi4Lk2swTZE9Gwp7DK2LcOwFAgS8zJ3iKVsLxP9/zb613ltdqlEhAXNblzf
         Q9VGpla+zawYTECA0mSoIPG25FE9dgy7w+fgAd3UmAfKAZ1YvzMu9JrnnQilc/vUDk
         J6N63c58odq43z3oAtlsoTSn0l6XZMrrqEef5SAy9cpsBIPH9diVPSq6dNhQyQmt+2
         nsrCZqAzDtXoIfX13icCh8RS/tHAaWELx1kLZDscugZz7uzbfNpHjIltdvFptnHC7O
         MkYCJGj8/nilQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 70461605AC;
        Thu,  7 Jan 2021 23:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] soc: qcom: rpmh: Remove serialization of TCS commands
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161006160845.28512.12239514091707976344.git-patchwork-notify@kernel.org>
Date:   Thu, 07 Jan 2021 23:20:08 +0000
References: <1610008770-13891-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1610008770-13891-1-git-send-email-mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  7 Jan 2021 14:09:30 +0530 you wrote:
> From: Lina Iyer <ilina@codeaurora.org>
> 
> Requests sent to RPMH can be sent as fire-n-forget or response required,
> with the latter ensuring the command has been completed by the hardware
> accelerator. Commands in a request with tcs_cmd::wait set, would ensure
> that those select commands are sent as response required, even though
> the actual TCS request may be fire-n-forget.
> 
> [...]

Here is the summary with links:
  - [v3] soc: qcom: rpmh: Remove serialization of TCS commands
    https://git.kernel.org/qcom/c/fef419c463d0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


