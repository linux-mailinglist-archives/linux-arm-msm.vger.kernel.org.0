Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A33B39203B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 May 2021 21:04:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232832AbhEZTFf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 26 May 2021 15:05:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:41100 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233899AbhEZTFL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 26 May 2021 15:05:11 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AABC86147F;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622055806;
        bh=KsaVN+AujVIMDuSjLuDAlzCIAXUuB+x8UoJORVWUra0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=VCWgKQpK3dV/JEn7OBItsrPpsl47OFLuyz+9kNq2vEFkx/FjIzt0Hx5ieTO6L4S52
         zX00u3o7VvqanhlggNr2D4CwndyWqTZPPLIFZrn8Ttv5G6LdpHWMoVjB0uun0YiAbr
         sIf1iSJby8715oLj7bjfsRTcEeMwOVwHc8vBLQ1QkxlIC1KAaZ/X9pJ5dHTv+5EmU+
         NdNXHJO9Dsov0jaLos3OcmDHZ0lxUw489rkhUQhjVSQvwZjO94Kch+W3O5NFjbv8ce
         db/P+tWhz+eFmh4MvuR5djNubjWfsqTbgScGpcAPHRAq3YHLXLMqDPKGSBHNfPRuFO
         TOveh0yckC0Fw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id A60C6609B2;
        Wed, 26 May 2021 19:03:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v1 0/3] Add irq support to accommodate SC7280 target 
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <162205580667.26840.9827982252730688545.git-patchwork-notify@kernel.org>
Date:   Wed, 26 May 2021 19:03:26 +0000
References: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
In-Reply-To: <1617688895-26275-1-git-send-email-mkrishn@codeaurora.org>
To:     Krishna Manikandan <mkrishn@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Tue,  6 Apr 2021 11:31:32 +0530 you wrote:
> The changes in this series adds all the irq related changes which are needed to
> support EDP interface coming on sc7280 target.
> 
> Changes in this series:
>         - Currently each interrupt register has a range of 32 indexes only.
>           But with the introduction of VSYNC and UNDERRUN irq for INTF_5,
>           the number of irqs under INTR_STATUS will exceed this value.
>           Increase the range of each interrupt register to 64 indexes
>           to handle this.
> 
> [...]

Here is the summary with links:
  - [v1,1/3] drm/msm/disp/dpu1: increase the range of interrupts in dpu_irq_map
    https://git.kernel.org/qcom/c/a8eca8a1a524
  - [v1,2/3] drm/msm/disp/dpu1: add vsync and underrun irqs for INTF_5
    https://git.kernel.org/qcom/c/7e4526db30c2
  - [v1,3/3] drm/msm/disp/dpu1: add flags to indicate obsolete irqs
    https://git.kernel.org/qcom/c/dc8a4973fd69

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


