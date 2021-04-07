Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 250E0357335
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Apr 2021 19:30:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354861AbhDGRaU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Apr 2021 13:30:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:50098 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343919AbhDGRaS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Apr 2021 13:30:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 0F24561260;
        Wed,  7 Apr 2021 17:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617816609;
        bh=c1LstSHV4d7QLuMLaZzYlhyRd3/+ySfzDWvukJVXzPM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=paYjw5nBMxRr1R4benRhhis3GBdZK1Wshj8ki1xAO9ibWHLvb20yAGC1WpvTsOdDo
         9+OEvEz0gaFUN4YV9mui7nXy25GdRQVXFjDbCe/gAmzJfwoZ60orLxfEtyEHmmM9GM
         MlPpYaXQjS+ZJDqtU2d+TF9IllaPZUZob5i9t+dAmhcS9oJ51u2MM7SL/1HQthX8k7
         myi/UmedsAe21hHWl9N1s9SNsV2UqDm7jw525rV70+H9WCPGFsq0tfKElbvcl4r+Db
         n/1xOorDRAFLF+dASnJYTS07UoPgUu0Yf+sPG4izTmjKu7tSl0hwopm1cyiCnC/a4y
         KzjO4nSPzFZtw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F2ECB60A54;
        Wed,  7 Apr 2021 17:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: qcom: msm8916: Add GICv2 hypervisor
 registers/interrupt
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161781660899.13082.16852390000649965172.git-patchwork-notify@kernel.org>
Date:   Wed, 07 Apr 2021 17:30:08 +0000
References: <20210407163648.4708-1-stephan@gerhold.net>
In-Reply-To: <20210407163648.4708-1-stephan@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Wed,  7 Apr 2021 18:36:48 +0200 you wrote:
> The ARM Cortex-A53 CPU cores and QGIC2 interrupt controller
> (an implementation of the ARM GIC 2.0 specification) used in MSM8916
> support virtualization, e.g. for KVM on Linux. However, so far it was
> not possible to make use of this functionality, because Qualcomm's
> proprietary "hyp" firmware blocks the EL2 mode of the CPU and only
> allows booting Linux in EL1.
> 
> [...]

Here is the summary with links:
  - arm64: dts: qcom: msm8916: Add GICv2 hypervisor registers/interrupt
    https://git.kernel.org/qcom/c/4579058fecb6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


