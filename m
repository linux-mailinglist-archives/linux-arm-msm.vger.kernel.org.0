Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505E633819C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 00:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhCKXkP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 18:40:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:39778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229574AbhCKXkI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 18:40:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 6E20F64F7C;
        Thu, 11 Mar 2021 23:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615506008;
        bh=T9VKgoTYBKqMW7Op9u2OFLEc2LsMscdLqQEpsVZWI8s=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VcAejZg6BaSsVNXaM3hQzJGlB2WzHA2HbSjHXEL1Y/RNkjcmHlWnzh3nq2SBk7XQP
         wUgBcrW8O1PSa2bm5EonPOaNXMAUm0DHOLeXJiq8aqLtFpJHX3sv/Ps1CtBwEQHGpL
         egYgxjjUeWKF43faE5zCRlnyTpFkzuJOO7JQvt6cn8NsFFJCIIyUSDa90LsKd8rozQ
         nFt66iMIB0O4E3x3ZW6VIEErUgLyC7ptYdFjPYx73TfMJS07pi+nDYH21ljrcOfryD
         mg0LeDdOAKJBRKO6V6b0HUPlG6NJ2r5EBLvEOYYmao2y5ZsOyfvmSea1+TbcBZE/8g
         WPI7i9dp9A7vA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 641C7609CD;
        Thu, 11 Mar 2021 23:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/4] Fix number of pins in 'gpio-ranges'
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161550600840.29522.1905358598452082389.git-patchwork-notify@kernel.org>
Date:   Thu, 11 Mar 2021 23:40:08 +0000
References: <20210303033106.549-1-shawn.guo@linaro.org>
In-Reply-To: <20210303033106.549-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  3 Mar 2021 11:31:02 +0800 you wrote:
> The fixes are split per SoC to ease the stable kernel pick-up.
> 
> Shawn Guo (4):
>   arm64: dts: qcom: sdm845: fix number of pins in 'gpio-ranges'
>   arm64: dts: qcom: sm8150: fix number of pins in 'gpio-ranges'
>   arm64: dts: qcom: sm8250: fix number of pins in 'gpio-ranges'
>   arm64: dts: qcom: sm8350: fix number of pins in 'gpio-ranges'
> 
> [...]

Here is the summary with links:
  - [1/4] arm64: dts: qcom: sdm845: fix number of pins in 'gpio-ranges'
    https://git.kernel.org/qcom/c/c0590924525a
  - [2/4] arm64: dts: qcom: sm8150: fix number of pins in 'gpio-ranges'
    https://git.kernel.org/qcom/c/dca9464b366c
  - [3/4] arm64: dts: qcom: sm8250: fix number of pins in 'gpio-ranges'
    https://git.kernel.org/qcom/c/126195a71c04
  - [4/4] arm64: dts: qcom: sm8350: fix number of pins in 'gpio-ranges'
    https://git.kernel.org/qcom/c/0d37f5077ffb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


