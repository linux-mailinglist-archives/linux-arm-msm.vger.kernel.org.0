Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C73E03BDB43
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 18:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229975AbhGFQWw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 12:22:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:36942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229950AbhGFQWw (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 12:22:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7199261C1E;
        Tue,  6 Jul 2021 16:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625588413;
        bh=wivfzKvO7QjbWe7xoBqum+UKLZPnnJG01B1fLnMsQ/k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Sklfkg/yYIDoQhdk6paF/p2kHH9v0F+0J1Tup0t4ueWffY5QOBEfJ1MHkpRguw5HV
         9tsIY7ndEyp39GYVNkTA2HqnYywPYXqUbrvyruuhByhkvvp4xmPvcUx3873JtWeH0Y
         rbtT0sMo6OTuoIE6OKJPPBELwEvS8a5a/YDKWx7VKZ7NDaicVuN5v3zpyX4Q8xX/eq
         vgcONB7LYDjvhgzOfBiksBF2bOh+2/eY2QXlqTpo8SWoMeoVPIT8mxTAoMt0Ud5ahb
         FmKKChHxJMDgTOMorrB8Hp4XOGq4y9FKLOu3ogfiCZgZnkY6cC9MYOy0INUGUM16Aq
         /hAkv6C6jCOiA==
Date:   Tue, 6 Jul 2021 17:20:08 +0100
From:   Will Deacon <will@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Marc Zyngier <maz@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210706162007.GA20541@willie-the-truck>
References: <20210527124356.22367-1-will@kernel.org>
 <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
 <20210706102634.GB24903@arm.com>
 <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
 <20210706133314.GB20327@willie-the-truck>
 <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
 <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jul 06, 2021 at 04:30:34PM +0200, Arnd Bergmann wrote:
> On Tue, Jul 6, 2021 at 3:44 PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On 2021-07-06 14:33, Will Deacon wrote:
> > > On Tue, Jul 06, 2021 at 02:29:07PM +0100, Robin Murphy wrote:
> > >
> > > I can't find much information about the original Kryo core at all...
> >
> > I have similar issues with my QDF2400. The UART, RTC and DMA controllers
> > are all screaming at me. I'm confident that the UART doesn't do any
> > DMA (it is handled by the SBSA driver), but the DMA controllers are
> > probably doing what it says on the tin.
> 
> But that's a server chip, surely the DMA controller is fully cache coherent
> as required by SBSA? (please?)
> 
> Maybe just a misannotation on the device node?
> 
> > Do we know whether Falkor and Kryo share any part of their design?
> 
> I'm fairly sure the Snapdragon 821 / msm8996 is not cache coherent.
> 
> I can only speculate on how much got reused between the two, but
> as Falkor was released only after they had already given up on
> the full-custom Kryo core, it's plausible that it incorporates bits from
> that one. In particular the cache controller is probably easy to reuse
> even if the rest of it was a new design.

I think the million dollar question is whether the 128-byte cache-lines
live in a cache above the PoC or not. If it's just a system level cache
through which all DMA is "coherent", then it doesn't matter.

Digging around on the web, it's unclear whether msm8996 has an L3 or not.

Will
