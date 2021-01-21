Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF0C2FE69C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Jan 2021 10:45:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728259AbhAUJnc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Jan 2021 04:43:32 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51663 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728798AbhAUJmp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Jan 2021 04:42:45 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20210121094200euoutp012aade1b609fab4f8ea71c007b7b0924e~cNftjridC0808608086euoutp015
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Jan 2021 09:42:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20210121094200euoutp012aade1b609fab4f8ea71c007b7b0924e~cNftjridC0808608086euoutp015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1611222120;
        bh=syOn29PkVNKXEYzwcSgzjQDLWH7DGQmNV5Xz1eCMYTM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=SEWd0Y6YnJPNhgo3snx1/3hQTkCWE0zBt+mZag2928+baCCUkngHgZzYsJ+OQcJBg
         zvOXaePRdkmZuUdig/C0FL3mKOQLGiYmaHsAPcCuv7YmRgVhTDiRh91NApdItobyHO
         LMbLOi87nK1SgsWQnSBUpQmbVCF8DBc9oIvQqxWQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20210121094200eucas1p2d2fb282f86a55772a0a91cd5f79318fd~cNftK63nn2041720417eucas1p2p;
        Thu, 21 Jan 2021 09:42:00 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 4C.AF.44805.76C49006; Thu, 21
        Jan 2021 09:41:59 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210121094159eucas1p2fc9dab217ede409c4cbef118ce479789~cNfsia0zo2041720417eucas1p2n;
        Thu, 21 Jan 2021 09:41:59 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210121094159eusmtrp1c0c5532da77db0bd4367c3d7e82cdf32~cNfshvka02556825568eusmtrp1W;
        Thu, 21 Jan 2021 09:41:59 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-a1-60094c6746d1
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E9.FD.21957.76C49006; Thu, 21
        Jan 2021 09:41:59 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20210121094158eusmtip123c650e278bde0262e8eef828d16d96e~cNfsEHZr40639806398eusmtip1E;
        Thu, 21 Jan 2021 09:41:58 +0000 (GMT)
Subject: Re: [PATCH] regulator: core: avoid regulator_resolve_supply() race
 condition
To:     Mark Brown <broonie@kernel.org>
Cc:     David Collins <collinsd@codeaurora.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <5f37ae96-c5f9-6619-d88f-21c5e483ff8e@samsung.com>
Date:   Thu, 21 Jan 2021 10:41:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210118204958.GS4455@sirena.org.uk>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIKsWRmVeSWpSXmKPExsWy7djPc7rpPpwJBg9/2VhsnLGe1WLqwyds
        Fl1tQhbnz29gt/h2pYPJYuL+s+wWl3fNYbOYcX4fkwOHx+W+XiaPnbPusntsWtXJ5tG3ZRWj
        x+dNcgGsUVw2Kak5mWWpRfp2CVwZP/99ZS64nlDR3X2QpYHxbFgXIyeHhICJxMzDk9i7GLk4
        hARWMEo8/PefBSQhJPCFUWL6cnYI+zOjRPP/TJiGU91TGCHiyxklnt+ohmj+yCjxafE7sAZh
        gXCJtf9+gg0SEVCWuPp9LwtIEbPAaiaJC1e62EASbAKGEl1vIWxeATuJD1c+gk1lEVCV2Dvt
        GSuILSqQJHH3zmEmiBpBiZMzn4AN5RQwkriz8jNYL7OAvETz1tnMELa4xK0n85lAlkkIPOCQ
        uPPlCgvE2S4SnS/fQdnCEq+Ob2GHsGUkTk/uYYFoaAb6/9xadginh1HictMMRogqa4k7534B
        reMAWqEpsX6XPkTYUWLqiqfMIGEJAT6JG28FIY7gk5i0bTpUmFeio00IolpNYtbxdXBrD164
        xDyBUWkWktdmIXlnFpJ3ZiHsXcDIsopRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMwFZ3+
        d/zLDsblrz7qHWJk4mA8xCjBwawkwvvIkiNBiDclsbIqtSg/vqg0J7X4EKM0B4uSOG/SljXx
        QgLpiSWp2ampBalFMFkmDk6pBqb8njsq/3KKv96cqCWuHfb+orHEvbJ+px7hOYzzJ9z4dfjN
        whTP7qRrN+M0sks/fVMo72kR79iiG5/vY6Hrnz0znX3BD9+udyJXZueGPf3kIfegYv2htL91
        s2Wf/7FvCrleriJYEGlUwHNXbfJCaf1fcz13KfToxSTdlz+QvvLIxxo+zujkd3UnOYXO7zg/
        +/da0ejXl7NNWtez336uqnMkZuLEsCMvt5mcX5V7S+zLavXeNOM3rN+fqnncUE7q3rPlO9cX
        Sc8ew33ZWsqfGlijsrfru1ya2tUozXDhidSi73rZu44X9kYy76jpeHi3J3iy2OJF9+brWngz
        LNppcujB7ouah5Vm3ZnmmWYRnaDEUpyRaKjFXFScCABJezH4tAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsVy+t/xu7rpPpwJBvP/iVhsnLGe1WLqwyds
        Fl1tQhbnz29gt/h2pYPJYuL+s+wWl3fNYbOYcX4fkwOHx+W+XiaPnbPusntsWtXJ5tG3ZRWj
        x+dNcgGsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2
        CXoZP/99ZS64nlDR3X2QpYHxbFgXIyeHhICJxKnuKYwgtpDAUkaJ1TttIeIyEienNbBC2MIS
        f651sXUxcgHVvGeUWDTzITNIQlggXGLtv58sILaIgLLE1e97WUCKmAVWM0l8fDWJFaLjO6PE
        nB/L2UCq2AQMJbredoHZvAJ2Eh+ufARbzSKgKrF32jOwdaICSRInZn1ihqgRlDg58wnYBk4B
        I4k7Kz+D9TILmEnM2wxxBbOAvETz1tlQtrjErSfzmSYwCs1C0j4LScssJC2zkLQsYGRZxSiS
        Wlqcm55bbKhXnJhbXJqXrpecn7uJERh/24793LyDcd6rj3qHGJk4GA8xSnAwK4nwPrLkSBDi
        TUmsrEotyo8vKs1JLT7EaAr0z0RmKdHkfGACyCuJNzQzMDU0MbM0MLU0M1YS5906d028kEB6
        YklqdmpqQWoRTB8TB6dUA9Piz7t5UjY/P+z+fVMqz/6uxrCYOXOEDvqnFBeEWhxaN/vZO8dv
        S/cFflm2JWXiPG/z7etnzxIu79shwfTngdvpXO+7jpva8qxKI7OlU8L/+HCk9zjtNSjgEAxc
        53goRrE72awyYpnQA9bOBi4xxciFh8yWpUcZqB9yPL2ua06KI8vy6cdr1kUdKpzgGv3yG/ub
        W9W1oVeUuD+wXNCV385fpcUu788csrZdRLlKOCzntfkxvZNNfTM6Jm8v5l0+6yLLi0NR8osL
        S42n7Y20k3mus/zqyxWNb+6t/Lm9uLTK+dpWAT2X+o3BZ5iVTf4900zuCRX+EWctfsbh/ufG
        5ezA9BoX8K+Go8ZF6X2HEktxRqKhFnNRcSIAOIuM9kgDAAA=
X-CMS-MailID: 20210121094159eucas1p2fc9dab217ede409c4cbef118ce479789
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d
References: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
        <CGME20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d@eucas1p2.samsung.com>
        <e512ee85-7fa6-e5fe-eb30-f088bb83cf23@samsung.com>
        <20210118204958.GS4455@sirena.org.uk>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mark,

On 18.01.2021 21:49, Mark Brown wrote:
> On Tue, Jan 12, 2021 at 10:34:19PM +0100, Marek Szyprowski wrote:
>> ======================================================
>> WARNING: possible circular locking dependency detected
>> 5.11.0-rc1-00008-geaa7995c529b #10095 Not tainted
>> ------------------------------------------------------
>> swapper/0/1 is trying to acquire lock:
>> c12e1b80 (regulator_list_mutex){+.+.}-{3:3}, at:
>> regulator_lock_dependent+0x4c/0x2b0
> If you're sending backtraces or other enormous reports like this please
> run them through addr2line first so that things are a bit more leigible.

Well, I had a little time to process that issue, so I just copy-pasted 
the kernel log with the hope it will be useful. The trace is really 
long, but the function call stack is imho readable.

If you need more details about any specific trace, just ask. I don't 
know any good method of processing the raw kernel logs with addr2line 
and keeping things readable.

>> but task is already holding lock:
>> df7190c0 (regulator_ww_class_mutex){+.+.}-{3:3}, at:
>> regulator_resolve_supply+0x44/0x318
>>
>> which lock already depends on the new lock.
> Does this help (completely untested):

Sadly nope. I get same warning:

======================================================
WARNING: possible circular locking dependency detected
5.11.0-rc3-next-20210118-00005-g56a65ff7ca8b #10162 Not tainted
------------------------------------------------------
swapper/0/1 is trying to acquire lock:
c12e1e40 (regulator_list_mutex){+.+.}-{3:3}, at: 
regulator_lock_dependent+0x4c/0x2b4

but task is already holding lock:
df4fe8c0 (regulator_ww_class_mutex){+.+.}-{3:3}, at: 
regulator_resolve_supply+0x98/0x320

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (regulator_ww_class_mutex){+.+.}-{3:3}:
        ww_mutex_lock+0x48/0x88
        regulator_lock_recursive+0x84/0x1f4
        regulator_lock_dependent+0x188/0x2b4
        regulator_enable+0x30/0xe4
        dwc3_exynos_probe+0x17c/0x2c0
        platform_probe+0x80/0xc0
        really_probe+0x1d4/0x4ec
        driver_probe_device+0x78/0x1d8
        device_driver_attach+0x58/0x60
        __driver_attach+0xfc/0x160
        bus_for_each_dev+0x6c/0xb8
        bus_add_driver+0x170/0x20c
        driver_register+0x78/0x10c
        do_one_initcall+0x88/0x438
        kernel_init_freeable+0x190/0x1e0
        kernel_init+0x8/0x118
        ret_from_fork+0x14/0x38
        0x0

-> #1 (regulator_ww_class_acquire){+.+.}-{0:0}:
        regulator_enable+0x30/0xe4
        dwc3_exynos_probe+0x17c/0x2c0
        platform_probe+0x80/0xc0
        really_probe+0x1d4/0x4ec
        driver_probe_device+0x78/0x1d8
        device_driver_attach+0x58/0x60
        __driver_attach+0xfc/0x160
        bus_for_each_dev+0x6c/0xb8
        bus_add_driver+0x170/0x20c
        driver_register+0x78/0x10c
        do_one_initcall+0x88/0x438
        kernel_init_freeable+0x190/0x1e0
        kernel_init+0x8/0x118
        ret_from_fork+0x14/0x38
        0x0

-> #0 (regulator_list_mutex){+.+.}-{3:3}:
        lock_acquire+0x314/0x5d0
        __mutex_lock+0xa4/0xb60
        mutex_lock_nested+0x1c/0x24
        regulator_lock_dependent+0x4c/0x2b4
        regulator_enable+0x30/0xe4
        regulator_resolve_supply+0x1d0/0x320
        regulator_register_resolve_supply+0x14/0x78
        class_for_each_device+0x68/0xe8
        regulator_register+0xa30/0xca0
        devm_regulator_register+0x40/0x70
        tps65090_regulator_probe+0x150/0x648
        platform_probe+0x80/0xc0
        really_probe+0x1d4/0x4ec
        driver_probe_device+0x78/0x1d8
        bus_for_each_drv+0x78/0xbc
        __device_attach+0xe8/0x180
        bus_probe_device+0x88/0x90
        device_add+0x4c8/0x7ec
        platform_device_add+0x120/0x25c
        mfd_add_devices+0x580/0x60c
        tps65090_i2c_probe+0xb8/0x184
        i2c_device_probe+0x234/0x2a4
        really_probe+0x1d4/0x4ec
        driver_probe_device+0x78/0x1d8
        bus_for_each_drv+0x78/0xbc
        __device_attach+0xe8/0x180
        bus_probe_device+0x88/0x90
        device_add+0x4c8/0x7ec
        i2c_new_client_device+0x15c/0x27c
        of_i2c_register_devices+0x114/0x184
        i2c_register_adapter+0x1d8/0x6dc
        ec_i2c_probe+0xc8/0x124
        platform_probe+0x80/0xc0
        really_probe+0x1d4/0x4ec
        driver_probe_device+0x78/0x1d8
        bus_for_each_drv+0x78/0xbc
        __device_attach+0xe8/0x180
        bus_probe_device+0x88/0x90
        device_add+0x4c8/0x7ec
        of_platform_device_create_pdata+0x90/0xc8
        of_platform_bus_create+0x1a0/0x4ec
        of_platform_populate+0x88/0x120
        devm_of_platform_populate+0x40/0x80
        cros_ec_register+0x174/0x308
        cros_ec_spi_probe+0x16c/0x1ec
        spi_probe+0x88/0xac
        really_probe+0x1d4/0x4ec
        driver_probe_device+0x78/0x1d8
        device_driver_attach+0x58/0x60
        __driver_attach+0xfc/0x160
        bus_for_each_dev+0x6c/0xb8
        bus_add_driver+0x170/0x20c
        driver_register+0x78/0x10c
        do_one_initcall+0x88/0x438
        kernel_init_freeable+0x190/0x1e0
        kernel_init+0x8/0x118
        ret_from_fork+0x14/0x38
        0x0

other info that might help us debug this:

Chain exists of:
   regulator_list_mutex --> regulator_ww_class_acquire --> 
regulator_ww_class_mutex

  Possible unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(regulator_ww_class_mutex);
                                lock(regulator_ww_class_acquire);
                                lock(regulator_ww_class_mutex);
   lock(regulator_list_mutex);

  *** DEADLOCK ***

5 locks held by swapper/0/1:
  #0: dfbef0c8 (&dev->mutex){....}-{3:3}, at: device_driver_attach+0x18/0x60
  #1: df4f84d8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x34/0x180
  #2: df4f98e8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x34/0x180
  #3: df509cd8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x34/0x180
  #4: df4fe8c0 (regulator_ww_class_mutex){+.+.}-{3:3}, at: 
regulator_resolve_supply+0x98/0x320

stack backtrace:
CPU: 3 PID: 1 Comm: swapper/0 Not tainted 
5.11.0-rc3-next-20210118-00005-g56a65ff7ca8b #10162
Hardware name: Samsung Exynos (Flattened Device Tree)
[<c01116e8>] (unwind_backtrace) from [<c010cf58>] (show_stack+0x10/0x14)
[<c010cf58>] (show_stack) from [<c0b443c0>] (dump_stack+0xa4/0xc4)
[<c0b443c0>] (dump_stack) from [<c01932e0>] (check_noncircular+0x14c/0x164)
[<c01932e0>] (check_noncircular) from [<c0196a08>] 
(__lock_acquire+0x181c/0x3204)
[<c0196a08>] (__lock_acquire) from [<c01990cc>] (lock_acquire+0x314/0x5d0)
[<c01990cc>] (lock_acquire) from [<c0b4bd54>] (__mutex_lock+0xa4/0xb60)
[<c0b4bd54>] (__mutex_lock) from [<c0b4c82c>] (mutex_lock_nested+0x1c/0x24)
[<c0b4c82c>] (mutex_lock_nested) from [<c05d4544>] 
(regulator_lock_dependent+0x4c/0x2b4)
[<c05d4544>] (regulator_lock_dependent) from [<c05d99c0>] 
(regulator_enable+0x30/0xe4)
[<c05d99c0>] (regulator_enable) from [<c05d9c44>] 
(regulator_resolve_supply+0x1d0/0x320)
[<c05d9c44>] (regulator_resolve_supply) from [<c05da130>] 
(regulator_register_resolve_supply+0x14/0x78)
[<c05da130>] (regulator_register_resolve_supply) from [<c06aba80>] 
(class_for_each_device+0x68/0xe8)
[<c06aba80>] (class_for_each_device) from [<c05db5e0>] 
(regulator_register+0xa30/0xca0)
[<c05db5e0>] (regulator_register) from [<c05dd430>] 
(devm_regulator_register+0x40/0x70)
[<c05dd430>] (devm_regulator_register) from [<c05e6218>] 
(tps65090_regulator_probe+0x150/0x648)
[<c05e6218>] (tps65090_regulator_probe) from [<c06aca70>] 
(platform_probe+0x80/0xc0)
[<c06aca70>] (platform_probe) from [<c06a9b9c>] (really_probe+0x1d4/0x4ec)
[<c06a9b9c>] (really_probe) from [<c06a9f2c>] 
(driver_probe_device+0x78/0x1d8)
[<c06a9f2c>] (driver_probe_device) from [<c06a7c24>] 
(bus_for_each_drv+0x78/0xbc)
[<c06a7c24>] (bus_for_each_drv) from [<c06a9928>] 
(__device_attach+0xe8/0x180)
[<c06a9928>] (__device_attach) from [<c06a89d0>] 
(bus_probe_device+0x88/0x90)
[<c06a89d0>] (bus_probe_device) from [<c06a662c>] (device_add+0x4c8/0x7ec)
[<c06a662c>] (device_add) from [<c06ac634>] 
(platform_device_add+0x120/0x25c)
[<c06ac634>] (platform_device_add) from [<c06de87c>] 
(mfd_add_devices+0x580/0x60c)
[<c06de87c>] (mfd_add_devices) from [<c06e0ce8>] 
(tps65090_i2c_probe+0xb8/0x184)
[<c06e0ce8>] (tps65090_i2c_probe) from [<c082d2b8>] 
(i2c_device_probe+0x234/0x2a4)
[<c082d2b8>] (i2c_device_probe) from [<c06a9b9c>] (really_probe+0x1d4/0x4ec)
[<c06a9b9c>] (really_probe) from [<c06a9f2c>] 
(driver_probe_device+0x78/0x1d8)
[<c06a9f2c>] (driver_probe_device) from [<c06a7c24>] 
(bus_for_each_drv+0x78/0xbc)
[<c06a7c24>] (bus_for_each_drv) from [<c06a9928>] 
(__device_attach+0xe8/0x180)
[<c06a9928>] (__device_attach) from [<c06a89d0>] 
(bus_probe_device+0x88/0x90)
[<c06a89d0>] (bus_probe_device) from [<c06a662c>] (device_add+0x4c8/0x7ec)
[<c06a662c>] (device_add) from [<c082f884>] 
(i2c_new_client_device+0x15c/0x27c)
[<c082f884>] (i2c_new_client_device) from [<c08332dc>] 
(of_i2c_register_devices+0x114/0x184)
[<c08332dc>] (of_i2c_register_devices) from [<c0830250>] 
(i2c_register_adapter+0x1d8/0x6dc)
[<c0830250>] (i2c_register_adapter) from [<c0838a1c>] 
(ec_i2c_probe+0xc8/0x124)
[<c0838a1c>] (ec_i2c_probe) from [<c06aca70>] (platform_probe+0x80/0xc0)
[<c06aca70>] (platform_probe) from [<c06a9b9c>] (really_probe+0x1d4/0x4ec)
[<c06a9b9c>] (really_probe) from [<c06a9f2c>] 
(driver_probe_device+0x78/0x1d8)
[<c06a9f2c>] (driver_probe_device) from [<c06a7c24>] 
(bus_for_each_drv+0x78/0xbc)
[<c06a7c24>] (bus_for_each_drv) from [<c06a9928>] 
(__device_attach+0xe8/0x180)
[<c06a9928>] (__device_attach) from [<c06a89d0>] 
(bus_probe_device+0x88/0x90)
[<c06a89d0>] (bus_probe_device) from [<c06a662c>] (device_add+0x4c8/0x7ec)
[<c06a662c>] (device_add) from [<c08bba20>] 
(of_platform_device_create_pdata+0x90/0xc8)
[<c08bba20>] (of_platform_device_create_pdata) from [<c08bbc04>] 
(of_platform_bus_create+0x1a0/0x4ec)
[<c08bbc04>] (of_platform_bus_create) from [<c08bc104>] 
(of_platform_populate+0x88/0x120)
[<c08bc104>] (of_platform_populate) from [<c08bc1f0>] 
(devm_of_platform_populate+0x40/0x80)
[<c08bc1f0>] (devm_of_platform_populate) from [<c08c1910>] 
(cros_ec_register+0x174/0x308)
[<c08c1910>] (cros_ec_register) from [<c08c2ca0>] 
(cros_ec_spi_probe+0x16c/0x1ec)
[<c08c2ca0>] (cros_ec_spi_probe) from [<c07240fc>] (spi_probe+0x88/0xac)
[<c07240fc>] (spi_probe) from [<c06a9b9c>] (really_probe+0x1d4/0x4ec)
[<c06a9b9c>] (really_probe) from [<c06a9f2c>] 
(driver_probe_device+0x78/0x1d8)
[<c06a9f2c>] (driver_probe_device) from [<c06aa444>] 
(device_driver_attach+0x58/0x60)
[<c06aa444>] (device_driver_attach) from [<c06aa548>] 
(__driver_attach+0xfc/0x160)
[<c06aa548>] (__driver_attach) from [<c06a7b4c>] 
(bus_for_each_dev+0x6c/0xb8)
[<c06a7b4c>] (bus_for_each_dev) from [<c06a8c84>] 
(bus_add_driver+0x170/0x20c)
[<c06a8c84>] (bus_add_driver) from [<c06ab3e8>] (driver_register+0x78/0x10c)
[<c06ab3e8>] (driver_register) from [<c0102428>] 
(do_one_initcall+0x88/0x438)
[<c0102428>] (do_one_initcall) from [<c11010d4>] 
(kernel_init_freeable+0x190/0x1e0)
[<c11010d4>] (kernel_init_freeable) from [<c0b47db0>] 
(kernel_init+0x8/0x118)
[<c0b47db0>] (kernel_init) from [<c010011c>] (ret_from_fork+0x14/0x38)
Exception stack(0xc1ce3fb0 to 0xc1ce3ff8)

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

