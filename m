Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CFAD39696A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 May 2021 23:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbhEaVvt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 May 2021 17:51:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:39200 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231571AbhEaVvq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 May 2021 17:51:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 25E6C6135C;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622497806;
        bh=DVIbmxuhZgypird/Xzk++IgvRjxhrfRp6uV7toN9do8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gnnOwT4mLt4v1qGClqa+xSu+7J4fYF8t7lOAejC3NBySmmThv1k2boWdnuo21ocUa
         ilSN3jubnYh5guLehKvK8rNduzxAjj0duoB1Fqhu0A2l2xk9AMwcXI0l0AefTw2JbX
         b1EnbfSFpBI6JN3TH/5n4hOz6emcOoFpqiyQoZDLhkVsZ1Mgxabv46lmx8r/CEfIIu
         +X9mxV/Wx7Fngas0XcR/nyYYOMYCHHA4N/v0dZ+R0cmlvvbFTeQbYDz3ATYVHSN3Ny
         AnFFFlRw8QIfqh6UNE8v59cqKSTQFnLS17UKNJ96cFF0bUpr1YgRZ+UGW8/4OawYH8
         vcoWuWFvF2pgw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1E37C60CD1;
        Mon, 31 May 2021 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8350: use interconnect enums
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162249780611.3521.1497079956609068451.git-patchwork-notify@kernel.org>
Date:   Mon, 31 May 2021 21:50:06 +0000
References: <20210513060705.382184-1-vkoul@kernel.org>
In-Reply-To: <20210513060705.382184-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 13 May 2021 11:37:05 +0530 you wrote:
> Add interconnect enums instead of numbers now that interconnect is in
> mainline.
> 
> Reviewed-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes in v2:
>   - add missing include for header qcom,sm8350.h
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: sm8350: use interconnect enums
    https://git.kernel.org/qcom/c/84c856d07d80

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


