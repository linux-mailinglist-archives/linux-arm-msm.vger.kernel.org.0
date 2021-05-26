Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1077A392071
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234230AbhEZTF5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:41168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235849AbhEZTFT (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 9BDAD61445;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=quVbd9OvRiSet4GSs7r0WFsSL15bJSPjJqqa9Cic/6w=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=G06JXc+UWtKX027vnVooFBXcPAzCYi73YaNdEGfCbwcGJ2+a9zZWgh6MfOvkRPUxB
         3RDVtL4bBWLN/newnyFkmaynB953WjPPQpJrUyPyzMNcMY+EQfGgXX+Cc+z/+7NTVC
         4gK37oOjhlEGGi2Ix2DqX1OasdGU6pnKCGVMJ612IRdcbTtglnwolHPnvfurudg2Ur
         1E89z9ndJXcKZESnpDIkSDmYzMtma9WyIrLLwQCqHoUzr0H1c/REzEqorLD6RJ58wA
         7M+Ue3paN05xNBz7FHFNLo7GExhSGDRWGdcOYl9Cwe/HWe+Z5E7y8bW/rEFNA65HUY
         pggQ3Z5/uldqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9780C609ED;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] remoteproc: qcom: wcnss: Allow specifying firmware-name
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580861.26840.11427462516392398528.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210312002441.3273183-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210312002441.3273183-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Mar 2021 16:24:41 -0800 you wrote:
> Introduce a firmware-name property, in order to be able to support
> device/platform specific firmware for the wireless connectivity
> subsystem; in line with other Qualcomm remoteproc drivers.
> 
> Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2] remoteproc: qcom: wcnss: Allow specifying firmware-name
    https://git.kernel.org/qcom/c/48073935b9a4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


