Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B67B146DBB9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Dec 2021 20:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239515AbhLHTDr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Dec 2021 14:03:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239522AbhLHTDq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Dec 2021 14:03:46 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83846C061746
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 11:00:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C81B5CE2335
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Dec 2021 19:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C923FC341C8;
        Wed,  8 Dec 2021 19:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638990010;
        bh=KiYpetziZY8eVM7pFI7e0MLkza2zwO4pDjzRAYl2xg4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ap7g48v0gZknUULvCBl+8DShx6qCoxebyfZS4iIw7i72myN7iFEhvPe4PphpeAXh3
         BaypGLrrXyJ8oQP5mYCNuoYMa78FIr4z6SpGTs1iHcOE6ocOPMXnMHkl3texhBrtfv
         NIG9rxUL0yIHP6yfFv7OMF0Gf/LCHCMZS3OO5gcLgdoBzYemU3ANCMKm4aLot5/YuP
         2xt6vGtSJi6d2XqemeyrOKd6ENOgMSn0/l2cz10QtkDVS+90rQ9Wr3TlctamPYukcd
         ctESMZnwfgRDiT48Oo2wzVkvqkI6xXud6IRSCY+ZlZwIJKwIZr7m0rU4nphtbMNGFg
         u3+Go161fWF0g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B6E37609B3;
        Wed,  8 Dec 2021 19:00:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/7] soc: qcom: Add support for SM8450
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163899001074.10201.18374007307550805241.git-patchwork-notify@kernel.org>
Date:   Wed, 08 Dec 2021 19:00:10 +0000
References: <20211201072745.3969077-1-vkoul@kernel.org>
In-Reply-To: <20211201072745.3969077-1-vkoul@kernel.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Wed,  1 Dec 2021 12:57:38 +0530 you wrote:
> This series adds CPU, SoC and board compatible followed by rpmpd support
> for SM8450 and socinfo ID and update the smem processor count
> 
> Dmitry Baryshkov (4):
>   soc: qcom: smem: Update max processor count
>   dt-bindings: power: rpmpd: Add SM8450 to rpmpd binding
>   soc: qcom: rpmhpd: Add SM8450 power domains
>   soc: qcom: socinfo: add SM8450 ID
> 
> [...]

Here is the summary with links:
  - [1/7] dt-bindings: arm: cpus: Add kryo780 compatible
    https://git.kernel.org/qcom/c/f5ef92aa8b78
  - [2/7] dt-bindings: firmware: scm: Add SM8450 compatible
    https://git.kernel.org/qcom/c/ff0ce949551f
  - [3/7] dt-bindings: arm: qcom: Document SM8450 SoC and boards
    https://git.kernel.org/qcom/c/c1b360d25457
  - [4/7] soc: qcom: smem: Update max processor count
    https://git.kernel.org/qcom/c/1f88aa777924
  - [5/7] dt-bindings: power: rpmpd: Add SM8450 to rpmpd binding
    https://git.kernel.org/qcom/c/3fe1b82d947f
  - [6/7] soc: qcom: rpmhpd: Add SM8450 power domains
    https://git.kernel.org/qcom/c/4f84580dbd71
  - [7/7] soc: qcom: socinfo: add SM8450 ID
    https://git.kernel.org/qcom/c/34f922976948

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


