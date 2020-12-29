Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A4772E7360
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726277AbgL2UQv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:60040 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726247AbgL2UQv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:16:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A4ADB2222A;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272930;
        bh=kZhQ6AMzhtKDxEW2vbkewN8zWmyLkwjc9YQdWAscPbk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IciJHm0TL3vB6z+ak9TO6q1ziDlbbCdH2/9VZqyX61BDVH6Zss/mCypGCdh8Rfdri
         oQZJXEwOozCzOVXwJQuAtkY4MNMM9ESKspqffe+S+4reqdk/364W9mzVZhL4O+PJNz
         Q2jeh6PSFmtdz4Tcj0Rf7OktKLPnvWSAqsyK0sJa1PDvTyawslT+zd9y/vg+ZvNUHg
         Jh2NIaSPiLN7uHEoZbgIvyz706oGbs0AZMAEGpC7Vfn/gzDShMIYYXrFA4rWHuyrBl
         y+yLnZFZ5ST/01MB5tucB34Cx05Yxn6DVioSj2W8YCZV+1h16w6mA3XW/3gegKioxl
         h3K5X7fSwEKWQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 9EEB760591;
        Tue, 29 Dec 2020 20:15:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] pinctrl: qcom: Move clearing pending IRQ to
 .irq_request_resources callback
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293064.13751.12959767285380769665.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:30 +0000
References: <1604561884-10166-1-git-send-email-mkshah@codeaurora.org>
In-Reply-To: <1604561884-10166-1-git-send-email-mkshah@codeaurora.org>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Thu,  5 Nov 2020 13:08:04 +0530 you wrote:
> When GPIOs that are routed to PDC are used as output they can still latch
> the IRQ pending at GIC. As a result the spurious IRQ was handled when the
> client driver change the direction to input to starts using it as IRQ.
> 
> Currently such erroneous latched IRQ are cleared with .irq_enable callback
> however if the driver continue to use GPIO as interrupt and invokes
> disable_irq() followed by enable_irq() then everytime during enable_irq()
> previously latched interrupt gets cleared.
> 
> [...]

Here is the summary with links:
  - pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback
    https://git.kernel.org/qcom/c/71266d9d3936

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


