Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20F23BD8D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jul 2021 16:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231434AbhGFOsp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jul 2021 10:48:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:38748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231426AbhGFOsp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jul 2021 10:48:45 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A377B6195A;
        Tue,  6 Jul 2021 14:46:06 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1m0mKq-00Bked-K7; Tue, 06 Jul 2021 15:46:04 +0100
Date:   Tue, 06 Jul 2021 15:46:04 +0100
Message-ID: <87zguz7b6b.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] arm64: cache: Lower ARCH_DMA_MINALIGN to 64 (L1_CACHE_BYTES)
In-Reply-To: <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
References: <20210527124356.22367-1-will@kernel.org>
        <uHgsRacR8hJ7nW-I-pIcehzg-lNIn7NJvaL7bP9tfAftFsBjsgaY2qTjG9zyBgxHkjNL1WPNrD7YVv2JVD2_Wy-a5VTbcq-1xEi8ZnwrXBo=@protonmail.com>
        <20210706102634.GB24903@arm.com>
        <59800d6c-364a-f4be-e341-c5b531657ba3@arm.com>
        <20210706133314.GB20327@willie-the-truck>
        <f136da2ea91fc22334c552b8c524f6e7@kernel.org>
        <CAK8P3a2xWTvj6HjsC6gH44Ad13adKjK0wR7UxFFQ1i=XYixvQA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: arnd@arndb.de, will@kernel.org, robin.murphy@arm.com, catalin.marinas@arm.com, y.oudjana@protonmail.com, ardb@kernel.org, kernel-team@android.com, linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com, vincent.whitchurch@axis.com, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, 06 Jul 2021 15:30:34 +0100,
Arnd Bergmann <arnd@arndb.de> wrote:
> 
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
> But that's a server chip, surely the DMA controller is fully cache
> coherent as required by SBSA? (please?)

Remember that there is a SBSA level for each broken implementation
(even my XGene is SBSA compliant!), so that doesn't mean much.

> Maybe just a misannotation on the device node?

Maybe. But given that whoever wrote the ACPI tables made sure that
everything else was annotated as coherent, I doubt the DMA controllers
being advertised as non-coherent is an accident.

> > Do we know whether Falkor and Kryo share any part of their design?
> 
> I'm fairly sure the Snapdragon 821 / msm8996 is not cache coherent.
> 
> I can only speculate on how much got reused between the two, but
> as Falkor was released only after they had already given up on
> the full-custom Kryo core, it's plausible that it incorporates bits from
> that one. In particular the cache controller is probably easy to reuse
> even if the rest of it was a new design.

I guess we'll never find out, and I'm probably one of the few still
having some access to this HW (not even sure for how long anyway).

I won't cry if we decide to pull the plug on it.

	M.

-- 
Without deviation from the norm, progress is not possible.
