Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A44F32F735
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Mar 2021 01:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhCFAUR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Mar 2021 19:20:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:33606 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229597AbhCFAUI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Mar 2021 19:20:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8DB8A65059;
        Sat,  6 Mar 2021 00:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614990008;
        bh=qpIBQiDnJiyx6tL88d3QqB4m7031+eyAgcpAENiJEEo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=YGxfnAXZyKa18mY0DPQDLNeEvQ4sAfWDvO6jFxSkYJqzKOCqJkJqasmox/h0aQKf7
         ROt/KbbY8AMDSPVpyjN+rFCZAORks/SXCg3HzFFjzkFgz/EG/TlBeM0nRcXEtqXrYh
         j3GS7OcvRYk83Zhd4L0oIVbl5DoS3hp6ILsF0R8+s4KhUmMqPRy22fmD7JUteADvUf
         Z4OpJaJfqFRd4OS+akkqvrq10+dsRlBLCWYZqtJupgMwnrduYanp3fE732xi9dW2Qv
         OGuyl/eu6Xm1uFqH+fAEeeFL1gUGi7H/mnzytN3VNfbUE/2+i7O1tuPD91TeH0LH3S
         3jnmnl+qWOVdw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 8106160A13;
        Sat,  6 Mar 2021 00:20:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 0/3] arm64: dts: qcom: Fix PMU and timer interrupt properties
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161499000852.12377.9672228741102276894.git-patchwork-notify@kernel.org>
Date:   Sat, 06 Mar 2021 00:20:08 +0000
References: <cover.1613468366.git.saiprakash.ranjan@codeaurora.org>
In-Reply-To: <cover.1613468366.git.saiprakash.ranjan@codeaurora.org>
To:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue, 16 Feb 2021 15:17:46 +0530 you wrote:
> Fix PMU interrupt polarity for SM8250 and SM8350 SoCs and the timer
> interrupt property for SM8250 SoC.
> 
> Sai Prakash Ranjan (3):
>   arm64: dts: qcom: sm8250: Fix level triggered PMU interrupt polarity
>   arm64: dts: qcom: sm8350: Fix level triggered PMU interrupt polarity
>   arm64: dts: qcom: sm8250: Fix timer interrupt to specify EL2 physical
>     timer
> 
> [...]

Here is the summary with links:
  - [1/3] arm64: dts: qcom: sm8250: Fix level triggered PMU interrupt polarity
    https://git.kernel.org/qcom/c/7c735d4d11d3
  - [2/3] arm64: dts: qcom: sm8350: Fix level triggered PMU interrupt polarity
    https://git.kernel.org/qcom/c/5bf90503f1d6
  - [3/3] arm64: dts: qcom: sm8250: Fix timer interrupt to specify EL2 physical timer
    https://git.kernel.org/qcom/c/621d0639fbb2

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


