Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7459C3A2E95
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 16:50:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231372AbhFJOwC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 10:52:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:36068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230280AbhFJOwB (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 10:52:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5BCB3613E3;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623336605;
        bh=1n25sCgpA1q6SN+mnOeHrL1FL0xcYmVnhazkAnEC894=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZKRJGGvJ9KwS58frfUKLbpFH59ffIkZKKpAYiHKK6vEVoKO+vDdNacXOfeJUHM2Ez
         5Q2FL1tzC82zzQ9h9mzvX8NQLja9bkMK6Z4EAF5a2JqWnLIFigfmMTxxD2tbKL2xg4
         KQChM0u/MPfFjBzKo0euFh7TTBeUZ4hwWdbku1zqnzlHf6HK5IW0+MWKkMk342aF8o
         bmlPXQbA7aaKbdvzTR+MaIhvnTdrQ5Aos4C+4+xgXGChsfl0KDPC/G+wHi/6/I1Pv3
         Jqs5WlhctCSv5dbo2sy4AH1eCi/cRoipEM06yujLJqw5t74Ry/Rc/tOmUwyOEQ9AKC
         jrmU0G8yW05mw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 50BC260CE2;
        Thu, 10 Jun 2021 14:50:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8916-samsung-a2015: Add touch key
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162333660532.29297.11344402110051905304.git-patchwork-notify@kernel.org>
Date:   Thu, 10 Jun 2021 14:50:05 +0000
References: <20210604172742.10593-1-stephan@gerhold.net>
In-Reply-To: <20210604172742.10593-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Fri,  4 Jun 2021 19:27:38 +0200 you wrote:
> The Samsung Galaxy A3/A5 both have two capacitive touch keys,
> connected to an ABOV MCU. It implements the same interface as
> implemented by the tm2-touchkey driver and works just fine with
> the coreriver,tc360-touchkey compatible. It's probably actually some
> Samsung-specific interface that they implement with different MCUs.
> 
> Note that for some reason Samsung decided to connect this to GPIOs
> where no hardware I2C bus is available, so we need to fall back
> to software bit-banging using i2c-gpio.
> 
> [...]

Here is the summary with links:
  - [1/5] arm64: dts: qcom: msm8916-samsung-a2015: Add touch key
    https://git.kernel.org/qcom/c/61f363a625fc
  - [2/5] arm64: dts: qcom: msm8916-samsung-a3u: Add touch key regulators
    https://git.kernel.org/qcom/c/92b5c3975b3b
  - [3/5] arm64: dts: qcom: msm8916-samsung-a5u: Add touch key regulator
    https://git.kernel.org/qcom/c/410040777744
  - [4/5] arm64: dts: qcom: msm8916-samsung-a2015: Add rt5033 battery
    https://git.kernel.org/qcom/c/0c04d16f4123
  - [5/5] arm64: dts: qcom: msm8916-samsung-a2015: Add NFC
    https://git.kernel.org/qcom/c/5e57e5d0d622

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


