Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0D802E8FD4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 05:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726008AbhADEkr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 23:40:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:39332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726733AbhADEkr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 23:40:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id BBF032151B;
        Mon,  4 Jan 2021 04:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609735206;
        bh=DRIBzN2duNXJUkPNEgLDJ9RWcElDK/s5MWRmS4aFprM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=WEs+6blc9XMX7/Ef7Y0pWVkjd1LlsrmCmzMk56F9i9woAlz2URnyQ073zLEi0Q/Eb
         Wu2fP9n/8DLAPb+sdLKlF3KLz87H6xhzqlb29QDLFevMZTNeIMKOISLO3FDnvAq8dB
         ckEDJVA6+fAMOZO6z1Lek3Dkgy3f86rdAEb1JHKynKt6cUJpNk2RX9U9ksoqrztWYr
         JNZfkA7OYdFmcM5UD5K3clwYTWRfdOwg0jzv+D/T9sXjV2Hs1jnvLOJD3P2Aeg8ZIY
         6V2Er5dCw79KLXi5SzhFXE9tZ20WNxIzuaBvzfDWUxOJueHqTyEpCTpdg7VMC1zbCK
         PCLk7nEUgIAGQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id AD237603F8;
        Mon,  4 Jan 2021 04:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] arm64: dts: qcom: c630: keep both touchpad devices enabled
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160973520670.9031.11240020607790894878.git-patchwork-notify@kernel.org>
Date:   Mon, 04 Jan 2021 04:40:06 +0000
References: <20210102045940.26874-1-shawn.guo@linaro.org>
In-Reply-To: <20210102045940.26874-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sat,  2 Jan 2021 12:59:40 +0800 you wrote:
> Indicated by AML code in ACPI table, the touchpad in-use could be found
> on two possible slave addresses on &i2c3, i.e. hid@15 and hid@2c.  And
> which one is in-use can be determined by reading another address on the
> I2C bus.  Unfortunately, for DT boot, there is currently no support in
> firmware to make this check and patch DT accordingly.  This results in
> a non-functional touchpad on those C630 devices with hid@2c.
> 
> [...]

Here is the summary with links:
  - [v2] arm64: dts: qcom: c630: keep both touchpad devices enabled
    https://git.kernel.org/qcom/c/a9164910c5ce

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


