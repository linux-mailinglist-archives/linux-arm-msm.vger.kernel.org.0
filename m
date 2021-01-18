Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58D6B2FA8B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 19:26:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405527AbhARPGr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 10:06:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390777AbhARLl7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 06:41:59 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A08A3C061574
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 03:41:18 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id c6so10077686ede.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jan 2021 03:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d3ptOak+AELUZB9s6w6tuF0IncOrQPH0R3O9p4CLZp8=;
        b=l7wrJh+27RmK7NbYpcRk3BYStSoXEw89bgm4bUPJxP2VOoeIkFvh/CwgtOJZ9419zo
         8rHPMyxEy5Y+4WzXYN4zBSrQT8lBDTVHPVA4GWgk8FSBrDZwju5Sd4JNGuYEBlenYjmH
         52qcGdfI6p6wZvWrsT5r6c/UlkPFA64AkPPl2YGix2ArI8VfeVQOs/ln/MrV1UZNFofY
         BLer8IegQc/68FO1Soawez7DNXcCCxJfjIRm6yi3aqBLWUoDXPrx4uAA52D+l48Facri
         ce8EmytVHYtSyD5d3p5cCiuB/lUBZZK62G0LzR+mlosBvM9kEp9g9y2mbQ9cNIgLi1m8
         SEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d3ptOak+AELUZB9s6w6tuF0IncOrQPH0R3O9p4CLZp8=;
        b=pCUf0ac2OqBERPaLzONc/Pl85mfo89q5DIMcupCpmneBwF7B+iQ4QLSwreblf5hZtV
         d5L2UM9/i8XpMQRXvIWWjyZMc68nGeEZ/bztZbKuEcfBAj+z4bb93GTOOtEWDShY1PYW
         q77mG5EaDDKkdbt5nhg3UUCZzA2K1UbcY13P0aLEwCZ5ub2BogRCO/1dbC+m44n35b5S
         cZPwsLHHuE+hva2YGfIt3RcXmXJnOoMJ+rJnE8WiWn/8b8YukFanVjYZQDXTTOUXbZa0
         p0lvc2aTP+IZOBDRY+1sd4Qvgy3TU0Z7xPpMuXt8ERCsHOIdev3NPIalhXpB4vWleZJP
         +haA==
X-Gm-Message-State: AOAM531riUBh1s8KX++zsCX6CqLTe41atCdDKWnV7wnB97mmEXrctRDZ
        HWiFE5TsTjHDgz3IM3ec03IW8zaZNVNGxzHQqz16Jw==
X-Google-Smtp-Source: ABdhPJxirIE2MUS3/dv66F9WhAVPCqtApL4yNkVTY1/ANtCBjeTUHL/d3MRzpJBKindD8Tgj7PhQyaPL1/73t+PiqIE=
X-Received: by 2002:a05:6402:26c9:: with SMTP id x9mr5878233edd.365.1610970077216;
 Mon, 18 Jan 2021 03:41:17 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d@eucas1p2.samsung.com>
 <1610068562-4410-1-git-send-email-collinsd@codeaurora.org> <e512ee85-7fa6-e5fe-eb30-f088bb83cf23@samsung.com>
In-Reply-To: <e512ee85-7fa6-e5fe-eb30-f088bb83cf23@samsung.com>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 18 Jan 2021 17:11:05 +0530
Message-ID: <CA+G9fYunK_2h3-pHtZT_+56Xf8b=M-8Q9GnTsCJ3KxVaJULorA@mail.gmail.com>
Subject: Re: [PATCH] regulator: core: avoid regulator_resolve_supply() race condition
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     David Collins <collinsd@codeaurora.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, 13 Jan 2021 at 03:21, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi,
>

<trim>

>
> This patch landed in linux next-20210112 as commit eaa7995c529b
> ("regulator: core: avoid regulator_resolve_supply() race condition"). I
> found that it triggers a following lockdep warning during the DWC3
> driver registration on some Exynos based boards (this log is from
> Samsung Exynos5420-based Peach-Pit board):
>
> ======================================================
> WARNING: possible circular locking dependency detected
> 5.11.0-rc1-00008-geaa7995c529b #10095 Not tainted
> ------------------------------------------------------
> swapper/0/1 is trying to acquire lock:
> c12e1b80 (regulator_list_mutex){+.+.}-{3:3}, at:
> regulator_lock_dependent+0x4c/0x2b0
>
> but task is already holding lock:
> df7190c0 (regulator_ww_class_mutex){+.+.}-{3:3}, at:
> regulator_resolve_supply+0x44/0x318

LKFT testing also found this lockdep warning on
arm64 - hi6220-hikey while booting.

[    0.635532] WARNING: possible recursive locking detected
[    0.635558] 5.11.0-rc3-next-20210118 #1 Not tainted
[    0.635585] --------------------------------------------
[    0.635611] swapper/0/1 is trying to acquire lock:
[    0.635636] ffff000000a13158
(regulator_ww_class_mutex){+.+.}-{3:3}, at:
regulator_lock_recursive+0x9c/0x1e8
[    0.635721]
[    0.635721] but task is already holding lock:
[    0.635749] ffff000000a13958
(regulator_ww_class_mutex){+.+.}-{3:3}, at:
regulator_resolve_supply+0x70/0x2f0
[    0.635817]
[    0.635817] other info that might help us debug this:
[    0.635847]  Possible unsafe locking scenario:
[    0.635847]
[    0.635875]        CPU0
[    0.635892]        ----
[    0.635909]   lock(regulator_ww_class_mutex);
[    0.635942]   lock(regulator_ww_class_mutex);
[    0.635974]
[    0.635974]  *** DEADLOCK ***
[    0.635974]
[    0.636002]  May be due to missing lock nesting notation
[    0.636002]
[    0.636033] 4 locks held by swapper/0/1:
[    0.636057]  #0: ffff000000a02988 (&dev->mutex){....}-{3:3}, at:
__device_driver_lock+0x38/0x70
[    0.636131]  #1: ffff000000a13958
(regulator_ww_class_mutex){+.+.}-{3:3}, at:
regulator_resolve_supply+0x70/0x2f0
[    0.636205]  #2: ffff800012b102c0
(regulator_list_mutex){+.+.}-{3:3}, at:
regulator_lock_dependent+0x5c/0x290
[    0.636280]  #3: ffff8000137e3918
(regulator_ww_class_acquire){+.+.}-{0:0}, at:
regulator_enable+0x40/0xe0
[    0.636352]
[    0.636352] stack backtrace:
[    0.636378] CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.11.0-rc3-next-20210118 #1
[    0.636415] Hardware name: HiKey Development Board (DT)
[    0.636443] Call trace:
[    0.636460]  dump_backtrace+0x0/0x1f0
[    0.636490]  show_stack+0x2c/0x80
[    0.636516]  dump_stack+0xf8/0x160
[    0.636543]  __lock_acquire+0xa3c/0x1718
[    0.636571]  lock_acquire+0x3d8/0x4f0
[    0.636596]  __ww_mutex_lock.constprop.14+0xbc/0xf68
[    0.636628]  ww_mutex_lock+0x6c/0x3e8
[    0.636653]  regulator_lock_recursive+0x9c/0x1e8
[    0.636683]  regulator_lock_dependent+0x198/0x290
[    0.636713]  regulator_enable+0x40/0xe0
[    0.636739]  regulator_resolve_supply+0x1e8/0x2f0
[    0.636767]  regulator_register_resolve_supply+0x24/0x80
[    0.636797]  class_for_each_device+0x78/0xf8
[    0.636825]  regulator_register+0x840/0xbb0
[    0.636851]  devm_regulator_register+0x50/0xa8
[    0.636879]  reg_fixed_voltage_probe+0x224/0x410
[    0.636908]  platform_probe+0x6c/0xd8
[    0.636932]  really_probe+0x2b8/0x520
[    0.636960]  driver_probe_device+0xf4/0x168
[    0.636988]  device_driver_attach+0x74/0x98
[    0.637014]  __driver_attach+0xc4/0x178
[    0.637039]  bus_for_each_dev+0x84/0xd8
[    0.637066]  driver_attach+0x30/0x40
[    0.637092]  bus_add_driver+0x170/0x258
[    0.637119]  driver_register+0x64/0x118
[    0.637144]  __platform_driver_register+0x34/0x40
[    0.637172]  regulator_fixed_voltage_init+0x20/0x28
[    0.637205]  do_one_initcall+0x94/0x4a0
[    0.637231]  kernel_init_freeable+0x2f0/0x344
[    0.637261]  kernel_init+0x18/0x120

Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Full boot log here:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20210118/testrun/3771538/suite/linux-log-parser/test/check-kernel-warning-2159912/log

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git describe: next-20210112
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/hikey/lkft/linux-next/935/config


-- 
Linaro LKFT
https://lkft.linaro.org
