Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CAB3292E0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:54:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237017AbhCAUyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:54:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:55302 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243700AbhCAUup (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:50:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F0A3364F0F;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=uo6YtKmcMjQvZz1KlEd4wS/Jk73IWBfV26bhDdltBCg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JV7d/vHZpUJSmrKOv5j1dPYBuVGNEsamQArIefnHfJPCMtNy/MvDPOlRLSLhiCofV
         G7TofJB9u3WlWa1zyzL/bBa2ww/WdOdad9KkCeGMhkIgMaS51FXgyeKIX8a3FtyV7W
         7isHZaA+j5kfj/XEnQtIYfrzBx77+tX2pr479kmHeKbD/6u6utg3fSfgQYGXUlzWGx
         Q8XBCltEehbi7Or6Y3jpdCbl5jMC391Vp7A1t+mVzZ1pxuIVzm1IVZ4C2shlaOHO+/
         orZNFb/6BPArxtf4eze1HF9lE66962y8QyfnPjf8SZQKnS4/aNofLNSaHij7LjKikJ
         asubECi2ipJFg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EC44160997;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] dmaengine: qcom: gpi: Remove unneeded semicolon
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878494.6187.3611370851004683323.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210115100040.33364-1-vulab@iscas.ac.cn>
In-Reply-To: <20210115100040.33364-1-vulab@iscas.ac.cn>
To:     Xu Wang <vulab@iscas.ac.cn>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 10:00:40 +0000 you wrote:
> fix semicolon.cocci warning:
> drivers/dma/qcom/gpi.c:1703:2-3: Unneeded semicolon
> 
> Signed-off-by: Xu Wang <vulab@iscas.ac.cn>
> ---
>  drivers/dma/qcom/gpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - dmaengine: qcom: gpi: Remove unneeded semicolon
    https://git.kernel.org/qcom/c/9ee8f3d968ae

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


