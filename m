Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BA639202D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233790AbhEZTF3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:40984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235378AbhEZTFJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:09 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2FBA661464;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=6RJpa3uoJZY3QjR/Qb90abC4t52UwfvPIzWSSbIXhto=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=BdmvRITuObieh8lk7GcUjTvCCLbJWd0FNo8a77e5bO6RMkXRr8wbbh9CQBLBENunK
         xvw2G90SQIzFOmKR9lu5cMyhtML0RredEHCLFOrTFx564vbWwIrKjo6ECxN3xE1K6q
         xu78RtHvDlTb1cerQdR7SaFHMn8RQIvqfxWfq7d9XXUIIhZ2NdHJg21TANmA9ClUja
         pyuySaAsGwuZr2UHf0LCR8Qj3wmQHTjN5Y4Gv3ceelHzPlcrvlz/3xtTalmeUQHEci
         caFaWKGL/9rqA18nMkvXCUrSEGEsB9iCkIdrO8N0qQw28joI3k0Q30Uwt1M18RPaf3
         fafCrrlqz0KNg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2B49760C29;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] mmc: sdhci-msm: Remove unnecessary error log
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580617.26840.550341785599701699.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <20210409015424.3277212-1-jiayang5@huawei.com>
In-Reply-To: <20210409015424.3277212-1-jiayang5@huawei.com>
To:     Jia Yang <jiayang5@huawei.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 9 Apr 2021 09:54:24 +0800 you wrote:
> devm_ioremap_resource() has recorded error log, so it's
> unnecessary to record log again.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jia Yang <jiayang5@huawei.com>
> ---
>  drivers/mmc/host/sdhci-msm.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)

Here is the summary with links:
  - [-next] mmc: sdhci-msm: Remove unnecessary error log
    https://git.kernel.org/qcom/c/ffa4877c0a29

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


