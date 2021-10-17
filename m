Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC79430A43
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 Oct 2021 17:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhJQPmT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 17 Oct 2021 11:42:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:58552 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234969AbhJQPmS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 17 Oct 2021 11:42:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 97C1360FE3;
        Sun, 17 Oct 2021 15:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634485208;
        bh=N+sbXOTGN37J6HYiaE0G3UdMYsRDZT5oN//cgYhuPa0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=bN1Xe8YCKl2Et0uqZelFulnWuwPMKt4JNkwWlUQIen6yMU6HxFjxcl08OYMjeaSVT
         rcBGZ1Q80SLF6zcqvaMU16rMQlmcKj2vf0onzOy/Cl3Fch+ljleqRacrHJGj86g6Ij
         rgzxu5g9BwX5cR62iOrFI9WZm9Cox9c4UHf8eVUhl1L6HaS+MfTxqoVu1nsUpE2CC/
         KVSuuPXARTmsgGvd1y67+kICToN58lcP7G2wQbvuA+1k/XJ4uzlmN4gZlp8XRufBhv
         4q/NDehzfZn4jHZzauSlmHX6m605n7KqyYF0Yz5QNvPlqgDt10gmWLHGTLLImq2HgV
         Lq1qz4VjEpekQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 873EE60A90;
        Sun, 17 Oct 2021 15:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v12 0/5] Introduce SoC sleep stats driver
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <163448520854.5048.10323131697993656251.git-patchwork-notify@kernel.org>
Date:   Sun, 17 Oct 2021 15:40:08 +0000
References: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1634107104-22197-1-git-send-email-mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (for-next)
by Bjorn Andersson <bjorn.andersson@linaro.org>:

On Wed, 13 Oct 2021 12:08:19 +0530 you wrote:
> Changes in v12:
> - Address Stephan's comments from v11
> - Rename driver and compatible to qcom,rpm(h)-stats
> - Skip reading SMEM for RPM targets
> - Make driver register in late_init to avoid -EPROBE_DEFER from smem.
> - Change size to 0x10000 for RPM targets since area contains many others stats.
> 
> [...]

Here is the summary with links:
  - [v12,1/5] dt-bindings: Introduce QCOM Sleep stats bindings
    https://git.kernel.org/qcom/c/ac3f1ee77cbe
  - [v12,2/5] soc: qcom: Add Sleep stats driver
    https://git.kernel.org/qcom/c/1d7724690344
  - [v12,3/5] arm64: defconfig: Enable Sleep stats driver
    https://git.kernel.org/qcom/c/551ed64388fd
  - [v12,4/5] arm64: dts: qcom: Enable RPMh Sleep stats
    https://git.kernel.org/qcom/c/47cb6a068409
  - [v12,5/5] arm64: dts: qcom: Enable RPM Sleep stats
    https://git.kernel.org/qcom/c/290bc6846547

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


