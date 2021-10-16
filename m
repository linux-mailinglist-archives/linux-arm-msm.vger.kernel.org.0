Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE29B430048
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Oct 2021 06:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241404AbhJPEmS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 16 Oct 2021 00:42:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240685AbhJPEmQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 16 Oct 2021 00:42:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 388116124F;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634359209;
        bh=jrw6Lg1xDfa2PJDrGRoHrA/PXt2ygA60zsAeEmqrnrE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=pcfGxCMppGzuQJbDdab67VA09KecZmORRpAJhT2Spowyz1yJKK3cZx8l9USpn99jt
         4dnEVklUA1mIa17LHOUkn9tCSd8XA81Rsum7dXVdGCjqV9iUqokFQfKc66N1tS6Mr3
         8Ik8o0DADxNI44kMCcWrmypOLuaLA3fadiVPWXrD7BuMF3dCMRlklFTQICzeyjmPra
         ly/5E/46uIvLT9vWXjM1b9go5kZ9Zf5W8RbFqwiChAtU8pHUM76mYdLpL86BSgD0wB
         oHWs40IXKHzrSb6gcHoFw/VPIe/Oy53h3hv4FUOgwstmXLw7Nv7eFW3klxN6pXtBiU
         ARXLQRLbPu43Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1E6F060A47;
        Sat, 16 Oct 2021 04:40:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] dt-bindings: soc: smem: Make indirection optional
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163435920912.10607.7605517436966260372.git-patchwork-notify@kernel.org>
Date:   Sat, 16 Oct 2021 04:40:09 +0000
References: <20210930182111.57353-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210930182111.57353-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Thu, 30 Sep 2021 11:21:07 -0700 you wrote:
> In the modern Qualcomm platform there's no reason for having smem as a
> separate node, so let's change this.
> 
> Bjorn Andersson (4):
>   dt-bindings: sram: Document qcom,rpm-msg-ram
>   dt-bindings: soc: smem: Make indirection optional
>   soc: qcom: smem: Support reserved-memory description
>   arm64: dts: qcom: sdm845: Drop standalone smem node
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: sram: Document qcom,rpm-msg-ram
    https://git.kernel.org/qcom/c/d0fe6491ddd2
  - [v2,2/4] dt-bindings: soc: smem: Make indirection optional
    https://git.kernel.org/qcom/c/7a99e87e2e6b
  - [v2,3/4] soc: qcom: smem: Support reserved-memory description
    https://git.kernel.org/qcom/c/b5af64fceb04
  - [v2,4/4] arm64: dts: qcom: sdm845: Drop standalone smem node
    https://git.kernel.org/qcom/c/622adb84b3e7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


