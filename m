Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A9F53BE59B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 11:29:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbhGGJcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 05:32:17 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:42409 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230429AbhGGJcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 05:32:17 -0400
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N0G5n-1lDtIt1jfz-00xLlZ for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul
 2021 11:29:36 +0200
Received: by mail-wm1-f48.google.com with SMTP id o22so1407694wms.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 02:29:36 -0700 (PDT)
X-Gm-Message-State: AOAM530BhtKenoPebIJwqT/10AS3bVrsrs2yC3ecNgfrw6ix3ci8yUjW
        48MAuHU5DAVwy8NerCOQosSGnY3Z/+vKvh7YK40=
X-Google-Smtp-Source: ABdhPJxy9VGMkJsQ2xLLoHD9KhuY49v75rKOXdVcERo4CB/SzAd5LgjZYkH+UrCI7NzD7/EpMdgZQ2cNpiSkwbT9ERU=
X-Received: by 2002:a05:600c:3205:: with SMTP id r5mr5526288wmp.75.1625650176018;
 Wed, 07 Jul 2021 02:29:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210527124356.22367-1-will@kernel.org> <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck> <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
 <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
 <87zguz7b6b.wl-maz@kernel.org> <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
 <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
 <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com> <M0wGhzKTDUUYQPjRdiabG3xuKLx8p19uB1iqdkwfa8Op45i4zBGm4mpcHIxpYzWkJLiUM6JtQIDuBVyLlXtPhrlPyycbhZ2GO1ldLymA40g=@protonmail.com>
In-Reply-To: <M0wGhzKTDUUYQPjRdiabG3xuKLx8p19uB1iqdkwfa8Op45i4zBGm4mpcHIxpYzWkJLiUM6JtQIDuBVyLlXtPhrlPyycbhZ2GO1ldLymA40g=@protonmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 7 Jul 2021 11:29:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a33ZD6uLntmuvp_Rgfj1VYEV3YxP6+BxSDAQLon-q2hGw@mail.gmail.com>
Message-ID: <CAK8P3a33ZD6uLntmuvp_Rgfj1VYEV3YxP6+BxSDAQLon-q2hGw@mail.gmail.com>
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
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Wzx7QP6bv5PCoUZoj1gFSeZAfY07iI6Arm3y7dQgYSxFOulLmhG
 Dubs5KpwkJOYowj30SOpVcaGvA0OQSm58OHduJwz1vX9bKDy7gsgkeFmRn+EsYcu7PHoyIY
 Vlvgc2S21xLfb/mI6R7B69wQHoKS8ltpX5oGpaMflc/p3Tc6iYdOJ04KDs0TDI4bbSGRVfF
 rU6mFvAB2+p5if9JdT6Gw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:f7pEn5TD5ks=:/PELfdULn2BQ9fKaAoZ0Rp
 pWyVyLSdErJdw6+mVlTeiXVY9quVPKqVhToIC/ggg82u2cGu01/ssJ8S4K+gsnqaS9fSvZU86
 6NMXUXLg4tzdZoAQYwPmcS/EJNzHNaH10wXK1DHiGxvA/4rdc+k/Sm5zZQQ+ILeKhnIZBIDpz
 L0bLWoHfXs/Qgy1LqFcLIDr1ndxZAakHH008QkRhMPmsw+okIHg4LCUO3gJ9UUQXyr4UtgIZN
 7x8vusOffxwGjlcnvYmllei8UUciHhZ73GULiuxB6fWR5c9kWKlW/lNKzJOZpAEEOuDnDLt8Y
 BtfpOm6SKZS0U9rN+XP4OxzYnCIa0uzHSWm98LRyeOHJFdOtqOpOhiFAUYy/5Zse2XgwbLFr3
 yBpW7e/nBjLiM9L5uNjS2vyrp+y5TOwK79lCd88GKmUSrTiLUJ6NsEVcxHTB2fhYZ+XWg++2F
 xgcRWFCSOS4d2rZopxBws2Zh0g6JpBU70UjBniX5Vs37igovBN9f4sBGsS5EsGLMp8TYQsf1/
 I6a7ZYPdf9cyq3yI2cW9/60amK9hMgZjJSqyHf7RhCq7Wf4PkQD4XFPMzXv/TxA/6gBzx5wU/
 NKvWlOqAGXN46FOIs46FT001ITqA0uL97jXMOISpYH0ldgFcmO3YOQUfi0wi4H/T4eg0T0F1n
 xY+d50zIkDxihKuGudv2IX/ipS+2Z49m7RXQjy/DXfNBGah+Ug4hmxJp3cBZjjspbW+pK3WZY
 qgcikYKBK5GmC6vVbG3N9P2b2+quo3kwP9fESav46jjL0JYN/37KDLVZoyJw2Th0s7J61RMru
 ILJMWeBB8A6R0km+Bbvl2rG54brb/y7LP03W1nQbRhYs14JW2slmY4oAZ5mZVBkzN4OTBLS
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 6, 2021 at 6:20 PM Will Deacon <will@kernel.org> wrote:
>
> I think the million dollar question is whether the 128-byte cache-lines
> live in a cache above the PoC or not. If it's just a system level cache
> through which all DMA is "coherent", then it doesn't matter.

On Wed, Jul 7, 2021 at 10:24 AM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:
>
> On Wednesday, July 7th, 2021 at 12:33 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Tue, Jul 6, 2021 at 7:15 PM Yassine Oudjana y.oudjana@protonmail.com wrote:
> > >
> > > $ numactl -C 0 line -M 1M
> > > 128
> > > $ numactl -C 3 line -M 1M
> > > 128
> >
> >     Can you rerun the the 'line' test with '-M 128K' to see if that confirms the 64
> >     byte L1 line size that the 'cache' test reported?
>
> $ numactl -C 0 line -M 128K
> 64
> $ numactl -C 3 line -M 128K
> 64

Ok, so this seems to confirm that the L1 uses 64 byte lines, while the L2 (or
possibly L3) uses 128 byte lines.

On Wed, Jul 7, 2021 at 12:27 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> I can confirm that MSM8996, and a few derivatives, has 128 byte cache lines.

Ok, thanks. Assuming this is an outer cache and the L1 indeed has a smaller line
size, can you also confirm that this 128 byte lines are north of the point of
coherency?

In other words, does the CTR_EL0.DminLine field also show 128 bytes
(in which case
it seems we already lost)? And if not, does a CPU store to the second half of a
128 byte L2 line cause DMA data in the first half to be clobbered?

       Arnd
