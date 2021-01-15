Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80DBE2F7E02
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jan 2021 15:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730837AbhAOOUu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jan 2021 09:20:50 -0500
Received: from mail.kernel.org ([198.145.29.99]:55494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731147AbhAOOUt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jan 2021 09:20:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3894E23772;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610720409;
        bh=uLeTW4rUyy6NN2gws/UQn3luwnfQe0hIqW3dTx+6oGw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZC2zoSSW3J62jvRpm4vpATtksHIY/NtW86A3i/FLNkryH/kthxhyzqOD+1iN1p/yX
         /il9ep+foCdOFk/tYcerbQv4ni6ub7EHWw7p+JVdsXnYQWwjK1R4C9J+db5mH4pQk/
         8KhMJrpqAiT/pfxixoA6xtHAQWmUfMA3YTR9ehuJ24UVaNdtKm+EtSfB61G5vNRS3g
         5d4bj/RH7HEO0bbIYxqeKP1V0t99aIV1rEqTul0zwPh4Y3OO7re1Zet8fVrTQEX7L9
         /7Ma+i1A5lHqM22FfCqeNfxOm3qf6EaHE+MghWZ1WvlgS9pXy3Ag2QFrfxhUKQaGT7
         KwQ+bT5mxxy2w==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 324296064C;
        Fri, 15 Jan 2021 14:20:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: qrb5165-rb5: add HDMI audio playback
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161072040920.1237.8036707288252982710.git-patchwork-notify@kernel.org>
Date:   Fri, 15 Jan 2021 14:20:09 +0000
References: <20210115024713.92574-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210115024713.92574-1-dmitry.baryshkov@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 05:47:13 +0300 you wrote:
> Add support for audio output over the HDMI output using Tertiary I2S
> and LT9611UXC DSI-to-HDMI bridge.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)

Here is the summary with links:
  - arm64: dts: qcom: qrb5165-rb5: add HDMI audio playback
    https://git.kernel.org/qcom/c/c2c76ddb1402

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


