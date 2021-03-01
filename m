Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CDA53292CA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238003AbhCAUwY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:55334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243842AbhCAUsf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:35 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4EA9064F02;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=An+QZygoFcwRZr2EaWcOM+5NdvwB1EL7ma3d3KT79TI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WdBolLbXpEv7TUWBP+aM2YddTwCVF8mnLTYHTaIykt4pa2EVODb2kthjbotoogUVW
         JRHJAhVXcQU0s83w+8yDoHFhthrOirXRz2mtXBULC/15tA7Lx1pV/JMw99B1p1ddeI
         po6NsdLLhmTlq3ECHxB6iTc4nayXWdt9xWlE6mWtKpYrJv92DvieOsThpQsnbBrApn
         coYhEzBtw1YKjm4tbIqw1q+dhReDpCfPKXC3WxYosehBAaAALm4RTJCZ38eYJR9v3V
         z2QdOPLkgJmmpaPjhCMEJi8ldlu10oYKLLmM4NEwhvzOsw4FKrh0Mp1N9ee9pSriLQ
         N104e3TD/pOPw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4B52E60C27;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/2] PCI: qcom: fix PCIe support on sm8250
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878430.6187.18226186591276898489.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210117013114.441973-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210117013114.441973-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 17 Jan 2021 04:31:12 +0300 you wrote:
> SM8250 platform requires additional clock to be enabled for PCIe to
> function. In case it is disabled, PCIe access will result in IOMMU
> timeouts. Add device tree binding and driver support for this clock.
> 
> Canges since v4:
>  - Remove QCOM_PCIE_2_7_0_MAX_CLOCKS define and has_sf_tbu variable.
> 
> [...]

Here is the summary with links:
  - [v5,1/2] dt-bindings: pci: qcom: Document ddrss_sf_tbu clock for sm8250
    https://git.kernel.org/qcom/c/c9f04600026f
  - [v5,2/2] PCI: qcom: add support for ddrss_sf_tbu clock
    https://git.kernel.org/qcom/c/7081556f81f7

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


