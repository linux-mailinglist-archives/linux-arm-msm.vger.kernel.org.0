Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D9B5329260
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Mar 2021 21:46:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240909AbhCAUoQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 15:44:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:53304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243403AbhCAUl0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 15:41:26 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 61D0064E46;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614628782;
        bh=S6GyFOhdAgiu6QQHBXbTLXfBCOfy5CEaiUUnxsnEGQ0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=o8aRyVYP+8o5S3fZTPTgQaXPhttPaW7TVRkZ2CndBMbL7YstuZtR4TLHckLL52ivL
         wyLpZsbY4cyI6uH8DnecYtluZpQK4zSxaUciwr3LWkleq8Oo1AoAYBM/5fRSDSq9NN
         V4kNqKQCeep3EjuJCD7ZliDrmf9y8WTVqFPXD7RoDiNCqwS7d+Iwszg34xpigkBhPH
         Mfp6N+yjj9jKnjfBSQstNLCk2LIZrqMFc+eXzX/J3uiDd7v9dG9bVXn14ESW7KLpOd
         b+p3SUO7o9iTquMEq47+SeF3y9BwOzMYWjhVQeDVmdubXGQf52V2ZV7Q9ye1n0mLJY
         ArvqBBWDtj8Mw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5CC3060C25;
        Mon,  1 Mar 2021 19:59:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/2] drm/msm: Fix null dereference in _msm_gem_new
From:   patchwork-bot+linux-arm-msm@kernel.org
Message-Id: <161462878237.6187.8934799587305115324.git-patchwork-notify@kernel.org>
Date:   Mon, 01 Mar 2021 19:59:42 +0000
References: <20201228213131.2316293-1-iskren.chernev@gmail.com>
In-Reply-To: <20201228213131.2316293-1-iskren.chernev@gmail.com>
To:     Iskren Chernev <iskren.chernev@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello:

This series was applied to qcom/linux.git (refs/heads/for-next):

On Mon, 28 Dec 2020 23:31:30 +0200 you wrote:
> The crash was caused by locking an uninitialized lock during init of
> drm_gem_object. The lock changed in the breaking commit, but the init
> was not moved accordingly.
> 
>  8<--- cut here ---
>  Unable to handle kernel NULL pointer dereference at virtual address 00000000
>  pgd = (ptrval)
>  [00000000] *pgd=00000000
>  Internal error: Oops: 5 [#1] PREEMPT SMP ARM
>  Modules linked in: msm(+) qcom_spmi_vadc qcom_vadc_common dm_mod usb_f_rndis rmi_i2c rmi_core qnoc_msm8974 icc_smd_rpm pm8941_pwrkey
>  CPU: 2 PID: 1020 Comm: udevd Not tainted 5.10.0-postmarketos-qcom-msm8974 #8
>  Hardware name: Generic DT based system
>  PC is at ww_mutex_lock+0x20/0xb0
>  LR is at _msm_gem_new+0x13c/0x298 [msm]
>  pc : [<c0be31e8>]    lr : [<bf0b3404>]    psr: 20000013
>  sp : c36e7ad0  ip : c3b3d800  fp : 00000000
>  r10: 00000001  r9 : c3b22800  r8 : 00000000
>  r7 : c3b23000  r6 : c3b3d600  r5 : c3b3d600  r4 : 00000000
>  r3 : c34b4780  r2 : c3b3d6f4  r1 : 00000000  r0 : 00000000
>  Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>  Control: 10c5787d  Table: 03ae406a  DAC: 00000051
>  Process udevd (pid: 1020, stack limit = 0x(ptrval))
>  Stack: (0xc36e7ad0 to 0xc36e8000)
>  [...]
>  [<c0be31e8>] (ww_mutex_lock) from [<bf0b3404>] (_msm_gem_new+0x13c/0x298 [msm])
>  [<bf0b3404>] (_msm_gem_new [msm]) from [<bf0b3aa8>] (_msm_gem_kernel_new+0x20/0x190 [msm])
>  [<bf0b3aa8>] (_msm_gem_kernel_new [msm]) from [<bf0b4a30>] (msm_gem_kernel_new+0x24/0x2c [msm])
>  [<bf0b4a30>] (msm_gem_kernel_new [msm]) from [<bf0b8e2c>] (msm_gpu_init+0x308/0x548 [msm])
>  [<bf0b8e2c>] (msm_gpu_init [msm]) from [<bf060a90>] (adreno_gpu_init+0x13c/0x240 [msm])
>  [<bf060a90>] (adreno_gpu_init [msm]) from [<bf062b1c>] (a3xx_gpu_init+0x78/0x1dc [msm])
>  [<bf062b1c>] (a3xx_gpu_init [msm]) from [<bf05f394>] (adreno_bind+0x1cc/0x274 [msm])
>  [<bf05f394>] (adreno_bind [msm]) from [<c087a254>] (component_bind_all+0x11c/0x278)
>  [<c087a254>] (component_bind_all) from [<bf0b11d4>] (msm_drm_bind+0x18c/0x5b4 [msm])
>  [<bf0b11d4>] (msm_drm_bind [msm]) from [<c0879ea0>] (try_to_bring_up_master+0x200/0x2c8)
>  [<c0879ea0>] (try_to_bring_up_master) from [<c087a648>] (component_master_add_with_match+0xc8/0xfc)
>  [<c087a648>] (component_master_add_with_match) from [<bf0b0c3c>] (msm_pdev_probe+0x288/0x2c4 [msm])
>  [<bf0b0c3c>] (msm_pdev_probe [msm]) from [<c08844cc>] (platform_drv_probe+0x48/0x98)
>  [<c08844cc>] (platform_drv_probe) from [<c0881cc4>] (really_probe+0x108/0x528)
>  [<c0881cc4>] (really_probe) from [<c0882480>] (driver_probe_device+0x78/0x1d4)
>  [<c0882480>] (driver_probe_device) from [<c08828dc>] (device_driver_attach+0xa8/0xb0)
>  [<c08828dc>] (device_driver_attach) from [<c0882998>] (__driver_attach+0xb4/0x154)
>  [<c0882998>] (__driver_attach) from [<c087fa1c>] (bus_for_each_dev+0x78/0xb8)
>  [<c087fa1c>] (bus_for_each_dev) from [<c0880e98>] (bus_add_driver+0x10c/0x208)
>  [<c0880e98>] (bus_add_driver) from [<c0883504>] (driver_register+0x88/0x118)
>  [<c0883504>] (driver_register) from [<c0302098>] (do_one_initcall+0x50/0x2b0)
>  [<c0302098>] (do_one_initcall) from [<c03bace4>] (do_init_module+0x60/0x288)
>  [<c03bace4>] (do_init_module) from [<c03bdf1c>] (sys_finit_module+0xd4/0x120)
>  [<c03bdf1c>] (sys_finit_module) from [<c0300060>] (ret_fast_syscall+0x0/0x54)
>  Exception stack(0xc36e7fa8 to 0xc36e7ff0)
>  7fa0:                   00020000 00000000 00000007 b6edd5b0 00000000 b6f2ff20
>  7fc0: 00020000 00000000 0000017b 0000017b b6eef980 bedc3a54 00473c99 00000000
>  7fe0: b6edd5b0 bedc3918 b6ed8a5f b6f6a8b0
>  Code: e3c3303f e593300c e1a04000 f590f000 (e1940f9f)
> 
> [...]

Here is the summary with links:
  - [1/2] drm/msm: Fix null dereference in _msm_gem_new
    https://git.kernel.org/qcom/c/a694ffed8765
  - [2/2] drm/msm: Ensure get_pages is called when locked
    https://git.kernel.org/qcom/c/07fcad0d726d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


