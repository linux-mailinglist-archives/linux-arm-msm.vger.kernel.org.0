Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB89732926F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243564AbhCAUp3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:45:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:53216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243603AbhCAUmq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:42:46 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 992F764E5C;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=Mq0NULTGDmm8pRTq7mubmekkEgjweweIIa/EOtt+loo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WYEaNAnj+xVETxSpjZCgIU+nEvTOR0Oodnkdv8/zNsdHBXye9GEf+OCFgpKtgHx16
         BtL1TmkqQhqYRSlpfv1hldDvkHmHO1Zns4+q+/qw54WxyKT/DwEQj9tug9GCm0IuQ9
         BRc2qUCJ8cFfZL5eK3VQx5Hf0gxQHyutwCuoSRjI53GnOfw7VdNjI5+EIdL0F/Gm5b
         glT30kWNN5V5oUTOuwDTMVqK0WCDFtWBTlpH3IKZ175ltABCU7ADAHOhuorGoRliGh
         c+mCc+jZ9IJ0rhgR6+X9wOHClO5khBRT/ZxdOeYbmNAjWnHO0PVKOVbPFWPYPdQa3/
         VZWivGQ1c2o1w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 956E060C26;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/4] Fixup clocks for venus on sm8250
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878260.6187.10107812402993326444.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20210204150120.1521959-1-bryan.odonoghue@linaro.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Feb 2021 15:01:16 +0000 you wrote:
> V2:
> - Adds tested-by/reviewed-by as indicated - Dmitry
> - Fixes commit log copy/paste typo in patch #3 - Dmitry
> 
> V1:
> - Adds some missing indices to the videocc index
> - Adds videocc clock tree hirearchy for msv0
> - Adds a regulator to power the videocc consistent with downstream
> 
> [...]

Here is the summary with links:
  - [v2,1/4] dt-bindings: clock: Add missing SM8250 videoc clock indices
    https://git.kernel.org/qcom/c/9ba80d849c83
  - [v2,2/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_DIV_CLK_SRC
    https://git.kernel.org/qcom/c/2334032f00af
  - [v2,3/4] clk: qcom: videocc: Add sm8250 VIDEO_CC_MVS0_CLK
    https://git.kernel.org/qcom/c/c80a4285a36e
  - [v2,4/4] clk: qcom: videocc: Add gdsc mmcx-reg supply hook
    https://git.kernel.org/qcom/c/fe8e6d554705

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


