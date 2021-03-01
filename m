Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C9432925F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238287AbhCAUoL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:44:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:53308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243407AbhCAUlZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6A06564E4B;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=HMJehdIM/T7jJlm2l/2KDXUx7Tx0gnWK8NWYhcFA9/c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VhTOB7q8XDHH9sttN0cizFWd4KuPZr626/cFLiltHpCz5BSi08ChN/KCeXcij37PE
         KJkPMMb/H/ChRHqbYDhKV+3X5yIouUC2f7B1K5F2hsIcq3Sfr5071p5PH7mfj6ZLKH
         VdPAmQJGVDg8dfQ4RWsIoTAGKg9vbaxkZmhowwIiCMoZjaximGhUSLDZEZQZVeLvjd
         gZouSFp0dP0mochr/0a20OIqJ2H7hkg66UTWQlIZkwmxFaXHddd5FY4z/S36FfMNtH
         apQ6+3grqjq+zs6hkl/3JNICnRj57dfniTkz6qMH1tYa+T9P+cI4m8hVeq/JpOyGXL
         E0m53DENToRCA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6660660997;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] dt-bindings: phy: qcom,qmp: Add SC8180X UFS to the QMP
 binding
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878241.6187.7000585653118033429.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210120224531.1610709-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210120224531.1610709-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 20 Jan 2021 14:45:30 -0800 you wrote:
> Add compatible for the SC8180x UFS PHY to the QMP binding.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,qmp-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - [1/2] dt-bindings: phy: qcom,qmp: Add SC8180X UFS to the QMP binding
    https://git.kernel.org/qcom/c/a618c47a816f
  - [2/2] phy: qcom-qmp: Add SC8180X UFS phy
    https://git.kernel.org/qcom/c/a5a621ad0ab4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


