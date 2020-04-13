Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD3B01A6C41
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 20:57:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733131AbgDMS50 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 14:57:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1733123AbgDMS5Z (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 14:57:25 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BB3C008749
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 11:57:25 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id m19so7343144lfq.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 11:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=nnFhaYdn8r144w8Y8HQM6rwFTDCQ2TRjM0zl6Xk6Hbs=;
        b=yuZ5KYO8vk9sY0oppJp4fk/tUdUNLVbdp3hmeGyTprfOlJbFWhbbynnrM66UJJ56V2
         Lc1PZ2+dFgQoAxrRphjf//X9FZmzv4LM8Qq0gkeouKl/S6KN3uZJNUvQfHfRunEJxNYj
         v5sUTFrv8iOAHopDd+BHqDZfphZw0VeOjEIOJ1oi3RbdPdinTPvbsTowuWioIPtKUXsl
         yD+8BlrQozryzTNEvyeWojrRr6bikU+Uk+qi86EclWtq0n5/ITyPNH2cmUaUGA8ALmX6
         VCto1hUfqsfWu3OeJkD4ONBv+xKHCKoTyixraQrAx2RiBRvJuqfhYVEnLorg67EJuctM
         nbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=nnFhaYdn8r144w8Y8HQM6rwFTDCQ2TRjM0zl6Xk6Hbs=;
        b=mLOfCjE+ZAk1nnElR0C+eEcb1LtajHlxpZAa2NvwiapOtB6uNrdBbVS2m8VNJ1EGeG
         tEY+pa8nqAimw0rVZz75VuF71H/JJ9Sl9dX3u1TR1aFrwXTaqAidAdyBSbd1MK2XXyeF
         XpCGCoeA8iv82FdonbVtmm4aBrWrlCyeMlYc78vfCTGDdTIAMdz6IPr/UtY88p4MblOz
         RPSybhW2e9e3/CxIAE8JO1Op7j3cdhiUnsefTQNdCOiFpMTo/A/zFIy8mm1dAplr0o0v
         ws7m3OZ9FZZ9fJOrNZ1xkcqj1oAS5aO4dSw9HCzTF1DTKPY1FuPanLqOHf5e71a2zrXI
         /roQ==
X-Gm-Message-State: AGi0Puax7M81I9cRWMEialkA/HhokBOVjmbNb6hGBZDv3XuE+xjaHEkG
        vWLQZXgpYZ0FbGSwm1LyAil87lkmmSiSsjc91h4PvYCQLNE=
X-Google-Smtp-Source: APiQypIMkmyGlF3uCVpf3EjDwPW+WmpqbHG8XbB06TkJ1rIxipqbhKw8fK48Vz7k9u3QMh/yUAngrRulqJXAEhL6d+4=
X-Received: by 2002:a05:6512:d1:: with SMTP id c17mr11465758lfp.167.1586804242634;
 Mon, 13 Apr 2020 11:57:22 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 14 Apr 2020 00:27:10 +0530
Message-ID: <CA+G9fYsDgghO+4zMY-AF2RgUmAfjZyA+tjeg5m5F1rEgEtw5fg@mail.gmail.com>
Subject: BUG: spinlock bad magic - lock: msm_uart_ports
To:     linux-arm-msm@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        linux-serial@vger.kernel.org
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        agross@kernel.org,
        =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>,
        Anders Roxell <anders.roxell@linaro.org>,
        lkft-triage@lists.linaro.org,
        Nicolas Dechesne <nicolas.dechesne@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The kernel BUG reported on arm64 Dragonboard 410c (APQ 8016 SBC)
while booting Linux mainline kernel 5.6.0

The kernel configs (with extra fragments) and full boot log links
provided below.

boot log:
-----------
[ 0.000000] Linux version 5.6.0 (oe-user@oe-host) (gcc version 7.3.0
(GCC), GNU ld (GNU Binutils) 2.30.0.20180208) #1 SMP PREEMPT Sun Apr
12 11:44:21 UTC 2020
[ 0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
[ 0.000000] efi: UEFI not found.
<>
[    2.550066] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    2.564493] SuperH (H)SCI(F) driver initialized
[    2.568321] msm_serial 78af000.serial: msm_serial: detected port #1
[    2.568457] msm_serial 78af000.serial: uartclk = 19200000
[    2.568724] 78af000.serial: ttyMSM1 at MMIO 0x78af000 (irq = 9,
base_baud = 1200000) is a MSM
[    2.572081] msm_serial 78b0000.serial: msm_serial: detected port #0
[    2.572210] msm_serial 78b0000.serial: uartclk = 7372800
[    2.572423] 78b0000.serial: ttyMSM0 at MMIO 0x78b0000 (irq = 10,
base_baud = 460800) is a MSM
[    2.572508] BUG: spinlock bad magic on CPU#3, swapper/0/1
[    2.572534]  lock: msm_uart_ports+0x0/0x7e0, .magic: 00000000,
.owner: <none>/-1, .owner_cpu: 0
[    2.572552] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.6.0 #1
[    2.572565] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    2.572578] Call trace:
[    2.572594]  dump_backtrace+0x0/0x1e0
[    2.572609]  show_stack+0x24/0x30
[    2.572627]  dump_stack+0xe8/0x150
[    2.572643]  spin_dump+0x84/0xb8
[    2.572658]  do_raw_spin_lock+0xf8/0x120
[    2.572675]  _raw_spin_lock_irqsave+0x68/0x80
[    2.572692]  uart_add_one_port+0x3ac/0x4e8
[    2.572709]  msm_serial_probe+0x168/0x208
[    2.572725]  platform_drv_probe+0x58/0xa8
[    2.572739]  really_probe+0x290/0x498
[    2.572754]  driver_probe_device+0x12c/0x148
[    2.572768]  device_driver_attach+0x74/0x98
[    2.572782]  __driver_attach+0xc4/0x178
[    2.572798]  bus_for_each_dev+0x84/0xd8
[    2.572811]  driver_attach+0x30/0x40
[    2.572827]  bus_add_driver+0x170/0x258
[    2.572841]  driver_register+0x64/0x118
[    2.572856]  __platform_driver_register+0x54/0x60
[    2.572872]  msm_serial_init+0x40/0x70
[    2.572887]  do_one_initcall+0x94/0x460
[    2.572904]  kernel_init_freeable+0x274/0x2dc
[    2.572920]  kernel_init+0x18/0x110
[    2.572936]  ret_from_fork+0x10/0x18
[    2.572966] msm_serial: console setup on port #0
[    3.664259] printk: console [ttyMSM0] enabled

Full test log,
https://lkft.validation.linaro.org/scheduler/job/1361080#L3679
https://lkft.validation.linaro.org/scheduler/job/1361079#L3730

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  kernel-config:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-mainline/2607/config
dtb:
http://snapshots.linaro.org/openembedded/lkft/lkft/sumo/dragonboard-410c/lkft/linux-mainline/2607/Image.gz--5.6+git0+b753101a4a-r0-apq8016-sbc-20200412114028-2607.dtb

--
Linaro LKFT
https://lkft.linaro.org
