Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD12392048
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235777AbhEZTFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:41064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235818AbhEZTFN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3478E613DD;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055807;
        bh=2WFVMRz1MSf5Qs6cteA5bRd/kectWQg4eLeDDNkTb7I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=b0B4Uw0ECF0v7Ii1ACHUfvi2GvnJHZQ46eLhki/VumUV1tsUCBHsXq9Slbs5XAXz5
         AxeIgVirqNZZ6vB0HQF90NZcJBOse3kKxzGLFuMYX/uqL9Td47nnewFujbBJRKpZgJ
         O2TTFG8li1AnE9psmj/j0T8bqno+yrsyHYibgzTVik6Mri2uoj4Vcm9efxJ1Ymetz1
         1IjadTDxoH5I//0D7V+OMRUcQH2x3TXyI4ERl8vAwY4oqy+cHl/9/EbtKJl2hp7KmV
         CLdF/wBu7pDkxWDZkTsKdYe0zNC60T+3kky+q7tnv5kAGeYjNLluOpLfxTbsQBqsLp
         BEoEfpXINv4Dw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3015460CE1;
        Wed, 26 May 2021 19:03:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [v1] drm/msm/disp/dpu1: program 3d_merge only if block is attached
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580719.26840.7654324232436348739.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:27 +0000
References: <1617364493-13518-1-git-send-email-kalyan_t@codeaurora.org>
In-Reply-To: <1617364493-13518-1-git-send-email-kalyan_t@codeaurora.org>
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  2 Apr 2021 04:54:53 -0700 you wrote:
> Update the 3d merge as active in the data path only if
> the hw block is selected in the configuration.
> 
> Reported-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Here is the summary with links:
  - [v1] drm/msm/disp/dpu1: program 3d_merge only if block is attached
    https://git.kernel.org/qcom/c/12aca1ce9ee3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


