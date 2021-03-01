Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E61632926A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238996AbhCAUpL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:45:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:53312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243480AbhCAUl5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 79E4164E51;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=CXOOJ9gDHqNBmQUwdxqM84p0ZfvqAATfl/cObW57R34=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=cwhlKh85da+NpktAErlCnT2VU9myPOMDXIcF8sd7XEEERQeaQXeZXkSCW7aStYZHA
         QiTzutEPqOEy5E18IeLbNUnXNVWh/2QI8qF4kDbroYVbScpqJHCbvqkKqDXN7eSsvq
         ilA4a00q5Am9Ijc7MqI6Xj7kbDMfKVKxGTmQM5Xw63cJSk4R/IFusIvPXa5P5FFCis
         4aACDAAI6i/jhSUDFHfAFi37eiGtUEC7SY0SekDVFYo4Rq/H7JjTwcQrCvUFyo+sij
         uaKkRGjb0LlkHfIUkc5Nfiml65lSc2D1SmqM6y0aKx5Xk7Ipr4eUmg9fpmPk9G5KES
         ILRFbKqN9dmRw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7606360C26;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] spi: spi-qcom-qspi: Use irq trigger flags from firmware
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878248.6187.18386305830141776057.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210112001301.687628-1-swboyd@chromium.org>
In-Reply-To: <20210112001301.687628-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 11 Jan 2021 16:13:01 -0800 you wrote:
> We don't need to force this to be trigger high here, as the firmware
> properly configures the irq flags already. Drop it to save a line.
> 
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Rajendra Nayak <rnayak@codeaurora.org>
> Cc: Mukesh Kumar Savaliya <msavaliy@codeaurora.org>
> Cc: Akash Asthana <akashast@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> [...]

Here is the summary with links:
  - [v2] spi: spi-qcom-qspi: Use irq trigger flags from firmware
    https://git.kernel.org/qcom/c/eaecba876783

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


