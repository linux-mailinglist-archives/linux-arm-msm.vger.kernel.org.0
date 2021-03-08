Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A899331AE4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Mar 2021 00:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbhCHXUp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Mar 2021 18:20:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:36774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229471AbhCHXUI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Mar 2021 18:20:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id CAA68652A8;
        Mon,  8 Mar 2021 23:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615245607;
        bh=zx0yYVv7pInj/RpbaSnmRWPsvrE+Ae1uAMNE2KLSSPc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=PRgWdx6jTHevGgIerfhvJZIsVl8EmfjhW6kXUqNVV4kLENWa74d3uAHWBfpRJN+6Z
         83vyoacfMVaoLOnVtxTbRrvJuBv7PsJeZ0QBeJVhJnYSjMlbFPTQPHSmEEGmQOREVA
         jfszHu+bYCU5AxqCk6rbGOLkgNGi/7JYTSBOiaUiII14P0Vlgu+DgDufkvGoYPvBgD
         D7FIGalKjtzmwQhFTO9r7bdPhm3vlfhTBauP38fv/Cfzb5zQ8IdzHScQqfmXJ6zI7S
         L/injTOUYL+ss8UitkHeHd5NSSZtZI2nOZ6MeH4JFL8rIdt4WKQ1fil7uzVBep/7p/
         1QahGP4gMXB7Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BCAFA609DA;
        Mon,  8 Mar 2021 23:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: sc7180: Avoid glitching SPI CS at bootup on
 trogdor
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161524560776.12181.4446448510565909019.git-patchwork-notify@kernel.org>
Date:   Mon, 08 Mar 2021 23:20:07 +0000
References: <20210218145456.1.I1da01a075dd86e005152f993b2d5d82dd9686238@changeid>
In-Reply-To: <20210218145456.1.I1da01a075dd86e005152f993b2d5d82dd9686238@changeid>
To:     Doug Anderson <dianders@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 18 Feb 2021 14:55:09 -0800 you wrote:
> At boot time the following happens:
> 1. Device core gets ready to probe our SPI driver.
> 2. Device core applies SPI controller's "default" pinctrl.
> 3. Device core calls the SPI driver's probe() function which will
>    eventually setup the chip select GPIO as "unasserted".
> 
> Thinking about the above, we can find:
> a) For SPI devices that the BIOS inits (Cr50 and EC), the BIOS would
>    have had them configured as "GENI" pins and not as "GPIO" pins.
> b) It turns out that our BIOS also happens to init these pins as
>    "output" (even though it doesn't need to since they're not muxed as
>    GPIO) but leaves them at the default state of "low".
> c) As soon as we apply the "default" chip select it'll switch the
>    function to GPIO and stop driving the chip select high (which is
>    how "GENI" was driving it) and start driving it low.
> d) As of commit 9378f46040be ("UPSTREAM: spi: spi-geni-qcom: Use the
>    new method of gpio CS control"), when the SPI core inits things it
>    inits the GPIO to be "deasserted".  Prior to that commit the GPIO
>    was left untouched until first use.
> e) When the first transaction happens we'll assert the chip select and
>    then deassert it after done.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: sc7180: Avoid glitching SPI CS at bootup on trogdor
    https://git.kernel.org/qcom/c/deb625f19bc8

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


