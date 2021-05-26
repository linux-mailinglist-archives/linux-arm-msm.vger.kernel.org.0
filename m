Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D518C392063
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235795AbhEZTFs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:41100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235838AbhEZTFS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2B90F61621;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055808;
        bh=EHLlBkcCftDX6nHwdL52oJNGHrfuo9By2iLs7Z7BbqM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=DBa9WI8bAaatwvGX3CBobHpTZOzp13Il5Hb6UJLrkvHaV2ZAOErCmrKA4weH5vq4f
         8hSS/nG1wADOA1P1/OTrvS2w0t0pcYKm70ahdEEXpaeIMJj9PtfViXqWjiU2oM+a19
         8NwluppA1Kwcz7BAJTKnh5R2ACDP/swXNJj+LCwJ963yvBnXDzGmGPTixgLmVxYgJ3
         I1+QEkke4bhG1NXiUPef4bPvQwv9y9wrdhMurRQaAv4WSX2Yf+rEXY4vsw0y/CDFb3
         8MhyugirP+T6Lb3/6e04p4wBAsCRAsa27JCd05DQtKTrAK3L9RD1bSY5n3ec/IZnXx
         buBj0q/TXDLpA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2779660C29;
        Wed, 26 May 2021 19:03:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] media: camss: csid: Remove redundant dev_err call in
 msm_csid_subdev_init()
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580815.26840.9000093223232516513.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210402093255.2457184-1-yangyingliang@huawei.com>
In-Reply-To: <20210402093255.2457184-1-yangyingliang@huawei.com>
To:     Yang Yingliang <yangyingliang@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 2 Apr 2021 17:32:55 +0800 you wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> 
> [...]

Here is the summary with links:
  - [-next] media: camss: csid: Remove redundant dev_err call in msm_csid_subdev_init()
    https://git.kernel.org/qcom/c/6c0ed6d4b321

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


