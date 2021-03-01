Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E490D329309
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235194AbhCAU5i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:57:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:57170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243905AbhCAUx1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 82ECB64F33;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=AdfwRPVJwAk0zv6E1D8FboNB6C5HRMDI+2KkPXYjs+U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=N2R9qYrASdZytD60ntnqGEAoBy0pAgsWLcyq11aCxVYJGW5nDpugtirBLIQl1Zih/
         OkEuNpezbdgd5OYY0ABlDhGrziE/VAbcWp1v54quaVsvRVRwLsgqSuqbv1ERScbOfq
         pRIzcxIrIESYh3XKYJZ0kHuiNYO6HR4aEaIyaxAaQZ7UmbR+bozNI7twYpOi9+a6nx
         SpPS3FIGwCsh4nokcyVotJkrj9rqDX50/hrtQiMZvBYzpoykibD3DUnkJvuEK2rZpO
         TXnM7GesIEg3oOP+jyepA/jSj5k144kxDEg9AjPezdCvBF/YayZfd+u+EBHPiF9w4e
         hvecyQCHwG+Cg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7C4B060997;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dmaengine: qcom: fix gpi undefined behavior
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878550.6187.9388885457209679123.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210103135738.3741123-1-arnd@kernel.org>
In-Reply-To: <20210103135738.3741123-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun,  3 Jan 2021 14:57:29 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc points out an incorrect error handling loop:
> 
> drivers/dma/qcom/gpi.c: In function 'gpi_ch_init':
> drivers/dma/qcom/gpi.c:1254:15: error: iteration 2 invokes undefined behavior [-Werror=aggressive-loop-optimizations]
>  1254 |  struct gpii *gpii = gchan->gpii;
>       |               ^~~~
> drivers/dma/qcom/gpi.c:1951:2: note: within this loop
>  1951 |  for (i = i - 1; i >= 0; i++) {
>       |  ^~~
> 
> [...]

Here is the summary with links:
  - dmaengine: qcom: fix gpi undefined behavior
    https://git.kernel.org/qcom/c/0bd1bf86ab79

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


