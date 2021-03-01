Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5292329263
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243353AbhCAUoq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:44:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:53306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243142AbhCAUlZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FCC064E42;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=PQIb8tadXacjdhyy0bHJ/8xTYsNuPMyEaNR9rmvIZ9A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=d7iQRASiQsH4UH+W5xQWG3imNb2aK7jRcn1X3zKGFyVxiWDoCWk0rUMUze2UX32JN
         AWwsI4zzs52t4xuY7djCnb6+4a2LAsL6k8WDU9lhKMMSyjcdQjrx54LE3JIwQMp37M
         jFuPOEQ+1tlQ1FUkCH+6kNGG4/bJFYen+bPRO2UdObvZD9rD4PCmUh0zGPSsZOImAA
         m+ZjPMvwBH6uj6z0FxMTx0i5VOBym07OTJL9X2ycCFknTEIWaB+PDhS8o65VhjwBFC
         dPcTdeGCParjy78TbM7VH5aUOZAhaZTSLfjdY0BNdfSanamSKemp8pLAbci1dCsQvi
         mUHXtx9zh4Ikg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4C46E60C26;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: qcom: Define common TLMM binding
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878230.6187.10913588468447500355.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210126042650.1725176-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 25 Jan 2021 20:26:48 -0800 you wrote:
> Several properties are shared between all TLMM bindings. By providing a
> common binding to define these properties each platform's binding can be
> reduced to just listing which of these properties should be checked for
> - or further specified.
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v2,1/3] dt-bindings: pinctrl: qcom: Define common TLMM binding
    https://git.kernel.org/qcom/c/6bdafceac179
  - [v2,2/3] dt-bindings: pinctrl: qcom: Add sc8180x binding
    https://git.kernel.org/qcom/c/332dcd71d145
  - [v2,3/3] pinctrl: qcom: Add sc8180x TLMM driver
    https://git.kernel.org/qcom/c/97423113ec4b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


