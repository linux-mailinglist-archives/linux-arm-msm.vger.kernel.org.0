Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BDBB45917C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 16:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239845AbhKVPi0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 10:38:26 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:36729 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239815AbhKVPiZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 10:38:25 -0500
Received: from mail-wr1-f46.google.com ([209.85.221.46]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBmDy-1mwqJV3ohI-00C6OF; Mon, 22 Nov 2021 16:35:17 +0100
Received: by mail-wr1-f46.google.com with SMTP id u1so33439657wru.13;
        Mon, 22 Nov 2021 07:35:17 -0800 (PST)
X-Gm-Message-State: AOAM530sLAVQvXK6/g3gPJ0jseTqmSumX0z1NsbxMYoE/+QNsiu1rnAC
        NXu7PvV0GQKDfsGhZZT2BPfs8rccrJylifWtO1A=
X-Google-Smtp-Source: ABdhPJxJtyPDgupGJO5dvWb1SjNslTHYXWjP3r97r/gd2zxQeFi9EA/iMblGVL3S0bnNlwwqB0nbTHmFAH/3E6PXgg8=
X-Received: by 2002:adf:efc6:: with SMTP id i6mr40179592wrp.428.1637595317455;
 Mon, 22 Nov 2021 07:35:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1636973694.git.quic_saipraka@quicinc.com>
 <9396fbdc415a3096ab271868960372b21479e4fb.1636973694.git.quic_saipraka@quicinc.com>
 <CAK8P3a2Bp4LP7C1-XLKvjyxV-e1vrHb-=3zpm75CRgPYNbY2jA@mail.gmail.com>
 <b07e339c-530d-683c-c626-14b73b42e72a@quicinc.com> <1609f1f7-6f61-6e17-d907-c526f09bffe5@quicinc.com>
 <CAK8P3a1KxJFwgock3XiRDZYzT=5PZ=Hsh_8uFv9heoa1rwNqtA@mail.gmail.com>
 <9ef8b483-f15f-eda8-d430-2d01e6cad70e@quicinc.com> <CAK8P3a0Zo+PTGAAvisAZamfLUm1ToGZpmHDn-Xk0Eo8TTRGyZg@mail.gmail.com>
 <4ed41054-3868-d5e2-9958-56250b7f9be0@quicinc.com>
In-Reply-To: <4ed41054-3868-d5e2-9958-56250b7f9be0@quicinc.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 22 Nov 2021 16:35:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a07sMdR9NUz5AOJk+O-op9qLU_PjnhvqvTz9xrHE7NXEg@mail.gmail.com>
Message-ID: <CAK8P3a07sMdR9NUz5AOJk+O-op9qLU_PjnhvqvTz9xrHE7NXEg@mail.gmail.com>
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
X-Provags-ID: V03:K1:afe0cawbtPSkXEpDaURr+UUlHsPTEzS/tUjQeRZIDw8hix9rMzH
 rRTDvuz45huZDfzu80RI0J4udYOpJl0YsSusZzona0T1fro74mJm0DrgpVzqlDEvOep+1p2
 aKkslwZ14vzaZiQxYskVvTlfvyZC8sn+Mhv8g/7Gp3cKuin1KyQUrD3yLoOAFGwHPcE33DW
 0yYknpYZdEyocQ49yNQ3g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wv+83+BqJV8=:wICOjBZ/A8ofZ8nbL3NFMs
 d8XlJeQljC5DvoIoxuuMXHQB5zS58kZxtPOPPoE5Fuv0IsGE1SosB3ofn2HrfqFB9UKfO4gQL
 JzbhwOi5FZ4V6kgDdZILboya3FF/euDlHaO5sC/zuYwFtK8iyyvtXfFA1UXfgPBxJoUN/+hoW
 k3/3TLf82af095JEZ6XXWTUbWu9OaFKXVGn+lu4PvNWgzrH2tX2h4YxptaYIuHeTEOdesdJzU
 sygKigS3wmHwpmugL8VhLzmtf1/IK51DHGxqu6EpJTB9oMuQTHh727SQX38iUFoL4SNZaXUqt
 oCmQz1N9V8w1hQRynXGPidoQ7LMlxDPydzAk0yznqWkVS6+yGos+AgAuWQC55RsCul5FuQTr5
 TqAWyptla3MEvvqRJa64pY4LK5heXPJzUbTO2UM2yLTCO799Sk1kzN5h2CIH07uqeNNG9VV1b
 lrvlHl03ZMpwbtEtBXA21h/jH/Q1gkG/e5YRDtZDAHK92j5KXaSMwBdo84pb5wbnbQb9BnvFo
 Y7Bix7zxUcTsXOMHQRiDAzJvsZr6/FJqdCFn4+hYRagG+80JNAOQcdhIm/p1vOZ6cxuTLJG7R
 NOeWCULUH87x0Ah+buaaJgQo60olDk9XMvnItHXsouLcCfKUG4UVS3MhbD4XfO6niWvU6wPvK
 K54xeKN2F59i7yMClFtDcIiTXBEkfch7iEc88qGEieElptt4V9BvrOH+Nnx+F7WAk1ylHFY7o
 MxXIPYHecx5nEa1/C7Q1uJva3PxOKsFjHHO5FkyIRZKyP0UkjnL6g7816UuJDTc6BkC+lACEw
 A25O8z9d4HcBqz58FEtlrcDeMk5IqN91U7Zaki2Iizs6FEu61E=
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 22, 2021 at 3:59 PM Sai Prakash Ranjan
<quic_saipraka@quicinc.com> wrote:
> >> And if we do move this instrumentation to asm-generic/io.h, how will
> >> that be executed since
> >> the arch specifc read{b,w,l,q} overrides this generic version?
> > As I understand it, your version also requires architecture specific
> > changes, so that would be the same: it only works for architectures
> > that get the definition of readl()/readl_relaxed()/inl()/... from
> > include/asm-generic/io.h and only override the __raw version. Arnd
>
> Sorry, I didn't get this part, so  I am trying this on ARM64:
>
> arm64/include/asm/io.h has read{b,l,w,q} defined.
> include/asm-generic/io.h has below:
>    #ifndef readl
>    #define readl readl
>    static inline u32 readl(const volatile void __iomem *addr)
>
> and we include asm-generic/io.h in arm64/include/asm/io.h at the end
> after the definitions for arm64 mmio accesors.
> So arch implementation here overrides generic ones as I see it, am I
> missing something? I even confirmed this
> with some trace_printk to generic and arch specific definitions of readl
> and I see arch specific ones being called.

Ah, you are right that the arm64 version currently has custom definitions
of the high-level interfaces. These predate the introduction of the
__io_{p,}{b,a}{r,w} macros and are currently only used on risc-v.

I think in this case you should start by changing arm64 to use the
generic readl() etc definitions, by removing the extra definitions and
using

#define __io_ar(v) __iormb(__v)
#define __io_bw() dma_wmb()

      Arnd
