Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FDEA3292BF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243184AbhCAUvj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:51:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:54540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243766AbhCAUsI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 1B4B464EF9;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=vNU1DFS8JUFNcRbkUtpXJwXANdiJvJSCimelwL7F5Ic=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=NKMh64VnGAyOakHlbbF55tBulXD4M+jr6/os04dpCVvXlRHB0B+6RPMWhgiUehH43
         rExPYjDnfi2DD87SF9ZCGpOFOnFsZqVSkm9lG+JqZBxUAYxzrucDtpAuW8uzLZh5n7
         JDH5cmyp4lRHcEk9Z18jMCwSzBvUxWBC/vkZeSXoFtHimdI/mxNy4MABDRakqdLCD1
         +Mu9q6GACJJBHUmPqljztWnDak0f4DMUmCo7Ej24oqKt+eEFVv4dwkCnGN9+Xouy8Q
         f78VxN89NREa038FHHEXKrpFbfGXPBzkscQ6RkG6m6v6zllLty6NHHSjrvxrN9ns1T
         Iu07u1OM92H0w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 176DB60997;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] media: venus: Mark bufreq_enc with static keyword
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878409.6187.4012804024250758645.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <1610615121-15340-1-git-send-email-zou_wei@huawei.com>
In-Reply-To: <1610615121-15340-1-git-send-email-zou_wei@huawei.com>
To:     Zou Wei <zou_wei@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 14 Jan 2021 17:05:21 +0800 you wrote:
> Fix the following sparse warning:
> 
> drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c:1242:5: warning: symbol 'bufreq_enc' was not declared. Should it be static?
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>
> ---
>  drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [-next] media: venus: Mark bufreq_enc with static keyword
    https://git.kernel.org/qcom/c/0f9774dddf6c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


