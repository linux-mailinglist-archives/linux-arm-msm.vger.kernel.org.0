Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB92329262
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243010AbhCAUoi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:44:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:52940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243193AbhCAUlN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F14A64E38;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=I8QNwbOXiWsyvc1CdpBCN8N6ZFND9/dU8k8sjsHt70U=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=n370q1wJ+MwyRHjfeyP+YHqnWNxXesTXwotsqNe8jvi/64KsBE0+MzgHhlewg9R/p
         +DTqU2U2d5el7H/vpXHJM2D45ltevdGzvppj4q7hQmeaiUy9AOgRQoVXv49HPF1u7q
         simQhoZ3ibGKe30jm6IixR/FGDZuIk+mYPb+gu4rT7eRzrdrq0IpANbp7KB2aTMhUq
         rPyUH6z/Iu3CmVkLDkwHFJNVCGT+gz0mOSjhsRiZsqQ2xKibcWUIqMcv+i/mZZyigI
         Ic8bHWh7Owb64bVQgoQqc4ca94R7Wfy3kDeu9lEKm58Jg0KR+Ckh73bG52ciCB8fWm
         fqAt0NuvZzt7Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2B71F60A1B;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/4] arm64: dts: qcom: sc7180: trogdor: Add label to
 charger thermal zone
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878217.6187.2803002823684951175.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
In-Reply-To: <20210225103330.v2.1.I6a426324db3d98d6cfae8adf2598831bb30bba74@changeid>
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 25 Feb 2021 10:33:34 -0800 you wrote:
> Some revisions of trogdor boards use a thermistor for the charger
> temperature which currently isn't supported by the PM6150 ADC
> driver. This results in bogus temperature readings. Add a label
> to the charger thermal zone to facilitate disabling of the thermal
> zone on affected boards.
> 
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> [...]

Here is the summary with links:
  - [v2,1/4] arm64: dts: qcom: sc7180: trogdor: Add label to charger thermal zone
    https://git.kernel.org/qcom/c/dc7c5cde76b1
  - [v2,2/4] arm64: dts: qcom: sc7180: Disable charger thermal for lazor
    https://git.kernel.org/qcom/c/f73558cc83d1
  - [v2,3/4] arm64: dts: qcom: sc7180: trogdor: Fix trip point config of charger thermal zone
    https://git.kernel.org/qcom/c/6748450a6bcb
  - [v2,4/4] arm64: dts: qcom: sc7180: trogdor: Use ADC TM channel 0 instead of 1 for charger temperature
    https://git.kernel.org/qcom/c/7822de1a2946

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


