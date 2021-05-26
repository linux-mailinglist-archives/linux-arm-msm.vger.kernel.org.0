Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1593C39207A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234620AbhEZTGD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:41026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235735AbhEZTFU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 04729616EB;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055809;
        bh=9ZTnmbXX65opMKv4xIGt93QQr/zcu0UZEzquZ4HnozI=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QMBnlBOvR1acz+jvRhiKEYVeA8qE62jfVvlC6adNFq4FIrxb9Q9BfTVYaVgarp1Ny
         +CdUAbexhcwa0MTVHVTX4bvGPtxkqbtq4n8VnLhMkAqwd3g26f+BgkI2mb8RT7omDC
         tU6TMhizp2T6awS+CMcWt76IV+Ze+aghWDE+ff8wYgM2684J9siNPInvC0fwzlN9zx
         Cg196PWMmN376oWzo0XGJyGIYpn1K5cBHy9T5KaMYxZtDhmmqmGR9qRDJ/dL2iULpD
         pxEtOSkMUB5PGZSvydcot0uyfmQ/CzZ5HY08mE6LCu7C7/EzIfrz4MB2AEVLEeuDVn
         bgsWUqCNKRvRw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0032F609ED;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: core: Fix kerneldoc warnings
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580899.26840.13022492643801846364.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:28 +0000
References: <20210407105502.348082-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20210407105502.348082-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  7 Apr 2021 13:55:02 +0300 you wrote:
> Fix kerneldoc warnings in description of venus_core and venus_inst
> structures
> 
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>  drivers/media/platform/qcom/venus/core.h | 40 ++++++++++++++++++------
>  1 file changed, 31 insertions(+), 9 deletions(-)

Here is the summary with links:
  - venus: core: Fix kerneldoc warnings
    https://git.kernel.org/qcom/c/c9072b674f76

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


