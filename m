Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F16AD430A46
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238031AbhJQPmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:42:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238038AbhJQPmS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:42:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B784260ED5;
        Sun, 17 Oct 2021 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634485208;
        bh=YnElwHHcmtilUffaqiRT2FysXHBhBPd5PeAtaZ5QtQA=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=H5qPaqnnJMbwRsYUzvlWX014iwEubffsRTzdwch/QCN/giqF7fx9MH7sS+0YYAEjR
         ip7Q9RmeW948WKSvxibxBr1FIh5J1tgHLFRHtZipwcLkeSHHatDRVGXjXWRhC9+tRW
         Y6BdrOK1MqlCTqyuvgUyti+DEhEiQ1zeWxuktkRR6svTSSDlV7rIgNfwCp6hV6Gw+2
         yiA4Crtfkc31uMeiJrH88ZbYvm14ZNtP5+Kr3wrh4Efmr0PIdBfw4dOY0gXYyTWlll
         JF+MUfHTqhpgAzMBRfrsKDsN41X6q7W0MWhe5vlrTiibsZb8PsH9XSK4JgUpewC4kK
         Sagw2+hvqCDrA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A277460BBF;
        Sun, 17 Oct 2021 15:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: dts: qcom-apq8064: stop using legacy clock names for
 HDMI
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163448520866.5048.8226821651080630101.git-patchwork-notify@kernel.org>
Date:   Sun, 17 Oct 2021 15:40:08 +0000
References: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20211014214221.4173287-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Fri, 15 Oct 2021 00:42:21 +0300 you wrote:
> Stop using legacy clock names (with _clk suffix) for HDMI and HDMI PHY
> device tree nodes.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-apq8064.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - ARM: dts: qcom-apq8064: stop using legacy clock names for HDMI
    https://git.kernel.org/qcom/c/03d4e43fc5be

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


