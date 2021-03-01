Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE1163292EB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236494AbhCAUze (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:55:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:55336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237550AbhCAUvG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:51:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1490E64F23;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=vLjCuWXR6XVeerIBncozaiq25XbwGySwJ0WzJVT7liY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=jsbqtsN6Nl2C6GGnSsg91oEtkBjQ/Ah1WiyvTI9H74217yCJBs0jXGkF/5WezmQKG
         80TQWKHN2xqYrrx4hkMLWCh9/Wed4E896f1fiE7pjhdLgOwbDbHH6Dnzub+zTJRlRs
         OSLDkrxkSlqbDZbjyWOYG7C7cESwvAPyfwWlcc1IByOkA/9gAV3M3SxEUJWNhMB8Pj
         nkVZe9rCfdq04JJguLgszXkXLvBpiSHM0jTmBqkayIzaLdg8ZAJQX+u14/8YUjfkKS
         KJrPqhu3ap2rxIMC8LO6LUJqc3m4dyZCgA1L74XWcorU06nK+4xS1Na+NfrkrW0YNx
         BH3QIMfWwSvKQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 10E6760C27;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 0/2] pinctrl: qcom: Add SM8350 pinctrl support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878506.6187.10985745577123473830.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210205140132.274242-1-vkoul@kernel.org>
In-Reply-To: <20210205140132.274242-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  5 Feb 2021 19:31:30 +0530 you wrote:
> This adds binding and driver for TLMM block found in SM8350 SoC
> 
> The binding is dependent on TLMM common binding from Bjorn:
>  https://lore.kernel.org/linux-arm-msm/20210126042650.1725176-1-bjorn.andersson@linaro.org
> 
> Changes in v6:
>  - Add rob and bjorn r-b
>  - removed quotes around 'defs' and drop the phandle for binding
> 
> [...]

Here is the summary with links:
  - [v6,1/2] dt-bindings: pinctrl: qcom: Add SM8350 pinctrl bindings
    https://git.kernel.org/qcom/c/432e10330c39
  - [v6,2/2] pinctrl: qcom: Add SM8350 pinctrl driver
    https://git.kernel.org/qcom/c/d5d348a3271f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


