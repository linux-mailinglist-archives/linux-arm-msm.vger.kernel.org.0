Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE7635A27C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 18:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232642AbhDIQAW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 12:00:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:48848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232395AbhDIQAW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 12:00:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D1D6A610F9;
        Fri,  9 Apr 2021 16:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617984008;
        bh=aMbLXpKAmoEko1v+Ut55JGu0HugRt7ZEf3wfRyZNOoo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dSNxlC5opDceIiPi2OeuFE08dr9OIAfYIOTJpdPz5VsmyYV9GCoB1V5Km/zDZEAQn
         0qn7XS5KbdgA3FS4S2zJqj58hiXGw5Wf3MhEg18RBYScAQrU4DR0PYgscZGW93LmSI
         6dq/TTh+ORQ7LGGTeRfDG8DcGDSu0p3pe+jMcxU1LLd8cV+M/ft8Qr9cups4nDwudT
         sBzB8GGTdwh6HCOy3C1UyZSweq+IKAhHyZwn5NPno7kVOnb/f6IJpI2/6eDP/5XQuI
         cCMkDapBlBia2JMOPsJda2sMGL5XPK7dfS6FyoiqDQl86MJdTOfWua02roZ12rhtt2
         N6VglrzFKUNYA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C9B1660A2A;
        Fri,  9 Apr 2021 16:00:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: mdt_loader: Validate that p_filesz < p_memsz
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161798400882.30609.9877029233762908585.git-patchwork-notify@kernel.org>
Date:   Fri, 09 Apr 2021 16:00:08 +0000
References: <20210107233119.717173-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210107233119.717173-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  7 Jan 2021 15:31:19 -0800 you wrote:
> The code validates that segments of p_memsz bytes of a segment will fit
> in the provided memory region, but does not validate that p_filesz bytes
> will, which means that an incorrectly crafted ELF header might write
> beyond the provided memory region.
> 
> Fixes: 051fb70fd4ea ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - soc: qcom: mdt_loader: Validate that p_filesz < p_memsz
    https://git.kernel.org/qcom/c/84168d1b54e7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


