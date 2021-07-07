Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3223BE44D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 10:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230208AbhGGI1A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 04:27:00 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:34164 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230086AbhGGI1A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 04:27:00 -0400
Date:   Wed, 07 Jul 2021 08:24:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625646257;
        bh=XP4IBVf0L+tqhnyqfuHlYrlm5H4DfOMZiCHsdCepHEI=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=Tb5X+QUhqe9YyA0yktLNureZe9SOw7G6vOE90uYHd85QFQ5foPNqW1duo9iUU2V92
         bLJojl94UVfA2W4OMbK+kFMsbfS1lB7ArvyoxR+KlYw9r8Ba1rQd09aJ8qiLwTG7cX
         81+HLJEEYX0XHZMcEAyphTxd6i26lwxI64R+TS3w=
To:     Arnd Bergmann <arnd@arndb.de>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64 (L1_CACHE_BYTES)
Message-ID: <M0wGhzKTDUUYQPjRdiabG3xuKLx8p19uB1iqdkwfa8Op45i4zBGm4mpcHIxpYzWkJLiUM6JtQIDuBVyLlXtPhrlPyycbhZ2GO1ldLymA40g=@protonmail.com>
In-Reply-To: <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
References: <20210527124356.22367-1-will@kernel.org> <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com> <20210706133314.GB20327@willie-the-truck> <f136da2ea91fc22334c552b8c524f6e7@kernel.org> <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com> <87zguz7b6b.wl-maz@kernel.org> <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com> <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com> <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
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

On Wednesday, July 7th, 2021 at 12:33 AM, Arnd Bergmann <arnd@arndb.de> wro=
te:
> On Tue, Jul 6, 2021 at 7:15 PM Yassine Oudjana y.oudjana@protonmail.com w=
rote:
> > ...
>
> This is still somewhat inconclusive, but it does give some hope. The data=
 that
>
> I found on random web sites was
>
> -   32KB L1, 2MB/1MB L2 [1][2]
> -   16KB L1, 1.5MB L2 [3]
> -   32KB L1, 1MB/512KB L2 [4]
>
>     so none of the sizes really line up. My best guess is that the actual=
 hierarchy
>     1MB per-core L2 cache on the two big CPU, 512KB per-core L2 cache on
>     the two little ones, but no shared L2 or L3. The older Krait had a 4K=
B L0
>     cache, which could explain the 512-byte L1 output.
>
>     Can you rerun the the 'line' test with '-M 128K' to see if that confi=
rms the 64
>     byte L1 line size that the 'cache' test reported?
>
>     Arnd
>
>     [1] https://en.wikipedia.org/wiki/List_of_Qualcomm_Snapdragon_process=
ors#Snapdragon_820_and_821_(2016)
>     [2] https://en.wikipedia.org/wiki/Kryo
>     [3] https://www.geektopia.es/es/product/qualcomm/snapdragon-820/
>     [4] https://www.anandtech.com/show/9837/snapdragon-820-preview/2

$ numactl -C 0 line -M 128K
64
$ numactl -C 3 line -M 128K
64

