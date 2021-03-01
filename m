Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418ED329284
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238369AbhCAUqs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:54076 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239731AbhCAUn7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0F67764EBB;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=waQKVgjNrPPZPtBDua1a2JcFvH3VFJWNm0lAyio8JU8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Q75DRx0TwMMg28oNVxwqLi5biYcyF5Sz2vqXCCnEZ+lYK5RbScW41JSlIVjqeuXeP
         TBgInnd1fJtQBjqd7WUDD4frbHT28nOdr9NR7F6aIrj6Ga94zEC254Tq67LgxmvGc2
         TBPKY0+pfAVWKNdEfEZuckIBLIKX4+5Fb0sKi+SwEdEhqtNxy84axG3D469DKnJeZz
         j9U256L2wUNl3XdlDJWpQgFCtFtL/EubkuDxNNFi8Ip+nxSysDHICl2HSanaf1dkBa
         R8pGo6LqVXSP3BcwdFE+f04MwJAnku2F6aI+pUY7h7c45fbTcIlakpC9IF2wR9Vhod
         OtGyGWh6PcyFQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0B85160C27;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 1/4] pinctrl: qcom: Allow SoCs to specify a GPIO function
 that's not 0
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878304.6187.3950456849874918154.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
In-Reply-To: <20210114191601.v7.1.I3ad184e3423d8e479bc3e86f5b393abb1704a1d1@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 14 Jan 2021 19:16:21 -0800 you wrote:
> There's currently a comment in the code saying function 0 is GPIO.
> Instead of hardcoding it, let's add a member where an SoC can specify
> it.  No known SoCs use a number other than 0, but this just makes the
> code clearer.  NOTE: no SoC code needs to be updated since we can rely
> on zero-initialization.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Maulik Shah <mkshah@codeaurora.org>
> Tested-by: Maulik Shah <mkshah@codeaurora.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> [...]

Here is the summary with links:
  - [v7,1/4] pinctrl: qcom: Allow SoCs to specify a GPIO function that's not 0
    https://git.kernel.org/qcom/c/a82e537807d5
  - [v7,2/4] pinctrl: qcom: No need to read-modify-write the interrupt status
    https://git.kernel.org/qcom/c/4079d35fa4fc
  - [v7,3/4] pinctrl: qcom: Properly clear "intr_ack_high" interrupts when unmasking
    https://git.kernel.org/qcom/c/a95881d6aa2c
  - [v7,4/4] pinctrl: qcom: Don't clear pending interrupts when enabling
    https://git.kernel.org/qcom/c/cf9d052aa600

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


