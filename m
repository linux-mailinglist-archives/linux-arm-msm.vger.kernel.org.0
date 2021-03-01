Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA7432929E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239781AbhCAUs5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:48:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:55188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238856AbhCAUqG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:46:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 69F6F64EDB;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=PrRt7BxGHANDWXinZYSFRnyBQLPKjI3dflw/PBK4ldc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hIRfbupcHQxSQK66ZB3bckQH6YaK2tEClvQpiGjGIedBu6X4Kzir7bAA7T9FtaB3l
         6RjZ2Kw3AMfuGL/ApbkSlHtxNQb60CM3+ZRLWVP/Egi8rToUsa3TcgCAcA1H39IiW2
         1nhBqRA9jrBzDsw/rFa1Z0gg4uqE6slCP6Tda0YnoWvxJvW245nxWa3oRZCZVYs3qk
         oWJiZHoN7Wts6WY8CaN5ZdFRmbZwzu7PmoLQveEWBYjSruCKum83/LMn4c7VWdFgU0
         EUnJjyghpUMFSF4gKTqnqWMM9Des4dfm4+K2lA0/goAo0N50jc4p1DRc+LsneEP8ja
         ZDi9RdSZbw/3Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6683E60C27;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] mhi: unconstify mhi_event_config
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878341.6187.2051478449788599491.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1609865076-13890-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  5 Jan 2021 17:44:35 +0100 you wrote:
> Some parameters may have to be determined at runtime.
> It is the case for the event ring MSI vector.
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  v2: no change
> 
> [...]

Here is the summary with links:
  - [v2,1/2] mhi: unconstify mhi_event_config
    https://git.kernel.org/qcom/c/fcba4b2047a3
  - [v2,2/2] mhi: pci_generic: Fix shared MSI vector support
    https://git.kernel.org/qcom/c/b91c3b30e226

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


