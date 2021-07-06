Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 727273BD873
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 16:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbhGFOlt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 10:41:49 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:52733 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232527AbhGFOls (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 10:41:48 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mae7u-1lUSTw2pJq-00cChf for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul
 2021 16:30:50 +0200
Received: by mail-wm1-f47.google.com with SMTP id g10so7873806wmh.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jul 2021 07:30:50 -0700 (PDT)
X-Gm-Message-State: AOAM530V2E2JrD4gCbBLxGuxnVCf1jvCYBayjQSHVccbfU18QLkkDS3D
        WTW9s33YXT9y5OI6TauFexHll+uHi2BpI6Ja7lI=
X-Google-Smtp-Source: ABdhPJwjGcsb8QX7KR+y5dhq1rdJJfs2xmRDD56swcSUod9PkkjY20gqBu2JjgAr8kkaWEAWJO9jcpljutP9zo7GaRw=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr1126879wmb.142.1625581850346;
 Tue, 06 Jul 2021 07:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210527124356.22367-1-will@kernel.org> <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
 <20210706102634.GB24903@arm.com> <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck> <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
In-Reply-To: <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 6 Jul 2021 16:30:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
Message-ID: <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
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
X-Provags-ID: V03:K1:/mWEPK4Z+zy5bjPjyvfCSuehQCBBwX9NsFo8lNrvyc2B3io5q0i
 zGuHvo98JHLQ5NggNNftIseuML+CeAq8t37hR34Kj4+CGxr3Wx29/v87NQPKBA7Rt4y7XiV
 tDDJLFLXWHn8R2cM8omDoD+Pjlw01SkDFdjgZ7jNUFpW/L2xgEHKo4PT6dMv1vNd4lQEHx0
 jqNlA7/6COlq4ajdb1JIw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vfojltf3ngc=:thQja4WO6/vJHt2hGZIjzm
 G3Kf6mf8VzZ+mhMuiLy5VVkhjZkBlPzDH2yHetVgPgElgDahGDuSjZ1+Xyntvj1mgORU5QZoW
 Qeb4caszOjVJV2opVvVh63jNgFE1qxwX1wdvtfe68wXZNXOppr/tuOJp5U6ARCeyL27MH0NvA
 upEN6g3FeUHkYkdNyh7RdMWDKJg+t7Cmcxe77KTl2xgnvIpYdV3TWfLdWR4rgpK1//+p6ExaI
 oYy/DJoqblKbMvPjWuLJ8GMUXd0EDS7N2LlO8rw0syaO36e6qzJ44O2jDtLO2cMPCaJdPsSac
 2SX1r9ldwc02U41GWZSkXvTycVwKjG1pzwBzk5COGfQd/ww1UeqMR5H+aeRN9ZqyHbSTHEK+x
 NOgXxbHlGSaEDnOuEp+uiqwqaNNOzicA2QQVPA6Oss++8oENLr4LUNOHtnf/RCaIZPp/Q7uLJ
 NMo1Uba2rdBBiMLhU9TL42+TsPNJkdr9QOIwCPcGdfgAGMf4C/ZOiXCVn3Yc9pM6+2ruR2a+J
 hxkUFHzPFGy0PgGftdU29m1vzCtyoF1GcgHJ8cQfOyGluOhsSWNv+id9nfx7tyNwkEBCE+m1W
 y6gKpBhHxIY7zfp7dWvWyvGOwf+ys6PpzxLPG+q7bJLGbdM3it/tNZxOS9O+ThxkF/gU4bY7y
 fOEBxwUIN5EK3XsN0tm43vW4qpIXUl5aiPDt5DXKNS9UNYaObEIH4qdeZ6Q9RFbGMoH6P4U09
 wnS4mxK5/XExq8/QhfsXZ6mVlEht7J1U+ceCfkCIrqf2Zp4cFyyVkik5fhq3zOYOv7WEZHodb
 nFsAOGLIVHSUJx0JnFIa2vBGB0aB8n9ML+ZRS0H2ZZiKub2F58Z6SlShWQZQAY6bexCdD1L
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 6, 2021 at 3:44 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2021-07-06 14:33, Will Deacon wrote:
> > On Tue, Jul 06, 2021 at 02:29:07PM +0100, Robin Murphy wrote:
> >
> > I can't find much information about the original Kryo core at all...
>
> I have similar issues with my QDF2400. The UART, RTC and DMA controllers
> are all screaming at me. I'm confident that the UART doesn't do any
> DMA (it is handled by the SBSA driver), but the DMA controllers are
> probably doing what it says on the tin.

But that's a server chip, surely the DMA controller is fully cache coherent
as required by SBSA? (please?)

Maybe just a misannotation on the device node?

> Do we know whether Falkor and Kryo share any part of their design?

I'm fairly sure the Snapdragon 821 / msm8996 is not cache coherent.

I can only speculate on how much got reused between the two, but
as Falkor was released only after they had already given up on
the full-custom Kryo core, it's plausible that it incorporates bits from
that one. In particular the cache controller is probably easy to reuse
even if the rest of it was a new design.

      Arnd
