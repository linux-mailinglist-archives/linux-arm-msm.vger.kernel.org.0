Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6B33292F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238201AbhCAUzw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:55:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:55366 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239893AbhCAUvV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:51:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 248A364F25;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628785;
        bh=38BHmbPQ9nzUjhh3OWGRP4DEgd3aU9fpA2V8Ba+sEMM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IY7DHaf77SsgjwGzUz+zmvjOc8wFPNSBawYOXOGzjgzDr+4VsJSK1gFeNyVySFqPo
         wrYvqcvL5KljVh7vskuF9vfvZIJxJI3A4lWetmfsCfz4p90I5kRx8R7MLiOGsUZpq4
         Jd3gZQPXU5jHJZ0xTGo5QG/sCyaKijHGM1OXFmG/uZi15POOleXx/nDakiAIQdaIQ0
         2MBj3QOlHis1vpFIMy+qcGiwoRnZqBeuxwJwiupPpwQ+RaxJFUXGv5EnK3BtyatbR0
         QHIBHPJUb/RZ6nf3HHNloaleJiYuhH7BaAmAfIWkoe30tTuBcMTPnMcE6ua1y8OkwX
         LoxwWN2fU2Jrg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2106360C25;
        Mon,  1 Mar 2021 19:59:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] mhi: use irq_flags if controller driver configures it
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878513.6187.1357336605257034749.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:45 +0000
References: <20210104101128.8217-1-cjhuang@codeaurora.org>
In-Reply-To: <20210104101128.8217-1-cjhuang@codeaurora.org>
To:     Carl Huang <cjhuang@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon,  4 Jan 2021 18:11:28 +0800 you wrote:
> If controller driver has specified the irq_flags, mhi uses this specified
> irq_flags. Otherwise, mhi uses default irq_flags.
> 
> The purpose of this change is to support one MSI vector for QCA6390.
> MHI will use one same MSI vector too in this scenario.
> 
> In case of one MSI vector, IRQ_NO_BALANCING is needed when irq handler
> is requested. The reason is if irq migration happens, the msi_data may
> change too. However, the msi_data is already programmed to QCA6390
> hardware during initialization phase. This msi_data inconsistence will
> result in crash in kernel.
> 
> [...]

Here is the summary with links:
  - [v3] mhi: use irq_flags if controller driver configures it
    https://git.kernel.org/qcom/c/cdce2663ffb8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


