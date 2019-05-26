Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52EC92AC5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 May 2019 23:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbfEZVvb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 May 2019 17:51:31 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:39657 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbfEZVvb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 May 2019 17:51:31 -0400
Received: by mail-qk1-f196.google.com with SMTP id i125so13040987qkd.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 May 2019 14:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k0NU3GdNCQtaCBjZ4hKsl5/kUxZv2IaxX39s5Iv4+6o=;
        b=Ve77pMpT0U6SxZbft6ZK8JpKt6LHWXunl+S8aPo+fhmMxpwJjyUfLEllXvuINPi5ya
         L9iuVKrtEWvQW8QEpG1L0G8m/UTakEo9q3t044cTJQC6Bz/6aTC1UYMBYwuQCo1DXOb7
         LqeLaSWmCSnsfKye76Qem2pI8K4em8ZNdTpyn3V8M4P1g1AhF3HdcgGd2cWuu6tXugwJ
         CG4u69607NaxKVNPxvzF34T+XOO9hff2hvjenCuCbnFwXIYTvcKkGMx+PsDBCrCPavcD
         8OJZp2YhyATUyy3wprGYPDCoQLrmxOsSoc6nXXgZBEQwQ3AYFuyDc+NMCs8b5AQZ3b5r
         ADXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k0NU3GdNCQtaCBjZ4hKsl5/kUxZv2IaxX39s5Iv4+6o=;
        b=GHxwDnFSw1v9q2uJqqJXgfyXpD5vTeDqGqQ44W0IjG43tMoVAWaNKS0oP+aC+aZ2/p
         3Up7vb/qtxZskjZ9RK4tgE7ow8Av5aLdEMU0iMXb6n02iplqfMIZwnn0B10ENAa7TmJA
         QoIovLWYm0pd4SNGodLqZ+pkXfrDbAL1vIT1r712uzfHzw/Gs+597mYguP9aCHVX1FLV
         i1lTtpeGXuZ0cN7iNnDwUcaLo+O8f48hPbIPU4zQpX8sZn6MRqy96DXYDxOU0Za70mX+
         PvBmMNBVDyCZ/1vLulhvdIaYlrbWPKLF0Er7C8beXY8JFPaozlzBwunhAeAUifzRSRpf
         vxJg==
X-Gm-Message-State: APjAAAVTTSvV/6tTlQE29AmZmi/S49FFftffrO4rFMuZTbwj/PtuPvIk
        G7DM2cCg426yHFgw9UzwlYjjr0FNHaSM5nW9WmW+myjftQxx+g==
X-Google-Smtp-Source: APXvYqxXPJOR9AM+6hnmPx4XiRGV77+OkE6qRfAeMp5Gnykqo0kvJxguRg2isUteh9Lv2Qd9QVOmGM82oW57EdrBppM=
X-Received: by 2002:a05:620a:55c:: with SMTP id o28mr1330299qko.86.1558907489823;
 Sun, 26 May 2019 14:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <5ce71d79.1c69fb81.dd0de.33cf@mx.google.com> <7hv9y01z85.fsf@baylibre.com>
 <20190524012913.D9BB72168B@mail.kernel.org>
In-Reply-To: <20190524012913.D9BB72168B@mail.kernel.org>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Sun, 26 May 2019 23:51:18 +0200
Message-ID: <CAP245DXkEym=x3vrN2cc2y+uHHx_+z0cW0WsV0dGGXfd+c2mSQ@mail.gmail.com>
Subject: Re: next/pending-fixes boot: 227 boots: 6 failed, 198 passed with 20
 offline, 1 untried/unknown, 2 conflicts (v5.2-rc1-375-g3695b18d1e9cd)
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "kernelci.org bot" <bot@kernelci.org>,
        Kevin Hilman <khilman@baylibre.com>,
        kernel-build-reports@lists.linaro.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>, andygro@gmail.com,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, May 24, 2019 at 3:29 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Kevin Hilman (2019-05-23 17:18:50)
> > [ + Andy Gross, Stephen Boyd ]
> >
> > "kernelci.org bot" <bot@kernelci.org> writes:
> >
> > > next/pending-fixes boot: 227 boots: 6 failed, 198 passed with 20 offline, 1 untried/unknown, 2 conflicts (v5.2-rc1-375-g3695b18d1e9cd)
> > >
> > > Full Boot Summary: https://kernelci.org/boot/all/job/next/branch/pending-fixes/kernel/v5.2-rc1-375-g3695b18d1e9cd/
> > > Full Build Summary: https://kernelci.org/build/next/branch/pending-fixes/kernel/v5.2-rc1-375-g3695b18d1e9cd/
> > >
> > > Tree: next
> > > Branch: pending-fixes
> > > Git Describe: v5.2-rc1-375-g3695b18d1e9cd
> > > Git Commit: 3695b18d1e9cd6bb739579e782670518d500839d
> > > Git URL: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > > Tested: 82 unique boards, 24 SoC families, 19 builds out of 223
> > >
> > > Boot Regressions Detected:
> > >
> > > arm:
> > >
> > >     qcom_defconfig:
> > >         gcc-8:
> > >           qcom-apq8064-cm-qs600:
> > >               lab-baylibre-seattle: failing since 3 days (last pass: v5.1-11016-gf31c9c9ee122 - first fail: v5.1-12956-g8d4b83476a8f)
> > >           qcom-apq8064-ifc6410:
> > >               lab-baylibre-seattle: failing since 3 days (last pass: v5.1-11016-gf31c9c9ee122 - first fail: v5.1-12956-g8d4b83476a8f)
> >
> > Andy, 8064 not happy in linux-next lately, I haven't had a chance to
> > look closer.
> >
>
> Looks like some sort of tsens crash with a bad regmap_field or something.
>
> [    4.001041] Unable to handle kernel NULL pointer dereference at virtual address 00000000
> [    4.008631] pgd = (ptrval)
> [    4.016914] [00000000] *pgd=00000000
> [    4.019374] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> [    4.023100] Modules linked in:
> [    4.028402] CPU: 2 PID: 21 Comm: kworker/2:0 Tainted: G        W         5.2.0-rc1 #1
> [    4.031259] Hardware name: Generic DT based system
> [    4.039175] Workqueue: events deferred_probe_work_func
> [    4.043859] PC is at regmap_field_read+0x1c/0x70
> [    4.048973] LR is at is_sensor_enabled+0x40/0x74
> [    4.053743] pc : []    lr : []    psr: 20000013
> [    4.058340] sp : c02f1dc8  ip : 00000000  fp : 00000007
> [    4.064332] r10: c0de1534  r9 : c0bb596c  r8 : ee4eda00
> [    4.068214] usb 1-1: New USB device found, idVendor=04b4, idProduct=6570, bcdDevice=32.99
> [    4.069539] r7 : c02f0000  r6 : c02f1de0  r5 : 00000000  r4 : c02f0000
> [    4.069549] r3 : c02f1dc8  r2 : 11403009  r1 : c02f1de0  r0 : 00000000
> [    4.074838] usb 1-1: New USB device strings: Mfr=0, Product=1, SerialNumber=0
> [    4.083085] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> [    4.083096] Control: 10c5787d  Table: 8020406a  DAC: 00000051
> [    4.083108] Process kworker/2:0 (pid: 21, stack limit = 0x(ptrval))
> [    4.083118] Stack: (0xc02f1dc8 to 0xc02f2000)
> [    4.083152] 1dc0:                   c02f0000 c093d93c c02f0000 00000000 00000000 c093dabc
> [    4.083192] 1de0: 0000000b 11403009 ee39b040 ee39b040 ee39b040 c093d794 00000000 11403009
> [    4.089507] usb 1-1: Product: USB2.0 Hub
> [    4.096045] 1e00: 0000000b 11403009 ee4eda10 00000000 c10a2b84 00000000 c10c2f78 00000000
> [    4.096085] 1e20: c10a2b84 c080b940 c110b37c ee4eda10 c110b380 00000000 c10c2f78 c0809480
> [    4.096126] 1e40: c02f1ecc ee4eda10 ffffe000 ee4eda10 c10a2b84 c02f1ecc c0809b78 00000001
> [    4.105168] hub 1-1:1.0: USB hub found
> [    4.110367] 1e60: c0dbb994 c10c2f78 ffffe000 c0809938 ee4eda10 00000001 00000001 00000000
> [    4.116581] hub 1-1:1.0: 4 ports detected
> [    4.122170] 1e80: c02f0000 c02f1ecc c0809b78 00000001 c0dbb994 c10c2f78 ffffe000 c0807718
> [    4.187285] 1ea0: ffffe000 c028c26c ee20acb8 11403009 ee4eda10 ee4eda10 c02f0000 ee4eda54
> [    4.195443] 1ec0: c10938a8 c08092d8 ee4eda10 ee4eda10 00000001 11403009 ee4eda10 ee4eda10
> [    4.203603] 1ee0: c1093b18 c10938a8 c10c2f78 c08084e4 ee4eda10 c1093894 c1093894 c0808a2c
> [    4.211762] 1f00: c10938cc c0208880 eefc0cc0 eefc3e00 00000000 c10b76b0 00000000 c033c804
> [    4.219921] 1f20: eefc0cc0 eefc0cc0 eefc0cd8 c0208880 c0208894 eefc0cc0 00000108 c1003d00
> [    4.228082] 1f40: eefc0cd8 eefc0cc0 ffffe000 c033d6dc c023ed00 c10b70e8 c0d44c58 00000000
> [    4.236242] 1f60: c023ed1c c023ed00 c023ec80 00000000 c02f0000 c0208880 c033d448 c029bdec
> [    4.244400] 1f80: c023ed1c c034289c 00000000 c023ec80 c0342754 00000000 00000000 00000000
> [    4.252559] 1fa0: 00000000 00000000 00000000 c03010e8 00000000 00000000 00000000 00000000
> [    4.260719] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    4.268878] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
> [    4.277031] [] (regmap_field_read) from [] (is_sensor_enabled+0x40/0x74)

Sorry for breaking the boot on 8064. That was one of the platforms
that I didn't convert over to regmap (needs more refactoring). I had
hoped kernelci would catch any issues but looks like thermal-soc tree
entered linux-next quite late and didn't catch this.

Does reverting 3e6a8fb33084 ("drivers: thermal: tsens: Add new
operation to check if a sensor is enabled") fix the issue? If so,
reverting that commit might be the best course of action since I've
started vacations and can't fix this for 8064 in a meaningful amount
of time (until 3rd week of June). cc'ing Bjorn in case this needs more
investigation, but I think that patch is fairly self contained and
reverting it shouldn't have any knock-on effects.

Regards,
Amit

> [    4.285185] [] (is_sensor_enabled) from [] (tsens_probe+0x170/0x2d4)
> [    4.293699] [] (tsens_probe) from [] (platform_drv_probe+0x48/0x98)
> [    4.301764] [] (platform_drv_probe) from [] (really_probe+0x108/0x40c)
> [    4.309490] [] (really_probe) from [] (driver_probe_device+0x78/0x1c0)
> [    4.317822] [] (driver_probe_device) from [] (bus_for_each_drv+0x84/0xc8)
> [    4.326069] [] (bus_for_each_drv) from [] (__device_attach+0xd4/0x16c)
> [    4.334662] [] (__device_attach) from [] (bus_probe_device+0x84/0x8c)
> [    4.342815] [] (bus_probe_device) from [] (deferred_probe_work_func+0x84/0xc4)
> [    4.351081] [] (deferred_probe_work_func) from [] (process_one_work+0x204/0x570)
> [    4.359935] [] (process_one_work) from [] (worker_thread+0x294/0x580)
> [    4.369218] [] (worker_thread) from [] (kthread+0x148/0x150)
> [    4.377288] [] (kthread) from [] (ret_from_fork+0x14/0x2c)
> [    4.384735] Exception stack(0xc02f1fb0 to 0xc02f1ff8)
> [    4.391775] 1fa0:                                     00000000 00000000 00000000 00000000
> [    4.396916] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    4.405068] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    4.413232] Code: e1a06001 e1a0300d e3c34d7f e3c4403f
>
> [1] https://storage.kernelci.org/next/pending-fixes/v5.2-rc1-375-g3695b18d1e9cd/arm/qcom_defconfig/gcc-8/lab-baylibre-seattle/boot-qcom-apq8064-cm-qs600.html
