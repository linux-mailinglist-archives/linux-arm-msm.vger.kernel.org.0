Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797E5392027
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233459AbhEZTF0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:41088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235782AbhEZTFC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CC602613F6;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055805;
        bh=YeKORNFT8aM4VcPXYQl9iIJ9/FoAvkwYYRH2VBqfJc4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=X8tL8JVLYtXTh+kZy3bZwNqaEhypSvUQk9yX2ME60hbuoZxeO2SqQaJs3/oN9DW9s
         0RXJCMiQo/XOSkIkve4gjJ19rM3lHOunqc5MidoKM8BuoWjTEFE5fGOLRv67Bs0eEu
         FfmtCJoalhzyBoERJpo/w0Dk6pBHOgIJH7+YToLWJ8Okny9+e2dCPk90V5dH1lc+Sg
         a0J9kf9rJEwmUZ01oH+cxliDHzRDq8vPLe9DKyLbBiKonUoVmMG2nN3zs+24Dx8/Fg
         +9PDEFcJSF72QWxV/cfrbMvGvTBwzf8UIijKm/NK+lOEHXiuTG9M1KiYlpFxXKw1nV
         8QfA2CxBk436A==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C664D609ED;
        Wed, 26 May 2021 19:03:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] MAINTAINERS: Add entry for Qualcomm IPC Router (QRTR) driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580580.26840.8880070736473154549.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:25 +0000
References: <20210329112537.2587-1-manivannan.sadhasivam@linaro.org>
In-Reply-To: <20210329112537.2587-1-manivannan.sadhasivam@linaro.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 29 Mar 2021 16:55:37 +0530 you wrote:
> Add MAINTAINERS entry for Qualcomm IPC Router (QRTR) driver.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)

Here is the summary with links:
  - MAINTAINERS: Add entry for Qualcomm IPC Router (QRTR) driver
    https://git.kernel.org/qcom/c/5954846d09e4

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


