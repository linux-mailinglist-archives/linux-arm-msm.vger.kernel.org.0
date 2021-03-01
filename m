Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E398932925D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240043AbhCAUoD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:44:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:53178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238287AbhCAUkR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:40:17 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id DDFC564E01;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628781;
        bh=iMsIuuTMZgxEGba2/2SOo4Ev36nrm7Xf6cRqedtOyQ4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=JuIKWa9GYBEWtIvq50hnMBkdcVhc6V86tLQ/TXmmmfTVG1SxoI/rEvvx7eQP3vS07
         x9eUHziw9kL/uOlNe03vs95bMjOdzi0baclKMqBurLUocH2Gn69ysYs0sWqn7d4niS
         x8uU94QQo/E1Izl0XKVtF3D4AIlEEmxuXLN+FgkanQU/LSL/z4BtjBUUPoRT9Got2k
         xiqy5A6VFVwjpw+SsZN/4L9P08zYmOtZ6DC4rAMjfBpGaxmEvBnfw8hwk9m3lT0RrY
         SH7cmeq8cYv0JC5IqRjZzkDbcHAGESM25WQJ0X2Suiw4DhqXX1DXmEr2qTFEMoiCHL
         F2ddwF2dttieA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DA4EC60A1B;
        Mon,  1 Mar 2021 19:59:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Fix legacy relocs path
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878189.6187.1534737896968512966.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:41 +0000
References: <20210204225650.1284384-1-robdclark@gmail.com>
In-Reply-To: <20210204225650.1284384-1-robdclark@gmail.com>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  4 Feb 2021 14:56:49 -0800 you wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> In moving code around, we ended up using the same pointer to
> copy_from_user() the relocs tables as we used for the cmd table
> entry, which is clearly not right.  This went unnoticed because
> modern mesa on non-ancent kernels does not actually use relocs.
> But this broke ancient mesa on modern kernels.
> 
> [...]

Here is the summary with links:
  - drm/msm: Fix legacy relocs path
    https://git.kernel.org/qcom/c/c8d99bb938d3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


