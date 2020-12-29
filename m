Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D3D2E7389
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Dec 2020 21:18:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgL2URf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 15:17:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:60242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726335AbgL2URd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 15:17:33 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B2AE822510;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609272931;
        bh=vc2XhQatuQrrtr9BboJcCjWjENELtqOC/lUe7YXwVYc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=V7hUxvl0dXP+QOBv+skvi+iZRDZrf00P4EobMnSZT73tHsWHHhNGpaIO5GsUAmqnc
         mNOiOYiitESa6r6i5k2z8TeL5DgpUA+lJ4Xgc9olJZyh3ofLf/IZHNrVrbb5ToBlYA
         amXf9LQZa35Fcy0KU/GYK5yYlTRI+cIcdx0q4J6CJJNkqzYXNcUkE8vZRA+TPqoCPf
         qfMXSD0MRVnNZAQ2kGu/85WXV8ZUOYnlKuqe20tD79AUhQd/x5dHhL5zKUqKA8L/FY
         nQWUFJOP1i/UYWoGgSVmRgMzVdr/89W1BT8ABusdyzYhxDLMudxuX8y8deudZ3Q/jr
         Y2gkFrfI1hIsA==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id AE20A600D9;
        Tue, 29 Dec 2020 20:15:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] venus: pm_helpers: Fix kernel module reload
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <160927293170.13751.13847382083773191602.git-patchwork-notify@kernel.org>
Date:   Tue, 29 Dec 2020 20:15:31 +0000
References: <20201101130052.20974-1-stanimir.varbanov@linaro.org>
In-Reply-To: <20201101130052.20974-1-stanimir.varbanov@linaro.org>
To:     Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This patch was applied to qcom/linux.git (refs/heads/for-next):

On Sun,  1 Nov 2020 15:00:52 +0200 you wrote:
> After initial kernel module load during kernel boot and removing
> the module and try to load it again an Unable to handle kernel
> paging request is observed:
> 
> Unable to handle kernel paging request at virtual address ffffa44f7416eae0
>  Mem abort info:
>    ESR = 0x96000047
>    EC = 0x25: DABT (current EL), IL = 32 bits
>    SET = 0, FnV = 0
>    EA = 0, S1PTW = 0
>  Data abort info:
>    ISV = 0, ISS = 0x00000047
>    CM = 0, WnR = 1
>  swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000008147c000
>  [ffffa44f7416eae0] pgd=000000017df9f003, p4d=000000017df9f003,
>  pud=000000017df9e003, pmd=000000017df9b003, pte=0000000000000000
>  Internal error: Oops: 96000047 [#1] PREEMPT SMP
>  Modules linked in: venus_core(+) snd_soc_wsa881x regmap_sdw af_alg
>   snd_soc_wcd934x soundwire_qcom gpio_wcd934x q6asm_dai q6routing
>   q6adm q6afe_dai snd_soc_hdmi_codec q6afe q6asm q6dsp_common q6cor
>   display_connector rmtfs_mem drm ip_tables x_tables ipv6
>   [last unloaded: venus_core]
>  CPU: 6 PID: 889 Comm: modprobe Tainted: G        W      5.10.0-rc1+ #8
>  Hardware name: Thundercomm Dragonboard 845c (DT)
>  pstate: 80400085 (Nzcv daIf +PAN -UAO -TCO BTYPE=--)
>  pc : queued_spin_lock_slowpath+0x1dc/0x3c8
>  lr : do_raw_spin_lock+0xc0/0x118
>  sp : ffff8000142cb7b0
>  x29: ffff8000142cb7b0 x28: 0000000000000013
>  x27: ffffa44f72de5690 x26: 0000000000000003
>  x25: ffff17c2d00f8080 x24: ffff17c2c0d78010
>  x23: ffff17c2c0d4f700 x22: ffff17c2d00f8080
>  x21: 0000000000000000 x20: ffffa44f74148000
>  x19: ffff17c2c0d4f8f8 x18: 0000000000000000
>  x17: 0000000000000000 x16: ffffa44f7342f158
>  x15: 0000000000000040 x14: ffffa44f746e8320
>  x13: 0000000000000228 x12: 0000000000000020
>  x11: 0000000000000000 x10: 00000000001c0000
>  x9 : 0000000000000000 x8 : ffff17c33d746ac0
>  x7 : ffff17c2c109b000 x6 : ffffa44f7416eac0
>  x5 : ffff17c33d746ac0 x4 : 0000000000000000
>  x3 : ffff17c2c0d4f8f8 x2 : ffffa44f7416eae0
>  x1 : ffffa44f7416eae0 x0 : ffff17c33d746ac8
>  Call trace:
>   queued_spin_lock_slowpath+0x1dc/0x3c8
>   do_raw_spin_lock+0xc0/0x118
>   _raw_spin_lock_irqsave+0x80/0x14c
>   __pm_runtime_resume+0x38/0xb8
>   device_link_add+0x3b8/0x5d0
>   core_get_v4+0x268/0x2d8 [venus_core]
>   venus_probe+0x108/0x458 [venus_core]
>   platform_drv_probe+0x54/0xa8
>   really_probe+0xe4/0x3b0
>   driver_probe_device+0x58/0xb8
>   device_driver_attach+0x74/0x80
>   __driver_attach+0x58/0xe8
>   bus_for_each_dev+0x70/0xc0
>   driver_attach+0x24/0x30
>   bus_add_driver+0x150/0x1f8
>   driver_register+0x64/0x120
>   __platform_driver_register+0x48/0x58
>   qcom_venus_driver_init+0x20/0x1000 [venus_core]
>   do_one_initcall+0x84/0x458
>   do_init_module+0x58/0x208
>   load_module+0x1ec0/0x26a8
>   __do_sys_finit_module+0xb8/0xf8
>   __arm64_sys_finit_module+0x20/0x30
>   el0_svc_common.constprop.0+0x7c/0x1c0
>   do_el0_svc+0x24/0x90
>   el0_sync_handler+0x180/0x188
>   el0_sync+0x174/0x180
>  Code: 91002100 8b0200c2 f861d884 aa0203e1 (f8246828)
> 
> [...]

Here is the summary with links:
  - venus: pm_helpers: Fix kernel module reload
    https://git.kernel.org/qcom/c/9215f6bb4705

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


