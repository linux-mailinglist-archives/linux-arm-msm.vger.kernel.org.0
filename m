Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DDB4329246
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239582AbhCAUmg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:42:36 -0500
Received: from mail.kernel.org ([198.145.29.99]:52694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243728AbhCAUjV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:39:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BE43F64DDE;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628781;
        bh=uNZCtXx/zE7yhNGD76pTTz0cp60zCKn0NYX9MtcTdn4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ceDISnsnVyTvQENQqiKkkwQOcjZ4eH7tixxYpMox5PMeU1LOp8LFSpVWkZaEPLXxA
         ZBuBTrtvwhstO+1ZyhnWQTiG/Oh/n9IDUKT8RIJiLOR2isZqNd2i7zi/yFtBH29xXC
         JQcG6xKoZk18WfZCnBtfnmA1TG/wr6IEOCQrNWNqJAIIcwll8CIOL8XHRaWdv6lqnH
         +uQpEBAUS1IEkrYe+Y1e0ru3yaMZGWQhu7qMNFFMPcq62/qfYdfrKtUrGJnEFksbDj
         l2kht9VQXb7CkcK37eG1a6+Fh8O43EVeKsdhTNuE9E+eUx2Ergk06dVXTCydnJXEp1
         Ku2UtL1/53m9A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B296860C29;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] mhi: core: Factorize mhi queuing
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878172.6187.2346840709893381792.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <1610384195-14211-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1610384195-14211-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 11 Jan 2021 17:56:35 +0100 you wrote:
> Instead of duplicating queuing procedure in mhi_queue_dma(),
> mhi_queue_buf() and mhi_queue_skb(), add a new generic mhi_queue()
> as common helper.
> 
> Note that the unified mhi_queue align pm_lock locking on mhi_queue_buf
> behavior, taking it with irqsave variant (vs _bh for former queue_skb
> and queue_dma version).
> 
> [...]

Here is the summary with links:
  - [v3] mhi: core: Factorize mhi queuing
    https://git.kernel.org/qcom/c/a8f75cb348fd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


