Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54E0E39200F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235858AbhEZTFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:41070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235292AbhEZTE5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1C268613E6;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=oh8isAX65XR8AnLJeEiuaNHYU7wF4d4VMr5kILyhSpU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vBHyKoc6NxJAuHLXZ7JQtXwFfBrIrL95L5K+tvFnB1CRIMKGOG2YptJkN/Mq7D0Kb
         nY5IrFNCFkf3wv7CwJg1XBT32aAhqnuk9A3c9D0yB/ppqPoGrK1iap7wk094D4IkPe
         +f7jAXkmR9Q7L+wN7N56LbISrTiw7RQMQ+Ls2CEMs1YlR5q9VY8SXXT2NjW69Zxjr9
         t+F0xX7H6M4lXOGLlF99woMK2eO6gJIHbdk7MueNKPpcba4t3nraT1xv/DgqXGWvAm
         zj6rybWt92Bu4lH3xnd3u954j6JdRzDa0SNruncOfh6cyunZI6cB4qAfP4MbWBGEie
         1IoFpq1hkidVg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 17204609B2;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] ARM: kernel: Fix interrupted SMC calls
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580509.26840.18196693236512027746.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210118181040.51238-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210118181040.51238-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 18 Jan 2021 23:40:40 +0530 you wrote:
> On Qualcomm ARM32 platforms, the SMC call can return before it has
> completed. If this occurs, the call can be restarted, but it requires
> using the returned session ID value from the interrupted SMC call.
> 
> The ARM32 SMCC code already has the provision to add platform specific
> quirks for things like this. So let's make use of it and add the
> Qualcomm specific quirk (ARM_SMCCC_QUIRK_QCOM_A6) used by the QCOM_SCM
> driver.
> 
> [...]

Here is the summary with links:
  - [v2] ARM: kernel: Fix interrupted SMC calls
    https://git.kernel.org/qcom/c/57ac51667d8c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


