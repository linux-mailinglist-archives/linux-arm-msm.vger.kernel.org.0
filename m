Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F13F2E73DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726218AbgL2USm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:60052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726596AbgL2USl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:41 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4EFFD230FE;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272936;
        bh=zeFaIAupxiY7QVW/lThUVy9jpKrMTJmgV+bKlb3/o2Q=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ST8PrDKeHPbppzWXrIlUk+XGDp4Dl0o/NYxZ/a7dRGwnzEAS/aJztrwd2tZWbbzrn
         BG7dyLfK7jk0GMrN5oyHEVAIoz01ZMWdh6eTV+bKo7OiIJqbWiShGZ3Cytgm0m+GgN
         u2HTyoCot4nNNWAXzOyFnu2IeGfcU/1gPtwVxw/F8WcGwy08q9vDaIH2iuc945iIUW
         InDFPmZ+BVu33gXKC4fkqesHHaZB3Xvj/AuEWso8Kj4xANIIEvPsE+HM2K54yOD/qk
         C8FWOl9IYzrzQtbITLUp3d9aBMYG82ySvaPVMowd6cK+vykqH3wO30rfJ8f41Ryqc7
         1pmfiydkP7Xag==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 4BC3160591;
        Tue, 29 Dec 2020 20:15:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable TMPFS Posix ACL
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293630.13751.18445711164195086526.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:36 +0000
References: <20201130163007.310384-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201130163007.310384-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 30 Nov 2020 10:30:07 -0600 you wrote:
> The lack of TMPFS Posix ACL prevents the upstream defconfig from booting
> e.g. Ubuntu, so enable this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - arm64: defconfig: Enable TMPFS Posix ACL
    https://git.kernel.org/qcom/c/19f0af6ab132

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


