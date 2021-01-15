Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 662082F7E04
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 15:21:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728974AbhAOOUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 09:20:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:55504 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731286AbhAOOUt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 09:20:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 4272D2389B;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610720409;
        bh=aP17yrmcGlnooLKt9RVkMd/AFW/njd6hZZqRmlUCpEM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZxE6VZgyGHUCwX5bQy+WGVs2Rla4a8SbR7J7oWlOnQsYoCUalT9kqKWHtCmTeVkbE
         p+7R6rfKSYC/Sp665KSJQ59iLeo54VKPHXo2JYplwCI7o4u5RNrBniv6kgfiHZ6S11
         VuUDA/rNPEe42aL5QhxDJbKirqWoy7p7Ebv0Bc+NUVK3SWsNO2C0Qm0+UFH0nCHjHG
         Fx7UH3mhdexQZ6MA9HKBK2BkGBQS8YLJm0wX0R4ueKN6/fvgXnx21HMCvj8SI9P8Ds
         Ftf3DM65bitX6yiQGkSSnMm3+vyl3Escio+vj+wBvXWn+i+GikeBCxZsoVrVMMpbaS
         M/csX1TzHJwOw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 3EEE0605AB;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: correct sdhc_2 xo clk
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072040925.1237.1821331510730644837.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 14:20:09 +0000
References: <20210109011252.3436533-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210109011252.3436533-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  9 Jan 2021 04:12:52 +0300 you wrote:
> sdhc_2 uses 19200000 Hz clock rather than wrongly specified xo_board
> (39400000 Hz). Specify correct clock to fix DLL setup for SDR104 mode.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: c4cf0300be84 ("arm64: dts: qcom: sm8250: Add support for SDC2")
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - arm64: dts: qcom: sm8250: correct sdhc_2 xo clk
    https://git.kernel.org/qcom/c/74097d805edb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


