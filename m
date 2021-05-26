Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5190E392079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235800AbhEZTGB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235191AbhEZTFU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id ECDA1616EA;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055809;
        bh=BYdf+IXHpo06tPHtEFtdCBHj/RpHUlgLt5i84iyBzfM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=P8bG9ajt22hhihmhKdvrpQqW9iZA12k4TQNrZOXYz6TQhUsMKyxqI9jvKlc2RE9mp
         THxHrWQpjLR9fuikAC353GhloryHvFmuNes4tzpMwGJrS5zxGBCFozINB7PQiuHYE+
         +4KKdRYB2lxnjNnI/z/zSzYd7+jx8aQE1Jk1Q5g+bUnvBFa94wPRB3QYjH2+WggW9B
         os/XyzcFTUnyl/N2PAcG8/59BJidvXKQE5sM19QLoRqibHx7yJIT9ynF+b0ImYeOW4
         IFFNu/iSIysxBD7MwHYweVFDkekwBdq8IQtZhriuWPg3tQZnq6YdMT349qYcJ0SijS
         7g4zd26MdER7Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id E8DF060CE1;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] remoteproc: qcom: wcss: Fix return value check in
 q6v5_wcss_init_mmio()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580894.26840.5311685229135111552.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210319094100.4185044-1-weiyongjun1@huawei.com>
In-Reply-To: <20210319094100.4185044-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 19 Mar 2021 09:41:00 +0000 you wrote:
> From: Wei Yongjun <weiyongjun1@huawei.com>
> 
> In case of error, the function devm_ioremap() returns NULL pointer
> not ERR_PTR(). The IS_ERR() test in the return value check should
> be replaced with NULL test.
> 
> Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] remoteproc: qcom: wcss: Fix return value check in q6v5_wcss_init_mmio()
    https://git.kernel.org/qcom/c/859fd2418b4b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


