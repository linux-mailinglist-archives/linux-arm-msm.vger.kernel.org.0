Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1AC32157A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2020 14:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728989AbgGFMxf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jul 2020 08:53:35 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:55735 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728967AbgGFMxf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jul 2020 08:53:35 -0400
Received: from mail-qk1-f173.google.com ([209.85.222.173]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MIbzB-1k6Szp411J-00EeSP; Mon, 06 Jul 2020 14:53:33 +0200
Received: by mail-qk1-f173.google.com with SMTP id r22so34530382qke.13;
        Mon, 06 Jul 2020 05:53:32 -0700 (PDT)
X-Gm-Message-State: AOAM533C4qiqSnhL+DaWcXtlmE9qzODh0CXgeCswjA4hZDegvpwEZ20g
        iwEHFv9CYvYO2nZS0+UGqsULH/Igtcf+/hHlXd0=
X-Google-Smtp-Source: ABdhPJzLxzzD0oWLR8gLB+UZOumRyReNJRxw2eFk+0tK/K4zKW/yb78heESjoajcTacz1okTabKhg+kBVFSTBDtiDao=
X-Received: by 2002:a05:620a:1654:: with SMTP id c20mr39946815qko.138.1594040011521;
 Mon, 06 Jul 2020 05:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
In-Reply-To: <CA+G9fYvqW-RQxt3kSoNkh5Y2REoe0QQB_dTz_KPzhJzcwiM5OA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 6 Jul 2020 14:53:15 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
Message-ID: <CAK8P3a1Lda8HhsDvDREf-cOgb4RkCgEKK5Q-Zj+UhK8tsAaBLw@mail.gmail.com>
Subject: Re: [qemu] boot failed: Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     linux-serial@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Jiri Slaby <jslaby@suse.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>, jirislaby@kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ldewangan@nvidia.com, Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, Qian Cai <cai@lca.pw>,
        lkft-triage@lists.linaro.org, Dave Jiang <dave.jiang@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:7h2WIgJfUR8umEdQGzTQUYjL3+PVFsfHCxAO7m96RjRNmNGPw9N
 sHuWludrvhH8Rnl+cxeVAHKtw8Mww8bjjpS4LhYBlM+RdWcgUfVQT9YyUTm/iTF8lDS61Lj
 krhupWRzRsZhQ7u5PH5zmLIx+MmhwwxSckm7TgxDFTGte3rMYKWdPIKDiTjobw2zcQJ0Hhj
 xBc9GNT7CuiTl1d1brLNQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:05WRbZZwKYE=:1ZH7KIls0ynpOir4F2/d62
 j9meVUQU3kApE1/XOTpf3LT7oTPEqy09bFOmfv2/10XjbgPo7FLCwlv7n+bJ3BZzHOT939QrS
 0nnDepXpChMAgH6z3stpbszXbXJMWNI/3RqzzuAd11r02D6aVfCbogmad/bE2ewyNAs63DVr7
 F2jjH21Qipjl9NEvf6YYpFTHnK6hz70tgnyUhiL8Aw+HYSBlSUcXQK9Tu5OFrdJDBdtLERi83
 wAjHzX5aSE66qtz4HzyYwMpyt6o6ezkdnlE7CmDs02pbWr/cohE14c+Xi5ENgRGtFvakZR1NT
 qAUrpcZXAm65mV1VEWuPJLtgmOsU2aIUjdizcKQx5fBxZbvGcPC9ks6lhsgMReOreKvECfYY9
 PGMjdIoxkeXxB9PPcZMPbC18Joyb7j8YO4HNZq/1OCQjac+XgDmN+5A4PgmbYhyD0j9v00dKR
 kviv8CHn5gY04gqr0BAFOJTkjURWfG1mLRvkG9Yn/Mu8I9iN07qJUYGxYnU3wxDA+oCI0tHPF
 amwe41B/B9cZG6zdqDQvDUcqe5rDddTxFwIlMsJTYJgoixAx6GtHed529R3jmx02arSMtuP1p
 sl7h5jKHFp+/aDE8i/5apxYaLfVpaql3d4zlIviFf7IFElXn2IKxu237u/JTnvGlo/7VC+Wie
 ocpBS7Ia3HN8j4Ms0o+XGyeApsBlfJx0ehCsHk38Rgm2aFQ9tV6xgLKpjJ5uXevNaC7ZTFdIx
 y8kDxuL8eKn6tzjxJoTMZ6GnBwbNUHFnm5Kuhl4EazvFSS8yBldbFAUirGpzrmT3Iji9fILCw
 sZOn512pmpqNKNZBcYPUToOJ8sKnPuT+A1GErANP/bKZ4RJXzg=
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 6, 2020 at 1:03 PM Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> While booting qemu_arm64 and qemu_arm with Linux version 5.8.0-rc3-next-20200706
> the kernel panic noticed due to kernel NULL pointer dereference.
>
> metadata:
>   git branch: master
>   git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>   git commit: 5680d14d59bddc8bcbc5badf00dbbd4374858497
>   git describe: next-20200706
>   make_kernelversion: 5.8.0-rc3
>   kernel-config:
> https://builds.tuxbuild.com/Glr-Ql1wbp3qN3cnHogyNA/kernel.config
>
> qemu arm64 boot crash log,
>
> [    0.972053] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [    0.975301] Mem abort info:
> [    0.976316]   ESR = 0x96000004
> [    0.977378]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    0.979363]   SET = 0, FnV = 0
> [    0.980458]   EA = 0, S1PTW = 0
> [    0.981583] Data abort info:
> [    0.982634]   ISV = 0, ISS = 0x00000004
> [    0.984213]   CM = 0, WnR = 0
> [    0.985260] [0000000000000000] user address but active_mm is swapper
> [    0.987600] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    0.989557] Modules linked in:
> [    0.990671] CPU: 2 PID: 1 Comm: swapper/0 Not tainted
> 5.8.0-rc3-next-20200706 #1
> [    0.993711] Hardware name: linux,dummy-virt (DT)
> [    0.995708] pstate: 00000005 (nzcv daif -PAN -UAO BTYPE=--)
> [    0.998168] pc : pl011_dma_probe+0x90/0x360

This is the code from you vmlinux file:

ffff8000107233e4:       b90087e2        str     w2, [sp, #132]
ffff8000107233e8:       97fcf14c        bl      ffff80001065f918
<dma_request_chan>
ffff8000107233ec:       aa0003f4        mov     x20, x0
ffff8000107233f0:       b140041f        cmn     x0, #0x1, lsl #12
ffff8000107233f4:       54000488        b.hi    ffff800010723484
<pl011_dma_probe+0x11c>  // b.pmore
ffff8000107233f8:       f9400280        ldr     x0, [x20]
ffff8000107233fc:       f9409c02        ldr     x2, [x0, #312]
ffff800010723400:       b4000082        cbz     x2, ffff800010723410
<pl011_dma_probe+0xa8>

It's the "ldr     x0, [x20]" dereferencing 'chan' in pl011_dma_probe() after
checking it for an error value. However it's a NULL pointer, not an
error pointer, indicating that there is a bug in the dmaengine driver
that you use here, or in the dmaengine core code.

I don't see anything suspicious in dmaengine drivers, but there is a
recent series
from Dave Jiang that might explain it. Could you try reverting  commit
deb9541f5052 ("dmaengine: check device and channel list for empty")?

I think the broken change is this one:

@@ -819,6 +850,11 @@ struct dma_chan *dma_request_chan(struct device
*dev, const char *name)

        /* Try to find the channel via the DMA filter map(s) */
        mutex_lock(&dma_list_mutex);
+       if (list_empty(&dma_device_list)) {
+               mutex_unlock(&dma_list_mutex);
+               return NULL;
+       }
+
        list_for_each_entry_safe(d, _d, &dma_device_list, global_node) {
                dma_cap_mask_t mask;
                const struct dma_slave_map *map = dma_filter_match(d,
name, dev);

which needs to return an error code like -ENODEV instead of NULL. There
may be other changes in the same patch that introduce the same bug
elsewhere.

     Arnd
