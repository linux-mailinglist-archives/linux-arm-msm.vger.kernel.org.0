Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBE072E73A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726491AbgL2URz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:60054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgL2URy (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:54 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8891C22BF5;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=qhoE2mHFvE9/rj7mzhPeE1Cjv5oaFgr8f6bVq7ORLto=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=SIvTI2HqgaUMju6IHo1QADvcGOIwUhDokM03t6hXa4QAgUQIkTIVsto24DYRDFDhV
         iCjb4FV4nn3yMff1h6dWvhDYu/A9EA/ypa7Afot5aGgXyWvVHCz0LuKSvDGLrxHKtD
         WAd7xTI2KMpKdTI//eKEhtATR1iVgYmi+i64pwE21lri6BadaXAouZEqzdExNrboFp
         TQWby1K6xV8yrhXbmMfDMeKyzwZxhLUE7VuV+/A2C0KkbLxhqP94ievEPidQqTOo/3
         mF5FHx36h/XwH3yDpsLr5YEQ59t6uQOkTP4J+sQInJIHuHB8XnHO3Wv8ve2SYkIUVE
         mBMI5fN4f2UMA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 8406F60626;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: core: Remove double locking from
 mhi_driver_remove()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293353.13751.16470415321455244115.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <1602787671-9497-1-git-send-email-bbhatt@codeaurora.org>
In-Reply-To: <1602787671-9497-1-git-send-email-bbhatt@codeaurora.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 15 Oct 2020 11:47:51 -0700 you wrote:
> There is double acquisition of the pm_lock from mhi_driver_remove()
> function. Remove the read_lock_bh/read_unlock_bh calls for pm_lock
> taken during a call to mhi_device_put() as the lock is acquired
> within the function already. This will help avoid a potential
> kernel panic.
> 
> Fixes: 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - bus: mhi: core: Remove double locking from mhi_driver_remove()
    https://git.kernel.org/qcom/c/9b627c25e708

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


