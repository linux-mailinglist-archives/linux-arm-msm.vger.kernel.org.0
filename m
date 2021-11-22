Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B68645903E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 15:30:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235040AbhKVOdz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 09:33:55 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:43197 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhKVOdz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 09:33:55 -0500
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MgNtR-1m9WGG1if9-00hzOz; Mon, 22 Nov 2021 15:30:47 +0100
Received: by mail-wr1-f50.google.com with SMTP id u18so33108095wrg.5;
        Mon, 22 Nov 2021 06:30:47 -0800 (PST)
X-Gm-Message-State: AOAM531FzBG0qlD8wp5YnHIFIyp+yOnK+x1fcpjK+R+62UvBuXxqoVwC
        5HGtXGrb1lt1TrFmRjV4JW+/k0Ru43vT1p3lCZA=
X-Google-Smtp-Source: ABdhPJxwQgTTqkYEJR5I2hfzVGzzxTuU7usxVgKz/BIB3jyn4CsuZvl8ULo4pVKSafHc6tpoBh28lUk3DLof17hMmG0=
X-Received: by 2002:adf:f7c2:: with SMTP id a2mr39417517wrq.71.1637591447024;
 Mon, 22 Nov 2021 06:30:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636973694.git.quic_saipraka@quicinc.com>
 <9396fbdc415a3096ab271868960372b21479e4fb.1636973694.git.quic_saipraka@quicinc.com>
 <CAK8P3a2Bp4LP7C1-XLKvjyxV-e1vrHb-=3zpm75CRgPYNbY2jA@mail.gmail.com>
 <b07e339c-530d-683c-c626-14b73b42e72a@quicinc.com> <1609f1f7-6f61-6e17-d907-c526f09bffe5@quicinc.com>
 <CAK8P3a1KxJFwgock3XiRDZYzT=5PZ=Hsh_8uFv9heoa1rwNqtA@mail.gmail.com> <9ef8b483-f15f-eda8-d430-2d01e6cad70e@quicinc.com>
In-Reply-To: <9ef8b483-f15f-eda8-d430-2d01e6cad70e@quicinc.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 22 Nov 2021 15:30:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Zo+PTGAAvisAZamfLUm1ToGZpmHDn-Xk0Eo8TTRGyZg@mail.gmail.com>
Message-ID: <CAK8P3a0Zo+PTGAAvisAZamfLUm1ToGZpmHDn-Xk0Eo8TTRGyZg@mail.gmail.com>
Subject: Re: [PATCHv4 2/2] arm64/io: Add a header for mmio access instrumentation
To:     Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        quic_psodagud@quicinc.com, Marc Zyngier <maz@kernel.org>,
        gregkh <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Ingo Molnar <mingo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:73gkTW5fIWH7AJ47+2Ei3EKyerhGsjP7mhl0SP7coN2xgnTP08Z
 SW2yFq2t356TB14Kupoqk/KXdkHDyXoDc4pHmr9gx7b0n6jpNi/H20mA7VwZtUisb6z1XbR
 c0hFYcGMB/dwMgqmGuuQiCqm8MlAhnb664jKC6o/0UwAPTCvWz8fYwnXDqRWmBIZov/A/Bd
 iONaskA884V2KAqYrd3Jw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:E0U/yhXxpaE=:ViNwE/BvfvcPDQ4pWsk+7U
 ZxM3onaTgN7FHW43sZJRGqCylvES+d9rsXY7p64rsTjhQYb8+HKd7JxMsvgGkTsYMa+5oEepZ
 Wa3N4D6q3OdZZhKLKQ5OR0Z5nVHrhEzYcZkko6pTv6fmpbG2F6kVqMq1Jqx3EtP5+tGztVtRT
 8bRD98tXjlQZ479EH8Mk3uicgvWLvUDKOR4ELt73o/HBz+1gzop0+NdXDIoH4fRjkcNb3mXlT
 JjLAlDtlBLW375YBFRbDYYWpf5EWy2Jy9vg709GQDNqCGLSox+z20cs5m232FV7+FUUeAULnK
 Fqp1DVZ3hSGHOjU2GsQQRe21rtSCYr3z6j9ZclpOjBtunXLd89JK/EYmn80jOzCnmtSXfhFr+
 WSHW7I99YBVC4tJ/V0J5aqRY3dLH0Ri6WbYL0SHrE2BDYhaxAMZ2bMzjsC5fLAoRHCtDvDmxH
 dV/cO/0bduWhnnsdnE4p/NQsh8Tuo3LQ0yysJru7Vkuag4i6KGtaqEwqTdBjeWkEpz7nhyAdA
 O/c+IroALQzhqHr1O3LfmlOPlcm17954hsUPR9B2+lUlIYeBp0ras9gi0YsOWkWGkfFJfaQG7
 h8upZoKSiuQy3r66vlY+hepcFPR7inDhtEICEPCs2Uf5ZbwBuFuKjzPlXWaMqLKRyI8Fyl6Qm
 Ds2FaFB1uhEMMYihEGpVeKhreSHOs3RCkv/euu6eUP00AWUDyO4L+fuy+fqYPv9+ZRhrxFyTN
 vfUHD3qFdaqZjK5rIxD4oniiMjm7mNa3vHIjmyaDokDOH+jN5r6RmnTa2vm3NaUOt6t0kiO9c
 V0NPID/RyAfFtiBcr6/KfCg2Zp1iq30I9TlOl06bklwfxjn5vs=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 22, 2021 at 3:19 PM Sai Prakash Ranjan
<quic_saipraka@quicinc.com> wrote:
> On 11/22/2021 7:29 PM, Arnd Bergmann wrote:
> >
> > I think this would be a lot less confusing to readers, as it is implemented
> > exactly in the place that has the normal definition, and it can also have
> > somewhat more logical semantics by only instrumenting the
> > normal/relaxed/ioport accessors but not the __raw_* versions that
> > are meant to be little more than a pointer dereference.
>
> But how is this different from logic in atomic-instrumented.h which also
> has asm-generic version?
> Initial review few years back mentioned about having something similar
> to atomic instrumentation
> and hence it was implemented with the similar approach keeping
> instrumentation out of arch specific details.

This is only a cosmetic difference. I usually prefer fewer indirections,
and I like the way that include/asm-generic/io.h only has all the
normal 'static inline' definitions spelled out, and calling the __raw_*
versions. Your version adds an extra layer with the arch_raw_readl(),
which I'd prefer to avoid.

> And if we do move this instrumentation to asm-generic/io.h, how will
> that be executed since
> the arch specifc read{b,w,l,q} overrides this generic version?

As I understand it, your version also requires architecture specific
changes, so that would be the same: it only works for architectures
that get the definition of readl()/readl_relaxed()/inl()/... from
include/asm-generic/io.h and only override the __raw version.

      Arnd
