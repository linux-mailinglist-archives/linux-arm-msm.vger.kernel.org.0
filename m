Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 460F32E73C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726545AbgL2USX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:60246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726549AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0EDF722D2C;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=ohQWWt+ZdbzqHB1VOflyhI6eW/d9o5FAk1nZm5qAu2c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=EiC9ZFo2fBv/PzcRTIWLHbFidYCczyWGzChGKAkcvwWC8FQ9MxTqkQC7CZvFnwclm
         fWrbHdcF49BXaqEK3sRJ0zmUrlxu+vR5nvKFftWfrlE9Vf5PGbpfsMckwzJSieTlR7
         nTX8YZXCCgZjuIXJfGe8W/4v2TbXP+gMujlh9i0E3VcXfiPfyIG5azFVttaveIIpEH
         cnj+K65rCUBw7tueboDAsz0epA6OdfeBdxZwd1tyvCiRuMxJBxfB1hvW8t8lxji9TK
         q+MwgwWRj+CafIFK5Y35tdtlXcVFIt0wyovU3W6wULcLubQjj5fitq5mvp2MqMcQaj
         l5xs2leB0brnw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 09583600D9;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] bus: mhi: core: Fix error handling in
 mhi_register_controller()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293503.13751.4255690824804324085.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <X8XqbtkPpEKSfFi2@mwanda>
In-Reply-To: <X8XqbtkPpEKSfFi2@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 1 Dec 2020 10:02:54 +0300 you wrote:
> There are a few problems with the error handling in this function.  They
> mostly center around the alloc_ordered_workqueue() allocation.
> 1) If that allocation fails or if the kcalloc() prior to it fails then
> it leads to a NULL dereference when we call
> destroy_workqueue(mhi_cntrl->hiprio_wq).
> 2) The error code is not set.
> 3) The "mhi_cntrl->mhi_cmd" allocation is not freed.
> 
> [...]

Here is the summary with links:
  - bus: mhi: core: Fix error handling in mhi_register_controller()
    https://git.kernel.org/qcom/c/89828f632dec

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


