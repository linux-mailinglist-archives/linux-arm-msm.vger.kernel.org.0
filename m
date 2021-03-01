Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 613C4329307
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:58:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243788AbhCAU5Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:57:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:57176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243916AbhCAUx2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8F6EE64F38;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=yeOM3/3H33ua/6a7XSMdYu25UwNBFQZNI0OvEGkFnAE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=J8M5YqxMTYsB4CeEHmrgUjyLY9sC7PGokNLXGebLMHSVh9EdLvtRha6k2hsEp4JkX
         +85qi+dKwc1DBqMzuJkPh+TUYP4Kt5Cq+IBlILIvAkVb+6U7uTgDNmEyi7vnv0G9SC
         IBW4ncZfbsJ+ayOe3NnYp0r20Jn4S9dCOahexFcY2DlbFe7N+BtMGjBAufXVmHvDJP
         SMmqdk9zQ+LP9ULtALPrxlheoT1HOIZAhrJq75tMXVksgxC2gsRPmdw1Mn+mFLn7qQ
         2kq3Hzhga/KlZLc8tCKoMW7gRhgqDS3drSEbdTvUJYFTsIahvZkqGHYTWRdwYMTaza
         KBk6TOFAeYe3Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8C1DA60A1B;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: qcom_wcnss: remove unneeded semicolon
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878557.6187.14261580877271983984.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <1612320402-3313-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1612320402-3313-1-git-send-email-yang.lee@linux.alibaba.com>
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  3 Feb 2021 10:46:42 +0800 you wrote:
> Eliminate the following coccicheck warning:
> ./drivers/remoteproc/qcom_wcnss.c:573:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/remoteproc/qcom_wcnss.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - remoteproc: qcom_wcnss: remove unneeded semicolon
    https://git.kernel.org/qcom/c/9a1d27148543

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


