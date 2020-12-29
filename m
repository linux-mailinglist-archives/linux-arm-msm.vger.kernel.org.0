Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E172E7358
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:16:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgL2UQL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:59326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726138AbgL2UQK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:10 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 65CCF21D1B;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=QoUk7SgxIBdig+MG9+TS0tcdmXmw0rnjDWOKPmLk0Oo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=N0dxbNzLMCDu4k8lkmnyRYHP2mSHFLZcuj5xlicL3av0AV1u9GSQ7oRYscYIYSqrv
         RzitnS6qSwv8QA6kRttqBXDS7StSeAYF+pDDaqlKonQLSbO1iS3mXxXNAROAzR5TS5
         gbRIg3E4ZFTrKVRzptqz66A4uYnDe5+HV6hS43UrJhKcZEXvKk3cDxFsz0yCS1+2X4
         oIAmhCqezrgXbal2l+dTv1GCuXsqUcp/TfFBPwRZGefsgpnpBNu4wWjGA7wGJPC3SU
         w1Obk/GHsMqRuPTYr+JfLpXqDFWCwoOxFd0Afwtlf5S6EVSpN+TMHjHX4Z7MJSZziU
         ExHgy+P6wrdoA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 54E69604D7;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] fix dp link training failed at irq_hpd request
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293034.13751.10415695649285245534.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <20201113220803.15033-1-khsieh@codeaurora.org>
In-Reply-To: <20201113220803.15033-1-khsieh@codeaurora.org>
To:     Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 13 Nov 2020 14:08:00 -0800 you wrote:
> Some dongle require link training be done at irq_hpd request. This serial
> patches address the issues so that DP/HDMI display can be lit up properlly.
> This serial Patch also fixes clock stuck at "off" state error caused by
> previous link training failed.
> 
> Kuogee Hsieh (3):
>   drm/msm/dp: deinitialize mainlink if link training failed
>   drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
>   drm/msm/dp: promote irq_hpd handle to handle link training correctly
> 
> [...]

Here is the summary with links:
  - [v2,1/3] drm/msm/dp: deinitialize mainlink if link training failed
    https://git.kernel.org/qcom/c/231a04fcc6cb
  - [v2,2/3] drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
    https://git.kernel.org/qcom/c/ea530388e64b
  - [v2,3/3] drm/msm/dp: promote irq_hpd handle to handle link training correctly
    https://git.kernel.org/qcom/c/26b8d66a399e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


