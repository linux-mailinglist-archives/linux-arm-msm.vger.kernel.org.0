Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B25D739207C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235144AbhEZTGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:41112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235744AbhEZTFV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 209C2617C9;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055809;
        bh=xibD5OReJF+UA9oPXs/YCg+99N4hdWZeGIOwAUvxU6k=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Mm9v0VndIIc1LRjuN4pEzucFOctcfePgAXbJF3p+wRJjrOlCwxbSbqxcyOz2BM9SI
         B8FQ4i6kLhGo/6Od/CF4tAsiN2o5gM2cGYiquYnNC9NjvA1ds7gfze5kkdcCmfahdo
         +QZD/GswPdwqPhNHxt3nk5fxrQ0ZHin4grLcySTcTN8xCUMTtBHjotW316dt55q7QY
         IeLR26DrKQZUv3E0kNfDO0MY21MJQFGjqNF4OMO28qot4snkR6Ebe5AImCE1rRG/rZ
         WCJm/zsEgwZJx4Or8viQGScPdYYx+xPBdNlEEgRz8tsuXiGSo6MPQ/IJckxxZBEQjD
         1Hio/lcWbB0QA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1C6D6609ED;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: qrtr: Avoid potential use after free in MHI send
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580911.26840.2281184349229306050.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:29 +0000
References: <20210421174007.2954194-1-bjorn.andersson@linaro.org>
In-Reply-To: <20210421174007.2954194-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 21 Apr 2021 10:40:07 -0700 you wrote:
> It is possible that the MHI ul_callback will be invoked immediately
> following the queueing of the skb for transmission, leading to the
> callback decrementing the refcount of the associated sk and freeing the
> skb.
> 
> As such the dereference of skb and the increment of the sk refcount must
> happen before the skb is queued, to avoid the skb to be used after free
> and potentially the sk to drop its last refcount..
> 
> [...]

Here is the summary with links:
  - net: qrtr: Avoid potential use after free in MHI send
    https://git.kernel.org/qcom/c/47a017f33943

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


