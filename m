Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B17DF32927D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238859AbhCAUqX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:46:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:53296 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238665AbhCAUnX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:43:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id C04EB64E74;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=i2zF6gd2JFQfLTR0Hae9C3/ID92msU3nhbnWpLIVXnY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=KPHMKyy0BqkpZ9G7zBvEpPQImbIn0kQb0kCBJ3G1UBAtpgxi936RyypmoPwgDkIGo
         rK8O9p+b6OOIDRb3qD8DV4KYwLIy8BjVnIXR1PfdXZnEwmLkz/yBJ0W368J1rD2IxM
         dCAGpNb6IxombcdUF8FwCCk2Jm+JyizK19dU06ugg94Gu1PbpQ7oMErMmORuKvo2n6
         HQ2XJEZUeFOY3VIiXS+t8rQ42Bp8iHypRF4gTKY8wOmwTPLEXz+tTTxEb5AIeLicEf
         7YHZWRNcF0e3sDYbo88QywSfqX+0cCnHRH5kKdVrlm9t4IQt2vmgZ8FEjhNtknmQpB
         N8jVJPGS0m8WA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id BCA6460C27;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] cpufreq: qcom-hw: enable boost support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878276.6187.3475113742956110878.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20210113065241.23829-1-shawn.guo@linaro.org>
In-Reply-To: <20210113065241.23829-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed, 13 Jan 2021 14:52:41 +0800 you wrote:
> At least on sdm850, the 2956800 khz is detected as a boost frequency in
> function qcom_cpufreq_hw_read_lut().  Let's enable boost support by
> calling cpufreq_enable_boost_support(), so that we can get the boost
> frequency by switching it on via 'boost' sysfs entry like below.
> 
>  $ echo 1 > /sys/devices/system/cpu/cpufreq/boost
> 
> [...]

Here is the summary with links:
  - cpufreq: qcom-hw: enable boost support
    https://git.kernel.org/qcom/c/266991721c15

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


