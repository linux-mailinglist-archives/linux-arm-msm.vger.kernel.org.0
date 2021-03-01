Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 524053292BD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:52:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242937AbhCAUvY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:51:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:55170 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243749AbhCAUsC (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:48:02 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 0DA7164EEF;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628784;
        bh=cBcFL8j85FsBiMf5cav6ra7peThiqiBv8GlGh/x4POo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=d91/H7dLZq9pWM+XwCVSJCYsqAxoy5n1XnR48MJzqpkprmDRvQGvQuGOCCoQZ/GPL
         EnidRHHZvud9uO+KCpaDNb+Qp+Jj7Qa1bWDjH8kD+WbuBL1HtrC8GKhfK6LmlAZg9c
         u2xqF/VJBmWY9p+MOsZb0Q25v1A2FGcU4U1rgBd61l4FpP6Hf7feO1WiZv5a6cXUK7
         saXE4C65MyBbFqSkHAUeI0Qd1Y+EGTGMYYuCCje/CjptsU8mOWSfOks3Bb22fDmP76
         /5nHVeL1uLL42RJ1hVHOdpASD3vLIPiUh3nK11jE14AzTZfT+NbMMpRZF6/2H00Hcv
         oupz1l5dsM4Uw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0754260A1B;
        Mon,  1 Mar 2021 19:59:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: gfm-mux: fix clk mask
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878402.6187.17606542887858633431.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:44 +0000
References: <20210119113851.18946-1-srinivas.kandagatla@linaro.org>
In-Reply-To: <20210119113851.18946-1-srinivas.kandagatla@linaro.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 19 Jan 2021 11:38:51 +0000 you wrote:
> For some reason global GFM_MASK ended up with bit 1 instead of bit 0.
> Remove the global GFM_MASK and reuse mux_mask field.
> 
> Fixes: a2d8f507803e ("clk: qcom: Add support to LPASS AUDIO_CC Glitch Free Mux clocks")
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  drivers/clk/qcom/lpass-gfm-sm8250.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - clk: qcom: gfm-mux: fix clk mask
    https://git.kernel.org/qcom/c/78ddb79cab17

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


