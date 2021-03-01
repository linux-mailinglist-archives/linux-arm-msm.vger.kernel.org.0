Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB643292C2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243766AbhCAUv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:51:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:55878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243800AbhCAUsV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E676D64EF1;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=Mna8gaiZj0uWt9DMzN7SxT/qhL+e5cvPl8+5shy8+cM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NeFsLfeueJtiXgqZaSs6sEzKLZTpK77NN2oenUyrLrVMZ6CA4lzpj6GszqI8Utmzy
         X3Qq/ssrMgTbkxEvm6Lfh65HH8xizq7VM1hTUxcV8zYwYWgiPKpnlQixnAGzBg6R+g
         Fe43cIo6MRnVzJOMVInOnnQLD+4OtkAizh/0oUkge9v8xy63LKDBKsIVqS2yCD4BzB
         FIqgtzC7fyHvxiLWH7eqnD3UcExXGY3di/rim9qYIFPG/I3QAlJKvqlOeth0GvzjI2
         YsetEcL1g0yZlMv25T0Lsl4Vo5LTLEu2yKiytpr51H/LhqmcmBnSY6n4GOazJYvpfY
         rZO1WsgFef8DQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E301460C27;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v9 0/2] Better domain idle from device wakeup patterns
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878392.6187.10202632532389303810.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210120155042.28975-1-ilina@codeaurora.org>
In-Reply-To: <20210120155042.28975-1-ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 20 Jan 2021 08:50:40 -0700 you wrote:
> Changes since v8 [8]:
> - Check if device is attached to genpd
> 
> Changes since v7 [7]:
> - Whitespace and comment fixes
> - Add Reviewed-by tags
> 
> [...]

Here is the summary with links:
  - [v9,1/2] PM / domains: inform PM domain of a device's next wakeup
    https://git.kernel.org/qcom/c/67e3242ee280
  - [v9,2/2] PM / Domains: use device's next wakeup to determine domain idle state
    https://git.kernel.org/qcom/c/c79aa080fb0f

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


