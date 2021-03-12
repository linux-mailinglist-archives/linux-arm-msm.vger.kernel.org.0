Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44716338369
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 03:10:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbhCLCKW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 21:10:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:48758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbhCLCKH (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 21:10:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 72D8D64F90;
        Fri, 12 Mar 2021 02:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615515007;
        bh=qqoJPa/nvEZe38ZmGHwNjVyyLMDMNcybSGztQkWVJC8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Er+FSzjjjCA0LO+w52wPGSgZtgzROKx+9Qt2C4NCDSfkSIn3hFvFGnfNeA7wQWSMj
         Q6PVKcHoeZT/2svNoAAgAQnA/GJnCmNrj7+pPnBeqJVmWLBVUIdTX83yFS59ibf3Vf
         Bi0MkP7Pv/7Hp3TLG8Wj3yIYtgWTDUVjD/dyrrZr/pjjzTEGpbhK8/t2vNtekL9UbH
         TS4Ekg8D0Qy+Q6F2USnVtXEE6C/FIrJ+d/Fx1Kro5dU2wlSFtx0RJAGT5zitVlY4B4
         bTkuUPxgxAmIZrhWt+bxSyMJ6mwZjmJjSdcLcenA5T3gFIRurF6bllg7dwNToW2QjC
         QzrF9Fkw7+wDQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 66C5F609E7;
        Fri, 12 Mar 2021 02:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dt-bindings: arm: qcom: Add SM8350 HDK
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161551500741.25701.3074062623232353528.git-patchwork-notify@kernel.org>
Date:   Fri, 12 Mar 2021 02:10:07 +0000
References: <20210310035710.2816699-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210310035710.2816699-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  9 Mar 2021 19:57:10 -0800 you wrote:
> Document the SM8350 Hardware Development Kit (HDK).
> 
> Reported-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - dt-bindings: arm: qcom: Add SM8350 HDK
    https://git.kernel.org/qcom/c/d3d12de81b54

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


