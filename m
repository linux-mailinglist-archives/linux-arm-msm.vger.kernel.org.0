Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26F23292C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243783AbhCAUwK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:52:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:54738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243827AbhCAUs3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:29 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 479C264F00;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=vGbG23H/dv0hOUsdPJKNk1vm++bTwlTrCBqWsliVZlg=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=hL8ZnHXXtSFtfN6zWw0XK/Zn0Ys9iyz3K0XDSdwYYfwmPGeK1vZXyM8Hjwvjl+6Gz
         XQ5cEXR2qdihWIFU/dAR6TYRuDBRRZV2bDhP54Ah4bse62hh9QmKxsS1m+LOkOPjoh
         jlKJM1+v0qmzt3/+CgPjJiqCsgiSi47i/WO2jCWYJc8FRwaKZJg+VcCJ+jebeoOjH7
         nXX6dJGgF37DHua3Yv7QR7OKc2ewdq6fVmR3QDVILZNk7Z+mcxSTE9BDY1cEMLy1yN
         KGOyl6M7LSHODbGnTpTXhh/yltGCNKsOB5WSgk/QgVt/bDVnJTGxOn5zC+qgwD4k26
         qX41N4e4CH/Bw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 441AF60C25;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: remove redundant NULL check
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878427.6187.5147364957690964142.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <1611654679-102885-1-git-send-email-abaci-bugfix@linux.alibaba.com>
In-Reply-To: <1611654679-102885-1-git-send-email-abaci-bugfix@linux.alibaba.com>
To:     Abaci Team <abaci-bugfix@linux.alibaba.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 26 Jan 2021 17:51:19 +0800 you wrote:
> Fix below warnings reported by coccicheck:
> ./drivers/gpu/drm/msm/msm_gem.c:991:3-9: WARNING: NULL check before some
> freeing functions is not needed.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
> 
> [...]

Here is the summary with links:
  - drm/msm: remove redundant NULL check
    https://git.kernel.org/qcom/c/dd5d08b5e54d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


