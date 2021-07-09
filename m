Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C323C2105
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 10:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231582AbhGIIvc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 04:51:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:51194 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231494AbhGIIvb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 04:51:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F25A611AB;
        Fri,  9 Jul 2021 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625820528;
        bh=pQ92xSOMcEDltChjsdB6HAKdM9sWgzL0fKaeJ/tnu8E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ORctpzD/biOqGGpC6RyP8BsFLsDj69jUkH7hiaqXUMBjQwBjgSvTy3Cid5PHV8OS8
         zMrBrL4pxDnyjj/J7mjw4sb5Amb6FH46bTFySzlRSFru3FVtoAdu0ev3LR72bktVKc
         ikH7ps/mQqhXOS09EFt4gxG5BgsxBzBNdTeWqOkui/GwDa2Lter7EJz1U0UxKwXB85
         X+COt/JcDHP9zSuIdkMqI7Gv9tbZT5qEtUDGDEoYjv9K1CrY6qR6ezcAJusBW3U9GJ
         kkpWlqgaPXkHfMl6/w/LVN5YmjiPyKRXlCn8Zr9hJtFfjN3Yd9oEvXgfGuJVWXvEto
         g6lJDMOWzZIMg==
Date:   Fri, 9 Jul 2021 09:48:42 +0100
From:   Will Deacon <will@kernel.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64
 (L1_CACHE_BYTES)
Message-ID: <20210709084842.GA24432@willie-the-truck>
References: <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
 <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
 <87zguz7b6b.wl-maz@kernel.org>
 <CAK8P3a2eFDSdkAUgapGuANQJsO=Arsp4uxoiLRXL-ah0ttc6Fg@mail.gmail.com>
 <m-pFOMXMXSwpPq7H8syJd3qyVkuhGYjVEOgk-iiezAFhr8ApjWX8eIMkcL3updRXOOeOClx88ekyeOvEsNYp_HrY54W4iCSYl8yT03Tykv4=@protonmail.com>
 <CAK8P3a1rtXTtGQ_Q7eg2SOrYa_OhSWPWFiS8m=oSb_GU1uUNXQ@mail.gmail.com>
 <M0wGhzKTDUUYQPjRdiabG3xuKLx8p19uB1iqdkwfa8Op45i4zBGm4mpcHIxpYzWkJLiUM6JtQIDuBVyLlXtPhrlPyycbhZ2GO1ldLymA40g=@protonmail.com>
 <CAK8P3a33ZD6uLntmuvp_Rgfj1VYEV3YxP6+BxSDAQLon-q2hGw@mail.gmail.com>
 <CAOCk7Np_2Mk481g-7KTf=Jk-i9ZHiAgX40pKBYckAAReEQbGyA@mail.gmail.com>
 <CAOCk7NqdpUZFMSXfGjw0_1NaSK5gyTLgpS9kSdZn1jmBy-QkfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NqdpUZFMSXfGjw0_1NaSK5gyTLgpS9kSdZn1jmBy-QkfA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 08, 2021 at 02:59:28PM -0600, Jeffrey Hugo wrote:
> On Wed, Jul 7, 2021 at 8:41 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
> >
> > On Wed, Jul 7, 2021 at 3:30 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Tue, Jul 6, 2021 at 6:20 PM Will Deacon <will@kernel.org> wrote:
> > > >
> > > > I think the million dollar question is whether the 128-byte cache-lines
> > > > live in a cache above the PoC or not. If it's just a system level cache
> > > > through which all DMA is "coherent", then it doesn't matter.
> > >
> > > On Wed, Jul 7, 2021 at 10:24 AM Yassine Oudjana
> > > <y.oudjana@protonmail.com> wrote:
> > > >
> > > > On Wednesday, July 7th, 2021 at 12:33 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > > > > On Tue, Jul 6, 2021 at 7:15 PM Yassine Oudjana y.oudjana@protonmail.com wrote:
> > > > > >
> > > > > > $ numactl -C 0 line -M 1M
> > > > > > 128
> > > > > > $ numactl -C 3 line -M 1M
> > > > > > 128
> > > > >
> > > > >     Can you rerun the the 'line' test with '-M 128K' to see if that confirms the 64
> > > > >     byte L1 line size that the 'cache' test reported?
> > > >
> > > > $ numactl -C 0 line -M 128K
> > > > 64
> > > > $ numactl -C 3 line -M 128K
> > > > 64
> > >
> > > Ok, so this seems to confirm that the L1 uses 64 byte lines, while the L2 (or
> > > possibly L3) uses 128 byte lines.
> > >
> > > On Wed, Jul 7, 2021 at 12:27 AM Bjorn Andersson
> > > <bjorn.andersson@linaro.org> wrote:
> > > >
> > > > I can confirm that MSM8996, and a few derivatives, has 128 byte cache lines.
> > >
> > > Ok, thanks. Assuming this is an outer cache and the L1 indeed has a smaller line
> > > size, can you also confirm that this 128 byte lines are north of the point of
> > > coherency?
> >
> > Finding this old documentation has been painful  :)
> >
> > L0 I 64 byte cacheline
> > L1 I 64
> > L1 D 64
> > L2 unified 128 (shared between the CPUs of a duplex)
> >
> > I believe L2 is within the POC, but I'm trying to dig up the old
> > documentation to confirm.
> 
> Was able to track down a friendly hardware designer.  The POC lies
> between L2 and L3.  Hope this helps.

Damn, yes, it's bad news but thanks for chasing it up. I'll revert the patch
at -rc1 and add a comment about MSM8996.

Will
