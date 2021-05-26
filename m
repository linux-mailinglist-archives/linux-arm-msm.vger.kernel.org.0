Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A4039203C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233899AbhEZTFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:41026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235806AbhEZTFL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B1D636148E;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=Ct80kwN+wWrappODtrehiP4gyALcKC8kmBricClz7DA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GhAthpNrNmDO4bN1VDSzPStPlbucrYlSCgGef9QMpchaydSA/yHa+9xC4xt3QqLcT
         CMOueidqbACO5q+0K2pjylYpvi2JgOjIwdpgNGgk5XMuvg4jZWwBH9QBx2Tc7kRBJz
         P1PEXBVdR9rzl62BjlgWFvV0RbDf1rnNFj1EmI7cvyHaUZFxoIy1R/4Q/AZmfE2ZHK
         K6hnM2I+vtwUiVEL9zd5EBxG6Ta0d1Ty7j8LTf9o97iuZuJ62/Swh6H+begCJ5Drie
         acmmBSOl+Cp8CkyjTEcJa0OTAXkcospM4k9vXFjXpQa8WQJTW/kxRWoZ1g6vAsAffs
         3pEaj7IHOgE3g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AD7BA60C29;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/2] Add support for Qualcomm MFD PMIC register layout
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580670.26840.99920212559811225.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <cover.1616613838.git.gurus@codeaurora.org>
In-Reply-To: <cover.1616613838.git.gurus@codeaurora.org>
To:     Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 24 Mar 2021 12:28:52 -0700 you wrote:
> Changes from v4:
> - Only one cosmetic change: Moved the declaration of num_virt_regs under
>   num_type_reg instead of under num_main_regs in `struct regmap_irq_chip` so as
>   to reinforce the idea that it is related to the type setting of IRQs.
> - No other changes.
> 
> Changes from v3:
> - Implemented the scheme proposed in my response to Mark in [4].
> - Dropped the RFC tag from this patch series as this series has been tested on
>   target with a client driver utilizing these changes.
> 
> [...]

Here is the summary with links:
  - [v5,1/2] regmap-irq: Introduce virtual regs to handle more config regs
    https://git.kernel.org/qcom/c/4c5014456305
  - [v5,2/2] regmap-irq: Add driver callback to configure virtual regs
    https://git.kernel.org/qcom/c/394409aafd01

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


