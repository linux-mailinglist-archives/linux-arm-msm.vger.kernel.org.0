Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC9B392036
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232528AbhEZTFc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:41062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235404AbhEZTFK (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7A2A06143F;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=Yb3UR6JedpZ7ejQ5zZClHb6nP4OQosPyUQ08/vLll1Y=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=OeeLFLciXooKJqxFX85sjjujLTh7WQipXcFCY1LBK1ppeJRDR9Txf8lo52XzX5NQJ
         AfUsZ0TA14kOgrROFSLHMBCBH8B8uFfid9f6fmd4pBAYnlabMuhcPUeHdcyfc+9qOU
         07Nt+1Z8m3nifyTkiIpeoH6XbI0ltRnLevq54JDNwm80qMZbtzS3je0KSPNg/VEqZz
         Q4KYloyjWiqXxkUQHbyPXMtudE4SazFwjsAhiw1kqPHgHc+S/3/u44grOhKlARyA0i
         t1PKGjdFtOhMUVq7YBnwAVnJEcR/7AFMZfkPT+N1a7lYu1n+Z9EtRz9aYjADvx9dNq
         4hN5mdl8TVBFw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 73FB560CFD;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] mtd: parsers: qcom: incompatible with spi-nor 4k sectors
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580647.26840.9843684932243862791.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <0a2611f885b894274436ded3ca78bc0440fca74a.1614790096.git.baruch@tkos.co.il>
In-Reply-To: <0a2611f885b894274436ded3ca78bc0440fca74a.1614790096.git.baruch@tkos.co.il>
To:     Baruch Siach <baruch@tkos.co.il>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  3 Mar 2021 18:48:16 +0200 you wrote:
> Partition size and offset value are in block size units, which is the
> same as 'erasesize'. But when 4K sectors are enabled erasesize is set to
> 4K. Bail out in that case.
> 
> Fixes: 803eb124e1a64 ("mtd: parsers: Add Qcom SMEM parser")
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> 
> [...]

Here is the summary with links:
  - [v2] mtd: parsers: qcom: incompatible with spi-nor 4k sectors
    https://git.kernel.org/qcom/c/8f62f59f83c3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


