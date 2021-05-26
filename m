Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5AE6392040
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235085AbhEZTFh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:41112 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235810AbhEZTFM (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C5BF961492;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=GXvGjoWXG5zZ0Rh4jYvl0IWMxmvCIfbLvYiMfFBzQpg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qJzMkXCTWEavkkxHq6KE400JrnV8mnEpg/3K5EaeOc8mwlgqMcwctntXAJzkeocXg
         WjBEDkmpHVNlbFADKDl1oYvzr1WAxbYn5BM7SIs/eqxsytUYwc8b/+2DU2wBqojjBO
         IF/d/zRdkdUBs1zLw+SFrquuFc8iN6xJU70mGCiC2U2WBUEXO4YmMrWBVwFvj4Ckom
         b/AJDxVIqUCgIkZw9/WL/XmX9cWUu4VSMxrfNzF6ZeW1vdfipurQDAQ341GP7/NqQ0
         oXiWGgcZxOlXXIK6pQrhNQNY51uER/FKRcDPYbWkfHgFeJODnRwuuZ8I5q2wntdfBD
         u5EjUHvDVF9VQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C1AE160CE1;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] bus: mhi: core: Check state before processing power_down
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580678.26840.8136111392617315295.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <1615409365-8165-1-git-send-email-jhugo@codeaurora.org>
In-Reply-To: <1615409365-8165-1-git-send-email-jhugo@codeaurora.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 10 Mar 2021 13:49:25 -0700 you wrote:
> We cannot process a power_down if the power state is DISABLED.  There is
> no valid mhi_ctxt in that case, so attepting to process the power_down
> will likely result in a null pointer dereference.  If the power state is
> DISABLED, there is nothing to do anyways, so just bail early.
> 
> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> [...]

Here is the summary with links:
  - [v3] bus: mhi: core: Check state before processing power_down
    https://git.kernel.org/qcom/c/9e40641f62cd

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


