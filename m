Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DEBE2257D0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jul 2020 08:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbgGTGgH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jul 2020 02:36:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgGTGgF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jul 2020 02:36:05 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343C6C0619D2
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2020 23:36:05 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h19so18919734ljg.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2020 23:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=FQV28QGdwTwKOWpDreLUi50G2AjPPA50/sb2JVPxnns=;
        b=GjNXsb1TupAuup7Ai1G127hjV10+iWI9TQg6sNJa/CLSYMVadY6HJ4Do3CuPdo5L8X
         JDr1l5imcbWkbJGrcJH3QRsBQw/0ezvUbiPDgTEHIC7BA9r56ogyg8OBkHq99jLITl4+
         yZeGyd+28f26MMeHvNpmXfQT2gl+uMn08SZlokZmnip5LYltuk0ubz/3XuPkd0xZ6msW
         Zrdsl6tRVJM2GKJT6olyiCocPi2s93q38/cgsgKgsygYAYnzbiT1nXyka3wg0dqWT3SQ
         578qkFzePbDDUvFdtZYLzyiVR6V5GX8hXgpsuV4N+EqR+eSi+aM5FhAeoKWyCnpksbMf
         S34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=FQV28QGdwTwKOWpDreLUi50G2AjPPA50/sb2JVPxnns=;
        b=oyRB+2kx+1EmSCxD5h3O0tU7Wpr32hP9MYMCN3yeoY1Vbmp4/M+5KmJpYTqeW2uW5t
         V11XSvPU7gmXbPXVhX0SzoaTmVNuz2d+1qDJEPpyejzAlIqFKLjSk3h60qEP5iTGg7XL
         gZ9HNrfKtJNgsNu3YJ21chOHfwfF2Z5FvH896UcqQvKqfERTeccO3sPAWfLJXQo14xER
         JXCO4Q1ZAK23ZwWGTkYsA++2zVzxeo1aHUFdAx0ugUQZJp/1zcEvWYXwZcOx0HphK7v7
         5qCMpEfQ2DmTkvkLxykbboE+LOeIsV9JlDSJtwDNie1YHTbQpElJQ94DVRpkGFAmZtvI
         //zQ==
X-Gm-Message-State: AOAM532kM5lZc+I5X5yVhPaVjxt8sSxrPYPFWpDAe05CgmS8vsJJB3d3
        i4BGLWqwKp+Aum7TEnM69uoyrNfB8uwE8WuDzO5UVQ==
X-Google-Smtp-Source: ABdhPJzru40K+4IudODw+Tyc9+nlBM8CiDNqPiB7AxIVLIkZPZzVDQGTuNTBsP2QzAN/jhR915F1vsuWu0afy7mihk8=
X-Received: by 2002:a2e:7401:: with SMTP id p1mr10351994ljc.366.1595226963554;
 Sun, 19 Jul 2020 23:36:03 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Mon, 20 Jul 2020 12:05:52 +0530
Message-ID: <CA+G9fYuzqA0N6O-52uH9aHjsfF6HfhuxMby1Y6Yz7jGMAHW0zw@mail.gmail.com>
Subject: arm64: Internal error: Oops: qcom_iommu_tlb_inv_context
 free_io_pgtable_ops on db410c
To:     open list <linux-kernel@vger.kernel.org>,
        linux-mediatek@lists.infradead.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        iommu@lists.linux-foundation.org
Cc:     "Guohanjun (Hanjun Guo)" <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joerg Roedel <jroedel@suse.de>, Qian Cai <cai@lca.pw>,
        Arnd Bergmann <arnd@arndb.de>,
        Vinod Koul <vinod.koul@linaro.org>,
        lkft-triage@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This kernel oops while boot linux mainline kernel on arm64  db410c device.

metadata:
  git branch: master
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  git commit: f8456690ba8eb18ea4714e68554e242a04f65cff
  git describe: v5.8-rc5-48-gf8456690ba8e
  make_kernelversion: 5.8.0-rc5
  kernel-config:
https://builds.tuxbuild.com/2aLnwV7BLStU0t1R1QPwHQ/kernel.config

[    5.444121] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000018
[    5.456615]   ESR = 0x96000004
[    5.464471]   SET = 0, FnV = 0
[    5.464487]   EA = 0, S1PTW = 0
[    5.466521] Data abort info:
[    5.469971]   ISV = 0, ISS = 0x00000004
[    5.472768]   CM = 0, WnR = 0
[    5.476172] user pgtable: 4k pages, 48-bit VAs, pgdp=00000000bacba000
[    5.479349] [0000000000000018] pgd=0000000000000000, p4d=0000000000000000
[    5.485820] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    5.492448] Modules linked in: crct10dif_ce adv7511(+)
qcom_spmi_temp_alarm cec msm(+) mdt_loader qcom_camss videobuf2_dma_sg
drm_kms_helper v4l2_fwnode videobuf2_memops videobuf2_v4l2 qcom_rng
videobuf2_common i2c_qcom_cci display_connector socinfo drm qrtr ns
rmtfs_mem fuse
[    5.500256] CPU: 0 PID: 286 Comm: systemd-udevd Not tainted 5.8.0-rc5 #1
[    5.522484] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
[    5.529170] pstate: 20000005 (nzCv daif -PAN -UAO BTYPE=--)
[    5.535856] pc : qcom_iommu_tlb_inv_context+0x18/0xa8
[    5.541148] lr : free_io_pgtable_ops+0x28/0x58
[    5.546350] sp : ffff80001219b5f0
[    5.550689] x29: ffff80001219b5f0 x28: 0000000000000013
[    5.554078] x27: 0000000000000100 x26: ffff000036add3b8
[    5.559459] x25: ffff80000915e910 x24: ffff00003a5458c0
[    5.564753] x23: 0000000000000003 x22: ffff000036a37058
[    5.570049] x21: ffff000036a3a100 x20: ffff000036a3a480
[    5.575344] x19: ffff000036a37158 x18: 0000000000000000
[    5.580639] x17: 0000000000000000 x16: 0000000000000000
[    5.585935] x15: 0000000000000004 x14: 0000000000000368
[    5.591229] x13: 0000000000000000 x12: ffff000039c61798
[    5.596525] x11: ffff000039c616d0 x10: 0000000040000000
[    5.601820] x9 : 0000000000000000 x8 : ffff000039c616f8
[    5.607114] x7 : 0000000000000000 x6 : ffff000009f699a0
[    5.612410] x5 : ffff80001219b520 x4 : ffff000036a3a000
[    5.617705] x3 : ffff000009f69904 x2 : 0000000000000000
[    5.623001] x1 : ffff8000107e27e8 x0 : ffff00003a545810
[    5.628297] Call trace:
[    5.633592]  qcom_iommu_tlb_inv_context+0x18/0xa8
[    5.635764]  free_io_pgtable_ops+0x28/0x58
[    5.640624]  qcom_iommu_domain_free+0x38/0x60
[    5.644617]  iommu_group_release+0x4c/0x70
[    5.649045]  kobject_put+0x6c/0x120
[    5.653035]  kobject_del+0x64/0x90
[    5.656421]  kobject_put+0xfc/0x120
[    5.659893]  iommu_group_remove_device+0xdc/0xf0
[    5.663281]  iommu_release_device+0x44/0x70
[    5.668142]  iommu_bus_notifier+0xbc/0xd0
[    5.672048]  notifier_call_chain+0x54/0x98
[    5.676214]  blocking_notifier_call_chain+0x48/0x70
[    5.680209]  device_del+0x26c/0x3a0
[    5.684981]  platform_device_del.part.0+0x1c/0x88
[    5.688453]  platform_device_unregister+0x24/0x40
[    5.693316]  of_platform_device_destroy+0xe4/0xf8
[    5.698002]  device_for_each_child+0x5c/0xa8
[    5.702689]  of_platform_depopulate+0x3c/0x80
[    5.707144]  msm_pdev_probe+0x1c4/0x308 [msm]
[    5.711286]  platform_drv_probe+0x54/0xa8
[    5.715624]  really_probe+0xd8/0x320
[    5.719617]  driver_probe_device+0x58/0xb8
[    5.723263]  device_driver_attach+0x74/0x80
[    5.727168]  __driver_attach+0x58/0xe0
[    5.731248]  bus_for_each_dev+0x70/0xc0
[    5.735067]  driver_attach+0x24/0x30
[    5.738801]  bus_add_driver+0x14c/0x1f0
[    5.742619]  driver_register+0x64/0x120
[    5.746178]  __platform_driver_register+0x48/0x58
[    5.750099]  msm_drm_register+0x58/0x70 [msm]
[    5.754861]  do_one_initcall+0x54/0x1a0
[    5.759200]  do_init_module+0x54/0x200
[    5.762846]  load_module+0x1d1c/0x2300
[    5.766664]  __do_sys_finit_module+0xd8/0xf0
[    5.770398]  __arm64_sys_finit_module+0x20/0x30
[    5.774826]  el0_svc_common.constprop.0+0x6c/0x168
[    5.779078]  do_el0_svc+0x24/0x90
[    5.783939]  el0_sync_handler+0x90/0x198
[    5.787323]  el0_sync+0x158/0x180
[    5.791323] Code: 910003fd f9417404 b4000484 f9401482 (b9401846)
[    5.794532] ---[ end trace 3d6a53241629e560 ]---

full crash log details.
https://qa-reports.linaro.org/lkft/linux-mainline-oe/build/v5.8-rc5-48-gf8456690ba8e/testrun/2945157/suite/linux-log-parser/test/check-kernel-oops-1573988/log

-- 
Linaro LKFT
https://lkft.linaro.org
