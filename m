Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F176337E52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 20:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhCKTkc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 14:40:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:46856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229900AbhCKTkI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 14:40:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D5B6D64F72;
        Thu, 11 Mar 2021 19:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615491607;
        bh=oUg8GfKrF0E0ilTypisWAMgzzVcrwCZ5hMnn+asa6Uw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hPJyMHU6i/46G0ZSw24scyZJe2EDVdKeZ6aYo30jDGJ9rM0m8ooOuWm/3w5fg7eF0
         9dqyBlPBzKUVLdTaTyNfiof/5tAH/TueZ7eV9q485ajh5HdspKapTq2bat0o9Hz33b
         BvP5Co0v7tD27Fb6bP2Ol93sLrVa3cC72urFSnX0lgla3c7DbCt1EKIonmPdXfMz92
         Ym+p01L30Micx56Y+4qvGa7HCBpfyBHMvq7YL1A0+5hMd86aw/wOYmz9YYTUwEIqQn
         eINxgKYMqfyicH1MU6skFq0GFIk8d/nkFWbcyHbjfYW99DZxmOUi6KmoopkkBwDHg7
         6vdeOztpGMlaA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C4DAD6096F;
        Thu, 11 Mar 2021 19:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: qcom: Put child node before return
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161549160780.31986.9749178173176768005.git-patchwork-notify@kernel.org>
Date:   Thu, 11 Mar 2021 19:40:07 +0000
References: <20210121114907.109267-1-bianpan2016@163.com>
In-Reply-To: <20210121114907.109267-1-bianpan2016@163.com>
To:     Pan Bian <bianpan2016@163.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 21 Jan 2021 03:49:07 -0800 you wrote:
> Put child node before return to fix potential reference count leak.
> Generally, the reference count of child is incremented and decremented
> automatically in the macro for_each_available_child_of_node() and should
> be decremented manually if the loop is broken in loop body.
> 
> Fixes: 335a12754808 ("bus: qcom: add EBI2 driver")
> Signed-off-by: Pan Bian <bianpan2016@163.com>
> 
> [...]

Here is the summary with links:
  - bus: qcom: Put child node before return
    https://git.kernel.org/qcom/c/4f26f0c36fe2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


