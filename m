Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 128B22E73C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726530AbgL2USY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:18:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60230 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726539AbgL2UST (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:18:19 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B10A522D04;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272934;
        bh=sdI4A7se6riqkC7YPO6SpkfD02XSIRiHwAgCcrX6GwY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RCHJYoLwQ2QsXhjgIL3t78Jv3JL3WbOSR0xrDCNFVEjeWRaOqpV9yLlrDixgNYCHc
         SE3azVpwSeArQOpQm8a27+2Y3v9NNACr9gvluFF3ClotkK4SfRD/j5GJp5A2xSzYeQ
         nMYrkEt9huHDxDfLZuXq70YF9BuOZB0gWxEcplfl9J+Ri4tC7COXcsEoEly/MF5sVS
         92kftAf+N2P5/AYnBW6vWurVNVFWs21WVXSC3pw7LuOoj9DgluxJ56aKVyEXWw6Mbx
         EFgLlBPyLxzyN3Wu1t2H+9fP4V9ELXlc6m2teAbFRkO40DvvJSQ7vI3biiEfJgPfsJ
         QF4lk0xvzVb1Q==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id A993F600D9;
        Tue, 29 Dec 2020 20:15:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] drm/msm: Add missing struct identifier
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293469.13751.3484755651530912400.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:34 +0000
References: <1601005308-49706-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1601005308-49706-1-git-send-email-tiantao6@hisilicon.com>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 25 Sep 2020 11:41:48 +0800 you wrote:
> fix warnings reported by make W=1
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:195: warning: cannot
> understand function prototype: 'const struct dpu_intr_reg
> dpu_intr_set[] = '
> drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:252: warning: cannot
> understand function prototype: 'const struct dpu_irq_type
> dpu_irq_map[] = '
> 
> [...]

Here is the summary with links:
  - drm/msm: Add missing struct identifier
    https://git.kernel.org/qcom/c/c7314613226a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


