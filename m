Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5F839200C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235852AbhEZTFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:41064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235191AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0436061447;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=W4q4g7cf3+MpRffVnLgeTN7xaXpBW0pktQlVyHfSfkk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Ovu11YDZqyTtJqo8/xIGImcP9sgrKc2FZLuYff6ah0jmdyve/VYn9vb5lQ3e6z93x
         X2J4R1w5Igj5kRXJEW6oDV0CSGd0iUQE1Xj/79Ydd5tYIrBAmqDWk1cN2C5qkthM09
         uWwxon45FmXfZlF07fzRNZ4bw29d1EIO0jbhGz8vUgZJdix1HHhJfS1nPxQQ+mAQMk
         T1TgRGdbtp6dwuff9FF4HfsQH0tqy2YsttjMlD7lxzXI12Ins8sNuEGxU4DNihQ/ZG
         I5mI2u1nbU5lpXoSATiZY0TMMCnSk83Fm+Y3okQy0kRcmR/LXtLgW9TJYq6eEIbcfX
         Myip3dXCznLkA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F40DE60C29;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] bus: mhi: core: Fix shadow declarations
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580499.26840.12049047801262001472.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210409044614.7934-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210409044614.7934-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  9 Apr 2021 10:16:14 +0530 you wrote:
> This commit fixes below sparse warnings with W=2 about shadow
> declarations:
> 
> drivers/bus/mhi/core/main.c: In function ‘parse_xfer_event’:
> drivers/bus/mhi/core/main.c:667:17: warning: declaration of ‘flags’ shadows a previous local [-Wshadow]
>   667 |   unsigned long flags;
>       |                 ^~~~~
> drivers/bus/mhi/core/main.c:565:16: note: shadowed declaration is here
>   565 |  unsigned long flags = 0;
>       |                ^~~~~
> drivers/bus/mhi/core/main.c: In function ‘mhi_process_ctrl_ev_ring’:
> drivers/bus/mhi/core/main.c:856:23: warning: declaration of ‘new_state’ shadows a previous local [-Wshadow]
>   856 |     enum mhi_pm_state new_state;
>       |                       ^~~~~~~~~
> drivers/bus/mhi/core/main.c:837:19: note: shadowed declaration is here
>   837 |    enum mhi_state new_state;
>       |                   ^~~~~~~~~
> 
> [...]

Here is the summary with links:
  - [v3] bus: mhi: core: Fix shadow declarations
    https://git.kernel.org/qcom/c/683e77cadc83

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


