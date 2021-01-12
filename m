Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0312E2F3DF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jan 2021 01:44:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732062AbhALVuM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 16:50:12 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:57713 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727227AbhALVfL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 16:35:11 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210112213421euoutp02e6d814053da7365b8a3db8d1283a1065~ZmaGmaVK40716007160euoutp02p
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 21:34:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210112213421euoutp02e6d814053da7365b8a3db8d1283a1065~ZmaGmaVK40716007160euoutp02p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1610487261;
        bh=oXdva/fWwYF5r4uA7T00QBbpGyoI3CqqsZp7pxJj1qU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=QnzLYq01bIgHQfxtwqcbkNDq89W4UL1jdZBOo7lW8HPnJJrMNDpPDERDunsvMHAyS
         6+k65wRNy5tFjda1ss98FRwXEmU74+Idm5hLdyjOsUJI5EsnLZfz0CS0ds5l8E53ME
         RVxUGiXC8Gz+jZ8knvMYtq2+hKSu2MaXzyT7913c=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210112213420eucas1p152fea143540c1b2afe9163a0a16431b1~ZmaFnFEWl0691606916eucas1p1J;
        Tue, 12 Jan 2021 21:34:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id F3.18.44805.CD51EFF5; Tue, 12
        Jan 2021 21:34:20 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d~ZmaFHC0g22119621196eucas1p2l;
        Tue, 12 Jan 2021 21:34:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20210112213419eusmtrp27281e73a9d82281603a5afc665caa771~ZmaFGYIje2034120341eusmtrp2V;
        Tue, 12 Jan 2021 21:34:19 +0000 (GMT)
X-AuditID: cbfec7f4-b37ff7000000af05-a5-5ffe15dc0fe4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 2B.8A.21957.BD51EFF5; Tue, 12
        Jan 2021 21:34:19 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210112213419eusmtip2b29f4c20712384402d3d2e00f3c198a8~ZmaEkbqCm2880828808eusmtip2B;
        Tue, 12 Jan 2021 21:34:19 +0000 (GMT)
Subject: Re: [PATCH] regulator: core: avoid regulator_resolve_supply() race
 condition
To:     David Collins <collinsd@codeaurora.org>,
        Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <e512ee85-7fa6-e5fe-eb30-f088bb83cf23@samsung.com>
Date:   Tue, 12 Jan 2021 22:34:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djPc7p3RP/FG3Qd4rTYOGM9q8XUh0/Y
        LLrahCzOn9/AbvHtSgeTxcT9Z9ktLu+aw2Yx4/w+JgcOj8t9vUweO2fdZffYtKqTzaNvyypG
        j8+b5AJYo7hsUlJzMstSi/TtErgy9n/5ylLQ0MhY8frhKeYGxn95XYycHBICJhKbpjYzdjFy
        cQgJrGCUmLP+PhOE84VRonvDIRYI5zOjxJqGD6wwLfOWzIBKLGeUWN98ix3C+cgosWD1ZXaQ
        KmGBcIm1/36ygNgiAlcYJR6fiACxmQWqJDp6ZjCC2GwChhJdb7vYQGxeATuJdbNngdksAqoS
        c6ZOBOsVFUiSOL6vmxmiRlDi5MwnYHFOAXeJdVu7WCBmyks0b53NDGGLS9x6Mh/sBwmBBxwS
        HxquMUGc7SIxc/lNdghbWOLV8S1QtozE/50wDc2MEg/PrWWHcHoYJS43QZwqIWAtcefcL6Dz
        OIBWaEqs36UPEXaUmLriKTNIWEKAT+LGW0GII/gkJm2bDhXmlehoE4KoVpOYdXwd3NqDFy4x
        T2BUmoXktVlI3pmF5J1ZCHsXMLKsYhRPLS3OTU8tNspLLdcrTswtLs1L10vOz93ECExIp/8d
        /7KDcfmrj3qHGJk4GA8xSnAwK4nwFnX/jRfiTUmsrEotyo8vKs1JLT7EKM3BoiTOm7RlTbyQ
        QHpiSWp2ampBahFMlomDU6qBSbKJ/Vdn8ZRdnnceZnep/jR3Oj49uunn2epW2znpd/1WF/7+
        8UFERlnN07nE4MKWE74LbENC3+SpByrEzOt/O+mGta2/gOzmBsctX3++OqnZ2rT9l9HR6TEh
        m1btLGVV8l3093Pr5I55RxdvkxULqZTs3e7zND7jbEb/hgubnutc5Hvw8+G/zROu3Jv2U+xd
        wkvLfRyM0WsPOCwpvHfnGHNVd+9f0Z3XHvx4Jmlw7Ff0lhb57CPHd69wO/Xxb+u328JMAYU7
        md7wnZmtPfnRB9FvJ89JepwpWyap9EPm47dfJdPOddRKG5spbOYvDWhYevaS7Sbb+JvVV2dN
        SpsYdTSq5YNxpGrA2UVMHBK9rH+VWIozEg21mIuKEwEhaIIntwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsVy+t/xe7q3Rf/FG/y6pmqxccZ6VoupD5+w
        WXS1CVmcP7+B3eLblQ4mi4n7z7JbXN41h81ixvl9TA4cHpf7epk8ds66y+6xaVUnm0ffllWM
        Hp83yQWwRunZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq6dvZpKTmZJalFunb
        Jehl7P/ylaWgoZGx4vXDU8wNjP/yuhg5OSQETCTmLZnB0sXIxSEksJRR4lVLFytEQkbi5LQG
        KFtY4s+1LjaIoveMEpN7IBLCAuESa//9BOsWEbjEKHGqo5cJJMEsUCXR9rSfEcQWEnCT+PS1
        gxnEZhMwlOh6CzKJk4NXwE5i3exZYDaLgKrEnKkTgQZxcIgKJEksfusEUSIocXLmExYQm1PA
        XWLd1i4WiPFmEvM2P2SGsOUlmrfOhrLFJW49mc80gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS
        4tz03GJDveLE3OLSvHS95PzcTYzA+Nt27OfmHYzzXn3UO8TIxMF4iFGCg1lJhLeo+2+8EG9K
        YmVValF+fFFpTmrxIUZToHcmMkuJJucDE0BeSbyhmYGpoYmZpYGppZmxkjjv1rlr4oUE0hNL
        UrNTUwtSi2D6mDg4pRqY6rM2XbpY+fBCXB6XkiHT3hdbd8fMsfwofoqjuTLxxsa0YgbTX/zZ
        nWqhC2/wvE+v/6x3UKpq/r3mb4HyJduki9T2LF/szVJo9L5H8Ne78BnrHsbe3PvC13LJI0aV
        1QtCpT4xtwnJXrxlHcq/T+e+VvrXF9PKrp/XjJpRpOTs/eJKsELEe5dXS5fukWI9e86cV2PP
        wvYlco9n91V47fzV21ZpzR/XuJI5602MjJTauZM3DzKfjFt8XkPj8A5hz39JMcaJNRNfewfF
        LlpiUx9aGqNozG3zh3+i5Cw7i00eAk+KJVe/kuWxFetP3vi+bp/aXk6v/2ybfaas5xdfxPVx
        RWea+5utMWtdpO4udzZWYinOSDTUYi4qTgQAH2DXFkgDAAA=
X-CMS-MailID: 20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d
References: <1610068562-4410-1-git-send-email-collinsd@codeaurora.org>
        <CGME20210112213419eucas1p24231e4d0ac11c31184f2f8f3f20cbd9d@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 08.01.2021 02:16, David Collins wrote:
> The final step in regulator_register() is to call
> regulator_resolve_supply() for each registered regulator
> (including the one in the process of being registered).  The
> regulator_resolve_supply() function first checks if rdev->supply
> is NULL, then it performs various steps to try to find the supply.
> If successful, rdev->supply is set inside of set_supply().
>
> This procedure can encounter a race condition if two concurrent
> tasks call regulator_register() near to each other on separate CPUs
> and one of the regulators has rdev->supply_name specified.  There
> is currently nothing guaranteeing atomicity between the rdev->supply
> check and set steps.  Thus, both tasks can observe rdev->supply==NULL
> in their regulator_resolve_supply() calls.  This then results in
> both creating a struct regulator for the supply.  One ends up
> actually stored in rdev->supply and the other is lost (though still
> present in the supply's consumer_list).
>
> Here is a kernel log snippet showing the issue:
>
> [   12.421768] gpu_cc_gx_gdsc: supplied by pm8350_s5_level
> [   12.425854] gpu_cc_gx_gdsc: supplied by pm8350_s5_level
> [   12.429064] debugfs: Directory 'regulator.4-SUPPLY' with parent
>                 '17a00000.rsc:rpmh-regulator-gfxlvl-pm8350_s5_level'
>                 already present!
>
> Avoid this race condition by holding the rdev->mutex lock inside
> of regulator_resolve_supply() while checking and setting
> rdev->supply.
>
> Signed-off-by: David Collins <collinsd@codeaurora.org>

This patch landed in linux next-20210112 as commit eaa7995c529b 
("regulator: core: avoid regulator_resolve_supply() race condition"). I 
found that it triggers a following lockdep warning during the DWC3 
driver registration on some Exynos based boards (this log is from 
Samsung Exynos5420-based Peach-Pit board):

======================================================
WARNING: possible circular locking dependency detected
5.11.0-rc1-00008-geaa7995c529b #10095 Not tainted
------------------------------------------------------
swapper/0/1 is trying to acquire lock:
c12e1b80 (regulator_list_mutex){+.+.}-{3:3}, at: 
regulator_lock_dependent+0x4c/0x2b0

but task is already holding lock:
df7190c0 (regulator_ww_class_mutex){+.+.}-{3:3}, at: 
regulator_resolve_supply+0x44/0x318

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (regulator_ww_class_mutex){+.+.}-{3:3}:
        ww_mutex_lock+0x48/0x88
        regulator_lock_recursive+0x84/0x1f4
        regulator_lock_dependent+0x184/0x2b0
        regulator_enable+0x30/0xe4
        dwc3_exynos_probe+0x17c/0x2c0
        platform_probe+0x80/0xc0
        really_probe+0x1c4/0x4e4
        driver_probe_device+0x78/0x1d8
        device_driver_attach+0x58/0x60
        __driver_attach+0xfc/0x160
        bus_for_each_dev+0x6c/0xb8
        bus_add_driver+0x170/0x20c
        driver_register+0x78/0x10c
        do_one_initcall+0x88/0x438
        kernel_init_freeable+0x18c/0x1dc
        kernel_init+0x8/0x118
        ret_from_fork+0x14/0x38
        0x0

-> #1 (regulator_ww_class_acquire){+.+.}-{0:0}:
        regulator_enable+0x30/0xe4
        dwc3_exynos_probe+0x17c/0x2c0
        platform_probe+0x80/0xc0
        really_probe+0x1c4/0x4e4
        driver_probe_device+0x78/0x1d8
        device_driver_attach+0x58/0x60
        __driver_attach+0xfc/0x160
        bus_for_each_dev+0x6c/0xb8
        bus_add_driver+0x170/0x20c
        driver_register+0x78/0x10c
        do_one_initcall+0x88/0x438
        kernel_init_freeable+0x18c/0x1dc
        kernel_init+0x8/0x118
        ret_from_fork+0x14/0x38
        0x0

-> #0 (regulator_list_mutex){+.+.}-{3:3}:
        lock_acquire+0x2e4/0x5dc
        __mutex_lock+0xa4/0xb60
        mutex_lock_nested+0x1c/0x24
        regulator_lock_dependent+0x4c/0x2b0
        regulator_enable+0x30/0xe4
        regulator_resolve_supply+0x1cc/0x318
        regulator_register_resolve_supply+0x14/0x78
        class_for_each_device+0x68/0xe8
        regulator_register+0xa2c/0xc9c
        devm_regulator_register+0x40/0x70
        tps65090_regulator_probe+0x150/0x648
        platform_probe+0x80/0xc0
        really_probe+0x1c4/0x4e4
        driver_probe_device+0x78/0x1d8
        bus_for_each_drv+0x78/0xbc
        __device_attach+0xe8/0x180
        bus_probe_device+0x88/0x90
        device_add+0x4c4/0x7e8
        platform_device_add+0x120/0x25c
        mfd_add_devices+0x580/0x60c
        tps65090_i2c_probe+0xb8/0x184
        i2c_device_probe+0x234/0x2a4
        really_probe+0x1c4/0x4e4
        driver_probe_device+0x78/0x1d8
        bus_for_each_drv+0x78/0xbc
        __device_attach+0xe8/0x180
        bus_probe_device+0x88/0x90
        device_add+0x4c4/0x7e8
        i2c_new_client_device+0x15c/0x27c
        of_i2c_register_devices+0x114/0x184
        i2c_register_adapter+0x1d8/0x6dc
        ec_i2c_probe+0xc8/0x124
        platform_probe+0x80/0xc0
        really_probe+0x1c4/0x4e4
        driver_probe_device+0x78/0x1d8
        bus_for_each_drv+0x78/0xbc
        __device_attach+0xe8/0x180
        bus_probe_device+0x88/0x90
        device_add+0x4c4/0x7e8
        of_platform_device_create_pdata+0x90/0xc8
        of_platform_bus_create+0x1a0/0x4ec
        of_platform_populate+0x88/0x120
        devm_of_platform_populate+0x40/0x80
        cros_ec_register+0x174/0x308
        cros_ec_spi_probe+0x16c/0x1ec
        spi_probe+0x88/0xac
        really_probe+0x1c4/0x4e4
        driver_probe_device+0x78/0x1d8
        device_driver_attach+0x58/0x60
        __driver_attach+0xfc/0x160
        bus_for_each_dev+0x6c/0xb8
        bus_add_driver+0x170/0x20c
        driver_register+0x78/0x10c
        do_one_initcall+0x88/0x438
        kernel_init_freeable+0x18c/0x1dc
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
  #0: dfb6e4c8 (&dev->mutex){....}-{3:3}, at: device_driver_attach+0x18/0x60
  #1: c1fedcd8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x34/0x180
  #2: df53a4e8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x34/0x180
  #3: df5224d8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x34/0x180
  #4: df7190c0 (regulator_ww_class_mutex){+.+.}-{3:3}, at: 
regulator_resolve_supply+0x44/0x318

stack backtrace:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.11.0-rc1-00008-geaa7995c529b 
#10095
Hardware name: Samsung Exynos (Flattened Device Tree)
[<c01116e8>] (unwind_backtrace) from [<c010cf58>] (show_stack+0x10/0x14)
[<c010cf58>] (show_stack) from [<c0b38ffc>] (dump_stack+0xa4/0xc4)
[<c0b38ffc>] (dump_stack) from [<c0193458>] (check_noncircular+0x14c/0x164)
[<c0193458>] (check_noncircular) from [<c0196b90>] 
(__lock_acquire+0x1830/0x31cc)
[<c0196b90>] (__lock_acquire) from [<c01991e4>] (lock_acquire+0x2e4/0x5dc)
[<c01991e4>] (lock_acquire) from [<c0b4043c>] (__mutex_lock+0xa4/0xb60)
[<c0b4043c>] (__mutex_lock) from [<c0b40f14>] (mutex_lock_nested+0x1c/0x24)
[<c0b40f14>] (mutex_lock_nested) from [<c05ccd94>] 
(regulator_lock_dependent+0x4c/0x2b0)
[<c05ccd94>] (regulator_lock_dependent) from [<c05d220c>] 
(regulator_enable+0x30/0xe4)
[<c05d220c>] (regulator_enable) from [<c05d248c>] 
(regulator_resolve_supply+0x1cc/0x318)
[<c05d248c>] (regulator_resolve_supply) from [<c05d2974>] 
(regulator_register_resolve_supply+0x14/0x78)
[<c05d2974>] (regulator_register_resolve_supply) from [<c06a3000>] 
(class_for_each_device+0x68/0xe8)
[<c06a3000>] (class_for_each_device) from [<c05d3e20>] 
(regulator_register+0xa2c/0xc9c)
[<c05d3e20>] (regulator_register) from [<c05d5c70>] 
(devm_regulator_register+0x40/0x70)
[<c05d5c70>] (devm_regulator_register) from [<c05dea58>] 
(tps65090_regulator_probe+0x150/0x648)
[<c05dea58>] (tps65090_regulator_probe) from [<c06a3fe8>] 
(platform_probe+0x80/0xc0)
[<c06a3fe8>] (platform_probe) from [<c06a1114>] (really_probe+0x1c4/0x4e4)
[<c06a1114>] (really_probe) from [<c06a14ac>] 
(driver_probe_device+0x78/0x1d8)
[<c06a14ac>] (driver_probe_device) from [<c069f1a4>] 
(bus_for_each_drv+0x78/0xbc)
[<c069f1a4>] (bus_for_each_drv) from [<c06a0eb0>] 
(__device_attach+0xe8/0x180)
[<c06a0eb0>] (__device_attach) from [<c069ff50>] 
(bus_probe_device+0x88/0x90)
[<c069ff50>] (bus_probe_device) from [<c069dbac>] (device_add+0x4c4/0x7e8)
[<c069dbac>] (device_add) from [<c06a3bac>] 
(platform_device_add+0x120/0x25c)
[<c06a3bac>] (platform_device_add) from [<c06d5c7c>] 
(mfd_add_devices+0x580/0x60c)
[<c06d5c7c>] (mfd_add_devices) from [<c06d80e8>] 
(tps65090_i2c_probe+0xb8/0x184)
[<c06d80e8>] (tps65090_i2c_probe) from [<c0822520>] 
(i2c_device_probe+0x234/0x2a4)
[<c0822520>] (i2c_device_probe) from [<c06a1114>] (really_probe+0x1c4/0x4e4)
[<c06a1114>] (really_probe) from [<c06a14ac>] 
(driver_probe_device+0x78/0x1d8)
[<c06a14ac>] (driver_probe_device) from [<c069f1a4>] 
(bus_for_each_drv+0x78/0xbc)
[<c069f1a4>] (bus_for_each_drv) from [<c06a0eb0>] 
(__device_attach+0xe8/0x180)
[<c06a0eb0>] (__device_attach) from [<c069ff50>] 
(bus_probe_device+0x88/0x90)
[<c069ff50>] (bus_probe_device) from [<c069dbac>] (device_add+0x4c4/0x7e8)
[<c069dbac>] (device_add) from [<c0824aec>] 
(i2c_new_client_device+0x15c/0x27c)
[<c0824aec>] (i2c_new_client_device) from [<c08285e0>] 
(of_i2c_register_devices+0x114/0x184)
[<c08285e0>] (of_i2c_register_devices) from [<c08254b8>] 
(i2c_register_adapter+0x1d8/0x6dc)
[<c08254b8>] (i2c_register_adapter) from [<c082dd1c>] 
(ec_i2c_probe+0xc8/0x124)
[<c082dd1c>] (ec_i2c_probe) from [<c06a3fe8>] (platform_probe+0x80/0xc0)
[<c06a3fe8>] (platform_probe) from [<c06a1114>] (really_probe+0x1c4/0x4e4)
[<c06a1114>] (really_probe) from [<c06a14ac>] 
(driver_probe_device+0x78/0x1d8)
[<c06a14ac>] (driver_probe_device) from [<c069f1a4>] 
(bus_for_each_drv+0x78/0xbc)
[<c069f1a4>] (bus_for_each_drv) from [<c06a0eb0>] 
(__device_attach+0xe8/0x180)
[<c06a0eb0>] (__device_attach) from [<c069ff50>] 
(bus_probe_device+0x88/0x90)
[<c069ff50>] (bus_probe_device) from [<c069dbac>] (device_add+0x4c4/0x7e8)
[<c069dbac>] (device_add) from [<c08b140c>] 
(of_platform_device_create_pdata+0x90/0xc8)
[<c08b140c>] (of_platform_device_create_pdata) from [<c08b15f0>] 
(of_platform_bus_create+0x1a0/0x4ec)
[<c08b15f0>] (of_platform_bus_create) from [<c08b1af0>] 
(of_platform_populate+0x88/0x120)
[<c08b1af0>] (of_platform_populate) from [<c08b1bdc>] 
(devm_of_platform_populate+0x40/0x80)
[<c08b1bdc>] (devm_of_platform_populate) from [<c08b72fc>] 
(cros_ec_register+0x174/0x308)
[<c08b72fc>] (cros_ec_register) from [<c08b868c>] 
(cros_ec_spi_probe+0x16c/0x1ec)
[<c08b868c>] (cros_ec_spi_probe) from [<c071b2f4>] (spi_probe+0x88/0xac)
[<c071b2f4>] (spi_probe) from [<c06a1114>] (really_probe+0x1c4/0x4e4)
[<c06a1114>] (really_probe) from [<c06a14ac>] 
(driver_probe_device+0x78/0x1d8)
[<c06a14ac>] (driver_probe_device) from [<c06a19c4>] 
(device_driver_attach+0x58/0x60)
[<c06a19c4>] (device_driver_attach) from [<c06a1ac8>] 
(__driver_attach+0xfc/0x160)
[<c06a1ac8>] (__driver_attach) from [<c069f0cc>] 
(bus_for_each_dev+0x6c/0xb8)
[<c069f0cc>] (bus_for_each_dev) from [<c06a0204>] 
(bus_add_driver+0x170/0x20c)
[<c06a0204>] (bus_add_driver) from [<c06a2968>] (driver_register+0x78/0x10c)
[<c06a2968>] (driver_register) from [<c0102428>] 
(do_one_initcall+0x88/0x438)
[<c0102428>] (do_one_initcall) from [<c1101104>] 
(kernel_init_freeable+0x18c/0x1dc)
[<c1101104>] (kernel_init_freeable) from [<c0b3c65c>] 
(kernel_init+0x8/0x118)
[<c0b3c65c>] (kernel_init) from [<c010011c>] (ret_from_fork+0x14/0x38)
Exception stack(0xc1ce3fb0 to 0xc1ce3ff8)
3fa0:                                     00000000 00000000 00000000 
00000000
3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
00000000
3fe0: 00000000 00000000 00000000 00000000 00000013 00000000

I didn't analyze it yet if this warning is really an issue or just a 
false positive. If you have any hints or comments let me know.

> ---
>   drivers/regulator/core.c | 39 ++++++++++++++++++++++++++++-----------
>   1 file changed, 28 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
> index fee9241..3ae5ccd 100644
> --- a/drivers/regulator/core.c
> +++ b/drivers/regulator/core.c
> @@ -1813,23 +1813,34 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>   {
>   	struct regulator_dev *r;
>   	struct device *dev = rdev->dev.parent;
> -	int ret;
> +	int ret = 0;
>   
>   	/* No supply to resolve? */
>   	if (!rdev->supply_name)
>   		return 0;
>   
> -	/* Supply already resolved? */
> +	/* Supply already resolved? (fast-path without locking contention) */
>   	if (rdev->supply)
>   		return 0;
>   
> +	/*
> +	 * Recheck rdev->supply with rdev->mutex lock held to avoid a race
> +	 * between rdev->supply null check and setting rdev->supply in
> +	 * set_supply() from concurrent tasks.
> +	 */
> +	regulator_lock(rdev);
> +
> +	/* Supply just resolved by a concurrent task? */
> +	if (rdev->supply)
> +		goto out;
> +
>   	r = regulator_dev_lookup(dev, rdev->supply_name);
>   	if (IS_ERR(r)) {
>   		ret = PTR_ERR(r);
>   
>   		/* Did the lookup explicitly defer for us? */
>   		if (ret == -EPROBE_DEFER)
> -			return ret;
> +			goto out;
>   
>   		if (have_full_constraints()) {
>   			r = dummy_regulator_rdev;
> @@ -1837,15 +1848,18 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>   		} else {
>   			dev_err(dev, "Failed to resolve %s-supply for %s\n",
>   				rdev->supply_name, rdev->desc->name);
> -			return -EPROBE_DEFER;
> +			ret = -EPROBE_DEFER;
> +			goto out;
>   		}
>   	}
>   
>   	if (r == rdev) {
>   		dev_err(dev, "Supply for %s (%s) resolved to itself\n",
>   			rdev->desc->name, rdev->supply_name);
> -		if (!have_full_constraints())
> -			return -EINVAL;
> +		if (!have_full_constraints()) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
>   		r = dummy_regulator_rdev;
>   		get_device(&r->dev);
>   	}
> @@ -1859,7 +1873,8 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>   	if (r->dev.parent && r->dev.parent != rdev->dev.parent) {
>   		if (!device_is_bound(r->dev.parent)) {
>   			put_device(&r->dev);
> -			return -EPROBE_DEFER;
> +			ret = -EPROBE_DEFER;
> +			goto out;
>   		}
>   	}
>   
> @@ -1867,13 +1882,13 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>   	ret = regulator_resolve_supply(r);
>   	if (ret < 0) {
>   		put_device(&r->dev);
> -		return ret;
> +		goto out;
>   	}
>   
>   	ret = set_supply(rdev, r);
>   	if (ret < 0) {
>   		put_device(&r->dev);
> -		return ret;
> +		goto out;
>   	}
>   
>   	/*
> @@ -1886,11 +1901,13 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
>   		if (ret < 0) {
>   			_regulator_put(rdev->supply);
>   			rdev->supply = NULL;
> -			return ret;
> +			goto out;
>   		}
>   	}
>   
> -	return 0;
> +out:
> +	regulator_unlock(rdev);
> +	return ret;
>   }
>   
>   /* Internal regulator request function */

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

