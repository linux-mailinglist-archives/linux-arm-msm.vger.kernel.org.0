Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40A35329288
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240252AbhCAUrA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:47:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:54740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240892AbhCAUoS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:44:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F334C64E99;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=TR02CmUoeI+OC8y0+Wzj+wTZY749h1L9jAxD25UHfiU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=dfSuXDZJYN7v13v0hphn8kCKHRHJgzBNjRgpzZRTYFMY6MupFu907fnzc2da0G/pk
         IY09gNRC5bJB9PM5qiPX6Vth155UgP7t20asVZ+hY5M09E2TNmMk2cUm+LwozljwrH
         qEwWSoyQHJhgUKgYDShEQCRMWnlhM8MqTSAN6CDAitXHpRz+ADQVWAKeA1fkgbon4X
         PRi+OLVK5M0cGUJk10tB8idhuCflw2env6cM9lM7jTjyUGxliKuKWuuW22cjPB4+24
         sDU7rppVxkH++7S6t+KwAKzgUe7zGvkKokE3A/XewqRbDTJUrdTByDcN5hHXAFP40p
         O4TDYX8FrJtGA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EF94960C26;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] mhi: Fix double dma free
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878297.6187.5027331494557486161.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <1612894264-15956-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1612894264-15956-1-git-send-email-loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  9 Feb 2021 19:11:04 +0100 you wrote:
> mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
> resources, including unmapping coherent MHI areas, can be called
> from different path in case of controller unregistering/removal:
>  - From a client driver remove callback, via mhi_unprepare_channel
>  - From mhi_driver_remove that unitialize all channels
> 
> mhi_driver_remove()
> |-> driver->remove()
> |    |-> mhi_unprepare_channel()
> |        |-> mhi_deinit_chan_ctxt()
> |...
> |-> mhi_deinit_chan_ctxt()
> 
> [...]

Here is the summary with links:
  - [v2] mhi: Fix double dma free
    https://git.kernel.org/qcom/c/db4e8de1935b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


