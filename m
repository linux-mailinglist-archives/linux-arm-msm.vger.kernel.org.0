Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AF6341B31E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 17:40:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241708AbhI1Plx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 11:41:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:59244 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241705AbhI1Plr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 11:41:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A563B61246;
        Tue, 28 Sep 2021 15:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632843607;
        bh=FnkorFjpcIS4X6eBQW/rCuDj8Wg1FJo9bsFSyV7vdes=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=R+VkkwLu0AvnHA+yleCDodE4XzFy9pG80xZcRIJlJDD02Bg6l8x57ke58zMK6RY/i
         OHAKdk5sJT4wtDkgSvXQI7W6Jygnell2tOaNoIBGUhaSj4Awj6F5w0kNsgTBeeVUr6
         EAskcPyR32/Xve//1+zix4olS7XwGf6ExSXRzTJ4CWKUwUuHBT2Uq6JyjTJSYFoh/n
         g+8Fx/Dku/Q1c0SMcvMwVMXM9ym8IZZjTdBhYcVWdgpNkwkMCQNvzEvJtT0XlV8pak
         x22qzXfvEIX8ZKxz1EwyYDjIkL973Pru3UIpteK1zF3SAYWcO/baXw0HHWHhOidVUP
         oQuUZX6OrfXdw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 9B12060A7E;
        Tue, 28 Sep 2021 15:40:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sdm630-nile: Correct regulator label name
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163284360762.1686.7238669971575537044.git-patchwork-notify@kernel.org>
Date:   Tue, 28 Sep 2021 15:40:07 +0000
References: <20210926072215.27517-1-shawn.guo@linaro.org>
In-Reply-To: <20210926072215.27517-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun, 26 Sep 2021 15:22:15 +0800 you wrote:
> 29.5V (29p5) is obviously wrong for regulator l4 and l5.  Correct them
> to be 2.95V (2p95).  No functional change.
> 
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm630-sony-xperia-nile.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Here is the summary with links:
  - arm64: dts: qcom: sdm630-nile: Correct regulator label name
    https://git.kernel.org/qcom/c/c22441a7cbd0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


