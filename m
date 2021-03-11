Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C357E337E53
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 20:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbhCKTkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 14:40:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:46854 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229821AbhCKTkI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 14:40:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id CE74F64F73;
        Thu, 11 Mar 2021 19:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615491607;
        bh=D5jwaRXuGl5hAd+G0x2ZT8B16WWXlMQcS6HBtdCK9ag=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=GTbTJQg18rWuIxi7MhpGgzOe9bL3i8LHGIvQBUm1OoUth431baxJDJ5ZJx+n9GmsP
         MNEAQmoNptepdjSh8p0E1ztYQJTWG20vb8/E06aoD3U1laW++RCKCPWINfwUyV0eso
         DypPNxWnhDLtJIqyiauZWY0XBfuIuxWICjPSpXIWwR1pqfsaDN/9H7SoN4yyTCCPla
         C4HGxvQgpNaEeB1dHr+Z+krVL7Eb+TVIZN07Iccwl0SUjrNrpm11iZSlOgrmx+ANIL
         BbDqeYsz5lpDsbmZkI1eok2tCSiJTWIudx154JewxqBvV/7IYl8sWimqHFQyXK7x1+
         ZYAtFIUE7fPrg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BC8D1609E7;
        Thu, 11 Mar 2021 19:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: qcom: ebi2: fix device node iterator leak
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161549160776.31986.16106976282461833249.git-patchwork-notify@kernel.org>
Date:   Thu, 11 Mar 2021 19:40:07 +0000
References: <20200925234504.GA18813@agrajag.zerfleddert.de>
In-Reply-To: <20200925234504.GA18813@agrajag.zerfleddert.de>
To:     Tobias Jordan <kernel@cdqe.de>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat, 26 Sep 2020 01:45:04 +0200 you wrote:
> In the for_each_available_child_of_node loop of qcom_ebi2_probe, add a
> call to of_node_put to avoid leaking the iterator if we bail out.
> 
> Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
> 
> Signed-off-by: Tobias Jordan <kernel@cdqe.de>
> 
> [...]

Here is the summary with links:
  - bus: qcom: ebi2: fix device node iterator leak
    https://git.kernel.org/qcom/c/4f26f0c36fe2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


