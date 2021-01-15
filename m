Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37CB62F7F19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 16:11:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731913AbhAOPKt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 10:10:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:40804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730819AbhAOPKs (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 10:10:48 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 36DCB2388B;
        Fri, 15 Jan 2021 15:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610723408;
        bh=q5CND0sMJSPtHFoczjcVWMUC4rweWXN3wANTdjY167U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uiLgx7722BbA27OEvzlTFaAMHUvPWJaQ/Fxyfl/Xf7toIJ6KV4djQ2oOscE1+AsQg
         K/8Y0FleuDMZ3s1zZN64NruiYQihFkvN/MN0JfOwmrvI8OX/yf3TB3kF1eDu2LwPPB
         XY3BkI3bT/ls8IVP3MC4/ANN3jQb9YN0dWmap+dNFQd/9OWAd0huNG8hPXhOzEOE9g
         YuUC4Y2TixgkTxK8oirU5Ndx4ZzeMV2pOkMfi56rOhgibXkKjr0kmHdv4gJCiTGNFJ
         q5q/c9ZMsQzITn/+CJ55RgWbPXAIY8wzKJ14QsMANBcGxLv/oZeuthLbVdR323BaKx
         pgj4Y4kKYLJXA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 2FE8A6017C;
        Fri, 15 Jan 2021 15:10:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: enable Lontium LT9611UXC bridge driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072340819.23466.9198215051824419935.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 15:10:08 +0000
References: <20201228151827.4019213-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20201228151827.4019213-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 28 Dec 2020 18:18:27 +0300 you wrote:
> Enable lt9611uxc driver for Lontium DSI to HDMI bridge found on Qualcomm
> RB5 Robotics platform. Enable this driver to get display working on this
> platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - arm64: defconfig: enable Lontium LT9611UXC bridge driver
    https://git.kernel.org/qcom/c/ec8ef2dfaa3e

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


