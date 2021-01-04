Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1B5A2E8FD5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 05:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbhADEkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 23:40:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:39340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727044AbhADEkr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 23:40:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D6D0B21D7F;
        Mon,  4 Jan 2021 04:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609735206;
        bh=I+mPsaLOeN9VGYtrLJm6Jd8jK2R8bqhNsjUj5iQl0kw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ed4GPLBTubhhYl9quKDeqgpGSIV5Ma8Mf10nGjFOu5RguiNjeQPXhm/iPtlAM57Dy
         Qdr93F7Xk9/FAnXxUQdK2pjJoIZ0d9DByZ7DbHmKg/UMJA87AebWs9S05Fyx8E7lzy
         ZRhelMTuIpEnYfdRrSUIo6fDejz6kwHLq+w1EmPVFiim64HJPJy61EMVqNYB+PC2ol
         NqYNIh9gZEIjkeHq8vZOYE06/rnLvZVJ/yrAZGJGeFQZUWKi1G0LGv+sE73zGxcAHy
         ntadGadpiFNsXGg8b2KjgQY8GbqRMUN/eOiun2VQXS45Qyi+8kHtvk4h8Z4IMV9JwN
         wVl/oa//X3HiQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id C9C60604B5;
        Mon,  4 Jan 2021 04:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160973520682.9031.14643114470900704635.git-patchwork-notify@kernel.org>
Date:   Mon, 04 Jan 2021 04:40:06 +0000
References: <20201222043745.3420447-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201222043745.3420447-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 21 Dec 2020 20:37:45 -0800 you wrote:
> As of v5.11-rc1 the QUP nodes of SDM845 has got their interconnect
> properties specified, this means that the relevant interconnect provider
> needs to be builtin for the UART device to probe and the console to be
> registered before userspace needs to access it.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - arm64: defconfig: Make INTERCONNECT_QCOM_SDM845 builtin
    https://git.kernel.org/qcom/c/5b5465dd947c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


