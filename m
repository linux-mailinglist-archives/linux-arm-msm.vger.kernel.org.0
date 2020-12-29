Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B71912E739A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgL2URu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:60240 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726472AbgL2URs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2445922B4E;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=SVF5FrhUOlJuMTOOQtCykwx2cUX2RXIgZI493vJkC2g=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bGLnGL3mPW4CHIggTEuHMGKSSyAlnXp7dc2ksI3zKRDdGaTomDAAWPt7pSnYo3jA0
         YBc4kwgsNIs5bOHjHWVKgqH1SBG1DbDqukCEEA7tymJvCnFRb6lv8HsSECy+kZiFOL
         31SaeB6VFikGxZLqYbNADeiu+pmbZ6lzYQwhItgBjtOaFleXXN81hBs+AfFsDEoVb4
         JHZy/EzG4lfYabQ4x0fLLSNFiELsR4reC1w3JqTK+1nKuqfE/TSH6KVymEpCdOgFXe
         iEgGDoxyP4Q+wHbOk/+i447yMp91VHf0fj5uQYPq7V4hIy5sYIzdJEwWeTQ8He1hm3
         koAp6UxS9GvQA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 1FBC9600D9;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm/dp: remove duplicate include statement
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293312.13751.16338240831736686830.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <1605081476-27098-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1605081476-27098-1-git-send-email-tiantao6@hisilicon.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 11 Nov 2020 15:57:56 +0800 you wrote:
> linux/rational.h is included more than once, Remove the one that isn't
> necessary.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 1 -
>  1 file changed, 1 deletion(-)

Here is the summary with links:
  - drm/msm/dp: remove duplicate include statement
    https://git.kernel.org/qcom/c/64aec620b7f2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


