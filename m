Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CF02329302
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243757AbhCAU5E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:57:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:56490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243853AbhCAUxE (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:53:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7D34C64F32;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=dzxbQ9KKv6VRfPTjV/l65j692Yb3lvsgcHnWK/z2JXE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=AsKMW4lbL5vNTvKDXknZvnY95r4n9X+wPz9BhGaHr1xyEQFAZ+vqgUCtOidVxD894
         iEfVDtLp87hBvOsRxfo5NLqvHee8/rOVFko3Mo+E9cywA5VkTxcOeq4q3sJRj9OE7X
         kzkKVGYQ3YeotIw0e8xF179ftqGvjEAe0Q/fXEQGNvTHU98WCalYk2mqI0Xybh/W3i
         suzo1L2LN3MIEEpbuX0UlZaTa1vSicF4LoWBWC+antdFk7cru9NimzcvSPIuHdondb
         G/t82e9Oetky2YQLURcSEiOKdvT4O7D1NZjPVl3DZQk9qDkjJxREAkIJ6Bwa8fnfJX
         lXEbJXVjiB1rg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 746B060C26;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] bus: mhi: Ensure correct ring update ordering with memory
 barrier
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878547.6187.11431888554181670154.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <1606403201-5656-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1606403201-5656-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 26 Nov 2020 16:06:41 +0100 you wrote:
> The ring element data, though being part of coherent memory, still need
> to be performed before updating the ring context to point to this new
> element. That can be guaranteed with a memory barrier (dma_wmb).
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  v2: fix comment style
> 
> [...]

Here is the summary with links:
  - [v2] bus: mhi: Ensure correct ring update ordering with memory barrier
    https://git.kernel.org/qcom/c/f49b6aeb5c45

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


