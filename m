Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0592F2E73E9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgL2USx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726600AbgL2USw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 77CB423101;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=0ODwfrkydCwWe1UHw/4nJw5SoWCFMHwk5fc7HfA22yA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=m4j2A27VRiRcM7OTbyjg+tYN6nbJgFloKqeBFzGbmd2GpInwru2zNiwzPM1LPNkEZ
         ctSltf+ld30r4hLqRFHoElD/bSJing4lDdnAN0rM6b+PPjqvYrv0G0BdUVhmHXOoB6
         chYQx8lT7aflt6UXgNjWEfXOKjibc6aQ2W2XuvRKlrn6dVbjeGp+9SB1N7BocgYlgC
         5Mx+geZHvzrR+yypg7xPtlqHSTbWp2WNvAMbg3kOzFEt9a+akIBsY+M3gfFtG8OJVV
         7hkr0gvlmgjZ9nxA8BJOt2WrLlaeorio01qYvq5KwbnROcy65X34DSUR98SUPkfUW4
         DCL086mpLNEvw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 74A8460626;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] drm/msm/dp: do not notify audio subsystem if sink doesn't
 support audio
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293647.13751.1410969262278066743.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <20201103011023.21365-1-abhinavk@codeaurora.org>
In-Reply-To: <20201103011023.21365-1-abhinavk@codeaurora.org>
To:     Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  2 Nov 2020 17:10:23 -0800 you wrote:
> For sinks that do not support audio, there is no need to notify
> audio subsystem of the connection event.
> 
> This will make sure that audio routes only to the primary display
> when connected to such sinks.
> 
> changes in v2:
>   - Added fixes tag
>   - Removed nested if condition and removed usage of global pointer
> 
> [...]

Here is the summary with links:
  - [v2] drm/msm/dp: do not notify audio subsystem if sink doesn't support audio
    https://git.kernel.org/qcom/c/e8c765811b10

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


