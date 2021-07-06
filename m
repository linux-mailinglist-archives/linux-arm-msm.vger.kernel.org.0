Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9993BDE75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 22:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbhGFUgy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 16:36:54 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:48975 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229781AbhGFUgw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 16:36:52 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MkYsS-1lKKh02Qko-00m6u0 for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul
 2021 22:34:12 +0200
Received: by mail-wr1-f52.google.com with SMTP id i8so413426wrp.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 13:34:12 -0700 (PDT)
X-Gm-Message-State: AOAM5330XiKzO8LyuiwkZ2kWIL+0h92Gl795EpN45//d5TFXLWTVAcGj
        7MEMorJoi+froCZNuDJeKAElVTkHsbUMZQxZOvE=
X-Google-Smtp-Source: ABdhPJxr8Z9KUUIthRbx8NWpyZJ4RwE3JYLin40N5YqfPo6mCGWEH4smcwk5s62sDCLsLS/J9Ru0N0IBCTiscuPA7Sg=
X-Received: by 2002:adf:e107:: with SMTP id t7mr23967237wrz.165.1625603652293;
 Tue, 06 Jul 2021 13:34:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210527124356.22367-1-will@kernel.org> <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
 <20210706102634.GB24903@arm.com> <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck> <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
 <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
 <87zguz7b6b.wl-maz@kernel.org> <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
 <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
In-Reply-To: <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 6 Jul 2021 22:33:56 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
Message-ID: <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64 (L1_CACHE_BYTES)
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ZqDrh4W/x+ErXRApfdKflKkI0AyRw4gQ/i55sDZ1tPYRuwIt0YD
 O+Dhp0WQXs0j/HjN0V3xuxfm1/uwYB/o4X56HGN4udR7t3EqTlZZCbx2bQ1EBqfn2A5k35j
 PD0XheaTtO6/nkdtSDzP29cckFb7C9UYt2xNG/aK+QVshaMgm9aKIKTZ2RkqUJlfFYmQhxX
 2uEn9LqvOdeoDs+QenAug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6+xdlNhDPo0=:AOZfeQzRGMDhxgHmcWqrm6
 ZLdoEtS9q3YGwFVt10T18QMsVfZYpIU50rHzd2MBTxuZAIHWUfxpU3lxaYPglVkJauJvEZiLh
 Fk70xOvlN25gHGqFdFv2Vmt5hta0OtdaTTMAhz8LToPl9sjYp9W6NDPHiQyFt7bAEtKBQlcHE
 VRRAVqxSbhLqY/UFHX0C7ZaMDDagya+2ul5y+YGkM/pquRlqENGBJah3CwsXPicMxsA/tZQRi
 WHxgo2/FfEwP4gm26k+L3IITnUP+p6Qbxt1WtNM1sXr5ncU7FLONmjcuqr3dvbe93y6DkL2Yi
 FHvNv0z1oE8WxQBIyteGJe6RFkYV+pdmkl4QATsIx4Yxej6rYxneuKIu/BiGaNT7R2MHnaWWz
 ILyMU1fTZEuh1uBcSyJuQnSFgx2Ch5oZJcBfpWcngORZci/GAs5u0lCfxAIeUfXDxdn9yBxSy
 VNNHpSrM5VF+Bp79ZDRO+JjMf4rNGe8AbMsqVqB/PTUCzd19FAoEo4CpPT/VBaM9jfOUQ5Grc
 WjHsPP3AZi3BwgwHzg673X77x+L/b2cYmssH9eLbypmkGqplCZsG4agJX/KuH6qgM7Tr6J7dI
 zdoWIcrKOYuqdhg0VjAdzxpfixJsRsfMffTQ9GklCXNcjp9Ooier5LMKbbNYBFeFz8nyg18hx
 wdFasEHjZx6w+P2fMn2Y3jI29UNkmuHMGA0H5WcQ1/IEK+y6l2yUZXCCikjtfAx0xiDU8e1ZG
 lLPx0eBbaYj4rhC47rnFY2w3TnkESj+tzNXpYlJSghTjiF80Ku4GgGbvlXibqtL7sHbcbfGII
 O6mdvAInPkajkCDpNQNb/c3Fhh5WIqhGSn7IOvozX/hohhGd7ayl+4+YNDruEC+8a9NTIxc
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 6, 2021 at 7:15 PM Yassine Oudjana <y.oudjana@protonmail.com> wrote:
> > (the numactl command helps run this both on the 'big' and 'little'
> > cores without running into migration)
> >
> > Arnd
>
> Here are the results:

Thanks, that was quick

> $ numactl -C 0 line -M 1M
> 128
> $ numactl -C 3 line -M 1M
> 128
> $ numactl -C 0 cache
> L1 cache: 512 bytes 1.37 nanoseconds 64 linesize -1.00 parallelism
> L2 cache: 24576 bytes 2.75 nanoseconds 64 linesize 5.06 parallelism
> L3 cache: 131072 bytes 7.89 nanoseconds 64 linesize 3.85 parallelism
> L4 cache: 524288 bytes 15.86 nanoseconds 128 linesize 3.48 parallelism
> Memory latency: 145.93 nanoseconds 4.88 parallelism
> $ numactl -C 3 cache
> L1 cache: 24576 bytes 1.29 nanoseconds 64 linesize 5.00 parallelism
> L2 cache: 1048576 bytes 8.60 nanoseconds 128 linesize 3.07 parallelism
> Memory latency: 143.29 nanoseconds 5.37 parallelism

This is still somewhat inconclusive, but it does give some hope. The data that
I found on random web sites was

- 32KB L1, 2MB/1MB L2 [1][2]
- 16KB L1, 1.5MB L2 [3]
- 32KB L1, 1MB/512KB L2 [4]

so none of the sizes really line up. My best guess is that the actual hierarchy

1MB per-core L2 cache on the two big CPU, 512KB per-core L2 cache on
the two little ones, but no shared L2 or L3. The older Krait had a 4KB L0
cache, which could explain the 512-byte L1 output.

Can you rerun the the 'line' test with '-M 128K' to see if that confirms the 64
byte L1 line size that the 'cache' test reported?
      Arnd

[1] https://en.wikipedia.org/wiki/List_of_Qualcomm_Snapdragon_processors#Snapdragon_820_and_821_(2016)
[2] https://en.wikipedia.org/wiki/Kryo
[3] https://www.geektopia.es/es/product/qualcomm/snapdragon-820/
[4] https://www.anandtech.com/show/9837/snapdragon-820-preview/2
