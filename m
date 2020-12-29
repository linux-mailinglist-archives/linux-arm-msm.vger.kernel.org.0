Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85D0D2E73CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726567AbgL2US1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:60052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726561AbgL2USZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:25 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 66ADB22D5B;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272935;
        bh=wduqVfojFTft3G5+gQ0wgOxLFNGFTyw2xh8MIz7zPTs=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=olXlttkNaAZDbQXlZOcTuP/FeQu7rFAik5+xpM5XkLoD0qgx81yhpisXAJq24J0cU
         0qnapMVq44j+O2VbPajJ0h9tngkutriYzeDAMUlHU31lHxDBbf5vD57DBkjHy3DRQX
         6uvKi3DTZktK9e9u8tIjUqv4vlQcgIMxCzlUIn4PHbyglWz0hqMOpDLM1BkAFi3BAl
         wZ/YvOZuS1gncLDYrL8kn+tKxaaUeKPmOUtgVw5rqDh91IXqRqEyTqKq5QQEiYbvLy
         eJszIbp6HuFaRCdnJKtjOHVZt99YLSbGpKpGmJL0Sv4h7ONszUESnVabs4V9LyHFyE
         TQEk3o89k04Gw==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 62D3E600D9;
        Tue, 29 Dec 2020 20:15:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: defconfig: Enable HID multitouch
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293540.13751.15760891692879002695.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:35 +0000
References: <20201130162834.310282-1-bjorn.andersson@linaro.org>
In-Reply-To: <20201130162834.310282-1-bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 30 Nov 2020 10:28:34 -0600 you wrote:
> The Lenovo Yoga C630 relies on HID multitouch support for proper
> touchpad operation, so enable this.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Here is the summary with links:
  - arm64: defconfig: Enable HID multitouch
    https://git.kernel.org/qcom/c/74b87103b3d0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


