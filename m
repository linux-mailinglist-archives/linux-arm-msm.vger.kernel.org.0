Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E477391FF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235337AbhEZTFK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:41062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235386AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 470A561417;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=i+dUThtjc+DFwdNnmRNZhQEMDqYDPbHnS7MlktWMX4U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=g3SBn/PQoA86pv1EI3MvA1APWDJE9iWUfGtutO7hyunbckZenqT5232VTE1tvmZv/
         Qkleoar93nC2IZR3LzvZ8jYeEnGzOrcKThrRydj/rtBtwonNBHHdynVlkw8MoIw+uu
         3dQn7MdAHwusd93SzUo6UmtjnoJulnfj3krdovkdstDK5rdDwIxnpEHXw8nDxrTfaT
         GQrFdUhLbXcdfqikaZEpityCbx1doFt4cbrd0LioSu7E/TGRJC/OVM2Udm3fD780kj
         UVtlsgPC5mGu+Q9X6Wc7ZUSUVmooEYmkwJMfdCWCASuF9GeTo6EkGIsqBDXdIrlwBn
         /8eQO69pQQz1g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4273860CE1;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] nvmem: convert comma to semicolon
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580426.26840.13281097344474591828.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20201216132810.15688-1-zhengyongjun3@huawei.com>
In-Reply-To: <20201216132810.15688-1-zhengyongjun3@huawei.com>
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 16 Dec 2020 21:28:10 +0800 you wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---
>  drivers/nvmem/qcom-spmi-sdam.c | 2 +-
>  drivers/nvmem/snvs_lpgpr.c     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - [-next] nvmem: convert comma to semicolon
    https://git.kernel.org/qcom/c/e050f160d483

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


