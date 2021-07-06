Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99FA3BDC0B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 19:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhGFRSg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 13:18:36 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:43527 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbhGFRSg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 13:18:36 -0400
Date:   Tue, 06 Jul 2021 17:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1625591754;
        bh=Zw8oSZeKBxE+Yt+Ye7A3hOc+/l3wSELM0EmZrDF28FU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=GyGapLyvMm0Pr7fMurOz3iWAouPw517PnDdbDK42xjVLvBTebz0iFpyGfmZjpMnjK
         vFs3D3VMMEMDE+Wo2ZfFCcIrx2pebPDZEtiBEmr5H+WUw05jMLEaJSBKO+612rcugc
         LQO0S9O98SCP66AYMtIrgmu5QfyLRwE/gntRl8Kw=
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
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64 (L1_CACHE_BYTES)
Message-ID: <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
In-Reply-To: <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
References: <20210527124356.22367-1-will@kernel.org> <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com> <20210706102634.GB24903@arm.com> <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com> <20210706133314.GB20327@willie-the-truck> <f136da2ea91fc22334c552b8c524f6e7@kernel.org> <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com> <87zguz7b6b.wl-maz@kernel.org> <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
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

On Tuesday, July 6th, 2021 at 7:43 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Jul 6, 2021 at 4:46 PM Marc Zyngier maz@kernel.org wrote:
> > On Tue, 06 Jul 2021 15:30:34 +0100, Arnd Bergmann arnd@arndb.de wrote:
> > > I can only speculate on how much got reused between the two, but
> > > as Falkor was released only after they had already given up on
> > > the full-custom Kryo core, it's plausible that it incorporates bits f=
rom
> > > that one. In particular the cache controller is probably easy to reus=
e
> > > even if the rest of it was a new design.
> >
> > I guess we'll never find out, and I'm probably one of the few still
> > having some access to this HW (not even sure for how long anyway).
> >
> > I won't cry if we decide to pull the plug on it.
>
> Sure, but the Snapdragon 820E is one we do need to worry about.
> While the internet pretty much agrees on Falkor having 128 bytes
> L1 cache line, it might be good to rule out that Kryo just misreports
> it before we revert the patch.
>
> Yassine, could you run the 'line' and 'cache' helper from lmbench
> to determine what the cache topology appears to be and if that
> matches the CTR_EL0 contents?
>
> Something like
>
> numactl -C 0 line -M 1M
> numactl -C 3 line -M 1M
> numactl -C 0 cache
> numactl -C 3 cache
>
> (the numactl command helps run this both on the 'big' and 'little'
> cores without running into migration)
>
> Arnd

Here are the results:

$ numactl -C 0 line -M 1M
128
$ numactl -C 3 line -M 1M
128
$ numactl -C 0 cache
L1 cache: 512 bytes 1.37 nanoseconds 64 linesize -1.00 parallelism
L2 cache: 24576 bytes 2.75 nanoseconds 64 linesize 5.06 parallelism
L3 cache: 131072 bytes 7.89 nanoseconds 64 linesize 3.85 parallelism
L4 cache: 524288 bytes 15.86 nanoseconds 128 linesize 3.48 parallelism
Memory latency: 145.93 nanoseconds 4.88 parallelism
$ numactl -C 3 cache
L1 cache: 24576 bytes 1.29 nanoseconds 64 linesize 5.00 parallelism
L2 cache: 1048576 bytes 8.60 nanoseconds 128 linesize 3.07 parallelism
Memory latency: 143.29 nanoseconds 5.37 parallelism

