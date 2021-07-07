Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82BF3BE9EC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jul 2021 16:41:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232020AbhGGOoI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Jul 2021 10:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232056AbhGGOoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Jul 2021 10:44:08 -0400
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E7F6C061574
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jul 2021 07:41:26 -0700 (PDT)
Received: by mail-il1-x134.google.com with SMTP id g3so2997692ilj.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jul 2021 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nIwflScCI6Icjj1cWTTKEy9uQqC1wMtDQ5W0AmkNq+g=;
        b=qSsUSkhUDDeNTKV9IlCEbm5Hj4XmuLwhiJaM0jY4sL1uhWUMhgpGglFL3S092uXiDj
         /XMSg5ef6TxisfLtL4rp/0CVFyFA3VMjGerBWdJFKyRc95JI/pwk4RNsms4ev8lTdzdT
         kmf/HHtLD6sZKM5ba4zPBnhrt5oBNwIzA0pOchC937ROImjrDpTL07S8cHX+Smh0XuLi
         Rz6rT31y3iaIrs2yvFzo21OEssbLwi6J8IMdWQ9fwWcRYahQqSl3jOXj9IRtNUDh0hev
         2zfVoVZWn8ERMpvpvBudbyfGW86s/+treNOC7kHqDEWtwbMfrbkEZdsFHyesocfgw5Va
         /HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nIwflScCI6Icjj1cWTTKEy9uQqC1wMtDQ5W0AmkNq+g=;
        b=l7Sx7TIiCqi3qI5ISCRIYxYqoOLnceV7mckmlRAo6dq3EjGJeMpz2E8xBMHRzfuaGH
         snClzNWtn8RO4o+l9FhDAFIccuDGmnNKoW2m3lZwFhSDCQ9W0dHzOA1h10/2+7fPPEWr
         AVNE0Wah7EdpPhZ0rLT9NOgh0MJIWKjFCOQv8VCsCiYNv0mcHPqoT3wOVq5zi7tE78AZ
         v1NnXLQNXqH35RdH5xHkuidUiqMuD2qsvSSgj7hXktZT6Ognt+iDIHWk8NFDMJUqJT8t
         oZVgHXoqsBytBUx2MhzizFDzS7AWiy8rbeHmz+QX4io51E+6h8X6Brss4otrOMq1PWOf
         aD4w==
X-Gm-Message-State: AOAM533JAI1KPc1j/6EJQ9yossICBzly0JntqzCBMVd4orns5Xa6VXdl
        9ghqqQLtiXhTfMfn5koZ4V2NxsbQIODIDROWnO4=
X-Google-Smtp-Source: ABdhPJwQQMe3S+AM4KYV3Xo0/ehcLXF/J7ADlwe9sG4QkGCGpF1PS07nGxT96XXQEqLf3PdAJZC9KF8DNC5jsbg0epk=
X-Received: by 2002:a05:6e02:58f:: with SMTP id c15mr18436980ils.102.1625668886115;
 Wed, 07 Jul 2021 07:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210527124356.22367-1-will@kernel.org> <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck> <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
 <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
 <87zguz7b6b.wl-maz@kernel.org> <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
 <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
 <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
 <M0wGhzKTDUUYQPjRdiabG3xuKLx8p19uB1iqdkwfa8Op45i4zBGm4mpcHIxpYzWkJLiUM6JtQIDuBVyLlXtPhrlPyycbhZ2GO1ldLymA40g=@protonmail.com>
 <CAK8P3a33ZD6uLntmuvp_Rgfj1VYEV3YxP6+BxSDAQLon-q2hGw@mail.gmail.com>
In-Reply-To: <CAK8P3a33ZD6uLntmuvp_Rgfj1VYEV3YxP6+BxSDAQLon-q2hGw@mail.gmail.com>
From:   Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date:   Wed, 7 Jul 2021 08:41:15 -0600
Message-ID: <CAOCk7Np_2Mk481g-7KTf=Jk-i9ZHiAgX40pKBYckAAReEQbGyA@mail.gmail.com>
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

On Wed, Jul 7, 2021 at 3:30 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Jul 6, 2021 at 6:20 PM Will Deacon <will@kernel.org> wrote:
> >
> > I think the million dollar question is whether the 128-byte cache-lines
> > live in a cache above the PoC or not. If it's just a system level cache
> > through which all DMA is "coherent", then it doesn't matter.
>
> On Wed, Jul 7, 2021 at 10:24 AM Yassine Oudjana
> <y.oudjana@protonmail.com> wrote:
> >
> > On Wednesday, July 7th, 2021 at 12:33 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Tue, Jul 6, 2021 at 7:15 PM Yassine Oudjana y.oudjana@protonmail.com wrote:
> > > >
> > > > $ numactl -C 0 line -M 1M
> > > > 128
> > > > $ numactl -C 3 line -M 1M
> > > > 128
> > >
> > >     Can you rerun the the 'line' test with '-M 128K' to see if that confirms the 64
> > >     byte L1 line size that the 'cache' test reported?
> >
> > $ numactl -C 0 line -M 128K
> > 64
> > $ numactl -C 3 line -M 128K
> > 64
>
> Ok, so this seems to confirm that the L1 uses 64 byte lines, while the L2 (or
> possibly L3) uses 128 byte lines.
>
> On Wed, Jul 7, 2021 at 12:27 AM Bjorn Andersson
> <bjorn.andersson@linaro.org> wrote:
> >
> > I can confirm that MSM8996, and a few derivatives, has 128 byte cache lines.
>
> Ok, thanks. Assuming this is an outer cache and the L1 indeed has a smaller line
> size, can you also confirm that this 128 byte lines are north of the point of
> coherency?

Finding this old documentation has been painful  :)

L0 I 64 byte cacheline
L1 I 64
L1 D 64
L2 unified 128 (shared between the CPUs of a duplex)

I believe L2 is within the POC, but I'm trying to dig up the old
documentation to confirm.

>
> In other words, does the CTR_EL0.DminLine field also show 128 bytes
> (in which case
> it seems we already lost)? And if not, does a CPU store to the second half of a
> 128 byte L2 line cause DMA data in the first half to be clobbered?

Per the documentation I'm seeing, CTR_EL0.DminLine should show 128
bytes.  I don't have hardware handy to confirm.
