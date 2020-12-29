Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C84E2E73A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgL2USE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:60236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbgL2USD (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BD9A422C9C;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272933;
        bh=rzrjLiOikMllrblfnF/fNenwiLqPHK7L6W9rKkjDU4I=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uEa7meQWLwkWxUUoAkZLW3mA6JKoof0iElFzMddNs/YCpCO9bSW/9XbF/0bSOj4UG
         M7E/KtfVViWAAlFwzFx7/MXezFJSnxeIZyIhMf5Ydo0AAvj0G7KMRA6v3kW21V2xNN
         4IFvIETomrFM4Jx6zOyA2yDO2xiNYtUr5MvKQJN1q8nLjhUG8GmE/wV4pq8Xx/s70K
         +6D318jsra5oSz0ps/KLEv7MuiXROiQAnnfuEMW80K+RwYj5HS4dxcTLyWjpnFZcUe
         JqcUc5kp/MybMl68TbfbWpdTpbMXpfykuuxPaxlDNxzVB8PJzLl9/mT/EXcKwRgTUk
         T9w5Z76ZFqPog==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id BA04460591;
        Tue, 29 Dec 2020 20:15:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] mmc: sdhci-msm: detect if tassadar_dll is used by using
 core version
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293375.13751.15795947535492658487.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:33 +0000
References: <20201112173636.360186-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201112173636.360186-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 12 Nov 2020 20:36:36 +0300 you wrote:
> Detect if tassadar_dll is required by using core version rather than
> just specifying it in the sdhci_msm_variant_info.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
>  drivers/mmc/host/sdhci-msm.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

Here is the summary with links:
  - [v2] mmc: sdhci-msm: detect if tassadar_dll is used by using core version
    https://git.kernel.org/qcom/c/8ffbfe43e903

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


