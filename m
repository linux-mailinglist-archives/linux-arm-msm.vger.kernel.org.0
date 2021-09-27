Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4078E41A37B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 01:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237903AbhI0XBq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Sep 2021 19:01:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:41442 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237780AbhI0XBq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Sep 2021 19:01:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C781860EFF;
        Mon, 27 Sep 2021 23:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632783607;
        bh=3tidb5OlIxBs02wMr1rJQSwemtOrJ60cw+D2rmkkh4c=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=Tt08dNpNW8B6PEsut2k6m0RG4RLEQNHdfFGivrF2p/1t7M6ox8y4qc1hHxuZekyja
         r8jEFVx9joHNiju37ZOKYzc4q/wCgd4crWOUD8NscnInJG6qo80uJLXTI++pqdBOB0
         9lSP2eeRV/kiRx9w+Q2u6qiblZXN/x80tQLE2otXa8/SV6rpLS7aVp27G5/DAE2BOp
         udTfZWrfJcUXWCzp64CLGrXDqznV1/uv7HoiMfqon0EEV0FJKGr8qlCwfk0EVbPe70
         GZLRJ++RI0+XhDqYtq9KPMYsIYV4DbKAxauUjjGrUFv+TLI221f1lMXri8CpsYXOh0
         fEUzz+zcvMCcw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BEF6960A53;
        Mon, 27 Sep 2021 23:00:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: msm8916-longcheer-l8150: Add missing sensor
 interrupts
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163278360777.4723.16462055347638300134.git-patchwork-notify@kernel.org>
Date:   Mon, 27 Sep 2021 23:00:07 +0000
References: <20210816123544.14027-1-stephan@gerhold.net>
In-Reply-To: <20210816123544.14027-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 16 Aug 2021 14:35:44 +0200 you wrote:
> So far there were no interrupts set up for the BMC150 accelerometer
> + magnetometer combo because they were broken for some reason.
> It turns out Longcheer L8150 actually has a BMC156 which is very similar
> to BMC150, but only has an INT2 pin for the accelerometer part.
> 
> This requires some minor changes in the bmc150-accel driver which is now
> supported by using the more correct bosch,bmc156_accel compatible.
> Unfortunately it looks like even INT2 is not functional on most boards
> because the interrupt line is not actually connected to the BMC156.
> However, there are two pads next to the chip that can be shorted
> to make it work if needed.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: msm8916-longcheer-l8150: Add missing sensor interrupts
    https://git.kernel.org/qcom/c/51c7786f5d42

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


