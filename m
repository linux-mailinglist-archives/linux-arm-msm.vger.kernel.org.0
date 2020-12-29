Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C60E92E73DD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbgL2USl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:60050 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726218AbgL2USl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 39DCF230FB;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=nrk+ekr35xtS+71uCz/PMbhUBENUa7RrYOiGrZFCW48=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=n/Mrz/0US60aOZRg5/O0I8yDHRphVOERsgdtQoooSfjZ3esuUy9egnWiKnxId2iyw
         f3aQtPeJSNOEqMn0F0VzAR0xMjskxHqIjrqo+86C1j+laayU98O6tKKFdgnuEbvwOT
         jL92iDRnor3AMHfOZ9nzcHZ4CtXXXuWCPvF+TVZ6M+faqntJTyTj409NN2mJm+jbMz
         gVc1g5Davi8l6yWMWk9pm4dLxEHlsJJ2WaI9v5GPMxpC5BLop3Zc6ENEWck3pFtcA/
         TX7ks4K4ZhYuwldCrQELaGTmu7sHa84eKU5jfTxl4z6/WjegP0PlyUww60ymQui4nW
         wnoyAO87fkwfg==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 366FA60626;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [v3] drm/msm: Fix race condition in msm driver with async layer
 updates
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293621.13751.16013235465867269151.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <1602857443-27317-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1602857443-27317-1-git-send-email-mkrishn@codeaurora.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 16 Oct 2020 19:40:43 +0530 you wrote:
> When there are back to back commits with async cursor update,
> there is a case where second commit can program the DPU hw
> blocks while first didn't complete flushing config to HW.
> 
> Synchronize the compositions such that second commit waits
> until first commit flushes the composition.
> 
> [...]

Here is the summary with links:
  - [v3] drm/msm: Fix race condition in msm driver with async layer updates
    https://git.kernel.org/qcom/c/b3d91800d9ac

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


