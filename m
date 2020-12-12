Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01D992D83D4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 12 Dec 2020 02:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406228AbgLLBYZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Dec 2020 20:24:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405885AbgLLBYR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Dec 2020 20:24:17 -0500
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C84CC0613D6
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 17:23:37 -0800 (PST)
Received: by mail-ot1-x330.google.com with SMTP id x13so10029821oto.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Dec 2020 17:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=m3D8/vgpBLV17RrWZnz2RTLc7uiZ41l6KJXaC1DYt20=;
        b=F3YjqbsoTcExOovF8XqaTiW7Vxbte9BrSCeTSAkpzkku5fE3t04dM7nycvqrWIesf1
         eUT40IfwZI+hwCL+P5CKjpUeBWSMXWKzHYzLBElF77syF15l/ontoaMQ9QVZJJHJrioM
         Op9PRp1Fnrbf8eLdAhKnz9g+jBNWFkc2tYF/YJ4LUrpSwfuBNIbryQG85WXWYZuWS4/d
         6YrXmS/3TvciXPEuFHK2k4c7csejik6oMeWxbg2tarIpT/XrFPaw0i60p2yVbsCbfZgH
         TZXFayoow1idgWl9Set49iybr6hum5sZeM8RLeTpHrNgrwSE0yY7/OkI64w74jqDZ2Jl
         8n+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=m3D8/vgpBLV17RrWZnz2RTLc7uiZ41l6KJXaC1DYt20=;
        b=CEWmew/dyJYJRlhnqFLXYZBq5/po1EQ1PoeTVnxCMax1NAMVjNlGginxY7kGwK7ScU
         C2SxSmgA3UaLBXBD36Dn6nlS4LEIfmH4gxZUo8x7La3GpEib35zfgAPzyOPjCehViGWv
         HGlZyZQOsTL8BkaA0Dig+CAPRN6M5c8nYxMXW+XePQV9JCR2YGaD9FFy4PmQSqsl2lH6
         4hCP/Ah5b74JhzM1nWTa2m1T6e51e0V329uS1M8Xdw456HhAw3U4gTd9T3TFFX3pQzbW
         /Q4/T+ny38xJlAHQNzKI4ghfv8++So3dWC+vkJ5ihRfw3wT0Cjd4vRXEPVBRSxm3fCoq
         aQ7g==
X-Gm-Message-State: AOAM5336lG/lfBzoSoqNP8QU6OuBmDIh9fPWHxLYz6CN/GefgWoQT60f
        7dQGg9t9UEVJK+cawsyurFWhQSo9qKFdE5uQU+Ultw==
X-Google-Smtp-Source: ABdhPJwAZq3PU6s+7WVhZLUZ70AepZ41rFfkZJDmAioaR7w4+f9bzCsG9i1jH4QASHaqnYO8Pc3tNR6TH7+A2ZGMSBQ=
X-Received: by 2002:a9d:7411:: with SMTP id n17mr11779708otk.262.1607736216431;
 Fri, 11 Dec 2020 17:23:36 -0800 (PST)
MIME-Version: 1.0
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sat, 12 Dec 2020 04:23:25 +0300
Message-ID: <CAA8EJppRhRCVOrXT0=nxomCFonna3YHhNEv-YFLyjaQX4gRptw@mail.gmail.com>
Subject: ath11k/mhi backtraces on shutdown with linux-next
To:     ath11k@lists.infradead.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello,

I've noticed the following backtrace during shutdown stage when
rebooting RB5 board,
using linux-next/master:

[   31.060483] ath11k_pci 0000:01:00.0: shutdown
[   31.067844] ------------[ cut here ]------------
[   31.073111] WARNING: CPU: 4 PID: 101 at
drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550
[   31.083205] Modules linked in:
[   31.086801] CPU: 4 PID: 101 Comm: kworker/u17:0 Not tainted
5.10.0-rc7-next-20201211-13326-g8d69e01d5dc5-dirty #1269
[   31.098077] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   31.105437] Workqueue: mhi_hiprio_wq mhi_pm_st_worker
[   31.111124] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[   31.117789] pc : __arm_lpae_unmap+0x39c/0x550
[   31.122758] lr : __arm_lpae_unmap+0xf8/0x550
[   31.127642] sp : ffff800010ac3790
[   31.131539] x29: ffff800010ac3790 x28: ffff476580b1c800
[   31.137484] x27: ffffaa405d79c9d8 x26: 0000000000000000
[   31.143427] x25: 0000000000000003 x24: ffff800010ac3a38
[   31.149391] x23: 00000000ffbfd000 x22: 0000000000001000
[   31.155335] x21: ffff476589ec2b00 x20: 0000000000000003
[   31.161298] x19: 0000000000000000 x18: 0000000000000020
[   31.167240] x17: 0000000000000000 x16: 0000000000000000
[   31.173208] x15: 0000000000000001 x14: 0000000700000040
[   31.179143] x13: 0000000000000001 x12: 0000000000000040
[   31.185107] x11: 0000000000000000 x10: 0000000000000000
[   31.191043] x9 : 0000000000000010 x8 : ffff47658ab24fe8
[   31.197002] x7 : 000000000000000c x6 : 00000000000001fd
[   31.202939] x5 : ffff47658ab24000 x4 : 0000000000000003
[   31.208893] x3 : 0000000000001000 x2 : 00000000000ffbfd
[   31.214832] x1 : 0000000000000009 x0 : 0000000000000009
[   31.220771] Call trace:
[   31.223771]  __arm_lpae_unmap+0x39c/0x550
[   31.228373]  __arm_lpae_unmap+0xf8/0x550
[   31.232902]  __arm_lpae_unmap+0xf8/0x550
[   31.237412]  arm_lpae_unmap+0x64/0x7c
[   31.241654]  arm_smmu_unmap+0x48/0xac
[   31.245893]  __iommu_unmap+0xa8/0xfc
[   31.250038]  iommu_unmap_fast+0x10/0x1c
[   31.254446]  __iommu_dma_unmap+0x80/0x114
[   31.259032]  iommu_dma_free+0x2c/0x50
[   31.263264]  dma_free_attrs+0xdc/0xe0
[   31.267496]  mhi_driver_remove+0x1c8/0x240
[   31.272171]  __device_release_driver+0x188/0x230
[   31.277393]  device_release_driver+0x2c/0x44
[   31.282246]  bus_remove_device+0x124/0x130
[   31.286927]  device_del+0x168/0x420
[   31.290992]  mhi_destroy_device+0x7c/0xa0
[   31.295584]  device_for_each_child+0x5c/0xac
[   31.300451]  mhi_pm_st_worker+0x268/0xa20
[   31.305059]  process_one_work+0x1cc/0x360
[   31.309649]  worker_thread+0x2c8/0x470
[   31.313969]  kthread+0x160/0x164
[   31.317756]  ret_from_fork+0x10/0x34
[   31.321896] ---[ end trace 06455414208da447 ]---
[   31.327413] ------------[ cut here ]------------
[   31.332767] WARNING: CPU: 5 PID: 101 at
drivers/iommu/dma-iommu.c:497 __iommu_dma_unmap+0x108/0x114
[   31.342544] Modules linked in:
[   31.346166] CPU: 5 PID: 101 Comm: kworker/u17:0 Tainted: G        W
        5.10.0-rc7-next-20201211-13326-g8d69e01d5dc5-dirty #1269
[   31.358891] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   31.366275] Workqueue: mhi_hiprio_wq mhi_pm_st_worker
[   31.371972] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[   31.378655] pc : __iommu_dma_unmap+0x108/0x114
[   31.383738] lr : __iommu_dma_unmap+0x80/0x114
[   31.388729] sp : ffff800010ac39e0
[   31.392648] x29: ffff800010ac39e0 x28: ffff476580b1c800
[   31.398613] x27: ffffaa405d79c9d8 x26: ffff800010ac3b40
[   31.404581] x25: 000000000000002c x24: ffff476589ef8000
[   31.410547] x23: ffff476589ec2a58 x22: 00000000ffbfd000
[   31.416514] x21: ffff476580dc8000 x20: 00000000ffbfd000
[   31.422482] x19: 0000000000001000 x18: 0000000000000020
[   31.428448] x17: 0000000000000000 x16: 0000000000000000
[   31.434411] x15: 0000000000000001 x14: 0000000700000040
[   31.440370] x13: 0000000000000001 x12: 0000000000000040
[   31.446321] x11: 0000000000000000 x10: 0000000000000000
[   31.452263] x9 : 0000000000000010 x8 : ffff47658ab24fe8
[   31.458194] x7 : 000000000000000c x6 : 00000000000001fd
[   31.464115] x5 : ffff47658ab24000 x4 : 0000000000000003
[   31.470031] x3 : 0000000000001000 x2 : 00000000000ffbfd
[   31.475944] x1 : ffff476580acbc10 x0 : 0000000000000000
[   31.481853] Call trace:
[   31.484826]  __iommu_dma_unmap+0x108/0x114
[   31.489491]  iommu_dma_free+0x2c/0x50
[   31.493714]  dma_free_attrs+0xdc/0xe0
[   31.497935]  mhi_driver_remove+0x1c8/0x240
[   31.502593]  __device_release_driver+0x188/0x230
[   31.507795]  device_release_driver+0x2c/0x44
[   31.512643]  bus_remove_device+0x124/0x130
[   31.517304]  device_del+0x168/0x420
[   31.521346]  mhi_destroy_device+0x7c/0xa0
[   31.525920]  device_for_each_child+0x5c/0xac
[   31.530773]  mhi_pm_st_worker+0x268/0xa20
[   31.535352]  process_one_work+0x1cc/0x360
[   31.539933]  worker_thread+0x2c8/0x470
[   31.544248]  kthread+0x160/0x164
[   31.548029]  ret_from_fork+0x10/0x34
[   31.552164] ---[ end trace 06455414208da448 ]---
[   31.557448] ------------[ cut here ]------------
[   31.562744] trying to free invalid coherent area: 00000000463408c7
[   31.569644] WARNING: CPU: 5 PID: 101 at kernel/dma/remap.c:65
dma_common_free_remap+0x3c/0x80
[   31.578881] Modules linked in:
[   31.582507] CPU: 5 PID: 101 Comm: kworker/u17:0 Tainted: G        W
        5.10.0-rc7-next-20201211-13326-g8d69e01d5dc5-dirty #1269
[   31.595234] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   31.602622] Workqueue: mhi_hiprio_wq mhi_pm_st_worker
[   31.608326] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[   31.615016] pc : dma_common_free_remap+0x3c/0x80
[   31.620285] lr : dma_common_free_remap+0x3c/0x80
[   31.625552] sp : ffff800010ac3a10
[   31.629481] x29: ffff800010ac3a10 x28: ffff476580b1c800
[   31.635454] x27: ffffaa405d79c9d8 x26: ffff800010ac3b40
[   31.641430] x25: 000000000000002c x24: ffffaa405cc9bd18
[   31.647406] x23: 00000000ffbfd000 x22: 0000000000000000
[   31.653391] x21: ffff476589e940c0 x20: 0000000000001000
[   31.659365] x19: ffff80001078d000 x18: 0000000000000030
[   31.665350] x17: 0000000000000000 x16: 0000000000000001
[   31.671326] x15: 0000000000000004 x14: ffff47658d31a218
[   31.677309] x13: 0000000000000000 x12: ffff47658a151950
[   31.683287] x11: 00000020a75d4044 x10: 00000000000009b0
[   31.689276] x9 : ffff800010ac3740 x8 : ffff476580dc8a10
[   31.695255] x7 : ffff4766f6fc79c0 x6 : ffff4766f6fc79c0
[   31.701245] x5 : 0000000000000000 x4 : ffff4766f6fbd920
[   31.707231] x3 : ffff4766f6fc4878 x2 : ffff4766f6fbd920
[   31.713226] x1 : 0000000000000000 x0 : 0000000000000000
[   31.719204] Call trace:
[   31.722235]  dma_common_free_remap+0x3c/0x80
[   31.727127]  __iommu_dma_free+0xfc/0x100
[   31.731654]  iommu_dma_free+0x3c/0x50
[   31.735907]  dma_free_attrs+0xdc/0xe0
[   31.740158]  mhi_driver_remove+0x1c8/0x240
[   31.744854]  __device_release_driver+0x188/0x230
[   31.750094]  device_release_driver+0x2c/0x44
[   31.754963]  bus_remove_device+0x124/0x130
[   31.759657]  device_del+0x168/0x420
[   31.763728]  mhi_destroy_device+0x7c/0xa0
[   31.768327]  device_for_each_child+0x5c/0xac
[   31.773196]  mhi_pm_st_worker+0x268/0xa20
[   31.777795]  process_one_work+0x1cc/0x360
[   31.782400]  worker_thread+0x2c8/0x470
[   31.786734]  kthread+0x160/0x164
[   31.790538]  ret_from_fork+0x10/0x34
[   31.794699] ---[ end trace 06455414208da449 ]---
[   31.800160] ------------[ cut here ]------------
[   31.807409] WARNING: CPU: 2 PID: 101 at
drivers/iommu/io-pgtable-arm.c:583 __arm_lpae_unmap+0x39c/0x550
[   31.819609] Modules linked in:
[   31.825324] CPU: 2 PID: 101 Comm: kworker/u17:0 Tainted: G        W
        5.10.0-rc7-next-20201211-13326-g8d69e01d5dc5-dirty #1269
[   31.840279] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   31.849961] Workqueue: mhi_hiprio_wq mhi_pm_st_worker
[   31.857878] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[   31.866795] pc : __arm_lpae_unmap+0x39c/0x550
[   31.874043] lr : __arm_lpae_unmap+0xf8/0x550
[   31.881180] sp : ffff800010ac3790
[   31.887330] x29: ffff800010ac3790 x28: ffff476580b1c800
[   31.895563] x27: ffffaa405d79c9d8 x26: 0000000000000000
[   31.903811] x25: 0000000000000003 x24: ffff800010ac3a38
[   31.912024] x23: 00000000ffbfe000 x22: 0000000000001000
[   31.920249] x21: ffff476589ec2b00 x20: 0000000000000003
[   31.928446] x19: 0000000000000000 x18: 0000000000000030
[   31.936640] x17: 0000000000000000 x16: 0000000000000001
[   31.944834] x15: 0000000000000004 x14: ffff47658d31a218
[   31.953001] x13: 0000000000000000 x12: ffff47658a151950
[   31.961182] x11: 00000020a75d4044 x10: 00000000000009b0
[   31.969378] x9 : ffff800010ac3740 x8 : ffff47658ab24ff0
[   31.977550] x7 : 000000000000000c x6 : 00000000000001fe
[   31.985769] x5 : ffff47658ab24000 x4 : 0000000000000003
[   31.993932] x3 : 0000000000001000 x2 : 00000000000ffbfe
[   32.002075] x1 : 0000000000000009 x0 : 0000000000000009
[   32.010188] Call trace:
[   32.015291]  __arm_lpae_unmap+0x39c/0x550
[   32.021927]  __arm_lpae_unmap+0xf8/0x550
[   32.028382]  __arm_lpae_unmap+0xf8/0x550
[   32.034833]  arm_lpae_unmap+0x64/0x7c
[   32.040999]  arm_smmu_unmap+0x48/0xac
[   32.047078]  __iommu_unmap+0xa8/0xfc
[   32.053077]  iommu_unmap_fast+0x10/0x1c
[   32.059342]  __iommu_dma_unmap+0x80/0x114
[   32.065837]  iommu_dma_free+0x2c/0x50
[   32.071929]  dma_free_attrs+0xdc/0xe0
[   32.078009]  mhi_driver_remove+0x1c8/0x240
[   32.084566]  __device_release_driver+0x188/0x230
[   32.091666]  device_release_driver+0x2c/0x44
[   32.098394]  bus_remove_device+0x124/0x130
[   32.105007]  device_del+0x168/0x420
[   32.111003]  mhi_destroy_device+0x7c/0xa0
[   32.117501]  device_for_each_child+0x5c/0xac
[   32.124256]  mhi_pm_st_worker+0x268/0xa20
[   32.130776]  process_one_work+0x1cc/0x360
[   32.137311]  worker_thread+0x2c8/0x470
[   32.143536]  kthread+0x160/0x164
[   32.149225]  ret_from_fork+0x10/0x34
[   32.155277] ---[ end trace 06455414208da44a ]---
[   32.162810] ------------[ cut here ]------------
[   32.168067] WARNING: CPU: 4 PID: 101 at
drivers/iommu/dma-iommu.c:497 __iommu_dma_unmap+0x108/0x114
[   32.177835] Modules linked in:
[   32.181457] CPU: 4 PID: 101 Comm: kworker/u17:0 Tainted: G        W
        5.10.0-rc7-next-20201211-13326-g8d69e01d5dc5-dirty #1269
[   32.194182] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   32.201576] Workqueue: mhi_hiprio_wq mhi_pm_st_worker
[   32.207273] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO BTYPE=--)
[   32.213957] pc : __iommu_dma_unmap+0x108/0x114
[   32.219040] lr : __iommu_dma_unmap+0x80/0x114
[   32.224031] sp : ffff800010ac39e0
[   32.227950] x29: ffff800010ac39e0 x28: ffff476580b1c800
[   32.233920] x27: ffffaa405d79c9d8 x26: ffff800010ac3b40
[   32.239886] x25: 000000000000002c x24: ffff476589ef8000
[   32.245857] x23: ffff476589ec2a58 x22: 00000000ffbfe000
[   32.251831] x21: ffff476580dc8000 x20: 00000000ffbfe000
[   32.257802] x19: 0000000000001000 x18: 0000000000000030
[   32.263777] x17: 0000000000000000 x16: 0000000000000001
[   32.269748] x15: 0000000000000004 x14: ffff47658d31a218
[   32.275722] x13: 0000000000000000 x12: ffff47658a151950
[   32.281682] x11: 00000020a75d4044 x10: 00000000000009b0
[   32.287638] x9 : ffff800010ac3740 x8 : ffff47658ab24ff0
[   32.293584] x7 : 000000000000000c x6 : 00000000000001fe
[   32.299521] x5 : ffff47658ab24000 x4 : 0000000000000003
[   32.305464] x3 : 0000000000001000 x2 : 00000000000ffbfe
[   32.311392] x1 : ffff476580acbc10 x0 : 0000000000000000
[   32.317323] Call trace:
[   32.320311]  __iommu_dma_unmap+0x108/0x114
[   32.324997]  iommu_dma_free+0x2c/0x50
[   32.329262]  dma_free_attrs+0xdc/0xe0
[   32.333501]  mhi_driver_remove+0x1c8/0x240
[   32.338179]  __device_release_driver+0x188/0x230
[   32.343398]  device_release_driver+0x2c/0x44
[   32.348257]  bus_remove_device+0x124/0x130
[   32.352941]  device_del+0x168/0x420
[   32.357009]  mhi_destroy_device+0x7c/0xa0
[   32.361608]  device_for_each_child+0x5c/0xac
[   32.366484]  mhi_pm_st_worker+0x268/0xa20
[   32.371079]  process_one_work+0x1cc/0x360
[   32.375674]  worker_thread+0x2c8/0x470
[   32.379999]  kthread+0x160/0x164
[   32.383795]  ret_from_fork+0x10/0x34
[   32.387942] ---[ end trace 06455414208da44b ]---
[   32.393399] ------------[ cut here ]------------
[   32.398948] trying to free invalid coherent area: 00000000dd26af7e
[   32.405874] WARNING: CPU: 7 PID: 101 at kernel/dma/remap.c:65
dma_common_free_remap+0x3c/0x80
[   32.415074] Modules linked in:
[   32.418666] CPU: 7 PID: 101 Comm: kworker/u17:0 Tainted: G        W
        5.10.0-rc7-next-20201211-13326-g8d69e01d5dc5-dirty #1269
[   32.431356] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
[   32.438707] Workqueue: mhi_hiprio_wq mhi_pm_st_worker
[   32.444375] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[   32.451026] pc : dma_common_free_remap+0x3c/0x80
[   32.456254] lr : dma_common_free_remap+0x3c/0x80
[   32.461480] sp : ffff800010ac3a10
[   32.465376] x29: ffff800010ac3a10 x28: ffff476580b1c800
[   32.471312] x27: ffffaa405d79c9d8 x26: ffff800010ac3b40
[   32.477255] x25: 000000000000002c x24: ffffaa405cc9bd18
[   32.483195] x23: 00000000ffbfe000 x22: 0000000000000000
[   32.489149] x21: ffff476589e940c0 x20: 0000000000001000
[   32.495090] x19: ffff80001077d000 x18: 0000000000000030
[   32.501037] x17: 0000000000000000 x16: 0000000000000001
[   32.506979] x15: 0000000000000004 x14: ffff47658d31a218
[   32.512930] x13: 0000000000000000 x12: ffff47658a151950
[   32.518872] x11: ffff47658a151918 x10: 00000000000009b0
[   32.524817] x9 : ffff800010ac3740 x8 : ffff476580dc8a10
[   32.530764] x7 : ffff4766f6ff59c0 x6 : ffff4766f6ff59c0
[   32.536710] x5 : 0000000000000000 x4 : ffff4766f6feb920
[   32.542657] x3 : ffff4766f6ff2878 x2 : ffff4766f6feb920
[   32.548603] x1 : 0000000000000000 x0 : 0000000000000000
[   32.554547] Call trace:
[   32.557542]  dma_common_free_remap+0x3c/0x80
[   32.562408]  __iommu_dma_free+0xfc/0x100
[   32.566904]  iommu_dma_free+0x3c/0x50
[   32.571128]  dma_free_attrs+0xdc/0xe0
[   32.575344]  mhi_driver_remove+0x1c8/0x240
[   32.580003]  __device_release_driver+0x188/0x230
[   32.585216]  device_release_driver+0x2c/0x44
[   32.590061]  bus_remove_device+0x124/0x130
[   32.594731]  device_del+0x168/0x420
[   32.598768]  mhi_destroy_device+0x7c/0xa0
[   32.603334]  device_for_each_child+0x5c/0xac
[   32.608175]  mhi_pm_st_worker+0x268/0xa20
[   32.612743]  process_one_work+0x1cc/0x360
[   32.617321]  worker_thread+0x2c8/0x470
[   32.621622]  kthread+0x160/0x164
[   32.625397]  ret_from_fork+0x10/0x34
[   32.629522] ---[ end trace 06455414208da44c ]---
[   32.647234] arm-smmu 15000000.iommu: Unhandled context fault:
fsr=0x402, iova=0x00000000, fsynr=0x7f0011, cbfrsynra=0x1c01, cb=4
[   32.667398] arm-smmu 15000000.iommu: Unhandled context fault:
fsr=0x402, iova=0x00000000, fsynr=0x7f0011, cbfrsynra=0x1c01, cb=4


-- 
With best wishes
Dmitry
