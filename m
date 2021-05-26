Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5A9391FF3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:03:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235784AbhEZTFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:41030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235360AbhEZTE4 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:04:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1B226613F6;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055804;
        bh=wf/vobdqwlV4X7+s/l9J6o6pXnat3rZDyRAjcaxP6Ng=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=iPLDb70guyrOlMULrvS6T0be4ZP0UKicKK5i5o5fjbcRHvcwEQbR2xlHiCMViTNxC
         8lFA/Pg91sGzk+Uo85i3V9d1aB4UUC99Lj6hBwIRFMK4ndP2qXz8gUZa8lqhfV33i2
         l9oLidR9cLOSejczfI6ULM3rHs/WTi3T2Sqo5LJ99d+cMsiZZuMEPrFA3OtGhM2ViF
         lP+wiroPw9smiicuKmXY0cbzvI89S02n/pq+NwpED38xHJR1U0vPvyJy1i9rKTieH4
         rTAqBbh1Gz/DPxeKASOOFkYGzAL9NmpfEqHeznTyzPgmDhXBMKmPW3qU0g9IoOiCfu
         dYKEnlLs5BTVg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1729A60CE1;
        Wed, 26 May 2021 19:03:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5] pinctrl: qcom: sc8180x: add ACPI probe support
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580409.26840.9179911143934847531.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:24 +0000
References: <20210311024102.15450-1-shawn.guo@linaro.org>
In-Reply-To: <20210311024102.15450-1-shawn.guo@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu, 11 Mar 2021 10:41:02 +0800 you wrote:
> It adds ACPI probe support for pinctrl-sc8180x driver.  We have one
> problem with ACPI table, i.e. GIO0 (TLMM) block has one single memory
> resource to cover 3 tiles defined by SC8180X.  To follow the hardware
> layout of 3 tiles which is already supported DT probe, it adds one
> function to replace the original single memory resource with 3 named
> ones for tiles.  With that, We can map memory for ACPI in the same way
> as DT.
> 
> [...]

Here is the summary with links:
  - [v5] pinctrl: qcom: sc8180x: add ACPI probe support
    https://git.kernel.org/qcom/c/6d8d67988b1a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


