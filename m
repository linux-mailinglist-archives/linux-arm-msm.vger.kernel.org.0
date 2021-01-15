Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C06DE2F7F18
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:11:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725910AbhAOPKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:10:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:40802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731913AbhAOPKs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:10:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 289732054F;
        Fri, 15 Jan 2021 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610723408;
        bh=i9lj+6lYvfE+b3hMnxxu3QM+lFlZ/GuBAzmKgFaZSW4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fZ4IZAUPu6tL33zmG4Rm/4TDOA/xKZ6JPH87A5XlnvJhW90Dbtlw9m4cCALIAzYL8
         yb+DMq/o3ifniXsI6FIqDA3KNsQgkhHmzSq5AcVMMh58BaO2CADaXZQlypH09DCIKq
         XD0eiQwgqHfw6zchC8sNtDsIdimo09SkRedlnll/rw1wwG6tEnOBoP5e3mpirM3cr7
         g0zRoJ6/FBjr3MChvmQhYI0bj8Fb+odCRK8tU18FYUXP72fdGZkF67r3WgVajKstVZ
         XlBJYfi4Nh0FkjzhI3jkf9CYHkcUwp9B2CgqMuka/YCCdbmSy/WVKz4cw2nZbHIio8
         kFHARdfUVUvXw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2507E60156;
        Fri, 15 Jan 2021 15:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: enable display clock controller on sm8250
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072340814.23466.811504450251877439.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:10:08 +0000
References: <20201228151225.4018477-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201228151225.4018477-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 28 Dec 2020 18:12:25 +0300 you wrote:
> Enable the driver for the display clock controller on Qualcomm SM8250,
> needed in order to get the display working. This driver provides
> power-domains and as such should not be compiled as a module.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - arm64: defconfig: enable display clock controller on sm8250
    https://git.kernel.org/qcom/c/438ffa4afd5b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


