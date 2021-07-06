Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D7D93BC87C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 11:27:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbhGFJaN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 05:30:13 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:57064 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbhGFJaN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 05:30:13 -0400
Date:   Tue, 06 Jul 2021 09:26:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625563621;
        bh=u9sMUys0DqY/70UU3BBFv/mdCXUoxaApIn7OF4n3Wuc=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=vwhA4Tnu7BIGvRn1NvRmFAPpThomORJvx3eMXyRluYx09jm0lfH9UONOA5GiyN6n+
         llsMD24TFzfuuxZEDnAFaC7e7nvPcZ2HXTVGVMStTPn8CuqGnal5HgbOsYcvIG7BeU
         etU8KROUrp0tqHjHPyVFnUM+OpC2vskK9+3sgfEM=
To:     "will@kernel.org" <will@kernel.org>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     "ardb@kernel.org" <ardb@kernel.org>,
        "arnd@arndb.de" <arnd@arndb.de>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "kernel-team@android.com" <kernel-team@android.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "vincent.whitchurch@axis.com" <vincent.whitchurch@axis.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64 (L1_CACHE_BYTES)
Message-ID: <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In-Reply-To: <20210527124356.22367-1-will@kernel.org>

> Reduce ARCH_DMA_MINALIGN to 64 bytes and allow the warning/taint to
> indicate if there are machines that unknowingly rely on this.

The warning is being triggered on Qualcomm MSM8996, as well as the out-of-s=
pec taint:

------------[ cut here ]------------
rtc-pm8xxx 400f000.qcom,spmi:pmic@0:rtc@6000: ARCH_DMA_MINALIGN smaller tha=
n CTR_EL0.CWG (64 < 128)
WARNING: CPU: 0 PID: 1 at arch/arm64/mm/dma-mapping.c:45 arch_setup_dma_ops=
+0xf8/0x10c
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Tainted: G S                5.13.0+ #43
Hardware name: Xiaomi Mi Note 2 (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO BTYPE=3D--)
pc : arch_setup_dma_ops+0xf8/0x10c
lr : arch_setup_dma_ops+0xf8/0x10c
sp : ffff80001003bb50
x29: ffff80001003bb50 x28: 0000000000000000 x27: ffff800010ee04c0
x26: ffff800010f41060 x25: 00000000ffffffff x24: 0000000000000000
x23: 0000000000000080 x22: 0000000000000000 x21: 0000000000000000
x20: 0000000100000000 x19: ffff00008143e010 x18: ffffffffffffffff
x17: 696c206f74205d72 x16: 656874655f675b20 x15: ffff800011212d34
x14: 0000000000000000 x13: ffff8000110d4620 x12: 0000000000001047
x11: 000000000000056d x10: ffff8000110d4620 x9 : ffff8000110d4620
x8 : 00000000ffffefff x7 : ffff80001112c620 x6 : ffff80001112c620
x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff000080098000
Call trace:
arch_setup_dma_ops+0xf8/0x10c
of_dma_configure_id+0x120/0x2a4
platform_dma_configure+0x24/0x40
really_probe.part.0+0x50/0x2fc
__driver_probe_device+0x98/0x144
driver_probe_device+0xc8/0x15c
__driver_attach+0xf8/0x190
bus_for_each_dev+0x70/0xd0
driver_attach+0x24/0x30
bus_add_driver+0x104/0x1ec
driver_register+0x78/0x130
__platform_driver_register+0x28/0x34
pm8xxx_rtc_driver_init+0x1c/0x28
do_one_initcall+0x50/0x1b0
kernel_init_freeable+0x214/0x298
kernel_init+0x28/0x12c
ret_from_fork+0x10/0x18
---[ end trace 09b7616a3af9b190 ]---

This warning is triggered with nearly every driver probe, not only rtc-pm8x=
xx.
