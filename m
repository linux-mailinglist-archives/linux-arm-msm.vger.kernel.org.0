Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE5F3C1AC5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jul 2021 22:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230442AbhGHVCX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Jul 2021 17:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbhGHVCX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Jul 2021 17:02:23 -0400
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17483C061574
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jul 2021 13:59:40 -0700 (PDT)
Received: by mail-il1-x12f.google.com with SMTP id h3so7970470ilc.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jul 2021 13:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u0nJ5EypAihw/HUezUvxgsNKaLjT3N+h+V7waposDmE=;
        b=BFRavtR25uNMSAMxy1BrcpGAB6djxvxR1hryroHuucP5XxFeh/zHISP0RskNbjeFBs
         wnZLi4J33dxeEv+wla/xQi+afchuzSaq+OxnTm2KDrgXAD/qoTQIEt2w+gstQLWd9hKy
         /I3BN12z3wgGxp6wYOPOy+d2qL2HovXM+VxAyPZ59BeXjjP8uEt1U6LEzqLV+r+vdquM
         KE7fMicgGE2pyL8AeSD3/eYDE7PF2W9E6l+YrD4koousLqRaGHypdom2akKVPY7pDO6R
         4Ox69m84V7XwsxkVtcRr6Vy4xZl6nwSYUDMI2gX3w4Hmd2bcublkHHEp280qvguRHknp
         yUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u0nJ5EypAihw/HUezUvxgsNKaLjT3N+h+V7waposDmE=;
        b=bgyHUlWdxp7ZMNCBurx95qWFp1+BbF4A776TQgdjsoUFwsfSTg3f5Kr5mWZkEBnBYY
         FNt8SdvD3GRi1DJQn5F1qrTzmi8V9dY03vJnA4z0k5wA3fXwjUtJ9ZBV8BcKTMdf47ih
         e6velwAsc3CJunTh1J1LoJdjUA5bJ/7gmbZ8lQfJSAifUO7Hbu8NBfl01PKJbGNUta+y
         LngLLI6DZjG2TADhqAs6nD7TqIbWrbZG7feY44doZeKnLYPU5+g2hjY6Is9oZuCTceRE
         WdIJHJozKPFGSVem81dJb6TLK/fBHo6nYaAmgUdm1Gz9YFNuJKXT3XnkxHu3TsXmn5Qt
         FbtA==
X-Gm-Message-State: AOAM530sJ3xppZTTSpxZnrctf2xRDMFfmKNBzn99ehCTTJsYf5w4gvSe
        VfXUuLBj0yryjkVtqtO3g/fySkefGdjf6m4rNxE=
X-Google-Smtp-Source: ABdhPJzy6vsjNz305EeGV0LnSoMUm2tEd1A0t7cwc55gUpsOibEaNF5OzUOv4C+VlyLgm30G01ryHcmlTl1caL2VYSI=
X-Received: by 2002:a92:d08b:: with SMTP id h11mr8138938ilh.32.1625777979532;
 Thu, 08 Jul 2021 13:59:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210527124356.22367-1-will@kernel.org> <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck> <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
 <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
 <87zguz7b6b.wl-maz@kernel.org> <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
 <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
 <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
 <M0wGhzKTDUUYQPjRdiabG3xuKLx8p19uB1iqdkwfa8Op45i4zBGm4mpcHIxpYzWkJLiUM6JtQIDuBVyLlXtPhrlPyycbhZ2GO1ldLymA40g=@protonmail.com>
 <CAK8P3a33ZD6uLntmuvp_Rgfj1VYEV3YxP6+BxSDAQLon-q2hGw@mail.gmail.com> <CAOCk7Np_2Mk481g-7KTf=Jk-i9ZHiAgX40pKBYckAAReEQbGyA@mail.gmail.com>
In-Reply-To: <CAOCk7Np_2Mk481g-7KTf=Jk-i9ZHiAgX40pKBYckAAReEQbGyA@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Thu, 8 Jul 2021 14:59:28 -0600
Message-ID: <CAOCk7NqdpUZFMSXfGjw0_1NaSK5gyTLgpS9kSdZn1jmBy-QkfA@mail.gmail.com>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64 (L1_CACHE_BYTES)
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
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
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jul 7, 2021 at 8:41 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Wed, Jul 7, 2021 at 3:30 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Jul 6, 2021 at 6:20 PM Will Deacon <will@kernel.org> wrote:
> > >
> > > I think the million dollar question is whether the 128-byte cache-lines
> > > live in a cache above the PoC or not. If it's just a system level cache
> > > through which all DMA is "coherent", then it doesn't matter.
> >
> > On Wed, Jul 7, 2021 at 10:24 AM Yassine Oudjana
> > <y.oudjana@protonmail.com> wrote:
> > >
> > > On Wednesday, July 7th, 2021 at 12:33 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > On Tue, Jul 6, 2021 at 7:15 PM Yassine Oudjana y.oudjana@protonmail.com wrote:
> > > > >
> > > > > $ numactl -C 0 line -M 1M
> > > > > 128
> > > > > $ numactl -C 3 line -M 1M
> > > > > 128
> > > >
> > > >     Can you rerun the the 'line' test with '-M 128K' to see if that confirms the 64
> > > >     byte L1 line size that the 'cache' test reported?
> > >
> > > $ numactl -C 0 line -M 128K
> > > 64
> > > $ numactl -C 3 line -M 128K
> > > 64
> >
> > Ok, so this seems to confirm that the L1 uses 64 byte lines, while the L2 (or
> > possibly L3) uses 128 byte lines.
> >
> > On Wed, Jul 7, 2021 at 12:27 AM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > I can confirm that MSM8996, and a few derivatives, has 128 byte cache lines.
> >
> > Ok, thanks. Assuming this is an outer cache and the L1 indeed has a smaller line
> > size, can you also confirm that this 128 byte lines are north of the point of
> > coherency?
>
> Finding this old documentation has been painful  :)
>
> L0 I 64 byte cacheline
> L1 I 64
> L1 D 64
> L2 unified 128 (shared between the CPUs of a duplex)
>
> I believe L2 is within the POC, but I'm trying to dig up the old
> documentation to confirm.

Was able to track down a friendly hardware designer.  The POC lies
between L2 and L3.  Hope this helps.

> > In other words, does the CTR_EL0.DminLine field also show 128 bytes
> > (in which case
> > it seems we already lost)? And if not, does a CPU store to the second half of a
> > 128 byte L2 line cause DMA data in the first half to be clobbered?
>
> Per the documentation I'm seeing, CTR_EL0.DminLine should show 128
> bytes.  I don't have hardware handy to confirm.
