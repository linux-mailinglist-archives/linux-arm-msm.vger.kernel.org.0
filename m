Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009903BDA66
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 17:43:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhGFPqA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 11:46:00 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:45909 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231689AbhGFPqA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 11:46:00 -0400
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MsJXG-1lCnyM1Jtq-00tjPi for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul
 2021 17:43:20 +0200
Received: by mail-wm1-f42.google.com with SMTP id g8-20020a1c9d080000b02901f13dd1672aso1803103wme.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 08:43:20 -0700 (PDT)
X-Gm-Message-State: AOAM531CWV1+itoj5uIO/mMnzJW3KWtobzdzzqYq1g1HP+qem3ZEp7In
        yckVL1YG8xKtPQB6JRtQ7ggRpHAsvbYOlgbqmQA=
X-Google-Smtp-Source: ABdhPJwBsFis7Wrfpc+8YKB858g/CLI2CBiJNsnWQRTLHiyax5vvrnJQpy8WfeQiYrDRSHhYgs1gDjCg+O3xCGyvehY=
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr1518219wmh.120.1625586200041;
 Tue, 06 Jul 2021 08:43:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210527124356.22367-1-will@kernel.org> <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
 <20210706102634.GB24903@arm.com> <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck> <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
 <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com> <87zguz7b6b.wl-maz@kernel.org>
In-Reply-To: <87zguz7b6b.wl-maz@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 6 Jul 2021 17:43:04 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
Message-ID: <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64 (L1_CACHE_BYTES)
To:     Marc Zyngier <maz@kernel.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:S7YQrlmYd6xnXMa1uchZmOQE2oMZp9+aVveBbdM/SQQLebF1i9J
 xR4yadcs4i03+rBai9ZfMlj5WMzKfTQRPr39/YmAYu1b6zT1LR3EfXqk0GuNEWg+2Kglxlz
 +WJ1uxASjoUVMq6bf6NcsWC9Z4kYgL8pVQpy6guvSSlON4Mn42oBdAQrBdtYDQhO2fzqwQ2
 4v/1r9VPO6v9BVLZo0HPQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:XGa4GWzCyBU=:q//42MEELRkXfgDpECyvzl
 DpGXkIlpFKTM3CrO5gAnZK2Ts/ghtTFooAv8uPM8YxvGJenbak9fTkvbswZdSpFWl19I0lWXx
 LZUW1Pmpgembm724+C0f4qsIdE8loRg1ssZ+IUQbrV3ZZsjseoJHKw/P/6FYFSXP4ap4eim2p
 UWWxjLByiF57ZYyu26y+luc1P/W9YXVG07YQyoqf3VTikN3zsstMBGMlv6+fHw4MdXEQd7/hs
 VhUUa4IzH6yTkG5YdKQzlXa0yHNoMitorp5NgE/SuccuJL2S9iXKRJ7TmveYDLei4rH1/nUom
 7noLH2caSkaxN0qz7gwy5IcNWvsBUj0uYxpj8aHLZ6IhIxnzCogiwbx2ziLFuSZlTkU7r/2Zn
 6p08tII+KRHhkcPVRYqDkSez3VBN9mfCLLHM3k+kh5OGVJ/AvqxNZdiHU3JfJR/A/IeHrlCdh
 SasUPboU40OeRldD+glUtzWIEVwp5ZqtFyO3kTzN5FJT3J9yHsXqkHSYZIIo5WNZh+tLvE4bJ
 8Fh8OJlkMJSG77r3/yQ/u5G0q/RNdqA04WxjvgLJXBwjj2RTyCd5GFpsl1KVKbbF90aKMcBQw
 rNuAUJor7f67qok7kUi3Xnp7qenivVA9dfXn/qTS2lPO1nVsWiAlNZiSKVYJ1pcH66fAXvVwj
 oHfLCSkEcl+xs1Ifz7I660Q1sqkaZwwfrvsehYLAn4ehUlDhZqz15EWBbsWQ+Wn09DFLsSNSz
 e5Vtfhb78zWRU9hkKsFcKRi1VdBXiJ/tWWbOQ7PnYVdHR+rx66OF2zANtVxhMl+qantgoCn2+
 IuM6MjYUL4ldVawLa00yT99ykL4Dj0+UQd6RIOKSCTL5TV7QR+PY09/h6P3qgZNel/QRueM
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 6, 2021 at 4:46 PM Marc Zyngier <maz@kernel.org> wrote:
> On Tue, 06 Jul 2021 15:30:34 +0100, Arnd Bergmann <arnd@arndb.de> wrote:
> > I can only speculate on how much got reused between the two, but
> > as Falkor was released only after they had already given up on
> > the full-custom Kryo core, it's plausible that it incorporates bits from
> > that one. In particular the cache controller is probably easy to reuse
> > even if the rest of it was a new design.
>
> I guess we'll never find out, and I'm probably one of the few still
> having some access to this HW (not even sure for how long anyway).
>
> I won't cry if we decide to pull the plug on it.

Sure, but the Snapdragon 820E is one we do need to worry about.

While the internet pretty much agrees on Falkor having 128 bytes
L1 cache line, it might be good to rule out that Kryo just misreports
it before we revert the patch.

Yassine, could you run the 'line' and 'cache' helper from lmbench
to determine what the cache topology appears to be and if that
matches the CTR_EL0 contents?

Something like

numactl -C 0 line -M 1M
numactl -C 3 line -M 1M
numactl -C 0 cache
numactl -C 3 cache

(the numactl command helps run this both on the 'big' and 'little'
cores without running into migration)

      Arnd
