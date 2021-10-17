Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84504430A44
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234969AbhJQPmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:42:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:58558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238031AbhJQPmS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:42:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AB01E60FF2;
        Sun, 17 Oct 2021 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634485208;
        bh=aR7nZxnQmg6DVAI40zP9Yy3HW3r+XaHr810Ng5TztHc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gL0EtQykym847rQmXSUB5hpRUm01Akc5mjHwIFM/D/3sIktQ1P6+4DD6kkLdHlK4Q
         2ieXPNxShgm70K1NvkQ+MN546gZH8MC5mPrVWqKaOEL4Uxv2mvtci/YS7mAH0cDBMn
         6WdghVezh3ZgeeWoonSzsZd23uwmAFC2rBpLH9EVMwOtM++j/uHf5ZwAdYjUPoOH8R
         a595mpWKwTwNFpx4UcDPGQprttvQGjlowN+sMYbX30Ly8TvxmmB3QO8idgiXKy8iYO
         31Yd4ksJLpxEEn4eoMpqngu9A5Yz+vS8ucuNrigYzx3H4TyYPA+c1CcEmxOrcyKQ/U
         gK9gYZSi1aqBg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9A16060BC9;
        Sun, 17 Oct 2021 15:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] soc: qcom: socinfo: add two missing PMIC IDs
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163448520862.5048.597853118883905436.git-patchwork-notify@kernel.org>
Date:   Sun, 17 Oct 2021 15:40:08 +0000
References: <20211016190607.49866-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211016190607.49866-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Sat, 16 Oct 2021 22:06:07 +0300 you wrote:
> Add IDs for PMK8001 and PMI8996. They also fall in the list of
> 'duplicated' IDs, where the same index was used for multiple chips.
> 
> Fixes: 7fda2b0bfbd9 ("soc: qcom: socinfo: import PMIC IDs from pmic-spmi")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/soc/qcom/socinfo.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Here is the summary with links:
  - soc: qcom: socinfo: add two missing PMIC IDs
    https://git.kernel.org/qcom/c/2fae3ecc7040

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


