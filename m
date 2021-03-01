Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16403329299
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:49:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235394AbhCAUsh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:48:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:54484 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237550AbhCAUpk (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:45:40 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 52E7864DE5;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628783;
        bh=E0RD60eHfa4aM6EDcBFe6G7AtuUDez+v+YuZoTmWpeQ=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=mzTLFckxf+7SXZrnSqOdpElHwMOFDM/SW/KS6KoBB7tLoyMqboflJ0wKdweOTzvJq
         haVnpMolrZuUy8csIdRDpMHHmRLgkprkxw+Q0i2l9d5raPyHnllX7XnoGM7tRh+fiZ
         KgGeAGkzXfZ7BNbAcrYbPCetM+IYVSQYtPQxwYTkMbHR3ovl24LRm3maDA9RFmAF+9
         YYd88q194KFA1PR8//6W4zFirbVon1r6csMXSSQGL59gU3+wSB7rugzxXqokCeK0GH
         KNUggk2TAhJ9RYgaBtswcx5QeMFB3Fmnwns9IcFIzKfqMsQvzA114HA3Ts3MQZohsM
         cU6+EwcMoehAQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4F48F60997;
        Mon,  1 Mar 2021 19:59:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878332.6187.17621542496773888405.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:43 +0000
References: <20210115203329.846824-1-swboyd@chromium.org>
In-Reply-To: <20210115203329.846824-1-swboyd@chromium.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Fri, 15 Jan 2021 12:33:29 -0800 you wrote:
> Suspending/resuming with an HDMI dongle attached leads to crashes from
> an audio regmap.
> 
>  Unable to handle kernel paging request at virtual address ffffffc018068000
>  Mem abort info:
>    ESR = 0x96000047
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>  Data abort info:
>    ISV = 0, ISS = 0x00000047
>    CM = 0, WnR = 1
>  swapper pgtable: 4k pages, 39-bit VAs, pgdp=0000000081b12000
>  [ffffffc018068000] pgd=0000000275d14003, pud=0000000275d14003, pmd=000000026365d003, pte=0000000000000000
>  Internal error: Oops: 96000047 [#1] PREEMPT SMP
>  Call trace:
>   regmap_mmio_write32le+0x2c/0x40
>   regmap_mmio_write+0x48/0x6c
>   _regmap_bus_reg_write+0x34/0x44
>   _regmap_write+0x100/0x150
>   regcache_default_sync+0xc0/0x138
>   regcache_sync+0x188/0x26c
>   lpass_platform_pcmops_resume+0x48/0x54 [snd_soc_lpass_platform]
>   snd_soc_component_resume+0x28/0x40
>   soc_resume_deferred+0x6c/0x178
>   process_one_work+0x208/0x3c8
>   worker_thread+0x23c/0x3e8
>   kthread+0x144/0x178
>   ret_from_fork+0x10/0x18
>  Code: d503201f d50332bf f94002a8 8b344108 (b9000113)
> 
> [...]

Here is the summary with links:
  - ASoC: qcom: Fix number of HDMI RDMA channels on sc7180
    https://git.kernel.org/qcom/c/7dfe20ee92f6

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


