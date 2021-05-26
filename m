Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41E439207F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235735AbhEZTGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:06:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235859AbhEZTFV (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 3ACC3617ED;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055809;
        bh=M8sbipoSjUL0zfO1c9A8UjwNAL3kvxXBq/vVkAFtcyc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=gi6hT8elIDgHea8VjI3X8/tNokG+dTpQNswAgXpiKYz34Mu0nfAIwoRW628tidre6
         +ZbM3INov61Ud2wMhiUpxZ6VnMKR5Ji1iCl8Xor/LmLWs+aNjjbUCvxXfHqDT/A5cU
         d+/bS+r+SuMseAHQSMUx/T/Heye5+GNZh0oV2y8wKddCajekpkF6IoaTGW8x8rwTCM
         hG+MbWsH8d5uCOQHN8SMx4eFP065Wn9jwnhhTVGGVsn3oX5tcCJM9CthHUCnkiyheK
         KXlL0GI4b24La02QjqP8OckI0e171rFSEzr1E9e6B1Xc2NOQap5E5hd4q0iQRgtPWw
         8zo02Dig1QB0Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 3666E609B2;
        Wed, 26 May 2021 19:03:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] clk: qcom: rpmh: add support for SDX55 rpmh IPA clock
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580921.26840.17622437537935703985.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:29 +0000
References: <20210409134407.841137-1-elder@linaro.org>
In-Reply-To: <20210409134407.841137-1-elder@linaro.org>
To:     Alex Elder <elder@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  9 Apr 2021 08:44:07 -0500 you wrote:
> The IPA core clock is required for SDX55.  Define it.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - clk: qcom: rpmh: add support for SDX55 rpmh IPA clock
    https://git.kernel.org/qcom/c/b2150cab9a97

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


